# Adapter registry

Select tools after discovery. Record one entry per selected capability with source, version, license, owner, and validation.

The starter implements inventory checks, foreground Python command execution, static reports, and optional browser capture.
It does not configure a tracker, cloud, VPN, native agent runtime, Bunko release, AppHost, or telemetry collector.

## Required adapter record

Record purpose, inputs, outputs, working directory, allowed paths, environment names, network access, and side effects.
Define success, failure, cancellation, denied-access, and cleanup checks. Record the tested platform and source revision.
Keep implementation-specific credentials and endpoint values in ignored local configuration.

## Python tools

Run the synthetic demo with `python3 scripts/local_tools.py run demo --timeout 10`.
Build its private static report with `python3 scripts/local_tools.py report`.
Commands receive only basic path, locale, temporary-directory, and unbuffered-output environment values.
Tasks needing other configuration require a reviewed adapter. Do not embed secrets in task arguments.

Browser capture needs a separately reviewed Playwright installation and Chromium. All WebSocket traffic is blocked in the sample.
Run `python3 scripts/capture_local.py http://127.0.0.1:8000 --seconds 3` for a reviewed local synthetic page.
This is page observation, not a full user-journey recorder or a network security sandbox.

Keep Python as the first implementation. Future language adapters must pass equivalent behavior and safety checks.

Optional setup after reviewing the pinned dependencies:

```sh
python3 -m venv .venv-browser
.venv-browser/bin/python -m pip install -r runtime/browser-requirements.txt
.venv-browser/bin/python -m playwright install chromium
.venv-browser/bin/python scripts/capture_local.py http://127.0.0.1:8000 --seconds 3
```
