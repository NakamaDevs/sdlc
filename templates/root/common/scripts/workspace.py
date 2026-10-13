#!/usr/bin/env python3
"""Read-only inventory checks. Does not execute application or Git commands."""
import argparse
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def check():
    manifest = json.loads((ROOT/'workspace.json').read_text())
    if not isinstance(manifest, dict) or manifest.get('schema_version') != 1:
        raise ValueError('Unsupported workspace schema')
    repositories = manifest.get('repositories')
    if not isinstance(repositories, list):
        raise ValueError('repositories must be a list')
    seen_names, seen_paths = set(), set()
    for item in repositories:
        if not isinstance(item, dict):
            raise ValueError('Repository entry must be an object')
        for field in ('name', 'path', 'owner'):
            if not isinstance(item.get(field), str) or not item[field].strip():
                raise ValueError(f'Repository requires {field}')
        path = Path(item['path'])
        if path.is_absolute() or '..' in path.parts or path.parts[0] not in ('repos', 'worktrees'):
            raise ValueError('Repository path must stay under repos/ or worktrees/')
        resolved = (ROOT/path).resolve()
        if not resolved.is_relative_to(ROOT) or not resolved.is_dir():
            raise ValueError('Repository path is missing or escapes the root')
        if item['name'] in seen_names or resolved in seen_paths:
            raise ValueError('Duplicate repository name or path')
        seen_names.add(item['name'])
        seen_paths.add(resolved)
    for name in ('AGENTS.md', 'CLAUDE.md', 'docs/system.md', 'docs/onboarding.md', 'agents/brief.md', 'runtime/README.md'):
        if not (ROOT/name).is_file():
            raise ValueError(f'Missing required file: {name}')
    print(f'Scaffold valid; {len(repositories)} repository entries. Application readiness is not checked.')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('command', choices=('check', 'context'))
    args = parser.parse_args()
    try:
        check()
        if args.command == 'context':
            for name in ('AGENTS.md', 'docs/system.md', 'docs/onboarding.md', 'agents/brief.md'):
                print(ROOT/name)
    except (ValueError, OSError) as error:
        parser.exit(1, f'Workspace check failed: {error}\n')


if __name__ == '__main__':
    main()
