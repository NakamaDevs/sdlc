#!/usr/bin/env python3
"""Check reachable Git authorship without printing discovered identities."""
import argparse
import os
from pathlib import Path
import subprocess

IDENTITY = (b"SDLC Maintainers", b"maintainers@example.org")


def check_history(root, all_refs=False):
    environment = dict(os.environ, GIT_NO_REPLACE_OBJECTS="1")
    shallow = subprocess.check_output(
        ["git", "-C", str(root), "rev-parse", "--is-shallow-repository"],
        env=environment,
    ).strip()
    if shallow != b"false":
        raise ValueError("Complete Git history is required; fetch the full history before checking")
    output = subprocess.check_output(
        ["git", "-C", str(root), "log", "-z",
         "--format=%H%x00%an%x00%ae%x00%cn%x00%ce",
         "--all" if all_refs else "HEAD", "--"],
        env=environment,
    )
    fields = output.split(b"\0")
    if fields[-1:] == [b""]:
        fields.pop()
    if len(fields) % 5:
        raise ValueError("Could not parse Git identity metadata")
    findings = []
    for offset in range(0, len(fields), 5):
        _, author, author_email, committer, committer_email = fields[offset:offset + 5]
        if (author, author_email) != IDENTITY or (committer, committer_email) != IDENTITY:
            findings.append(offset // 5 + 1)
    return len(fields) // 5, findings


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--all", action="store_true", help="Include every local ref")
    args = parser.parse_args()
    try:
        count, findings = check_history(Path(__file__).resolve().parent.parent, args.all)
    except ValueError as error:
        print(str(error))
        return 1
    if findings:
        for index in findings:
            print(f"Commit #{index} contains unapproved identity metadata (redacted).")
        return 1
    print(f"Identity metadata checks passed for {count} reachable commits.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
