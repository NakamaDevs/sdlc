"""Build a Zensical view of configured roots without editing maintained sources."""
from __future__ import annotations
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import threading
import time

from palette_index import _read, _page_url

ROOT = Path(__file__).resolve().parents[2]
CONFIG = Path(os.environ.get('SDLC_WORKSPACE_CONFIG', ROOT / 'workspace.json')).resolve()
BUILD = ROOT / '_build/docs'
SOURCE = BUILD / 'source'
ASSETS = Path(__file__).parent / 'assets'


def prepare(dev=False):
    config = json.loads(CONFIG.read_text())
    ids = [item['id'] for item in config['documentation']]
    reserved = {'assets', 'stylesheets', 'javascripts'}
    if len(set(ids)) != len(ids) or set(ids) & reserved:
        raise ValueError('Documentation IDs must be unique and must not use asset directory names')
    SOURCE.mkdir(parents=True, exist_ok=True)
    for child in SOURCE.iterdir():
        if child.is_dir() and child.name not in set(ids) | reserved:
            shutil.rmtree(child)
    shutil.copytree(ASSETS, SOURCE, dirs_exist_ok=True)
    entries, sources, nav, landing_links = [], {}, [], []
    revisions = {}
    for item in config['documentation']:
        ident = item['id']
        if not ident.isidentifier():
            raise ValueError('Documentation IDs must be identifiers')
        repo = (CONFIG.parent / config['repositories'][item['repository']]).resolve()
        folder = (repo / item['path']).resolve()
        folder.relative_to(repo)
        target = SOURCE / ident
        shutil.copytree(folder, target, dirs_exist_ok=True)
        live = {p.relative_to(folder) for p in folder.rglob('*') if p.is_file()}
        for p in target.rglob('*'):
            if p.is_file() and p.relative_to(target) not in live:
                p.unlink()
        pages = []
        for path in sorted(folder.rglob('*.md')):
            relative = path.relative_to(folder)
            mounted = Path(ident) / relative
            title, headings = _read(path)
            title = title or path.stem
            url = _page_url(mounted)
            entries.append([0, title, url, item['label'], mounted.as_posix()])
            sources[mounted.as_posix()] = {'repository': item['repository'], 'path': path.relative_to(repo).as_posix()}
            repository_url = config.get('repository_urls', {}).get(item['repository'])
            if repository_url:
                from urllib.parse import quote
                if repo not in revisions:
                    revisions[repo] = subprocess.check_output(['git', '-C', str(repo), 'rev-parse', 'HEAD'], text=True).strip()
                branch = revisions[repo]
                sources[mounted.as_posix()]['url'] = repository_url.rstrip('/') + '/blob/' + branch + '/' + quote(path.relative_to(repo).as_posix())
            entries.extend([1, text, url + '#' + slug, title] for text, slug in headings)
            pages.append({title: mounted.as_posix()})
        pages.sort(key=lambda p: 0 if Path(next(iter(p.values()))).name in {'README.md', 'index.md'} else 1)
        if pages:
            landing_links.append(f"- [{item['label']}]({next(iter(pages[0].values()))})")
        nav.append({item['label']: pages})
    (SOURCE / 'index.md').write_text('# ' + config['name'] + '\n\n' + '\n'.join(landing_links) + '\n')
    (SOURCE / 'assets').mkdir(exist_ok=True)
    (SOURCE / 'assets/palette-index.json').write_text(json.dumps({'entries':entries,'sources':sources,'origin':'','repositories':list(config.get('repository_urls', {}).items()),'applications':[],'linear':''},ensure_ascii=False))
    import yaml
    theme = {'name':'material','variant':'classic','custom_dir':'../../tools/docs/overrides','font':False,'palette':[{'scheme':'default','toggle':{'icon':'material/weather-night','name':'Dark mode'}},{'scheme':'slate','toggle':{'icon':'material/weather-sunny','name':'Light mode'}}],'features':['navigation.tabs','navigation.sections','navigation.top','search.highlight','search.suggest']}
    settings = {'site_name':config['name'],'docs_dir':'source','site_dir':'site','use_directory_urls':True,'nav':[{'Home':'index.md'},*nav],'theme':theme,'markdown_extensions':['admonition','attr_list','md_in_html','tables',{'toc':{'permalink':True}},'pymdownx.details',{'pymdownx.highlight':{'pygments_lang_class':True,'anchor_linenums':True,'line_spans':'__span'}},'pymdownx.superfences'],'extra_css':[f'stylesheets/{name}.css' for name in ['sdlc','palette','annotations','codeview','diagram-viewer','course-navigation']],'extra_javascript':[f'javascripts/{name}.js' for name in ['palette','annotations','codeview']]}
    if dev:
        # The dev server loads the Tidewave toolbar. Static builds stay free of it.
        settings['extra'] = {'tidewave_root': str(ROOT)}
        settings['site_dir'] = 'site-dev'
    text = yaml.safe_dump(settings,sort_keys=False,allow_unicode=True)
    text = text.replace('- pymdownx.superfences\n', '- pymdownx.superfences:\n    custom_fences:\n    - name: mermaid\n      class: mermaid\n      format: !!python/name:pymdownx.superfences.fence_code_format\n')
    # Separate files let a static build run beside the dev server.
    (BUILD / ('mkdocs.yml' if dev else 'mkdocs.build.yml')).write_text(text)


def signature():
    config = json.loads(CONFIG.read_text())
    paths = [CONFIG, *ASSETS.rglob('*')]
    for item in config['documentation']:
        paths.extend((CONFIG.parent / config['repositories'][item['repository']] / item['path']).rglob('*'))
    return [(str(p), p.stat().st_mtime_ns, p.stat().st_size) for p in paths if p.is_file()]


def watch():
    previous = signature()
    while True:
        time.sleep(1)
        current = signature()
        if current != previous:
            prepare(dev=True)
            previous = current


if __name__ == '__main__':
    executable = str(Path(sys.executable).parent / 'zensical')
    if '--build' in sys.argv:
        prepare()
        raise SystemExit(subprocess.call([executable,'build','-f',str(BUILD/'mkdocs.build.yml')]))
    prepare(dev=True)
    threading.Thread(target=watch,daemon=True).start()
    raise SystemExit(subprocess.call([executable,'serve','-f',str(BUILD/'mkdocs.yml'),'--dev-addr',f"127.0.0.1:{os.environ['PORT']}"]))
