import json
import os
import subprocess
import signal
import time
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
GENERATOR = ROOT/'scripts/new_workspace.py'

class LocalToolsTest(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)/'root'
        subprocess.run([sys.executable, str(GENERATOR), str(self.root)], check=True, capture_output=True)

    def run_task(self, program, timeout=5):
        (self.root/'runtime/tasks.json').write_text(json.dumps({'schema_version':1,'tasks':{'test':{'argv':['{python}','-c',program],'cwd':'.'}}}))
        return subprocess.run([sys.executable,'scripts/local_tools.py','run','test','--timeout',str(timeout)],cwd=self.root,capture_output=True,text=True)

    def result(self):
        return json.loads(next((self.root/'artifacts').glob('run-*/result.json')).read_text())

    def test_success_and_html_escape(self):
        result=self.run_task("print('<script>alert(1)</script>')")
        self.assertEqual(result.returncode,0,result.stderr)
        self.assertEqual(self.result()['exit_code'],0)
        subprocess.run([sys.executable,'scripts/local_tools.py','report'],cwd=self.root,check=True,capture_output=True)
        report=(self.root/'artifacts/report.html').read_text()
        self.assertIn('&lt;script&gt;', report)
        self.assertNotIn('<script>alert', report)

    def test_failure_is_not_success(self):
        self.assertEqual(self.run_task('raise SystemExit(7)').returncode,7)
        self.assertEqual(self.result()['exit_code'],7)

    def test_launch_failures_retain_reportable_evidence(self):
        denied=self.root/'not-executable'
        denied.write_text('not executable')
        denied.chmod(0o600)
        for executable, expected in ((str(self.root/'missing'),127),(str(denied),126)):
            with self.subTest(expected=expected):
                (self.root/'runtime/tasks.json').write_text(json.dumps({'schema_version':1,'tasks':{'test':{'argv':[executable],'cwd':'.'}}}))
                completed=subprocess.run([sys.executable,'scripts/local_tools.py','run','test'],cwd=self.root,capture_output=True,text=True)
                self.assertEqual(completed.returncode,expected)
                record=Path(completed.stdout.strip())/'result.json'
                result=json.loads(record.read_text())
                self.assertEqual(result['exit_code'],expected)
                self.assertTrue(result['launch_failed'])
                self.assertFalse(result['timed_out'])
                self.assertFalse(result['cancelled'])
                self.assertGreaterEqual(result['duration_seconds'],0)
                self.assertEqual(result['output_bytes'],record.with_name('output.log').stat().st_size)
                self.assertNotIn(executable,record.with_name('output.log').read_text())
        subprocess.run([sys.executable,'scripts/local_tools.py','report'],cwd=self.root,check=True,capture_output=True)
        self.assertIn('launch_failed', (self.root/'artifacts/report.html').read_text())

    def test_report_selects_latest_timestamps_not_random_names(self):
        for index in range(60):
            directory=self.root/'artifacts'/f'run-{59-index:032x}'
            directory.mkdir(parents=True)
            (directory/'result.json').write_text(json.dumps({'task':f'task-{index:02}', 'started_at':index}))
            (directory/'output.log').write_text('synthetic')
        (self.root/'artifacts/run-zzzz').symlink_to(directory,target_is_directory=True)
        subprocess.run([sys.executable,'scripts/local_tools.py','report'],cwd=self.root,check=True,capture_output=True)
        report=(self.root/'artifacts/report.html').read_text()
        self.assertEqual(report.count('<section>'),50)
        for index in range(10):
            self.assertNotIn(f'<h2>task-{index:02}</h2>',report)
        positions=[report.index(f'<h2>task-{index:02}</h2>') for index in range(10,60)]
        self.assertEqual(positions,sorted(positions))

    def test_report_timestamp_ties_and_legacy_fallback(self):
        for name, timestamp in (('b',1),('a',1),('legacy',None),('invalid','bad'),('nonfinite',float('nan'))):
            directory=self.root/'artifacts'/f'run-{name}'
            directory.mkdir(parents=True)
            record=directory/'result.json'
            record.write_text(json.dumps({'task':name,'started_at':timestamp}))
            os.utime(record,(0,0))
            (directory/'output.log').write_text('synthetic')
        subprocess.run([sys.executable,'scripts/local_tools.py','report'],cwd=self.root,check=True,capture_output=True)
        report=(self.root/'artifacts/report.html').read_text()
        expected=['invalid','legacy','nonfinite','a','b']
        positions=[report.index(f'<h2>{name}</h2>') for name in expected]
        self.assertEqual(positions,sorted(positions))

    def test_timeout_is_recorded(self):
        self.assertEqual(self.run_task('import time; time.sleep(10)',0.1).returncode,124)
        self.assertTrue(self.result()['timed_out'])

    def test_output_is_bounded(self):
        self.assertEqual(self.run_task("print('x'*600000)").returncode,0)
        self.assertTrue(self.result()['truncated'])
        self.assertLessEqual(next((self.root/'artifacts').glob('run-*/output.log')).stat().st_size,262144)

    def test_bad_working_directory_is_rejected(self):
        (self.root/'runtime/tasks.json').write_text(json.dumps({'schema_version':1,'tasks':{'bad':{'argv':['echo','x'],'cwd':'../outside'}}}))
        result=subprocess.run([sys.executable,'scripts/local_tools.py','run','bad'],cwd=self.root,capture_output=True)
        self.assertNotEqual(result.returncode,0)
        self.assertFalse(list((self.root/'artifacts').glob('run-*')))

    def test_cancellation_records_result(self):
        program="import time; print('ready',flush=True); time.sleep(30)"
        (self.root/'runtime/tasks.json').write_text(json.dumps({'schema_version':1,'tasks':{'test':{'argv':['{python}','-c',program],'cwd':'.'}}}))
        process=subprocess.Popen([sys.executable,'scripts/local_tools.py','run','test'],cwd=self.root,stdout=subprocess.PIPE,stderr=subprocess.PIPE,text=True)
        try:
            deadline=time.monotonic()+5
            while time.monotonic()<deadline:
                logs=list((self.root/'artifacts').glob('run-*/output.log'))
                if logs and 'ready' in logs[0].read_text():
                    break
                time.sleep(0.02)
            else:
                self.fail('runner did not become ready')
            process.send_signal(signal.SIGINT)
            stdout,stderr=process.communicate(timeout=5)
            self.assertEqual(process.returncode,130,stderr)
            self.assertTrue(self.result()['cancelled'])
        finally:
            if process.poll() is None:
                process.kill()
                process.communicate()

    def test_capture_rejects_non_loopback_before_loading_browser(self):
        for url in ('https://example.com','http://localhost:8000','http://127.0.0.1.evil.test','file:///tmp/test'):
            result=subprocess.run([sys.executable,'scripts/capture_local.py',url],cwd=self.root,capture_output=True,text=True)
            self.assertNotEqual(result.returncode,0)
            self.assertIn('literal loopback',result.stderr)

if __name__=='__main__':
    unittest.main()
