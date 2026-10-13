"""Opt-in local browser acceptance; enable after installing pinned Playwright."""
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import threading
import unittest
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer

ROOT=Path(__file__).resolve().parents[1]

@unittest.skipUnless(os.environ.get('SDLC_BROWSER_TEST')=='1','optional Playwright browser acceptance')
class BrowserCaptureTest(unittest.TestCase):
    def test_capture_and_external_request_block(self):
        class Handler(BaseHTTPRequestHandler):
            def do_GET(self):
                self.send_response(200)
                self.send_header('Content-Type','text/html')
                self.end_headers()
                self.wfile.write(b'<h1>Local capture fixture</h1><script>console.log("fixture-ready");fetch("https://example.com/blocked").catch(()=>{});</script>')
            def log_message(self,*args):
                pass
        with tempfile.TemporaryDirectory() as tmp:
            destination=Path(tmp)/'root'
            subprocess.run([sys.executable,str(ROOT/'scripts/new_workspace.py'),str(destination)],check=True,capture_output=True)
            server=ThreadingHTTPServer(('127.0.0.1',0),Handler)
            thread=threading.Thread(target=server.serve_forever,daemon=True)
            thread.start()
            try:
                result=subprocess.run([sys.executable,'scripts/capture_local.py',f'http://127.0.0.1:{server.server_port}','--seconds','1'],cwd=destination,capture_output=True,text=True,timeout=40)
                self.assertEqual(result.returncode,0,result.stderr)
                evidence=next((destination/'artifacts').glob('browser-*'))
                self.assertGreater((evidence/'page.png').stat().st_size,100)
                self.assertGreater(next(evidence.glob('*.webm')).stat().st_size,100)
                events=json.loads((evidence/'events.json').read_text())
                self.assertTrue(any(x['kind']=='blocked' and 'example.com' in x['text'] for x in events))
                self.assertTrue(any(x['kind']=='console' and 'fixture-ready' in x['text'] for x in events))
            finally:
                server.shutdown()
                server.server_close()
                thread.join()
