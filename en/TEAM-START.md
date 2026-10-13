# TEAM-START

A new team starts here. Use this guide for an existing application or a new project.
The baseline works without a private tool, a particular employer, or an agent subscription.

## What already exists

The handbook already covers delivery, security, skills, tool setup, and human decisions.
This adoption path connects those references to exercises and a reusable root workspace.
Use [COURSE.md](COURSE.md) for learning, [AGENT-TEAM.md](AGENT-TEAM.md) for delegation, and [WORKSPACES.md](WORKSPACES.md) for isolation.

## Start in one hour

1. Name the product owner, technical owner, QA owner, and release owner. One person can hold several roles.
2. Select one small user journey. State its business rule and two failure cases.
3. Create a private root repository from the starter below. Keep application repositories separate.
4. Inventory only the repositories needed for this journey. Record access, revision, owner, commands, and missing knowledge.
5. Run the discovery checks. Record missing access as a gap, not an assumed fact.
6. Complete the first course exercise. Select one bounded pilot change with measurable acceptance evidence.

## Generate the root workspace

Run from a checkout of this SDLC repository. Use Python 3.12 or newer.
The destination must not exist. The generator writes only that new directory.
It does not clone applications, install tools, start services, change accounts, or publish anything.

```sh
python3 scripts/new_workspace.py /tmp/team-root --language en
cd /tmp/team-root
python3 scripts/workspace.py check
python3 scripts/workspace.py context
```

Use `--language es` for Spanish. Review the generated files before the first commit.
Choose a private repository and verify its remote and visibility before pushing project context.
The sample check validates the scaffold. It does not prove application readiness.

## Keep the boundary clear

The root owns discovery notes, cross-repository decisions, onboarding, agent briefs, and local orchestration.
Application repositories retain their code, tests, history, access rules, and release process.
The starter ignores child checkouts, worktrees, local configuration, state, and evidence artifacts.
Review staged paths before every root commit. Ignored files are not an access-control boundary.

Read child instructions before proposing changes there. Root instructions never grant extra access or replace child policy.
For public upstream repositories, keep private analysis in the private root. Submit only the authorized code change upstream.
A local agent session must receive both the root context and the relevant child instructions explicitly.

## Tool adoption

| Layer | Start with | Add when |
| --- | --- | --- |
| Human documentation | Markdown and Git | A searchable local reader improves discovery |
| Named commands | Existing application tasks | mise makes tools and commands reproducible |
| Documentation portal | Existing reader or static Markdown | An approved Bunko release is available |
| Runtime | One application and synthetic fixtures | Aspire coordinates several required resources |
| Agents | One task and one accountable person | Independent tasks have bounded ownership and checks |
| Skills | A reviewed procedure | Repeated work justifies a pinned reusable skill |

This repository's own Bunko installation requires private access. It is not a dependency of the generated starter.
With access, follow the repository README and use its pinned release and configuration schema.
Without access, read the Markdown directly or connect an approved documentation reader.
Register root documentation and permitted child roots. Keep reviewer notes and local databases private.

## First week

Complete the shared course, then the relevant role lab. Record actual durations instead of promising a fixed adoption time.
Have a second person or a fresh agent follow the repository onboarding page without oral instructions.
Fix missing commands and ambiguous business rules before adding parallel automation.
Measure time to first validated change, repeated questions, review findings, escaped defects, and interruption load.
Do not use generated code volume or agent count as a success measure.

## Acceptance

The pilot is complete when a newcomer explains the journey, finds the owning repository, and runs the documented check.
A fresh agent must recover the task, source revision, permissions, test result, remaining gap, and next step.
The team must distinguish proposed, implemented, locally tested, integrated, deployed, and accepted work.
Keep publication of reading editions separate from repository delivery.
