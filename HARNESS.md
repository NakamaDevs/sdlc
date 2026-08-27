# HARNESS

Harness engineering makes the repository, tools, tests, observability, and workflow legible and enforceable for people and AI agents.

Humans define intent, constraints, priorities, and acceptance. Agents execute within a repository-local harness. The harness must make the correct path easy to discover and the unsafe path difficult to execute.

## Repository as the system of record

Keep the important engineering knowledge in versioned repository artifacts. Use a short agent entry point as a map. Put detailed specifications, architecture decisions, execution plans, quality rules, test evidence, and operational runbooks in linked files.

Use progressive disclosure. Agents should discover the relevant document, read only the required depth, run the approved task, and return bounded evidence. Do not depend on private chat history or undocumented human memory.

## Legibility and enforceable boundaries

Expose application behavior through stable commands, structured logs, traces, metrics, health checks, browser routes, API contracts, and test fixtures. Encode architectural boundaries, dependency direction, schema validation, security rules, and quality checks in linters or structural tests when possible.

A rule is stronger when the repository can check it. Error messages should explain the failed invariant and the next repair action.

## Feedback loops and autonomy

Build the loop in depth-first order: specification, implementation, tests, review, observability, recovery, and cleanup. When an agent fails, identify the missing capability, tool, boundary, or document. Improve the harness instead of relying only on a larger prompt.

Increase autonomy only after the repository proves reliable task discovery, isolated execution, bounded resources, test validation, review, rollback, and human escalation. Autonomy is an outcome of evidence, not a default permission.

## Isolated and observable work

Give each independent change an isolated workspace or environment when concurrent processes, ports, data, logs, or credentials could interfere. Make the environment bootable from the repository. Expose its logs, metrics, traces, browser state, and test artifacts through approved local tools.

Keep raw evidence recoverable. Return compact summaries to agents, but preserve the complete artifact for review and diagnosis.

## Symphony assessment

OpenAI describes Symphony as an orchestrator that turns a project-management board into a control plane for coding agents. An open task can map to an isolated agent workspace. Ticket status can represent the workflow state. Blocked work can form a dependency graph. Failed or stalled runs can be restarted according to policy.

Use this pattern when the project has clear issue contracts, reliable status transitions, isolated workspaces, bounded execution, reviewable artifacts, and a safe recovery path. Keep issue tracking separate from implementation details. An issue may produce multiple pull requests or only research and planning.

Do not assume Symphony or any agent orchestrator generalizes automatically. Validate task pickup, duplicate prevention, cancellation, retry limits, dependency handling, workspace cleanup, secret isolation, pull-request ownership, and human escalation before continuous operation.

## Harness review checklist

1. Can a new agent find the repository map, current specification, approved tasks, and quality gate?
2. Can the agent run local checks with pinned tools and bounded output?
3. Can the agent observe the application without receiving unnecessary secrets or complete logs?
4. Can independent work run without shared ports, data, credentials, or mutable state?
5. Can failed work be stopped, retried, recovered, reviewed, and rolled back?
6. Are architecture rules and documentation freshness checked mechanically?
7. Are human approval points explicit for external systems, production data, destructive actions, and security exceptions?

References:

- [Harness engineering: leveraging Codex in an agent-first world](https://openai.com/index/harness-engineering/)
- [An open-source spec for Codex orchestration: Symphony](https://openai.com/index/open-source-codex-orchestration-symphony/)
- [OpenAI Symphony repository](https://github.com/openai/symphony)
## Durable harness updates

Harnesses should learn from execution evidence without changing their own rules silently. Record failed attempts, tool latency, test outcomes, recovery steps, and operator feedback. Convert a repeated failure into a reviewed task, test, guardrail, or documentation change.

[AutoSaddler](https://arxiv.org/abs/2608.23041) is research on automatic harness optimization with durable updates from agent execution traces. Treat it as research evidence, not a permission for unreviewed self-modification. Keep policy changes reviewable, versioned, reversible, and attributable.

The [Omar Sanusi discussion](https://x.com/omarsar0/status/2092246879702769956) is a secondary discussion reference. It is not a normative source. Validate its claims against the repository, tests, and primary research.