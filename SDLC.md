# SDLC 

## Document currency and command evidence

## Focused companion references

- [LINEAR.md](LINEAR.md) — issue, milestone, owner, status, progress, and review tracking.
- [HARNESS.md](HARNESS.md) — harness engineering, repository legibility, feedback loops, isolation, and Symphony.
- [ADOPTION.md](ADOPTION.md) — intake, repository structure, templates, adoption sequence, and operating cadence.
- [JOY.md](JOY.md) — meaningful work, autonomy, learning, focus, and team joy.
- [BURNOUT.md](BURNOUT.md) — burnout risks, workload boundaries, recovery, and escalation.
- [STRUCTURE.md](STRUCTURE.md) — mono-repo, multi-repo, submodules, meta, and editor automation.
- [HUMAN.md](HUMAN.md) — human-in-the-loop intake, steering, editor integration, and attention protection.
- [HERDR.md](HERDR.md) — persistent local-first and remote-first workspaces.
- [OWASP.md](OWASP.md) — OWASP standards, secrets, storage, attestation, and pre-launch security.
- [MCP.md](MCP.md) — MCP transports, Code Mode, stateless operation, authentication, authorization, and approvals.
- [joy.md](joy.md) — meaningful work, autonomy, learning, focus, and team joy.
- [burnout.md](burnout.md) — burnout risks, workload boundaries, recovery, and escalation.
- [structure.md](structure.md) — mono-repo, multi-repo, submodules, meta, and editor automation.
- [human.md](human.md) — human-in-the-loop intake, steering, editor integration, and attention protection.
- [herdr.md](herdr.md) — persistent local-first and remote-first workspaces.
- [AGENT-SKILLS.md](AGENT-SKILLS.md) — research evidence, skills structure, distribution, versioning, and trust.
- [MISE.md](MISE.md) — mise tools, runtimes, environments, tasks, scope, and output handling.
- [ASPIRE.md](ASPIRE.md) — Aspire development, testing, previews, deployment, networking, secrets, AI, and observability.
- [OLLAMA.md](OLLAMA.md) — local model serving, Aspire integration, Claude Code, trust, and validation.
- [TESTING.md](TESTING.md) — specifications, FIRST tests, test layers, UI evidence, and validation.
- [SECURITY.md](SECURITY.md) — trust boundaries, secret protection, local security checks, and supply-chain controls.

## Harness engineering

Treat the repository as the system of record for agent-readable knowledge, executable guardrails, feedback loops, isolated work, and review evidence. See [HARNESS.md](HARNESS.md) for the detailed harness and Symphony guidance.

## Adoption and operating model

Use [ADOPTION.md](ADOPTION.md) to intake the SDLC system, structure repositories, create templates, and make the practices stick.

Last reviewed: 2026-08-26

Review this document at least every 30 days, before a release, and whenever a pinned tool, operating system, cloud platform, or command changes. The repository owner must record the next review date in the project work log.

This document uses command names as verified instructions only when an official reference and a tested version exist. Otherwise, label the command as an example or `unverified`. Agents must not guess command syntax, flags, paths, or provider behavior.

### Refresh procedure

1. Read the official command reference for the installed tool and target version.
2. Read the repository pin from `mise.toml`, a lockfile, an AppHost manifest, or the approved runner image.
3. Run the version command and help command locally, such as `mise --version`, `aspire --version`, `mise tasks validate --errors-only`, and `aspire <command> --help`.
4. Run a safe validation or publish operation. Do not run deploy, destroy, migration, or production commands during documentation refresh unless a human approves the target.
5. Test the command on every supported operating system and architecture, or record the exact platform limitation.
6. Record the URL, tool version, date, operating system, architecture, command, result, and known limitation.
7. Update this document, the repository task help, and the relevant specification or runbook. Run the link and Markdown checks before publishing.

### Version and status rules

- Pin mise, language runtimes, package managers, CLIs, action versions, and deployment plugins when they affect results.
- Record whether each command is stable, preview, experimental, or repository-specific.
- Link to the versioned command reference when the vendor provides one. Use the unversioned page only when it states the supported version range.
- Keep a tested command matrix with tool, version, platform, command, expected result, observed result, and evidence URL.
- Treat a documentation page, a successful `--help` result, and a successful local run as separate evidence. One does not replace the others.
- Mark a command `unverified` when the reference is missing, the installed version differs, the platform was not tested, or the result is only inferred.

The current command families use these evidence sources:

- mise: the official CLI reference, repository `mise.toml`, `mise --version`, `mise tasks info --json TASK`, and `mise tasks validate --errors-only`.
- Aspire: the official CLI reference, the project-pinned Aspire version, `aspire --version`, and `aspire <command> --help`. Record preview status for `aspire publish`, `aspire deploy`, `aspire destroy`, `aspire do`, and `aspire otel` when the selected version reports them as preview.
- Kubernetes and container tools: the official `kubectl`, Helm, Docker, or `nerdctl` reference, client and server versions, a dry run, and a disposable-cluster test.
- Cloud CLIs and observability: the provider command reference, CLI version, target account or project, permission check, staging endpoint, telemetry query, and bounded smoke result.

Do not claim that a deployment or telemetry path works because a command exists. Prove the path with a safe target, an observable request, and recoverable evidence.

### Verified command references

