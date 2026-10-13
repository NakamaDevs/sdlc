# COURSE

This course teaches a complete delivery loop. Use a synthetic appointment application for the shared exercises.
A person selects a time, submits a request, and sees confirmation. An unavailable time produces a conflict.
The example carries no payment, message delivery, production access, or personal data.

## How to use the course

Complete the shared path before a role lab. Each lesson produces evidence, not just reading progress.
A facilitator or another learner reviews the exit criterion. Record gaps in the private root.
Use [TEAM-START.md](TEAM-START.md), [AGENT-TEAM.md](AGENT-TEAM.md), and [WORKSPACES.md](WORKSPACES.md) as the practical references.

## Shared path

| Lesson | Exercise | Evidence and exit criterion |
| --- | --- | --- |
| 1. Product and domain | Describe the appointment journey, actors, state changes, and conflict rule | Another learner explains success and failure without reading code |
| 2. Discover the system | Trace the screen to API, storage, worker, and external boundaries | Repository map records verified revisions, owners, commands, and unknowns |
| 3. Engineer context | Write a short root map and one repository onboarding page | A fresh agent finds the correct test command without guessing |
| 4. Specify a small change | Add cancellation before an appointment starts | PM owns the time rule; scenarios cover success, denial, and repeated request |
| 5. Work with mocks | Model the cancellation response and conflict state | UI test passes; an unknown route fails; fixtures name their schema revision |
| 6. Validate the provider | Implement or inspect cancellation with isolated synthetic data | Provider tests match the contract; a concurrent or repeated request is covered |
| 7. Integrate and review | Run the real local journey and inspect the final diff | Evidence names both revisions; reviewer reproduces each material finding |
| 8. Deliver and hand off | Prepare release and rollback records without deploying | Fresh reader distinguishes test, release authorization, deployment, and acceptance |

If no sample application exists, lessons 1 through 4 are document exercises.
Lessons 5 through 7 require an approved local application or a separate sandbox implementation.
Do not mark those labs passed from written scenarios alone. Record the missing executable environment.

## Role labs

| Role | Independent assignment | Required handoff |
| --- | --- | --- |
| PM or product | Resolve ambiguous cancellation timing and prioritize one thin slice | Decision, non-goals, measurable scenarios, acceptance owner |
| QA | Challenge the happy path with time boundaries, denial, and retries | Risk-based test plan, reproducible failure, environment and artifacts |
| Frontend | Show pending, success, conflict, and error states using the agreed mock | State catalogue, browser evidence, accessibility checks, real-provider gap |
| Backend | Enforce cancellation and repeated-request semantics | Contract tests, data invariants, consumer map, migration implications |
| DevOps or platform | Run two isolated instances and stop one | Identity preflight, health evidence, isolation proof, recovery procedure |
| Design or UX | Compare intended flow with implemented states | State inventory, accessibility expectations, unresolved product decisions |
| Research or architecture | Compare two ways to isolate runtime state | Primary sources, tradeoffs, local experiment, uncertainty, decision proposal |
| Security or data | Trace sensitive data and external effects | Access boundary, synthetic-data plan, redaction and retention checks |

The learner can use an agent but must explain the evidence and remaining risk.
An agent cannot approve a product rule, release, or access grant on behalf of an unnamed owner.

## Repository onboarding assignment

Create one page per repository in the root. Keep the page next to the cross-repository map.
Include purpose, domain terms, owner, source revision, entry points, dependencies, supported environments, and exact verification commands.
Explain one end-to-end request, one common failure, and one recovery procedure.
Include links to existing child documentation instead of copying it.

Add three exercises: locate behavior, run a focused check, and diagnose a seeded local failure.
Each exercise states prerequisites, safe scope, expected evidence, and completion criteria.
Record inaccessible areas as unknown. Ask the owning person to validate business and operational claims.
Have a newcomer repeat the exercises. Update the page from observed confusion, not imagined coverage.

## Agent onboarding assignment

Give a fresh agent the root guide, repository page, and one completed task brief.
Ask it to identify allowed paths, acceptance scenarios, command scope, missing access, and stop conditions.
Then assign a read-only trace of the appointment flow. Compare the answer with the verified map.
Only after this passes, allow one bounded implementation in an isolated worktree.
Have a separate reviewer assess the final diff. Record findings, resolutions, and unverified behavior.

## Team simulation

Run researcher and QA discovery independently. Then agree on the contract before implementation.
Run frontend and backend work concurrently only when ownership and contract boundaries are clear.
The coordinator integrates both revisions and asks QA to repeat the same scenario against the real provider.
Introduce one deliberate contract mismatch. The integration check must detect it before the team calls the feature complete.
Record a short handoff and let a new session resume. This tests the documentation as part of the system.

## Maintain the course

Attach repository and contract revisions to each completed lab. Repeat affected exercises when commands or behavior change.
Review the course after the pilot and each significant architecture change.
Retire duplicated pages and obsolete instructions. Keep one accountable owner per repository onboarding page.
Use setup time, independently completed tasks, defect detection, and learner questions to select the next improvement.
