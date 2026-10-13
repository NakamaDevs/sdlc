#!/usr/bin/env python3
"""Optional Playwright observation of a reviewed literal-loopback URL."""
import argparse
import ipaddress
import json
from pathlib import Path
from urllib.parse import urlsplit
import uuid

ROOT=Path(__file__).resolve().parents[1]


def local_url(url):
    try:
        parts=urlsplit(url)
        return parts.scheme in ('http','https') and not parts.username and not parts.password and ipaddress.ip_address(parts.hostname).is_loopback
    except (ValueError,TypeError):
        return False


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('url')
    parser.add_argument('--seconds',type=int,default=3)
    args=parser.parse_args()
    if not local_url(args.url):
        parser.error('Use an http(s) URL with a literal loopback IP address')
    if not 1 <= args.seconds <= 60:
        parser.error('seconds must be between 1 and 60')
    try:
        from playwright.sync_api import sync_playwright
    except ImportError:
        parser.error('Install the reviewed Playwright Python version and Chromium separately')
    base=ROOT/'artifacts'
    if base.is_symlink():
        parser.error('artifacts must not be a symlink')
    output=base/('browser-'+uuid.uuid4().hex)
    output.mkdir(parents=True,mode=0o700)
    events=[]
    def record(kind,text):
        if len(events)<1000:
            events.append({'kind':kind,'text':text[:2000]})
    with sync_playwright() as playwright:
        browser=playwright.chromium.launch()
        context=browser.new_context(record_video_dir=str(output),service_workers='block',accept_downloads=False)
        def route_request(route):
            if local_url(route.request.url) and urlsplit(route.request.url).netloc == urlsplit(args.url).netloc and urlsplit(route.request.url).scheme == urlsplit(args.url).scheme:
                route.continue_()
            else:
                record('blocked',route.request.url)
                route.abort()
        context.route('**/*',route_request)
        # WebSockets need their own route and require a current reviewed Playwright.
        context.route_web_socket('**/*',lambda socket: socket.close())
        page=context.new_page()
        page.on('console',lambda message: record('console',message.text))
        page.on('pageerror',lambda error: record('pageerror',str(error)))
        try:
            page.goto(args.url,wait_until='domcontentloaded',timeout=15000)
            page.wait_for_timeout(args.seconds*1000)
            page.screenshot(path=str(output/'page.png'),full_page=True)
        finally:
            context.close()  # Finalizes recorded videos.
            browser.close()
            (output/'events.json').write_text(json.dumps(events,indent=2)+'\n')
    print(output)


if __name__=='__main__':
    main()