- mise CLI reference
- mise tasks
- mise task information
- mise task validation
- [Aspire CLI overview](https://learn.microsoft.com/en-us/dotnet/aspire/cli/overview)
- [Aspire command reference](https://learn.microsoft.com/en-us/dotnet/aspire/cli-reference/aspire)
- [Aspire publish command](https://learn.microsoft.com/en-us/dotnet/aspire/cli-reference/aspire-publish)
- [Aspire deploy command](https://learn.microsoft.com/en-us/dotnet/aspire/cli-reference/aspire-deploy)
- [Aspire AppHost testing](https://aspire.dev/testing/manage-app-host/)
- [Aspire resource access in tests](https://aspire.dev/testing/accessing-resources/)
- [Aspire advanced testing](https://aspire.dev/testing/advanced-scenarios/)
- [Aspire testing in CI/CD](https://aspire.dev/testing/testing-in-ci/)
- [Aspire hot reload and watch](https://aspire.dev/app-host/hot-reload-and-watch/)
- [Aspire networking overview](https://aspire.dev/fundamentals/networking-overview/)
- [Aspire service discovery](https://aspire.dev/fundamentals/service-discovery/)
- [Aspire container networking](https://aspire.dev/fundamentals/container-networking/)
- [Aspire pipelines](https://aspire.dev/deployment/pipelines/)
- [Aspire app lifecycle](https://aspire.dev/deployment/app-lifecycle/)
- [Aspire health checks](https://aspire.dev/fundamentals/health-checks/)
- [Aspire Dev Containers](https://aspire.dev/get-started/dev-containers/)
- [Aspire Ollama integration](https://aspire.dev/integrations/ai/ollama/ollama-get-started/)
- [Aspire OpenAI integration](https://aspire.dev/integrations/ai/openai/openai-get-started/)
- [Ollama Claude Code integration](https://docs.ollama.com/integrations/claude-code)
- [Aspire custom hosting integrations](https://aspire.dev/integrations/custom-integrations/hosting-integrations/)
- [Aspire secure communication](https://aspire.dev/integrations/custom-integrations/secure-communication/)
- [Aspire Seq integration](https://aspire.dev/integrations/observability/seq/seq-get-started/)
- [Aspire YARP integration](https://aspire.dev/integrations/reverse-proxies/yarp/)
- [SOPS](https://getsops.io/)
- [Agent Skills specification](https://agentskills.io/home)
- [npx skills CLI](https://github.com/vercel-labs/skills)
- [NakamaDevs skills marketplace](https://github.com/NakamaDevs/skills)
- [Gitleaks](https://github.com/gitleaks/gitleaks)
- [Semgrep Community Edition](https://semgrep.dev/products/community-edition/)
- [Trivy filesystem scanning](https://trivy.dev/docs/latest/target/filesystem/)
- [zizmor](https://docs.zizmor.sh/)
- [OWASP Dependency-Check](https://owasp.org/www-project-developer-guide/release/implementation/dependencies/dependency_check/)
- [Zig language reference](https://ziglang.org/documentation/master/)
- [Zig 0.16.0 release notes](https://ziglang.org/download/0.16.0/release-notes.html)
- [Ghostty and libghostty overview](https://github.com/ghostty-org/ghostty/blob/main/README.md)
- [libghostty C header](https://github.com/ghostty-org/ghostty/blob/main/include/ghostty.h)
- [libghostty build integration](https://github.com/ghostty-org/ghostty/blob/main/CMakeLists.txt)
- [Ghostling embedding example](https://github.com/ghostty-org/ghostling)

These references are the authority for command names, flags, stability, and version-specific behavior.


## Handoff: Working-software engineering system

## Purpose

Create a reusable engineering system for teams that use people, AI agents, or
both.

The system must support:

- behavior specifications;
- software design decisions;
- test-first development;
- agentic workflows;
- controlled delegation;
- project management;
- progress reporting;
- review;
- quality checks;
- working software.

This document is independent from:

- programming languages;
- frameworks;
- databases;
- cloud providers;
- user interfaces;
- issue trackers;
- agent platforms;
- repository structures.

Each project may adapt the details.

The project must preserve the principles.

## Core principle

Working software comes first.

Code is not proof of working software.

A feature is complete only when:

- the behavior is specified;
- the design is understood;
- the implementation satisfies the behavior;
- required tests pass;
- failure behavior is understood;
- quality checks pass;
- documentation is current;
- project status reflects reality;
- reviewers can inspect the evidence.

## Communication principles

Use two communication layers.

### Technical communication

Use Simplified Technical English (STE) for English technical content.

Use Simplified Technical Spanish (STS) for Spanish technical content.

Apply STE and STS to:

- specifications;
- workflows;
- issue descriptions;
- pull requests;
- review comments;
- release notes;
- error messages;
- test instructions;
- agent instructions;
- handoff notes;
- status updates.

Use active voice.

Use short sentences.

Use one idea in each sentence.

Use one term for one concept.

Keep technical names, paths, commands, versions, identifiers, and error messages
exact.

Do not remove risks, limitations, or failures to make the text shorter.

Use the official ASD-STE100 source as the authority for STE:

https://www.asd-ste100.org/

Use the project STS skill when the target language is Spanish.

Use compatible STE or STS skills when the agent environment provides them.
Do not claim official certification unless the project has certification.

### Core project updates

Use top-down, answer-first communication for important updates.

Use this structure:

1. Resolution or current answer.
2. Situation.
3. Complication or risk.
4. Evidence.
5. Decision or recommendation.
6. Owner and next action.

Keep the main answer at the top.

Group supporting points into clear, non-overlapping sections.

Use evidence for each important claim.

Separate facts, decisions, assumptions, and open questions.

Use this format for milestone or project updates:

```md
## Decision

<One sentence with the current answer.>

## Situation

<What the team expected or completed.>

## Complication

<What changed, remains open, or creates risk.>

## Evidence

- <Command, link, test, result, or document.>
- <Command, link, test, result, or document.>

## Recommendation

<The next controlled action.>

## Owner and status

- Owner: <person or agent>
- Status: <status>
- Milestone: <milestone>
- Next update: <condition for the next update>
```

Use this structure for significant Linear comments, project updates, review
summaries, and human handoffs.

This communication pattern is based on Situation–Complication–Resolution and
top-down pyramid communication. The project must adapt it to its own audience.

## Required project documents

Each project should maintain:

- `spec.md`;
- `workflow.md`;
- `test.md`;
- `feature-matrix.md`;
- a research register;
- a decision register;
- a work log or evidence register.

Projects may use different paths.

The documents must preserve the same responsibilities.

## `spec.md`: behavior specification

The specification defines behavior.

It must not define implementation details unless they are required constraints.

### Required sections

1. Status and version.
2. Normative language.
3. Problem statement.
4. Goals.
5. Non-goals.
6. Users and external actors.
7. System boundaries.
8. Domain models.
9. Commands and outcomes.
10. State machines.
11. Input and output contracts.
12. User-interface behavior.
13. Authorization and privacy.
14. Persistence and lifecycle.
15. Integration boundaries.
16. Error behavior.
17. Retry and recovery behavior.
18. Observability.
19. Compatibility and migration.
20. Quality requirements.
21. Acceptance evidence.
22. Open questions.
23. Decisions.

### Behavior contract

Every feature must define:

- observable behavior;
- valid inputs;
- invalid inputs;
- successful outcomes;
- typed failures;
- state transitions;
- authorization rules;
- privacy rules;
- retry behavior;
- recovery behavior;
- observability;
- required evidence.

Invalid operations must not report success.

Invalid state transitions must not mutate state.

Retries must be safe when the operation supports an identifier for correlation or
idempotency.

### Implementation independence

The specification must not require:

- a programming language;
- a framework;
- a database;
- a cloud provider;
- a frontend technology;
- a deployment model;
- a specific agent.

Implementation choices belong in architecture decision records.

## Software design principles

Use these principles when they improve the system:

- explicit boundaries;
- high cohesion;
- low coupling;
- dependency inversion;
- stable contracts;
- pure domain logic where practical;
- explicit state transitions;
- idempotent commands;
- bounded retries;
- structured errors;
- observable side effects;
- deterministic fixtures;
- replaceable adapters;
- small interfaces;
- reversible changes.

Do not apply a pattern because it has a familiar name.

Each design decision must explain:

- the problem;
- the chosen design;
- rejected alternatives;
- trade-offs;
- test impact;
- operational impact;
- migration or rollback impact.

## `feature-matrix.md`: capability and evidence inventory

Maintain one row for each important feature or capability.

Each row should include:

- feature name;
- behavior specification reference;
- user or system outcome;
- implementation owner;
- implementation location;
- unit-test evidence;
- integration-test evidence;
- contract-test evidence;
- API-test evidence;
- UI or browser-test evidence;
- end-to-end evidence;
- manual-validation evidence;
- security evidence;
- performance evidence, when required;
- current status;
- project-management item;
- known risks;
- missing evidence;
- last review date.

Use statuses such as:

- `planned`;
- `specified`;
- `in progress`;
- `partial`;
- `verified`;
- `blocked`;
- `deprecated`.

Do not mark a feature `verified` when only one test layer passes.

Record the evidence that exists.

Record the evidence that remains open.

Update the matrix in the same change as the feature, test, or specification.

## `test.md`: testing and validation specification

Define the test strategy before implementation.

### FIRST principles

Tests should be:

- fast;
- independent;
- repeatable;
- self-validating;
- timely.

Use equivalent terms when a project has an existing standard.

Preserve the same properties.

### Test layers

Select only the layers that fit the project:

1. unit;
2. component;
3. integration;
4. contract;
5. API;
6. browser or UI;
7. end to end;
8. performance;
9. security;
10. accessibility;
11. manual exploratory validation.

Use the lowest layer that gives enough confidence.

Use higher-level tests for behavior that lower layers cannot prove.

### Test plan fields

For every behavior, record:

- behavior;
- risk;
- test layer;
- fixture or setup;
- expected RED result;
- exact RED command;
- implementation boundary;
- expected GREEN result;
- exact GREEN command;
- refactor guard;
- unresolved testability risk.

If the RED result was not observed, record:

`RED not yet evidenced.`

Do not infer TDD history from a final diff.

### Local validation

Every project must define a local validation path.

It should include:

- required tools;
- dependency setup;
- focused tests;
- component tests;
- API tests;
- contract tests;
- integration tests;
- UI tests, when applicable;
- end-to-end tests, when applicable;
- complete quality checks.

Another contributor or agent must be able to follow this path.

## UI and computer-use traceability

Use computer-use exploration only when it adds value.

Before converting manual exploration into automation, record:

- route;
- viewport;
- step;
- action;
- selector or locator;
- expected state;
- observed state;
- screenshot or failure evidence;
- resulting automated test.

Prefer selectors based on:

- roles;
- labels;
- visible text;
- explicit test contracts.

Avoid coordinates, CSS classes, and unstable DOM structure as primary
selectors.

Convert stable manual flows into automated UI tests.

Keep manual validation for visual, accessibility, or interaction behavior that
automation cannot certify.

## `workflow.md`: agentic software lifecycle

Define how people and agents move work from an idea to delivery.

### Standard work graph

```text
research
  -> specification
  -> design decision
  -> test plan
  -> RED evidence
  -> implementation
  -> GREEN evidence
  -> focused review
  -> quality checks
  -> project update
  -> human review
  -> merge or release
```

A project may add or remove stages.

It must preserve explicit evidence between stages.

### Agent roles

Use only the roles the project needs:

- coordinator;
- research agent;
- specification agent;
- architecture agent;
- test agent;
- implementation agent;
- review agent;
- validation agent;
- release agent.

Each agent must have:

- one objective;
- defined inputs;
- defined output;
- bounded scope;
- allowed files or systems;
- acceptance criteria;
- validation requirements;
- handoff state;
- blocker behavior.

Agents must not expand scope silently.

Create a separate work item for meaningful out-of-scope work.

### Delegation rules

Delegate work when it is:

- independent;
- bounded;
- reviewable;
- useful in parallel;
- assigned to a clear owner.

Do not delegate tightly coupled work when the result blocks immediate progress.

Use separate workspaces when:

- agents modify overlapping files;
- branches depend on each other;
- long-running checks interfere;
- isolation reduces risk.

Use trunk-based development when changes are:

- small;
- independent;
- documentation-focused;
- safe to review together.

### Agent loop

For every work item:

1. Locate or create the project-management item.
2. Link it to a milestone, initiative, or project goal.
3. Read project instructions and related specifications.
4. Research unresolved questions.
5. Record sources, findings, limits, and decisions.
6. Update the specification.
7. Define the test plan.
8. Write the smallest focused test.
9. Run the test and record RED evidence.
10. Implement the smallest behavior change.
11. Run the focused test and record GREEN evidence.
12. Run nearby tests.
13. Update the feature matrix.
14. Run required quality checks.
15. Perform a focused review.
16. Update the project-management item.
17. Hand off with complete evidence or an explicit blocker.

## Research practice

Research must answer a defined question.

Each research record should include:

- question;
- source;
- source date;
- finding;
- limitation;
- local decision;
- affected specification;
- affected feature;
- follow-up work.

Prefer authoritative and primary sources.

Separate external facts from local decisions.

Do not turn a source summary into a product requirement without a documented
decision.

## Agent Skills practice

Use the Agent Skills format for reusable agent capabilities.

A skill should contain:

```text
skill-name/
├── SKILL.md
├── scripts/
├── references/
├── assets/
└── examples/
```

Only `SKILL.md` is required.

Use progressive disclosure:

1. discover the skill by name and description;
2. activate it when the task matches;
3. read supporting files only when needed;
4. execute the documented workflow.

Create a new shared skill only when:

- the workflow repeats across projects;
- the workflow has stable inputs and outputs;
- the workflow has clear safety rules;
- the workflow has validation evidence;
- an existing skill does not cover the need.

Before creating a new skill:

- search the team skill repository;
- search the Agent Skills ecosystem;
- inspect existing related skills;
- record reuse, adaptation, and replacement decisions.

Useful references include:

- https://agentskills.io/home
- https://github.com/vercel-labs/skills
- https://www.skills.sh/
- [source URL removed for privacy]

Keep shared skills project neutral.

Keep project-specific rules in the project repository.

### Skill distribution and supply-chain controls

Use `npx skills` or an equivalent installer only from a reviewed source. Inspect the repository, `SKILL.md`, scripts, references, assets, package metadata, install hooks, and generated files before activation.

Use project-scoped skills when the workflow is part of the repository contract and must be reviewed with the code. Use user-scoped skills for personal, low-risk preferences that must work across repositories. Use organization plugins or a private skills bundle when the organization owns the workflow, needs shared updates, or needs controlled tool permissions.

Prefer a versioned source reference, immutable commit or tag, checksum or lock record, reviewed license, and reproducible installation. Record the source URL, revision, selected skill names, installation scope, target agents, review owner, and update policy. Do not install an entire repository when one skill is sufficient.

Keep executable scripts minimal and inspect them before execution. Prefer local scripts with pinned runtimes. Do not allow a skill to download arbitrary code, read unrelated files, access production systems, or send source and logs to a hosted service without an explicit trust decision.

`npx skills add` supports project and global installation, selected skills, agent selection, local paths, Git sources, and direct URLs. `npx skills use` can use a skill without installing it. Use these modes deliberately and record the choice.

Use the NakamaDevs private skills marketplace as the organization source for reviewed shared bundles. Keep repository-specific skills in the repository. Use a skills lock record or equivalent manifest for exact revisions. Review updates as code and run skill-level tests before promotion.

References:

- [Agent Skills specification and format](https://agentskills.io/home)
- [npx skills CLI](https://github.com/vercel-labs/skills)
- [NakamaDevs skills marketplace](https://github.com/NakamaDevs/skills)

## Project management and Linear-style tracking

Use the available project-management system.

The examples below use Linear terminology.

The process applies to any equivalent tool.

### Work-item requirements

Every planned item must have:

- a clear title;
- one owner;
- one project;
- one milestone or parent goal;
- scope;
- acceptance criteria;
- test requirements;
- dependencies;
- current status;
- document links;
- known risks.

### Status rules

Use statuses that reflect reality:

- planned work stays queued;
- active work moves to `In Progress`;
- completed implementation moves to review;
- approved work moves to merge or release;
- blocked work records the exact blocker;
- completed work moves to `Done` only after acceptance passes.

Do not move an item to completion because the code looks finished.

### Comment and update rules

Post an update after:

- research completion;
- specification changes;
- reproduction;
- RED evidence;
- implementation progress;
- GREEN evidence;
- review findings;
- quality-check completion;
- a meaningful group of completed tasks;
- a blocker;
- milestone progress.

Each update should state:

- the answer or current result;
- what changed;
- evidence;
- remaining risk;
- decision or recommendation;
- owner;
- current status.

Use STE or STS for the prose.

Keep commands, paths, identifiers, and error messages exact.

Do not hide failures.

### Milestone rules

Group related work into logical milestones.

Each milestone must have:

- an outcome;
- child tasks;
- dependencies;
- acceptance evidence;
- current progress;
- known blockers;
- completion criteria.

Update the milestone after a meaningful group of tasks completes.

Keep milestone progress aligned with child-task status and evidence.

## Quality and review

Before handoff:

1. Run focused tests.
2. Run nearby component tests.
3. Run integration and contract tests.
4. Run UI and end-to-end tests when applicable.
5. Run security, accessibility, and performance checks when applicable.
6. Run the complete local quality gate.
7. Review the change for correctness, security, design, testing, and
   documentation drift.
8. Update specifications and the feature matrix.
9. Record all evidence in project management.

A review must identify:

- defects;
- missing tests;
- missing specification;
- security risks;
- compatibility risks;
- operational risks;
- documentation drift;
- unverified assumptions.

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

## Completion standard

A project may call a feature complete only when:

- the behavior is specified;
- the design is understood;
- the test plan exists;
- required RED and GREEN evidence is recorded;
- implementation is complete;
- relevant tests pass;
- quality checks pass;
- documentation is current;
- the feature matrix is current;
- project-management status is accurate;
- reviewers can reproduce the result;
- unresolved risks are accepted or tracked.

The goal is reliable, reviewable, working software.

The goal is not maximum automation.


## Aspire local development and runtime observability

Aspire is optional.

Use it when the project has multiple services, dependencies, containers, or
processes that need one local development loop.

Aspire is not a required framework. The project may use another local
orchestration tool with the same responsibilities.

### Goals

The local orchestration layer should provide:

- one command to start the local system;
- dependency ordering;
- resource health;
- endpoint discovery;
- console logs;
- structured logs;
- distributed traces;
- resource restart;
- bounded shutdown;
- local test integration;
- agent-readable diagnostics.

Working software must remain the primary goal.

The orchestration layer must not hide application failures.

### Setup

When the project uses Aspire, install the Aspire CLI with the project-approved
version.

For an existing Aspire project, initialize or refresh agent guidance:

```sh
aspire agent init
```

For non-interactive setup:

```sh
aspire agent init \
  --non-interactive \
  --skills all \
  --skill-locations standard
```

Use the project-supported agent location.

Do not install skills globally unless the team requires global availability.

The official Aspire workflow bundle includes:

- `aspire`;
- `aspire-init`;
- `aspire-orchestration`;
- `aspire-monitoring`;
- `aspire-deployment`;
- `aspireify`.

Use the top-level `aspire` skill when the correct workflow is unclear.

Use `aspire-orchestration` for lifecycle operations.

Use `aspire-monitoring` for logs, traces, metrics, and runtime diagnosis.

Use `aspireify` when adding Aspire to an existing codebase.

See the [official Aspire skills documentation](https://aspire.dev/get-started/aspire-skills/).

### Aspire MCP setup

Use Aspire skills to teach agents the workflow.

Use Aspire MCP when agents need live information from a running application.

Start the MCP server with:

```sh
aspire agent mcp
```

For Claude Code or other MCP clients, the project may use this configuration:

```json
{
  "mcpServers": {
    "aspire": {
      "command": "aspire",
      "args": [
        "agent",
        "mcp"
      ]
    }
  }
}
```

For VS Code, use the client-specific `servers` configuration.

The project must generate or validate the configuration with:

```sh
aspire agent init
```

The Aspire MCP server uses local STDIO communication.

It does not open a network listener.

It is a development-time tool.

Do not expose it through a public endpoint.

See the [official Aspire MCP documentation](https://aspire.dev/get-started/aspire-mcp-server/).

### Agent observability loop

When an agent works on a running local system, use this order:

1. List AppHosts.
2. Select the correct AppHost.
3. List resources.
4. Check resource state and health.
5. Discover the target endpoint.
6. Reproduce the behavior.
7. Read console logs.
8. Read structured logs.
9. Find the related distributed trace.
10. Read structured logs for that trace.
11. Form one diagnosis.
12. Change the smallest relevant boundary.
13. Reproduce the behavior again.
14. Confirm the fix with tests.
15. Record the evidence.

Do not start by changing code.

First inspect the running system.

### Aspire MCP tools

The agent should use the following tools when available:

- `list_apphosts`;
- `select_apphost`;
- `list_resources`;
- `list_console_logs`;
- `list_structured_logs`;
- `list_traces`;
- `list_trace_structured_logs`;
- `execute_resource_command`;
- `doctor`;
- `list_integrations`;
- `get_integration_docs`;
- `search_docs`;
- `get_doc`.

Use bounded queries.

Request only the resource, time range, or trace needed for the current issue.

Large logs and traces may be truncated.

Save relevant evidence locally when the project permits it.

Do not paste complete logs into Linear.

### Log and trace investigation

For a failing request, record:

- resource;
- endpoint;
- request or correlation identifier;
- timestamp;
- resource state;
- health state;
- relevant console log lines;
- relevant structured log fields;
- trace identifier;
- failing span;
- error type;
- duration;
- retry count;
- suspected cause;
- confirmed cause.

Use the trace to follow the request across process boundaries.

Use structured logs to identify the operation and state transition.

Use console logs to diagnose startup, shutdown, and process failures.

### Resource design

Every resource should define:

- stable resource name;
- process or container command;
- arguments;
- environment variables;
- working directory;
- dependencies;
- readiness check;
- health check;
- endpoint;
- startup timeout;
- shutdown timeout;
- log behavior;
- failure behavior.

The AppHost must declare the resource graph.

The application must own application behavior.

Do not place business rules in the orchestration layer.

### Local development loop

The project should define these commands:

```sh
<start-command>
<status-command>
<logs-command>
<traces-command>
<restart-command>
<stop-command>
<focused-test-command>
<full-quality-command>
```

The commands may use Aspire CLI, Aspire MCP, project scripts, or another local
tool.

The project must document:

- how to start the system;
- how to wait for readiness;
- how to find endpoints;
- how to inspect logs;
- how to inspect traces;
- how to restart one resource;
- how to stop the system;
- how to recover from stale processes;
- how to recover from port conflicts;
- how to reset disposable data;
- how to preserve required local data;
- how to run tests against the local system.

### Browser and API handoff

When a UI test needs a running resource:

1. Use orchestration tools to discover the endpoint.
2. Record the endpoint and resource name.
3. Use the browser or API test tool.
4. Record the route, selector, request, and expected state.
5. Use logs and traces when the test fails.
6. Convert the stable flow into an automated test.
7. Store the test trace in the project test documentation.

Do not hard-code dynamic ports unless the project contract requires them.

### Security

By default, runtime data may include:

- resource metadata;
- console logs;
- structured logs;
- distributed traces;
- endpoint information.

Exclude sensitive resources from MCP access when required.

Use the platform-supported resource exclusion mechanism.

Do not expose:

- credentials;
- tokens;
- private user data;
- candidate data;
- production data;
- secret environment variables;
- sensitive request bodies.

Treat logs and traces as project data.

Define their retention and redaction rules.

### Validation

The local orchestration setup is valid when:

- the AppHost or equivalent starts;
- dependencies reach readiness;
- endpoints are discoverable;
- one API request succeeds;
- one browser flow succeeds when applicable;
- logs are available;
- a trace is available when telemetry is configured;
- one resource can restart;
- shutdown leaves no orphan process;
- focused tests pass;
- the complete local quality gate passes.

Record missing telemetry as an explicit limitation.

Do not claim trace coverage when the application does not emit traces.

### Sources

Use the official Aspire documentation for setup and current command behavior:

- [Aspire skills](https://aspire.dev/get-started/aspire-skills/)
- [Aspire MCP server](https://aspire.dev/get-started/aspire-mcp-server/)

The current Aspire documentation states that Aspire MCP can expose resource
state, console logs, structured logs, distributed traces, and resource
commands to local AI agents. It also states that Aspire skills should be
installed first, with MCP added when live runtime data is required. [Aspire
skills](https://aspire.dev/get-started/aspire-skills/), [Aspire MCP
server](https://aspire.dev/get-started/aspire-mcp-server/)


### Aspire testing and ephemeral environments

Aspire testing is optional. Use it when the AppHost can create a realistic local dependency graph or a disposable preview environment.

Use `Aspire.Hosting.Testing` and `DistributedApplicationTestingBuilder` for functional and integration tests. Create one AppHost per test suite when tests can share isolated resources safely. Dispose it at suite completion. Creating the AppHost for every test adds startup and container cost.

Use the documented resource-access APIs to obtain dynamic endpoints, connection strings, resource state, and logs. Do not hard-code ports or discover them through process output.

Create a local ephemeral environment when the test needs real dependencies. Use disposable volumes, unique resource names, test-only credentials, bounded startup timeouts, and cleanup after the suite. Reset state between tests when sharing the AppHost.

Create a published ephemeral preview environment when browser or external integration tests need a routable endpoint. Use `aspire publish` to create target artifacts, then use the approved deployment target or pipeline to apply them. Add a unique environment identifier, branch or commit metadata, a time-to-live, disposable data, an authentication boundary, and an automatic cleanup step.

A published AppHost is not automatically a preview environment. The deployment target must provide isolation, endpoint exposure, secret injection, data cleanup, observability, and deletion. Record the target-specific command and version.

The preview gate must wait for readiness, run API contract tests, run browser smoke tests when applicable, verify logs and traces, publish bounded artifacts, and delete the environment after the TTL or failed cleanup retry. Never use production data in a preview environment.

In CI, use a runner with a supported container runtime. Aspire documentation states that GitHub-hosted Linux runners are suitable for Linux test containers, while hosted Windows and macOS runners require a configured self-hosted container runtime for this use case.

References:

- [Manage the AppHost in tests](https://aspire.dev/testing/manage-app-host/)
- [Access resources in tests](https://aspire.dev/testing/accessing-resources/)
- [Advanced testing scenarios](https://aspire.dev/testing/advanced-scenarios/)
- [Testing in CI/CD pipelines](https://aspire.dev/testing/testing-in-ci/)

### Aspire watch, hot reload, and rebuild control

Use the AppHost watch and hot-reload features for inner-loop changes when the selected resource supports them. Keep the AppHost process running while application code reloads. Do not rebuild or recreate every resource after a source-only change.

Separate changes into three classes:

- application source changes: reload or restart only the affected project or process;
- AppHost topology changes: rebuild the AppHost and reconcile the resource graph;
- image, package, toolchain, or infrastructure changes: rebuild the affected artifact and rerun the required readiness and smoke checks.

Keep databases and other stateful resources persistent during the inner loop when the test does not require a clean state. Use explicit reset tasks for schema, seed data, and volumes. Use a clean ephemeral environment for release and compatibility validation.

Make watch behavior visible in named tasks. The task must report whether it reused the AppHost, restarted a resource, rebuilt an image, or recreated the environment. Avoid nested watchers that compete for the same files or ports.

Use separate tasks for `dev:watch`, `dev:restart`, `dev:rebuild`, and `dev:clean`. The rebuild and clean tasks must require explicit confirmation or a disposable target.

Reference: [Aspire Hot Reload and watch](https://aspire.dev/app-host/hot-reload-and-watch/)

### Aspire networking, service discovery, and local HTTPS

Model service dependencies with Aspire references. Use `WithReference` or its language-equivalent integration to provide endpoint and configuration data to consumers. Resolve endpoints from the consuming network context.

Keep host, container, and public endpoints distinct. Aspire documents different network contexts for localhost, the container bridge network, and the public internet. A URL that works on the host may not work inside a container.

Use YARP when the local system needs one HTTPS entry point, path routing, static files, or a proxy boundary. Give the gateway a stable local hostname and certificate mapping, such as `https://interview.mensetsukan.localhost:15180/`, only after verifying the certificate, port, route, and backend health.

Do not treat a local hostname as proof of production ingress behavior. Test the same route contract through the deployed ingress or gateway.

References:

- [Aspire networking overview](https://aspire.dev/fundamentals/networking-overview/)
- [Aspire service discovery](https://aspire.dev/fundamentals/service-discovery/)
- [Aspire container networking](https://aspire.dev/fundamentals/container-networking/)
- [Aspire YARP integration](https://aspire.dev/integrations/reverse-proxies/yarp/)

### Aspire lifecycle, pipelines, and health gates

Use lifecycle dependencies for setup and readiness. A migration, seed, or setup resource must finish successfully before dependent application resources receive traffic. Keep migrations idempotent and make seed data deterministic.

Use Aspire pipelines for explicit build, provision, migration, deploy, smoke-test, and notification steps. Give each step a stable name and declared dependencies. Keep deployment-specific steps in the deployment pipeline, not in application startup.

Use readiness checks to decide when a resource can receive traffic. Use liveness checks to decide when a process should restart. Do not use a liveness check as a readiness check. Health responses must not disclose credentials, tokens, or private data.

References:

- [Aspire pipelines](https://aspire.dev/deployment/pipelines/)
- [Aspire app lifecycle](https://aspire.dev/deployment/app-lifecycle/)
- [Aspire health checks](https://aspire.dev/fundamentals/health-checks/)

### Aspire dev containers and AI integrations

Use a local Dev Container or a remote Codespace when the project needs a reproducible development shell, container runtime, or onboarding path. Record which host capabilities remain outside the container, such as Docker socket access, browser access, GPU access, certificates, and cloud credentials.

Use the Aspire Ollama integration for local or private model serving. Use the OpenAI integration when the project accepts a hosted provider boundary. Keep provider credentials outside the AppHost source and bind them through approved secret injection.

Ollama can also provide a local endpoint for Claude Code. Treat that endpoint as a local model boundary and test model availability, request limits, tool permissions, and failure behavior.

References:

- [Aspire Dev Containers](https://aspire.dev/get-started/dev-containers/)
- [Aspire Ollama integration](https://aspire.dev/integrations/ai/ollama/ollama-get-started/)
- [Aspire OpenAI integration](https://aspire.dev/integrations/ai/openai/openai-get-started/)
- [Ollama Claude Code integration](https://docs.ollama.com/integrations/claude-code)

### Aspire custom hosting, secure communication, and Seq

Create a custom hosting integration when a resource has a stable lifecycle, configuration contract, health behavior, and endpoint model that should be reusable. Keep the integration thin. Do not hide deployment-specific behavior behind a generic resource name.

Use the documented secure-communication integration points for TLS, certificates, trust stores, and endpoint bindings. Test certificate rotation, hostname validation, expired certificates, and failed trust separately.

Use Seq as an optional local structured-log sink. Keep application logs structured and vendor-neutral. Verify that sensitive fields are redacted before logs reach Seq or any remote sink.

References:

- [Aspire custom hosting integrations](https://aspire.dev/integrations/custom-integrations/hosting-integrations/)
- [Aspire secure communication](https://aspire.dev/integrations/custom-integrations/secure-communication/)
- [Aspire Seq integration](https://aspire.dev/integrations/observability/seq/seq-get-started/)

### Secrets with SOPS

Use SOPS to encrypt configuration values at rest. Prefer age identities for a small repository team, or the approved cloud KMS identity for controlled deployment environments. SOPS supports offline identities and cloud KMS integrations.

Keep encrypted files separate from generated plaintext. Decrypt only into a process environment, a short-lived file with restrictive permissions, or the target secret manager. Do not pass secrets through command-line arguments, task names, logs, traces, screenshots, prompts, or browser URLs.

For local Aspire, decrypt only the development secret set and inject it through the approved environment or AppHost parameter path. For CI, use workload identity or the CI secret store to access the SOPS key. For deployed environments, decrypt in the deployment boundary or convert the values into the provider secret manager. Do not copy a production plaintext secret into the repository or preview artifact.

Review `.sops.yaml`, key groups, creation rules, identity access, rotation, revocation, and recovery. Test that a developer, CI job, and deployment identity can access only the intended environment.

Reference: [SOPS](https://getsops.io/)

## Standard tooling with mise

Use JDX mise to provide one workflow for tools, runtimes, environment variables, and tasks across operating systems.

Pin tools in a repository `mise.toml` file. Use `mise install` to install them. Use `mise ls --current` to inspect selected versions. Use `mise doctor` to diagnose configuration and trust problems.

Use `mise env` to inspect the project environment. Use `mise env --json` when another tool needs structured data. Use `mise exec -- COMMAND` when a command must run with the project environment without changing the parent shell.

Define build, format, lint, test, audit, development, and release commands as named `mise run` tasks. Keep task names stable across operating systems. Use task dependencies for ordering. Return a non-zero status on failure.

Keep private values in ignored local configuration or an approved secret manager. Do not commit credentials, tokens, private URLs, or candidate data. Review `mise.toml`, lockfiles, plugins, and install hooks as executable supply-chain changes.

On a new machine, install the approved mise version, inspect the active configuration with `mise config`, trust the reviewed configuration, run `mise install`, inspect versions with `mise ls --current`, run focused tasks, and then run `mise run check`.

CI must use the same task names as local development. It must record the mise version, selected runtime versions, operating system, architecture, command, and result. Do not depend on shell startup files. Invoke mise explicitly in CI and automation.

Test every supported operating system. Record platform-specific skips as evidence. Use a cross-platform program when task logic becomes complex. Bound parallel work with `MISE_JOBS` when runners have limited resources.

Official references: mise, configuration, `mise env`, `mise run`, and `mise trust`.

## Scoped and discoverable mise tasks

Keep task definitions close to the code that owns them. Put repository-wide tasks in the root `mise.toml`. Put component tasks in the component `mise.toml`. Put deeper project or section tasks in the nearest child configuration or a documented task directory.

Use `mise tasks` from the current directory to discover tasks in the active configuration hierarchy. Use `mise tasks --all` only when an agent needs the complete monorepo inventory. Use `mise tasks info --json TASK` to inspect the task source, directory, dependencies, environment, inputs, outputs, and command before execution. Use `mise tasks deps TASK` to inspect ordering. Use `mise tasks validate --errors-only` before relying on a task.

Give every task a stable name and a short description. Use names such as `build`, `test`, `lint`, `check`, and `serve` inside one project. Use a qualified name or an explicit directory when two projects have the same task name. Do not hide normal verification tasks. Hide only internal helpers that agents must not call directly.

A task must run only the files and services in its scope. Set `dir` explicitly when a task crosses a component boundary. Pass arguments through a declared usage contract. Do not let a task silently change directory, install unpinned tools, read production data, or deploy to an external system.

Expose one safe entry task per project, such as `mise run check`. Make that task depend on the required local checks. Document the project root, component roots, supported operating systems, prerequisites, and expected outputs in the repository guide. Agents should discover tasks before running them.

Use `mise mcp` when an agent platform supports MCP. It exposes task, tool, environment, and configuration resources. Keep task execution approval and trust boundaries in the agent or repository policy.

## Choosing a scripting language for repository automation

Choose the language that best fits the repository boundary and the operating system constraints. Do not choose a language only because it is familiar.

- Use the repository main language for domain-aware scripts, fixtures, migrations, and tests. This keeps models, errors, and maintenance in one ecosystem.
- Use Go for portable repository automation, preflight checks, test orchestration, and process control when one static binary should run across operating systems.
- Use TypeScript for Node or web tooling, JSON and YAML transformation, and automation that already depends on the Node ecosystem.
- Use Elixir for Mix-native project tasks, supervision-aware tooling, and behavior that must use the Elixir application boundary.
- Use Elixir and OTP for long-running orchestration, supervision trees, concurrent workflows, fault isolation, retries, and stateful process coordination. Keep OTP behaviors and shutdown semantics visible in tests.
- Use Python for data processing, scientific or machine-learning adapters, and tooling that depends on its mature package ecosystem.
- Use Rust for performance-intensive, memory-sensitive, or CPU-bound tasks when profiling shows that a simpler language cannot meet the requirement. Keep the Rust boundary small and expose a stable command or library contract.
- Use Zig for portable native libraries and frameworks when explicit cross-compilation, C or C++ interoperability, or WebAssembly targets are core requirements. Keep a stable C ABI at integration boundaries and test every target.
- Use a small POSIX or PowerShell script only for a thin operating-system adapter. Move complex logic into a tested program.

Record the choice in the task description or an architecture decision. The choice must state the required runtime, supported operating systems, dependency install path, error and exit-code behavior, test command, and maintenance owner. Prefer a language already pinned by mise. Avoid adding a second runtime for a one-line task.

Automation must execute arguments directly when possible. Validate inputs before process execution. Do not build shell source from untrusted values. Keep stdout concise and stable. Send diagnostics to stderr. Return non-zero on failure.

### Zig portability pathway

Zig is a strong option for small native libraries, command-line tools, and framework adapters that must target many operating systems or WebAssembly. Its compiler can target explicit CPU, operating-system, and ABI combinations. This improves repeatability, but it does not remove platform API, libc, linker, runtime, or host-browser constraints.

Use Zig for portability when the assessment shows a real need for:

- cross-compiling one codebase to supported native targets;
- compiling or linking C and selected C++ sources through the Zig toolchain;
- exposing a small C-compatible ABI to C, C++, Swift, Go, Rust, or another host;
- producing a browser or host WebAssembly module;
- embedding a portable core inside platform-specific user interfaces.

For C and C++, prefer a narrow, documented C ABI. Use explicit integer widths, ownership rules, allocator rules, error values, and symbol visibility. Treat C++ name mangling, exceptions, RTTI, standard-library ABI, and compiler runtime selection as platform boundaries. Do not promise C++ binary compatibility because a C++ compiler can compile the source.

For WebAssembly, choose the target from the host contract. Use a freestanding target for browser or JavaScript hosts, and use a WASI target when the runtime provides WASI. Define imports, exports, memory ownership, filesystem access, clocks, threading, and capability limits. Test the module in every supported runtime.

Use libghostty as a case study, not as a universal guarantee. The project describes `libghostty-vt` as a C and Zig library compatible with macOS, Linux, Windows, and WebAssembly. The full embedding API has platform-specific limits. Separate the portable core from native GUI and operating-system integrations.

### Zig assessment

1. Pin the Zig compiler version in mise and record the matching Zig release notes.
2. Run `zig version`, `zig targets`, `zig test`, and the repository build task on the host platform.
3. Build a target matrix for every supported architecture, operating system, ABI, libc choice, and WebAssembly host.
4. Compile a C ABI smoke consumer and check exported symbols, header types, ownership, error values, and calling conventions.
5. Run native tests on native runners. Run cross-compiled artifacts in an emulator, container, device, or target runner.
6. Run WebAssembly tests in each supported browser or WASI runtime. Test denied capabilities and interrupted execution.
7. Measure startup, memory, binary size, and throughput before choosing Zig or Rust for performance. Keep the smallest language boundary that meets the evidence.

Do not select Zig only because it can cross-compile. Confirm library availability, debugging, sanitizers, licensing, linker behavior, support policy, and the ability of project maintainers to update the toolchain.

## Efficient command output for agents

Agents must not receive complete logs by default. A command wrapper should keep the original output in a bounded artifact and return a compact summary with the command, exit code, duration, result, failed step, warning count, error lines, and artifact path.

Use a formatter or summarizer when a tool produces repetitive output. Prefer `xcbeautify` or `xcpretty` for `xcodebuild` output. Apply the same pattern to compiler, test, package, container, and infrastructure tools. Keep raw output available for review and recovery.

Preserve failure information. A formatter must not hide the first error, the related command, the test name, the file and line, the exit code, or the final result. Use `set -o pipefail` for pipelines so the wrapper returns the producer failure. Use machine-readable output such as JSON or JUnit when a consumer needs reliable parsing.

Use structured reduction before semantic reduction. First remove repeated progress lines, collapse identical records, group tests by result, and show counts. Then summarize text only when the original bytes remain recoverable and the summarizer reports its method and limits.

Caveman and similar token-optimization tools may reduce eligible context, logs, code, tables, and tool output. Use them only when the original data remains recoverable, the transformation is measured, and the task still passes its validation gate. Keep credentials, source code needed for a decision, exact errors, patches, commands, and security evidence uncompressed or byte-exact. Treat hosted gateways as a separate trust boundary. Do not send private logs or source to a hosted service without approval.

Every output reducer must define:

- input and output formats;
- whether the transformation is lossless;
- the recovery path;
- the fields that it must preserve;
- maximum output size;
- redaction rules;
- failure behavior;
- a test fixture and quality threshold.

Add the reducer to mise as a named task. For example, `mise run test --output compact` may return a compact agent summary while `mise run test --output raw` preserves the full stream. Do not make compact output the only evidence.

## Output validation and evidence

A command is agent-ready when an agent can discover it, inspect its scope, run it with bounded inputs, identify success or failure from its exit code and summary, and locate the complete artifact when required. Test the reducer with passing output, warnings, multiple failures, truncated output, malformed output, secrets, and interrupted processes.

Record the command, task source, configuration files, runtime versions, operating system, architecture, summary format, artifact path, exit code, and validation result. Update the feature matrix or work log when the command changes.

References:

- mise tasks
- mise task information
- mise task validation
- mise MCP
- [Caveman](https://caveman.so/)
- xcbeautify
- [xcpretty](https://github.com/xcpretty/xcpretty)

## Deployment pathways

Keep the AppHost or equivalent resource graph as the source of local topology. Keep production deployment decisions explicit. A deployment path must state its target, image or executable source, configuration inputs, secret source, network boundary, persistence model, health checks, rollback method, and observability destination.

Use the simplest target that satisfies the product requirement:

- Use a local OCI runtime for development and deterministic integration tests.
- Use one host with an OCI runtime, a reverse proxy, and a service manager when one machine is sufficient. Use systemd, launchd, or the supported Windows service manager for restart and shutdown.
- Use Docker Compose or another generated compose format for a small multi-service deployment. Validate the generated file before applying it.
- Use Kubernetes when the system needs scheduling, replicas, rolling updates, workload identity, multi-node capacity, or a standard cluster control plane.
- Use a managed cloud platform when the team needs provider-managed networking, identity, scaling, backups, or compliance controls.
- Use a private VPC or bare-metal cluster when data locality, network isolation, hardware control, or offline operation requires it.

When the selected Aspire target supports deployment, use the project-approved `aspire publish` or `aspire deploy` flow. When it does not, use the published artifacts with the target platform tooling. Do not assume that one AppHost command supports every target or every Aspire version. Record the exact Aspire version and target integration in the deployment specification.

### Kubernetes pathway

Treat Kubernetes manifests, Helm charts, or operators as deployment artifacts. Generate them from the AppHost only when the generator supports the required resource types. Otherwise write a small explicit chart or manifest set that preserves the AppHost contract.

Validate manifests against the target Kubernetes version. Run a server-side dry run, policy checks, image and secret reference checks, and a disposable-cluster smoke test before production. Use readiness, liveness, startup, and shutdown behavior that matches the application contract. Keep persistent volumes and migrations explicit. Never place production credentials in a manifest or image.

Deploy through a controlled identity and a recorded context. Use a namespace or equivalent environment boundary. Prefer progressive rollout, observable health gates, and an explicit rollback command. Keep `kubectl`, Helm, and cluster versions pinned through mise or the approved runner image.

### Cloud and simple-host pathway

For a simple host, publish an OCI image or a self-contained executable. Configure a service manager, TLS termination, firewall rules, backups, log rotation, health checks, and a rollback directory or image tag. Test restart after host reboot and loss of a dependency.

For cloud deployment, choose provider-native compute that matches the workload. Examples include Azure Container Apps, Azure App Service, or AKS; Google Cloud Run, GKE, or Compute Engine; and Amazon ECS, EKS, or EC2. Use provider deployment tooling when the Aspire integration does not cover the target. Keep the AppHost resource names, environment contract, health paths, and dependency rules consistent across targets.

Use workload identity or managed identity where the platform supports it. Keep secrets in the provider secret manager. Use private networking for internal dependencies. Restrict ingress and egress. Define data residency, retention, backup, recovery, and deletion rules before deployment.

## Rancher Desktop for local container and Kubernetes workflows

Rancher Desktop is a local development and test environment. It is not a production cluster. It can provide a Docker-compatible Moby engine or containerd with `nerdctl`. Only one container runtime is active at a time, and images and containers are not shared when the runtime changes.

Use the Docker-compatible runtime when project tasks call `docker` or Docker Compose. Use containerd and `nerdctl` only when the repository documents that interface. Enable local Kubernetes only when a test needs Kubernetes behavior. Pin the Kubernetes version and record the runtime, Kubernetes context, CPU architecture, memory, and disk allocation in the test evidence.

Run the same `mise run` tasks against Rancher Desktop as against the other supported OCI runtimes. Pull required images before time-limited tests. Keep local image stores and disposable volumes separate from production data. Stop workloads after tests and verify that no orphan process or cluster resource remains.

Do not treat Rancher Desktop availability as proof that a remote Kubernetes deployment works. Follow local acceptance with a disposable remote-cluster or staging acceptance test.

## Online testability and observability

A deployment is testable online when an external test runner can discover its endpoint, authenticate with a disposable identity, execute a safe journey, correlate the request with a trace identifier, observe logs and metrics, and report a bounded result. Use a dedicated preview or staging environment. Do not run acceptance tests against production data.

Expose separate readiness and liveness behavior. Keep health endpoints free of secrets. Return a correlation identifier or trace context for each test request. Test startup, dependency failure, timeout, retry, authorization failure, migration failure, graceful shutdown, and rollback. Use API tests for contract behavior and Playwright for browser behavior.

Prefer OpenTelemetry SDKs and the OpenTelemetry Collector as the application boundary. Export OTLP from the application to a local sidecar, node agent, or private gateway. The collector can redact, batch, sample, retry, route, and export telemetry without coupling application code to one vendor.

### Provider defaults

- Azure: use Azure Monitor with Application Insights and Log Analytics. Use the Azure Monitor OpenTelemetry distribution or OTLP ingestion according to the supported language and runtime. Store the connection string or endpoint in a secret store or environment binding. Verify traces, metrics, exceptions, and structured logs in Application Insights and query retained logs in Log Analytics.
- Google Cloud: use Cloud Logging, Cloud Monitoring, and Cloud Trace. Prefer OpenTelemetry with a collector and OTLP for vendor-neutral application code. Route telemetry through the Google-built collector, Ops Agent, or the platform-supported collector path. Verify log entries, metrics, trace spans, and alert conditions in Google Cloud Observability.
- AWS: use CloudWatch Logs, CloudWatch Metrics, Application Signals, and AWS X-Ray as the managed destinations. Use the CloudWatch agent, AWS Distro for OpenTelemetry, or an upstream or custom OpenTelemetry Collector according to language and platform support. Verify service metrics, logs, traces, and alarms in the selected AWS console.

Provider defaults are convenience paths. They do not replace the application telemetry contract. Keep resource names, service names, deployment version, environment, region, and correlation identifiers consistent across providers.

### VPC and bare-metal pathway

For a private VPC or bare-metal host, run an OpenTelemetry Collector inside the trusted network. Use mTLS or another approved transport between applications and the collector. Restrict collector receivers to the application network. Permit only the required egress to the telemetry backend. Do not expose an OTLP receiver directly to the public internet.

Choose a collector topology that matches failure and scale needs: a sidecar for strong workload isolation, a node or host agent for local collection, or a gateway for centralized routing. Configure bounded queues, retries, backpressure, disk buffering when allowed, sampling, redaction, and a defined behavior when the backend is unavailable. The application must remain safe when telemetry export fails.

A custom backend may use OpenTelemetry-compatible storage and analysis tools. Document the receiver, processors, exporters, dashboards, alerts, retention, access control, backup, and deletion lifecycle. Test the path without sending private or production data. Keep raw diagnostic access restricted and return compact summaries to agents.

## Deployment validation and rollback

Every deployment path must expose named mise tasks such as `deploy:validate`, `deploy:publish`, `deploy:apply`, `deploy:smoke`, `deploy:observe`, and `deploy:rollback`. Keep destructive or production tasks protected by an explicit environment and human approval.

The deployment gate must:

- build from a pinned toolchain;
- validate configuration and generated artifacts;
- scan dependencies and images according to policy;
- deploy to a disposable or staging target;
- run API and browser smoke tests;
- verify health, logs, metrics, and traces;
- record the version, target, endpoint, commit, test result, and artifact links;
- roll back to the last known-good version when a health gate fails.

The evidence must show both application success and platform success. A successful image push or deployment command is not proof that users can reach the application.

Deployment references:

- [Aspire deployment](https://learn.microsoft.com/en-us/dotnet/aspire/deployment/overview)
- [Rancher Desktop container engine](https://docs.rancherdesktop.io/ui/preferences/container-engine/general/)
- [Rancher Desktop Kubernetes](https://docs.rancherdesktop.io/ui/preferences/kubernetes/)
- [Azure Monitor OpenTelemetry](https://learn.microsoft.com/en-us/azure/azure-monitor/app/opentelemetry-enable)
- [Google Cloud instrumentation and observability](https://docs.cloud.google.com/stackdriver/docs/instrumentation/overview)
- [AWS CloudWatch OpenTelemetry](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-OTLPGettingStarted.html)
- [AWS Distro for OpenTelemetry and X-Ray](https://docs.aws.amazon.com/xray/latest/devguide/xray-services-adot.html)