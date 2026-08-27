# STRUCTURE

Optional Q&A for organizing a monorepo, multiple repositories, and connected tools.

## Q: Should we use a monorepo or multiple repositories?

Use a monorepo when shared changes, atomic commits, common tooling, and one release boundary outweigh repository size and permission complexity.

Use multiple repositories when teams need independent ownership, release cadence, access control, compliance boundaries, or technology lifecycles.

Use evidence from change coupling, build time, release frequency, ownership, access needs, and failure isolation. Do not choose from ideology.

## Q: What structure works for a monorepo?

Keep a short root map. Give each component a local guide, task namespace, tests, and ownership. Keep shared policy and tooling at the root. Keep component-specific rules near each component.

Use one root quality entry point. Allow focused component tasks. State each task scope and working directory.

## Q: What structure works for multiple repositories?

Give every repository its own README, agent map, pinned tools, local quality gate, ownership, release notes, and dependency policy. Keep cross-repository contracts in versioned documents or schemas.

Use a small index repository when people need a shared map. Link to repositories by stable URL and revision. Do not copy complete repositories into the index.

## Q: When should we use submodules?

Use Git submodules when the team must pin an exact external repository revision. Accept the update and onboarding costs. Document recursive clone, update, status, and failure recovery.

Do not use submodules as a general package manager. Prefer published packages or explicit repository dependencies when consumers do not need source-level coordination.

## Q: When should we use meta?

Use [meta](https://github.com/mateodelnorte/meta) when a coordinated repository group needs one developer command surface. Each repository keeps its history and ownership.

Pin the meta version. Declare repository membership, branch policy, bootstrap behavior, status behavior, and failure handling. Keep commands transparent and reviewable.

## Q: How should editor automation work?

Expose the same named tasks in the editor, terminal, CI, and agent tools. The editor may discover tasks and show diagnostics. The repository task remains the source of truth.

Provide actions for discovery, formatting, linting, unit tests, integration tests, browser tests, security scans, local start, logs, and stop. Each action must show the command, scope, exit code, and artifact path.

## Q: How do we avoid blocking people?

Use asynchronous tasks for long work. Store status and artifacts. Let a person close the editor, change context, or eat without losing the run. Resume or inspect the result later.

## References

- [meta repository](https://github.com/mateodelnorte/meta)
- [Git documentation for submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules)
- [OpenAI harness engineering](https://openai.com/index/harness-engineering/)
