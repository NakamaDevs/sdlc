# HOOKS

This guide defines practical Git hooks for fast local feedback, secret protection, and safe handoff to CI.

## Q: When should a project use Git hooks?

Use hooks for checks that are fast, deterministic, local, and useful before a commit or push. Good examples include formatting, staged-file validation, whitespace checks, lightweight unit tests, and secret detection.

Do not put slow integration suites, network-dependent checks, production deployment, or destructive actions in every commit hook. Put those checks in explicit tasks, CI, or protected server workflows.

Hooks are developer feedback. They are not the final security boundary because a user can skip them, a clone may not install them, and an attacker can submit code without running them.

## Q: What is the recommended hook tool?

Use [prek](https://prek.j178.dev/) when the repository wants a fast Rust implementation that remains compatible with upstream `pre-commit` configuration and hooks.

Keep the configuration in `.pre-commit-config.yaml` for broad compatibility. Use `prek.toml` only when the repository accepts `prek`-specific behavior. Pin remote hook revisions and record the minimum `prek` version.

Verified commands include:

- `prek install` — install the repository hook integration.
- `prek uninstall` — remove the integration.
- `prek run` — run configured hooks for staged files.
- `prek run --all-files` — run configured hooks for the whole repository.
- `prek run <hook-id>` — run one hook.
- `prek run --files path/to/file` — run selected files.
- `prek run --hook-stage manual` — run a manual-stage hook.

See the [prek quickstart](https://prek.j178.dev/quickstart/) and [configuration reference](https://prek.j178.dev/reference/configuration/).

## Q: How should hooks stay fast and useful?

- Run only on relevant staged files.
- Use built-in or local tools when they are stable and portable.
- Keep formatters separate from validators.
- Cache tool installations, not untrusted build outputs.
- Print the failed check and one repair command.
- Avoid network access during ordinary commits.
- Move expensive checks to `pre-push`, an explicit `mise` task, or CI.
- Allow a manual stage for checks that need deliberate execution.
- Keep one repository command as the supported escape hatch, such as `mise run check:fast`.
- Measure hook duration and remove checks that do not change decisions.

A hook should finish quickly enough that developers do not learn to bypass it.

## Q: What is the lightweight local validation ladder?

Run the smallest useful layer first:

1. `git diff --cached --check` for whitespace and conflict-marker errors.
2. `prek run` for staged-file formatting, lint, schema, and secret checks.
3. Focused unit tests for changed behavior.
4. A smoke test that starts the smallest real path and checks one successful request or command.
5. `mise run check:fast` or the repository equivalent.
6. `prek run --all-files`, complete tests, security scans, and `mise run verify` before handoff.

Define `check:fast`, `smoke`, and `verify` as repository tasks when the project needs these names. Each task must document its scope, expected duration, dependencies, and evidence.

A smoke test must exercise a real executable boundary. It should use disposable data, bounded timeouts, deterministic inputs, and a clear success marker. It must clean up its process and temporary resources.

## Q: How should hooks prevent Git leaks?

Use a staged-content secret scan before commit and a history or range scan in CI. [Gitleaks](https://github.com/gitleaks/gitleaks) documents native, Docker, pre-commit, and GitHub Action integrations.

Scan before commit, before push, and after incident response. Review `.gitleaks.toml` and `.gitleaksignore` as security-sensitive files. An exception must identify the exact rule, path, and safe reason. Never add a real secret to an allowlist.

Use `gitleaks git .` only with the pinned Gitleaks version and repository configuration. Confirm the installed command with `gitleaks --help` because CLI subcommands can change between versions.

Before committing, inspect the exact staged content:

- `git status --short`
- `git diff --cached --stat`
- `git diff --cached`
- `git diff --cached --check`

If a secret is detected, stop. Revoke or rotate it first. Remove it from the working tree and history with an approved process. Then rescan the complete history and verify the secret no longer works.

Do not rely on deleting a file in a later commit. Git history, tags, forks, caches, CI logs, artifacts, and issue comments may retain the value.

## Q: When may a hook be bypassed?

A bypass is an explicit, temporary decision. Record the reason and run the skipped check before push or merge.

Use bypasses only for a false positive, an unavailable local dependency, an emergency recovery, or a deliberate staged workflow. Never use a bypass to hide a secret, failing test, or unreviewed security exception.

`git commit --no-verify` and `SKIP=<hook-id> prek run` can bypass local checks. Treat both as visible events in the worklog or pull request when they affect evidence.

## Q: What belongs in CI and server controls?

CI must repeat critical checks on a clean environment. Protected branches and server-side policy must enforce required checks. Use CI for full-history secret scans, dependency and container scans, complete tests, smoke tests against disposable services, and artifact provenance.

Use pre-receive or equivalent server controls when the hosting platform supports them and the organization requires a hard rejection boundary. Keep the same detection rules versioned and reviewable.

The local hook and CI task should call the same repository command where possible. This prevents local and CI behavior from drifting.

## Q: What should an adoption checklist contain?

- A pinned hook runner and configuration.
- A fast staged-file path.
- A manual full-repository path.
- Secret detection before commit and in CI.
- Focused tests for changed behavior.
- A real smoke test.
- Documented repair commands.
- A documented bypass and incident path.
- Tool versions and supported operating systems.
- Evidence in the feature matrix or work item.

## References

- [Git hooks documentation](https://git-scm.com/docs/githooks)
- [Git hook command](https://git-scm.com/docs/git-hook)
- [prek quickstart](https://prek.j178.dev/quickstart/)
- [prek configuration](https://prek.j178.dev/configuration/)
- [prek hook stages](https://prek.j178.dev/reference/configuration/)
- [pre-commit documentation](https://pre-commit.com/)
- [Gitleaks](https://github.com/gitleaks/gitleaks)
- [OWASP Secrets Management Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Secrets_Management_Cheat_Sheet.html)