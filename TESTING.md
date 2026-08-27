# TESTING

Companion guidance extracted from the SDLC document.

This file is the focused reference for specifications, FIRST tests, test layers, UI evidence, and validation.
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

