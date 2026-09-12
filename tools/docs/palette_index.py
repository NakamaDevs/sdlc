"""Build the compact index used by the documentation command palette.

The rendered search index (``site/search.json``) carries the full text of every
section and is several megabytes, which is too large to fetch when the palette
opens. This script writes a much smaller index holding only what the palette
needs to jump somewhere: every page, and every second- and third-level heading.

Entries are arrays rather than objects to keep the file small:

    [kind, title, url, context, source]

``kind`` is 0 for a page and 1 for a heading. ``context`` is the navigation
section for a page, and the owning page title for a heading. ``source`` is the
Markdown path, present on pages only, so the palette can open the file.

Run it before a build or a preview; both documentation tasks do this already.
"""

from __future__ import annotations

import json
import re
import subprocess
import sys
from pathlib import Path

import yaml
from markdown.extensions.toc import slugify

PAGE, HEADING = 0, 1

_FENCE = re.compile(r"^(```|~~~)")
_HEADING = re.compile(r"^(#{1,3})\s+(.+?)\s*#*\s*$")
_ATTR_LIST = re.compile(r"\s*\{[:#][^}]*\}\s*$")
_INLINE_CODE = re.compile(r"`([^`]*)`")
_LINK = re.compile(r"\[([^\]]*)\]\([^)]*\)")


class _Loader(yaml.SafeLoader):
    """Ignore the Python-object tags that the Markdown extensions use."""


_Loader.add_multi_constructor("tag:yaml.org,2002:python/name:", lambda *_: None)
_Loader.add_multi_constructor("!!python/name:", lambda *_: None)


def _nav_sections(nav: object, trail: tuple[str, ...] = ()) -> dict[str, str]:
    """Map each page path in the navigation to its section trail."""
    sections: dict[str, str] = {}
    if isinstance(nav, list):
        for entry in nav:
            sections.update(_nav_sections(entry, trail))
    elif isinstance(nav, dict):
        for title, value in nav.items():
            if isinstance(value, str):
                sections[value] = " › ".join(trail) if trail else ""
            else:
                sections.update(_nav_sections(value, trail + (str(title),)))
    return sections


def _page_url(relative: Path) -> str:
    """Match ``use_directory_urls``: a page becomes a directory, README an index."""
    parts = list(relative.parts)
    stem = Path(parts[-1]).stem
    parts = parts[:-1] if stem in ("index", "README") else parts[:-1] + [stem]
    return "/".join(parts) + "/" if parts else ""


def _clean(text: str) -> str:
    text = _ATTR_LIST.sub("", text)
    text = _LINK.sub(r"\1", text)
    text = _INLINE_CODE.sub(r"\1", text)
    return text.replace("*", "").replace("_", "").strip()


def _read(path: Path) -> tuple[str | None, list[tuple[str, str]]]:
    """Return a page title and its ``(text, slug)`` headings, ignoring code fences."""
    title: str | None = None
    headings: list[tuple[str, str]] = []
    fence: str | None = None

    for line in path.read_text(encoding="utf-8", errors="replace").splitlines():
        opening = _FENCE.match(line)
        if opening:
            marker = opening.group(1)
            if fence is None:
                fence = marker
            elif line.startswith(fence):
                fence = None
            continue
        if fence is not None:
            continue

        match = _HEADING.match(line)
        if not match:
            continue
        text = _clean(match.group(2))
        if not text:
            continue
        if len(match.group(1)) == 1:
            if title is None:
                title = text
            continue
        headings.append((text, slugify(text, "-")))

    return title, headings
