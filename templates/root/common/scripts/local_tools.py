#!/usr/bin/env python3
"""POSIX foreground task runner with bounded private artifacts; not a sandbox."""
import argparse
import html
import json
import math
import os
from pathlib import Path
import selectors
import signal
import subprocess
import sys
import time
import uuid

ROOT = Path(__file__).resolve().parents[1]
LIMIT = 262144


def artifacts():
    path = ROOT/'artifacts'
    if path.is_symlink():
        raise ValueError('artifacts must not be a symlink')
    path.mkdir(exist_ok=True, mode=0o700)
    return path


def run(name, timeout):
    if os.name != 'posix':
        raise ValueError('Process cleanup currently requires POSIX')
    if not math.isfinite(timeout) or not 0 < timeout <= 86400:
        raise ValueError('timeout must be between 0 and 86400 seconds')
    config = json.loads((ROOT/'runtime/tasks.json').read_text())
    if config.get('schema_version') != 1:
        raise ValueError('Unsupported task schema')
    task = config['tasks'][name]
    argv = task['argv']
    if not isinstance(argv, list) or not argv or not all(isinstance(x,str) and x for x in argv):
        raise ValueError('argv must be a nonempty string array')
    argv = [sys.executable if x == '{python}' else x for x in argv]
    cwd = (ROOT/task['cwd']).resolve()
    if not cwd.is_relative_to(ROOT) or not cwd.is_dir():
        raise ValueError('Working directory must exist inside the root')
    directory = artifacts()/('run-'+uuid.uuid4().hex)
    directory.mkdir(mode=0o700)
    env = {key:os.environ[key] for key in ('PATH','LANG','LC_ALL','TMPDIR') if key in os.environ}
    env['PYTHONUNBUFFERED']='1'
    started=time.time()
    timed_out=cancelled=truncated=False
    size=0
    print(directory,flush=True)
    process=subprocess.Popen(argv,cwd=cwd,env=env,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,start_new_session=True)
    previous_handler=signal.getsignal(signal.SIGTERM)
    def terminate(signum, frame):
        raise KeyboardInterrupt
    signal.signal(signal.SIGTERM,terminate)
    try:
        with selectors.DefaultSelector() as selector, (directory/'output.log').open('wb') as log:
            selector.register(process.stdout,selectors.EVENT_READ)
            deadline=time.monotonic()+timeout
            while selector.get_map():
                if time.monotonic() >= deadline:
                    timed_out=True
                    break
                for key,_ in selector.select(min(0.1,max(0,deadline-time.monotonic()))):
                    chunk=os.read(key.fileobj.fileno(),65536)
                    if not chunk:
                        selector.unregister(key.fileobj)
                        continue
                    accepted=chunk[:max(0,LIMIT-size)]
                    log.write(accepted)
                    log.flush()
                    size+=len(accepted)
                    truncated |= len(accepted)<len(chunk)
            # A task can close its output while it continues running.
            if not timed_out:
                try:
                    process.wait(timeout=max(0.001,deadline-time.monotonic()))
                except subprocess.TimeoutExpired:
                    timed_out=True
    except KeyboardInterrupt:
        cancelled=True
    finally:
        signal.signal(signal.SIGTERM,previous_handler)
        # Only the process group created by this invocation is owned here.
        try:
            os.killpg(process.pid,signal.SIGTERM)
        except ProcessLookupError:
            pass
        try:
            process.wait(timeout=2)
        except subprocess.TimeoutExpired:
            pass
        # Clean up descendants even if the foreground parent already exited.
        try:
            os.killpg(process.pid,signal.SIGKILL)
        except ProcessLookupError:
            pass
        process.wait()
        process.stdout.close()
    code=130 if cancelled else 124 if timed_out else process.returncode
    result={'task':name,'cwd':str(cwd.relative_to(ROOT)),'started_at':started,'duration_seconds':round(time.time()-started,3),'exit_code':code,'timed_out':timed_out,'cancelled':cancelled,'truncated':truncated,'output_bytes':size}
    (directory/'result.json').write_text(json.dumps(result,indent=2)+'\n')
    return code if 0 <= code <= 255 else 1


def report():
    directory=artifacts()
    entries=[]
    for record in sorted(directory.glob('run-*/result.json'))[-50:]:
        if record.is_symlink() or record.parent.is_symlink():
            continue
        result=json.loads(record.read_text())
        log=record.with_name('output.log')
        if log.is_symlink():
            continue
        with log.open('rb') as stream:
            output=stream.read(LIMIT).decode('utf-8',errors='replace')
        entries.append('<section><h2>'+html.escape(str(result['task']))+'</h2><pre>'+html.escape(json.dumps(result,indent=2))+'</pre><details><summary>Output</summary><pre>'+html.escape(output)+'</pre></details></section>')
    target=directory/'report.html'
    if target.is_symlink():
        raise ValueError('Report target must not be a symlink')
    target.write_text('<!doctype html><html lang="en"><meta charset="utf-8"><meta http-equiv="Content-Security-Policy" content="default-src \'none\'; style-src \'unsafe-inline\'"><title>Local task evidence</title><style>body{font:16px system-ui;max-width:960px;margin:3rem auto;padding:1rem}pre{white-space:pre-wrap;overflow-wrap:anywhere}section{border-top:1px solid #888;padding:1rem 0}</style><h1>Local task evidence</h1><p>Static report. Task results do not establish deployment or acceptance.</p>'+''.join(entries)+'</html>')
    print(target)


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    commands=parser.add_subparsers(dest='command',required=True)
    runner=commands.add_parser('run')
    runner.add_argument('name')
    runner.add_argument('--timeout',type=float,default=300)
    commands.add_parser('report')
    args=parser.parse_args()
    try:
        if args.command=='report':
            report()
            return 0
        return run(args.name,args.timeout)
    except (ValueError,OSError,KeyError,TypeError) as error:
        parser.exit(1,f'Local tools failed: {error}\n')


if __name__=='__main__':
    raise SystemExit(main())
