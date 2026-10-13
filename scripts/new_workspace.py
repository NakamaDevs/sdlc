#!/usr/bin/env python3
"""Create a private-root starter without touching application repositories."""
import argparse
import shutil
from pathlib import Path


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('destination', type=Path)
    parser.add_argument('--language', choices=('en', 'es'), default='en')
    args = parser.parse_args()
    destination = args.destination.expanduser().absolute()
    source = Path(__file__).resolve().parents[1] / 'templates/root'
    if destination.exists() or destination.is_symlink():
        parser.error('Destination already exists; choose a new directory.')
    if not destination.parent.is_dir():
        parser.error('Destination parent must exist.')
    destination.mkdir()
    for layer in ('common', args.language):
        shutil.copytree(source/layer, destination, dirs_exist_ok=True,
                        ignore=shutil.ignore_patterns('__pycache__', '*.pyc'))
    for name in ('repos', 'worktrees', 'state', 'artifacts', 'docs/repositories', 'docs/decisions', 'docs/work'):
        (destination/name).mkdir(exist_ok=True, mode=0o700 if name in ('state', 'artifacts') else 0o755)
    print(f'Created {destination}. Review README.md before connecting repositories.')


if __name__ == '__main__':
    main()
