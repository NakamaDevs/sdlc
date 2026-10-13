# WORKSPACES

Use a private root repository as a coordination workspace. This is a meta repository, not a merged application history.
Read [STRUCTURE.md](STRUCTURE.md) for repository choices and [ASPIRE.md](ASPIRE.md) for runtime tooling.

## Root layout

```text
team-root/
  AGENTS.md
  CLAUDE.md
  README.md
  mise.toml
  workspace.json
  skills.lock.json
  docs/
    system.md
    onboarding.md
    repositories/
    decisions/
    work/
  agents/
  runtime/
  scripts/
  repos/          # ignored child checkouts
  worktrees/      # ignored task checkouts
  state/          # ignored runtime state
  artifacts/      # ignored evidence
```

The root manifest records repository paths and expected ownership. Keep credentials and private endpoint values in ignored local configuration.
A manifest is an inventory, not authorization to clone, run, or publish a repository.
Use an optional Meta adapter only when the team needs group commands. Review each command's repository scope before execution.
Keep a clean baseline checkout per application. Create task worktrees only for repositories that the task changes.

## Small checkouts and lean runtimes

Clone only needed repositories. A Git worktree reuses Git objects but still needs its own working files and runtime state.
Sparse checkout reduces materialized paths. Partial clone reduces initial object downloads when the server supports it.
Neither isolates data or removes dependency requirements. Shallow history can break merge-base, changelog, and release tasks.

Use sparse checkout only after proving the selected paths contain build metadata, shared packages, fixtures, and generated-code inputs.
Run one full-checkout comparison before adopting a sparse profile. Expand the profile when a missing dependency appears.
Record the selected paths and Git version. Do not describe a sparse result as complete integration evidence.

Choose one explicit profile per task:

| Profile | Real resources | Evidence boundary |
| --- | --- | --- |
| docs | Documentation only | Readability, links, discovery |
| frontend-mock | UI plus local mock server | Browser behavior against synthetic contracts |
| backend-contract | API plus isolated required data services | Provider behavior and contract conformance |
| integrated-local | Changed applications plus dependencies | Cross-service behavior on named revisions |
| release-check | Complete required release graph | Release acceptance in an approved environment |

Keep the normal startup profile documented and stable. A task selects a smaller profile explicitly.
Install dependencies only for that profile. Bound workers, containers, memory, ports, and test concurrency.

## Worktree lifecycle

Create a branch from the verified base and a uniquely named task directory. Inspect existing worktrees before creating another.
Record repository revision, issue, owner, path, and runtime instance together.
Confirm the actual checkout before edits, tests, migrations, or seeds.
After delivery, preserve needed evidence and data. Stop only owned processes, then remove only a clean, delivered worktree.
Do not force removal when changes or ownership are unclear.

## Runtime identity

Each writable instance needs its own identity. Record these fields before startup:

| Boundary | Required value |
| --- | --- |
| Source | Absolute checkout, branch, commit for every application |
| Routing | Instance name, discovered ports, hostnames, frontend-to-backend binding |
| Database | Engine, database or schema, user, migration state, fixture revision |
| Async work | Queue namespace, worker identity, scheduler ownership |
| Storage | Bucket or directory namespace and upload prefix |
| Cache | Key prefix or isolated service with verified separation |
| Integrations | Mock or sandbox endpoints and blocked external effects |
| Evidence | Log, trace, test, and artifact directories |

Port isolation alone is insufficient. Two workers on different ports can still consume the same queue or mutate the same database.
A shared database engine is acceptable only with verified independent writable databases and credentials.
Do not share writable state across concurrent instances. Never restore or reseed data automatically on restart.

Before a mutation, verify identity from the application connection and running process, not only the configuration file.
Fail closed on mismatch. A second instance must leave the first instance's data, routing, and workers unchanged.
Test this with two synthetic sentinel records and distinct queue jobs. Stop one instance and verify the other remains healthy.

## Aspire integration

Keep the AppHost and adapters in the root. Bind each resource to an explicit checkout and instance registry entry.
Use discovered endpoints for test clients. Keep the dashboard and diagnostic tools local or access controlled.
The starter contains a runtime contract, not a universal AppHost. Implement the graph for the selected languages and pinned Aspire version.
First validate one service, one dependency, readiness, logs, and resource restart. Then add a second isolated instance.

Restart an application resource for application changes. Reload the AppHost when its resource definitions change.
Preserve databases during either operation. Record any deliberate reset as a separate action.
The acceptance record includes startup, request, readiness, logs, isolation, stop, and cleanup results.
Keep unsupported platforms and missing telemetry explicit.

## Mock contracts and evidence

Use synthetic fixtures tied to an API schema revision and owning provider. Both frontend and backend owners review changed semantics.
Cover success, empty, loading, validation, authorization, not-found, conflict, timeout, and server-error states where relevant.
Include money, nullability, pagination, ordering, dates, and idempotency when the feature depends on them.
Unknown mock routes must fail. Disable accidental passthrough to live services.

For backend tests, fake outbound services at the integration boundary. Keep production business logic under test.
Use real disposable data services when transaction, locking, migration, or queue behavior matters.
Contract checks compare mock responses with the current provider schema and representative provider tests.
Update fixtures and contracts together. A snapshot alone does not establish semantic compatibility.

Run fast mock checks during implementation. Before integration, exercise the same acceptance scenario against the real local provider.
Record consumer revision, provider revision, schema revision, fixture revision, environment, command, exit result, and artifacts.
A mock pass is UI evidence. A provider pass is backend evidence. An integrated journey demonstrates their connection.
Deployment and business acceptance require separate evidence and the team's approval boundary.

## References

- [Git worktree](https://git-scm.com/docs/git-worktree)
- [Git sparse checkout](https://git-scm.com/docs/git-sparse-checkout)
- [Git clone](https://git-scm.com/docs/git-clone)
