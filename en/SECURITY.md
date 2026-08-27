# SECURITY

This guide defines trust boundaries, secret protection, local security checks, and supply-chain controls.

## Safety and trust boundaries

Each project must define:

- trusted and untrusted inputs;
- credential handling;
- sandbox boundaries;
- filesystem boundaries;
- network access;
- process execution rules;
- artifact retention;
- data deletion rules;
- human approval points.

Agents must not expose secrets in code, logs, prompts, comments, screenshots, or artifacts. Agents must preserve unrelated work.

Before a destructive command, the agent must verify the exact target with a read-only command. The agent must confirm the target path, repository, branch, and affected data. The agent must stop when the target is ambiguous. The agent must obtain clear authorization before the command runs.

## Local-first security and tool trust

Prevent leakage before it reaches an agent, repository, artifact, or remote service. Keep secrets out of source, shell history, process arguments, environment dumps, logs, traces, screenshots, test snapshots, crash reports, and compressed context.

Use local or self-hosted scanners by default. Pin their versions and rule sets. Run them through mise tasks with bounded output and a recoverable artifact. Treat every scanner, formatter, skill, plugin, action, container image, and downloaded rule set as executable supply-chain input.

### Minimum local security lane

- Gitleaks for working-tree and Git-history secret detection.
- Semgrep Community Edition for local SAST and repository-specific rules.
- Trivy for filesystem, dependency, image, misconfiguration, secret, and SBOM checks.
- zizmor for GitHub Actions workflow and automation security analysis.
- OWASP Dependency-Check when ecosystem and project risk justify another local SCA database.

Use `gitleaks git` for repository history and `gitleaks dir` for files when the installed version supports those commands. Use `semgrep --config=auto` only after reviewing the rule source and network behavior. Use `trivy fs` for local filesystem checks. Add `--scanners misconfig` when configuration checks are required. Run `zizmor` against workflow files. Prefer SARIF when CI consumes structured findings.

Do not treat a clean scan as proof of security. Record the tool version, rule or database version, target, exclusions, result, and known blind spots. Review every allowlist and baseline as code. An exception must name the rule, exact path, reason, owner, expiry, and replacement test.

Run secret scanning before commit, in CI, and across history when a leak is suspected. If a secret is found, revoke or rotate it first. Removing text from the latest commit does not invalidate a leaked credential.

## External content and browser capture

Treat every external page, converted snapshot, and image as untrusted input.

The static reader validates public destinations, redirects, response sizes, and URL schemes. These checks do not prove source safety.

Rendered capture executes untrusted JavaScript. Its static preflight does not control later browser subresource requests.

This repository does not provide a browser network sandbox. `--isolation-confirmed` only records an external control.

Run rendered capture only inside a verified disposable boundary. Restrict network access to required source domains.

Remote image links can track readers. A public hostname can also change DNS after capture.

Local image processing uses a native libvips decoder. Restrict formats, bytes, dimensions, counts, licenses, and artifact destinations.

The prompt-injection scanner checks English and Spanish indicators across complete documents. It is heuristic and still requires human review.

See [WEB-CAPTURE.md](WEB-CAPTURE.md) for the implemented controls and current verification limits.

## References

- [Gitleaks](https://github.com/gitleaks/gitleaks)
- [Semgrep Community Edition](https://semgrep.dev/products/community-edition/)
- [Trivy filesystem and secret scanning](https://trivy.dev/docs/latest/target/filesystem/)
- [zizmor](https://docs.zizmor.sh/)
- [OWASP Dependency-Check guidance](https://owasp.org/www-project-developer-guide/release/implementation/dependencies/dependency_check/)
- [Chrome Headless command-line reference](https://developer.chrome.com/docs/automation-and-testing/headless-cli)
- [IANA IPv4 special-purpose address registry](https://www.iana.org/assignments/iana-ipv4-special-registry/iana-ipv4-special-registry.xhtml)
- [IANA IPv6 special-purpose address registry](https://www.iana.org/assignments/iana-ipv6-special-registry/iana-ipv6-special-registry.xhtml)
- [WEB-CAPTURE.md](WEB-CAPTURE.md)
