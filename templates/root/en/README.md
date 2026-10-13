# Team root workspace

This private coordination repository contains context and local tooling for separate application repositories.
It does not contain application code. Choose the project name, owners, access boundary, and remote before publishing.

## Start

Use Python 3.12 or newer. Review scripts and select a reviewed Python patch in mise before team-wide adoption.

```sh
python3 scripts/workspace.py check
python3 scripts/workspace.py context
```

These commands validate the scaffold and print context paths. They do not clone, start, or validate applications.
The equivalent mise tasks are `workspace:check` and `workspace:context`.

## Connect one repository

Manually clone an authorized repository under `repos/`. Verify its remote, revision, and instructions.
Add an entry to `workspace.json`:

```json
{"name":"api","path":"repos/api","owner":"API team"}
```

Keep the `repositories` array and schema version. This inventory format is local to this starter, not Bunko or Meta configuration.
Run the check again. Create its onboarding page using [the system template](docs/system.md).
Keep source instructions authoritative. Store discovery and cross-repository context here.

## Learn and operate

Start with [onboarding](docs/onboarding.md), [agent instructions](AGENTS.md), and [runtime setup](runtime/README.md).
Use the [generic SDLC course](https://github.com/NakamaDevs/sdlc/blob/main/en/COURSE.md) and [workspace guide](https://github.com/NakamaDevs/sdlc/blob/main/en/WORKSPACES.md).

Plain Markdown is the default reader. Bunko, Aspire, Meta, Codex, and Claude are optional adapters.
No private release, employer policy, organization account, or paid call is required to inspect this starter.
Implement and validate application-specific start and test tasks before calling this an executable product environment.

Use [the first-session prompt](agents/bootstrap.md) with Codex or Claude. Customize [team policy](policies/team.md) and [adapters](adapters/README.md) before implementation.
