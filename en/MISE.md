# MISE

Companion guidance extracted from the SDLC document.

This file is the focused reference for JDX mise, runtimes, environments, task discovery, task scope, cross-platform execution, and efficient agent output.
## Standard tooling with mise

Use JDX mise to provide one workflow for tools, runtimes, environment variables, and tasks across operating systems.

Pin tools in a repository `mise.toml` file. Use `mise install` to install them. Use `mise ls --current` to inspect selected versions. Use `mise doctor` to diagnose configuration and trust problems.

Use `mise env` to inspect the project environment. Use `mise env --json` when another tool needs structured data. Use `mise exec -- COMMAND` when a command must run with the project environment without changing the parent shell.

Define build, format, lint, test, audit, development, and release commands as named `mise run` tasks. Keep task names stable across operating systems. Use task dependencies for ordering. Return a non-zero status on failure.

`mise trust` approves executable configuration for one trusted repository path. Review the configuration before you run it. Do not trust an unreviewed repository, a changed configuration, or a parent directory by implication.

Keep private values in ignored local configuration or an approved secret manager. Do not commit credentials, tokens, private URLs, or candidate data. Review `mise.toml`, lockfiles, plugins, and install hooks as executable supply-chain changes.

On a new machine, install the approved mise version, inspect the active configuration with `mise config`, trust the reviewed configuration, run `mise install`, inspect versions with `mise ls --current`, run focused tasks, and then run `mise run check`.

CI must use the same task names as local development. It must record the mise version, selected runtime versions, operating system, architecture, command, and result. Do not depend on shell startup files. Invoke mise explicitly in CI and automation.

Test every supported operating system. Record platform-specific skips as evidence. Use a cross-platform program when task logic becomes complex. Bound parallel work with `MISE_JOBS` when runners have limited resources.

## Scoped and discoverable mise tasks

Keep task definitions close to the code that owns them. Put repository-wide tasks in the root `mise.toml`. Put component tasks in the component `mise.toml`. Put deeper project or section tasks in the nearest child configuration or a documented task directory.

Use `mise tasks` from the current directory to discover tasks in the active configuration hierarchy. Use `mise tasks --all` only when an agent needs the complete monorepo inventory. Use `mise tasks info --json TASK` to inspect the task source, directory, dependencies, environment, inputs, outputs, and command before execution. Use `mise tasks deps TASK` to inspect ordering. Use `mise tasks validate --errors-only` before relying on a task.

Treat a task as scoped only when its declaration names its working directory, inputs, outputs, services, network use, credentials, and side effects. A task with unknown scope is not safe for an agent to run.

Give every task a stable name and a short description. Use names such as `build`, `test`, `lint`, `check`, and `serve` inside one project. Use a qualified name or an explicit directory when two projects have the same task name. Do not hide normal verification tasks. Hide only internal helpers that agents must not call directly.

A task must run only the files and services in its scope. Set `dir` explicitly when a task crosses a component boundary. Pass arguments through a declared usage contract. Do not let a task silently change directory, install unpinned tools, read production data, or deploy to an external system.

Expose one safe entry task per project, such as `mise run check`. Make that task depend on the required local checks. Document the project root, component roots, supported operating systems, prerequisites, and expected outputs in the repository guide. Agents should discover tasks before running them.

Use `mise mcp` when an agent platform supports MCP. It exposes task, tool, environment, and configuration resources. Keep task execution approval and trust boundaries in the agent or repository policy.

## References

Official references: [mise](https://mise.jdx.dev/), [configuration](https://mise.jdx.dev/configuration.html), [`mise env`](https://mise.jdx.dev/cli/env.html), [`mise run`](https://mise.jdx.dev/cli/run.html), and [`mise trust`](https://mise.jdx.dev/cli/trust.html).
