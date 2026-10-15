import importlib.util
import os
from pathlib import Path
import subprocess
import tempfile
import unittest

SCRIPT = Path(__file__).resolve().parents[1] / "scripts/check_identity_history.py"
SPEC = importlib.util.spec_from_file_location("identity_history", SCRIPT)
identity_history = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(identity_history)


class IdentityHistoryTests(unittest.TestCase):
    def test_rejects_personal_metadata_in_ancestors(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            subprocess.run(["git", "init", "-q", str(root)], check=True)
            for name, email in (("Person A", "person@example.test"),
                                ("SDLC Maintainers", "maintainers@example.org")):
                environment = dict(os.environ, GIT_AUTHOR_NAME=name, GIT_AUTHOR_EMAIL=email,
                                   GIT_COMMITTER_NAME=name, GIT_COMMITTER_EMAIL=email)
                subprocess.run(["git", "-C", str(root), "-c", "commit.gpgsign=false",
                                "-c", "core.hooksPath=/dev/null", "commit", "--allow-empty",
                                "-qm", "test: synthetic identity fixture"],
                               env=environment, check=True)
            self.assertEqual(identity_history.check_history(root), (2, [2]))
            shallow = root / "shallow"
            subprocess.run(["git", "clone", "-q", "--depth=1", root.as_uri(), str(shallow)],
                           check=True)
            with self.assertRaisesRegex(ValueError, "Complete Git history is required"):
                identity_history.check_history(shallow)

    def test_accepts_role_metadata(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            subprocess.run(["git", "init", "-q", str(root)], check=True)
            environment = dict(os.environ, GIT_AUTHOR_NAME="SDLC Maintainers",
                               GIT_AUTHOR_EMAIL="maintainers@example.org",
                               GIT_COMMITTER_NAME="SDLC Maintainers",
                               GIT_COMMITTER_EMAIL="maintainers@example.org")
            subprocess.run(["git", "-C", str(root), "-c", "commit.gpgsign=false",
                            "-c", "core.hooksPath=/dev/null", "commit", "--allow-empty",
                            "-qm", "test: synthetic identity fixture"],
                           env=environment, check=True)
            self.assertEqual(identity_history.check_history(root, all_refs=True), (1, []))
