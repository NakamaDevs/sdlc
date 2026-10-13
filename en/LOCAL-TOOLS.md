# LOCAL-TOOLS

Provide local documentation, review, runtime inspection, and browser evidence as separate capabilities.
Use Python for the reference command and evidence layer. Applications can use any supported language.

## Documentation and review

The inspected Bunko workspace uses Zensical for Docs and Pierre Diffs for code rendering in Review.
Pierre Diffs is the library at diffs.com. It is not a task tracker or the complete review workflow.
Keep source selection, annotations, evidence, and review decisions separate from the rendering library.
The generic starter does not redistribute Bunko or require access to its private release.

Use a pinned, approved release when available. Otherwise use Markdown and Git diff as the baseline.
Document the selected viewer's version, license, source, privacy behavior, and update owner.
Retain upstream notices when distributing open-source components. Keep private annotations outside published documentation.
A rendered diff is not an independent correctness review. Reviewers still assess behavior, contracts, tests, and risks.

## Backend-neutral inspection

| Capability | Portable boundary | Framework-specific extension |
| --- | --- | --- |
| Processes | Declared command, working directory, timeout, exit result | Aspire or another supervisor adapter |
| Logs | Bounded stdout and stderr with source identity | Structured logging and redaction hooks |
| Telemetry | Service identity, timestamps, trace and span identifiers | OpenTelemetry SDK and local collector |
| Application health | Explicit readiness request and expected result | Framework health endpoint |
| Browser | Approved local URL and reproducible scenario | DOM, console, network and accessibility inspection |
| Evidence | Screenshot, video, trace, revisions and retention | Browser automation adapter |
| Diagnostics | Read-only application interfaces | Optional framework introspection with explicit permissions |

A C++ task can use the same command and evidence contract as a Python service.
Internal object inspection and code evaluation need language-specific adapters. Do not promise those capabilities for every backend.
OpenTelemetry support varies by language and signal. Verify the SDK and exporter before claiming traces or metrics exist.
Keep collection local by default. Record the actual collector, retention, redaction, and export boundary.

## Python reference tools

The starter supplies a foreground command runner and a static HTML report. It does not expose a remote control server.
Declare command arguments and working directories in the local runtime task configuration, then explicitly run a named task.
The runner retains bounded combined output, exit result, timeout state, and an artifact directory.
It does not interpret commands from a browser, scrape credentials, install dependencies, or select a production environment.

```sh
python3 scripts/local_tools.py run demo --timeout 10
python3 scripts/local_tools.py report
```

The demo emits synthetic output. Replace or add tasks only after reviewing their effects.
Command declarations are executable code. Review arguments, working directory, environment, network access, and outputs before running them.
The runner is not a security sandbox. Use OS or container isolation for untrusted tasks.
Run persistent applications in an approved terminal supervisor and keep task ownership visible.

## Browser and telemetry adapters

The optional Python capture adapter uses Playwright. Install its reviewed version and browser separately in an isolated environment.
Its local-only mode permits HTTP requests only to the selected loopback origin. It records a screenshot, video, and console observations.
Use a disposable browser context and synthetic data. Local requests can still change application state, so review the selected URL.
The basic capture observes a page. Add reviewed interaction tests for complete user journeys.

```sh
python3 scripts/capture_local.py http://127.0.0.1:8000 --seconds 3
```

Configure a local OpenTelemetry collector or the selected runtime dashboard for traces and metrics.
Correlate its output with the runner's artifact directory and application revision.
The reference runner does not implement an OTLP collector, debugger, live DOM editor, or distributed trace viewer.
Treat these as replaceable adapters with independent acceptance checks, not implicit features of the starter.

## Acceptance and maintenance

Verify successful and failed commands, timeout, cancellation, output limits, and escaped HTML in the report.
Verify a screenshot, completed video, blocked external request, browser console event, and one reproducible interaction when adding browser support.
Verify one correlated request and trace when adding telemetry. State missing instrumentation explicitly.
Keep artifacts private until reviewed and redacted. Delete them according to the team retention policy.
Record unsupported platforms. The Python process cleanup implementation currently targets POSIX systems.

## References

- [Zensical documentation](https://zensical.org/docs/)
- [Pierre Diffs documentation](https://diffs.com/docs)
- [OpenTelemetry language support](https://opentelemetry.io/docs/languages/)
- [Playwright Python videos](https://playwright.dev/python/docs/videos)
