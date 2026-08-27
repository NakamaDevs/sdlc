# SECURITY

Companion guidance extracted from the SDLC document.

This file is the focused reference for trust boundaries, secret protection, local security checks, and supply-chain controls.
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

Agents must not expose secrets in:

- code;
- logs;
- prompts;
- comments;
- screenshots;
- artifacts.

Agents must preserve unrelated work.

Agents must not use destructive commands without clear authorization and a
verified target.


## Local-first security and tool trust

Prevent leakage before it reaches an agent, repository, artifact, or remote service. Keep secrets out of source, shell history, process arguments, environment dumps, logs, traces, screenshots, test snapshots, crash reports, and compressed context.

Use local or self-hosted scanners by default. Pin their versions and rule sets. Run them through mise tasks with bounded output and a recoverable artifact. Treat every scanner, formatter, skill, plugin, action, container image, and downloaded rule set as executable supply-chain input.

Minimum local security lane:

- Gitleaks for working-tree and Git-history secret detection;
- Semgrep Community Edition for local SAST and repository-specific rules;
- Trivy for filesystem, dependency, image, misconfiguration, secret, and SBOM checks;
- zizmor for GitHub Actions workflow and automation security analysis;
- OWASP Dependency-Check when the ecosystem and project risk justify an additional local SCA database.

Use `gitleaks git` for repository history and `gitleaks dir` for files when the installed version supports those commands. Use `semgrep --config=auto` only after reviewing the rule source and network behavior. Use `trivy fs` for local filesystem checks and add `--scanners misconfig` when configuration checks are required. Use `zizmor` against workflow files and prefer SARIF when the CI system consumes structured findings.

Do not treat a clean scan as proof of security. Record tool version, rule or database version, target, exclusions, result, and known blind spots. Review every allowlist and baseline as code. An exception must name the rule, exact path, reason, owner, expiry, and replacement test.

Run secret scanning before commit, in CI, and across history when a leak is suspected. If a secret is found, revoke or rotate it first. Removing the text from the latest commit does not invalidate a leaked credential.

References:

- [Gitleaks](https://github.com/gitleaks/gitleaks)
- [Semgrep Community Edition](https://semgrep.dev/products/community-edition/)
- [Trivy filesystem and secret scanning](https://trivy.dev/docs/latest/target/filesystem/)
- [zizmor](https://docs.zizmor.sh/)
- [OWASP Dependency-Check guidance](https://owasp.org/www-project-developer-guide/release/implementation/dependencies/dependency_check/)

