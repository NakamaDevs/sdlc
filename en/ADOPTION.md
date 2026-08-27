# ADOPTION

This guide explains how people and AI agents intake, apply, and maintain the SDLC system.

## Intake for humans

Read `SDLC.md` first. Treat it as the map and the shared principles. Then read only the companion guide for the current work. A person should find the project purpose in less than ten minutes. The person should also find the current milestone, quality gate, owner, and next action.

Start with the repository README. Confirm the supported languages, operating systems, deployment targets, required tools, and local verification command. Read the repository-local agent guide before using a global or organization rule.

Do not adopt every optional technology at once. Select the smallest set that solves the current coordination or quality problem. Record the decision and the reason.

## Intake for agents

Use this order:

1. Read the nearest agent guide and repository README.
2. Find the current specification, feature or task, and acceptance evidence.
3. Read the relevant companion guide only when its topic affects the task.
4. Discover available tasks before executing commands.
5. Run a bounded status or validation task.
6. State the current result, evidence, risk, and next action before changing files.
7. Update the specification, tests, documentation, feature matrix, and work tracker when behavior changes.

The agent entry point should be short. It should link to the source of truth instead of repeating the entire handbook.

## Issue and branch intake

Before work starts, create or locate the required issue in the repository project. Confirm its owner, scope, acceptance evidence, and milestone.

Before editing, use Herdr to create or locate the assigned branch and worktree. Follow the repository branch policy for the branch name and base. Do not share a branch or worktree with another agent.

If Herdr is unavailable, stop before a shared Git write. Follow the repository fallback procedure or ask the repository owner for direction.

## Recommended repository structure

Use the existing repository conventions when they are clear. A new repository can start with this structure:

```text
README.md
AGENTS.md
ARCHITECTURE.md
mise.toml
docs/
├── spec.md
├── workflow.md
├── feature-matrix.md
├── test.md
├── decisions/
├── plans/
├── runbooks/
└── references/
apps/
packages/
scripts/
tests/
.github/workflows/
```

`AGENTS.md` should map the repository. `README.md` should onboard people. `spec.md` should define behavior. `workflow.md` should define the agent loop. `feature-matrix.md` should connect features to tests. `test.md` should define validation. `plans/` should hold active and completed plans.

## Two adoption paths

Choose one primary path for each rule. Do not maintain two independent copies of the same requirement.

### Path A: repository documents

Use repository documents when the guidance:

- defines a local command, stack, owner, environment, or release unit;
- must change in the same pull request as the code;
- must remain readable without an agent runtime;
- needs a visible history for people, auditors, and automation.

Copy only the necessary generic guides. Record their source revision and local adaptations.

Keep a short `AGENTS.md` that links to the local documents. Do not paste the complete handbook into it.

### Path B: reusable skills and references

Use a skill or versioned reference when the guidance:

- applies unchanged across several repositories;
- defines a repeatable agent procedure;
- needs reusable scripts, fixtures, or validation;
- has one reviewed owner and update path.

Keep project-scoped skills in `.agents/skills/` when they form part of the repository contract.

Pin shared skills and references to a reviewed revision. Link them from `AGENTS.md` and record their trust boundary.

Do not hide required human guidance inside a skill. Provide a readable document or reference for every required workflow.

### Optional organization profiles

Keep the generic guides useful without organization access.

Put private project names, teams, account identifiers, branch overrides, skill marketplaces, and stack preferences in an optional profile.

Place each optional profile after all generic Gist files. Label inaccessible links and state which policy can override the generic guide.

Use one export check to enforce this order.

## Templates that make the practice stick

Provide templates for issues, milestones, specifications, decisions, test plans, work logs, pull requests, and release notes. Each template must request the smallest evidence needed for review.

Keep templates next to the repository or in a versioned organization bundle. Use placeholders for names, identifiers, environments, and dates. Do not place real credentials, private URLs, candidate data, or production values in examples.

Make the templates executable where possible. A task template should link to the validation command. A feature template should require a test row. A deployment template should require the target, health gate, observability query, rollback, and cleanup.

## Minimum viable adoption

Adopt these controls first:

- one repository map;
- one pinned local quality command;
- one behavior specification template;
- one test and evidence format;
- one issue and milestone workflow;
- one secret scan;
- one documented owner for keeping the system current.

Add Aspire, Ollama, additional language runtimes, preview environments, remote agents, and advanced orchestration only when the baseline is reliable.

## Adoption sequence

Use a small pilot feature. Measure setup time, task discovery time, validation time, review time, escaped defects, repeated questions, and documentation drift.

Then:

1. Fix missing maps, commands, fixtures, or evidence paths.
2. Promote repeated guidance into a template, task, linter, or test.
3. Apply the pattern to a second feature and a second repository.
4. Remove rules that do not improve safety, quality, speed, or clarity.
5. Publish the stable pattern as a versioned organization skill or repository template.

Do not measure adoption by document size or the number of tools installed. Measure whether people and agents can produce working, reviewable software with fewer guesses.

## Operating cadence

At the start of work, confirm the issue, milestone, owner, specification, test plan, and local command.

During work, record meaningful progress, decisions, failures, and evidence. Keep the issue status aligned with reality.

At completion, run the quality gate and update the feature matrix and docs.

Attach bounded evidence, review risks, and record the next maintenance action.

On a regular cadence, run documentation freshness, link, task-discovery, secret, dependency, workflow, and skill-source checks. Remove stale guidance and close obsolete plans.

## Definition of success

The system works when a new person or agent can find the correct source and local check.

The reader can understand failures, make a bounded change, and leave current repository and tracker records.

Success requires judgment. The documents guide decisions. They do not replace domain expertise, review, security approval, or production change control.
