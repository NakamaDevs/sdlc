"""Portable starter acceptance tests. No network or application processes."""
import json
import re
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
GENERATOR = ROOT / 'scripts/new_workspace.py'

class WorkspaceTest(unittest.TestCase):
    def generate(self, destination, language='en'):
        return subprocess.run([sys.executable, str(GENERATOR), str(destination), '--language', language], capture_output=True, text=True)

    def test_both_languages_work_offline(self):
        for language in ('en', 'es'):
            with self.subTest(language=language), tempfile.TemporaryDirectory() as tmp:
                destination = Path(tmp) / 'root'
                result = self.generate(destination, language)
                self.assertEqual(result.returncode, 0, result.stderr)
                for command in ('check', 'context'):
                    result = subprocess.run([sys.executable, 'scripts/workspace.py', command], cwd=destination, capture_output=True, text=True)
                    self.assertEqual(result.returncode, 0, result.stderr)
                self.assertEqual((destination/'CLAUDE.md').read_text(), '@AGENTS.md\n')
                self.assertIn('/repos/', (destination/'.gitignore').read_text())
                self.assertEqual(json.loads((destination/'workspace.json').read_text())['repositories'], [])

    def test_template_languages_and_local_links(self):
        template=ROOT/'templates/root'
        english={p.relative_to(template/'en') for p in (template/'en').rglob('*.md')}
        spanish={p.relative_to(template/'es') for p in (template/'es').rglob('*.md')}
        self.assertEqual(english,spanish)
        for language in ('en','es'):
            with tempfile.TemporaryDirectory() as tmp:
                destination=Path(tmp)/'root'
                self.assertEqual(self.generate(destination,language).returncode,0)
                for document in destination.rglob('*.md'):
                    for target in re.findall(r'\[[^\]]*\]\(([^)]+)\)',document.read_text()):
                        if '://' not in target and not target.startswith('#'):
                            self.assertTrue((document.parent/target.split('#')[0]).exists(),f'{document}: {target}')

    def test_existing_destination_is_preserved(self):
        with tempfile.TemporaryDirectory() as tmp:
            destination = Path(tmp) / 'root'
            destination.mkdir()
            marker = destination / 'keep'
            marker.write_text('existing work')
            result = self.generate(destination)
            self.assertNotEqual(result.returncode, 0)
            self.assertIn('Destination already exists', result.stderr)
            self.assertEqual(marker.read_text(), 'existing work')
            self.assertEqual(list(destination.iterdir()), [marker])

    def test_symlink_destination_is_rejected(self):
        with tempfile.TemporaryDirectory() as tmp:
            destination = Path(tmp) / 'link'
            destination.symlink_to(Path(tmp) / 'missing')
            self.assertNotEqual(self.generate(destination).returncode, 0)
            self.assertFalse((Path(tmp) / 'missing').exists())

    def test_invalid_repository_inventory_fails(self):
        with tempfile.TemporaryDirectory() as tmp:
            destination = Path(tmp) / 'root'
            self.assertEqual(self.generate(destination).returncode, 0)
            for path in ('../outside', '/tmp/outside', 'repos/missing'):
                (destination/'workspace.json').write_text(json.dumps({'schema_version':1, 'repositories':[{'name':'api','path':path,'owner':'team'}]}))
                result = subprocess.run([sys.executable, 'scripts/workspace.py', 'check'], cwd=destination, capture_output=True, text=True)
                self.assertNotEqual(result.returncode, 0)

    def test_child_repository_is_read_only(self):
        with tempfile.TemporaryDirectory() as tmp:
            destination = Path(tmp) / 'root'
            self.assertEqual(self.generate(destination).returncode, 0)
            child = destination/'repos/api'
            child.mkdir(parents=True)
            marker = child/'README.md'
            marker.write_text('upstream text')
            manifest = {'schema_version':1,'repositories':[{'name':'api','path':'repos/api','owner':'team'}]}
            (destination/'workspace.json').write_text(json.dumps(manifest))
            result = subprocess.run([sys.executable, 'scripts/workspace.py', 'check'], cwd=destination, capture_output=True, text=True)
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertEqual(list(child.iterdir()), [marker])
            self.assertEqual(marker.read_text(), 'upstream text')

if __name__ == '__main__':
    unittest.main()
