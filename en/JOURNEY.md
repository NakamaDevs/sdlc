# HARNESS JOURNEY

This proof of concept studies how a portable harness can support delivery, validation, documentation, and human learning. Step 2 is partly achieved. Reliable freshness remains incomplete. Steps 3 to 6 are planned capabilities, not claims of unattended production operation.

## Evidence and limits

Assessment date: 2026-10-29. This is a review of available local artifacts, not a fresh production audit. The observations below describe that sample. Private source identities, incident dates, paths, code, and raw evidence are intentionally excluded. The guide contains original, generalized lessons. It is not a reproducible public benchmark.

| Evidence class | What was inspected | What it supports | What it does not prove |
| --- | --- | --- | --- |
| E1 | Agent definitions and workflow guidance | Configured role routing, ownership, checks, and release boundaries | That every run followed the rules |
| E2 | A stored local review record | A recorded clean verdict with explicit checks that could not run | Successful execution of those checks or independent verification of the verdict |
| E3 | A stored end-to-end result | A sampled run reports expected results without unexpected failures | Current production acceptance, all journeys, or sustained reliability |
| E4 | A stored numeric usage aggregate | Recorded model identifiers and estimated usage accounting | Invoice cost, complete coverage, or model superiority |
| E5 | Lessons and operating notes | Reported merge races, stale workspaces, misleading checks, and status drift | Measured frequency or proof that repairs eliminated recurrence |
| E6 | CI workflow definitions | Configured resource guards, timeouts, and runner checks | Current runner isolation, capacity, or successful CI execution |

Keep private provenance in the authorized source environment. Public lessons use these evidence classes. Do not publish raw reports, screenshots, client links, account details, or identifying combinations to make a lesson look better supported. Distinguish inspected configuration, recorded execution, operator report, and proposed practice.

## Six stages and exit evidence

The proposed sample sizes below are acceptance targets. They are not achieved measurements. Agree on a representative workload and observation window before testing; do not select only easy successes.

| Stage | Observed or reported | Not yet demonstrated | Human dependency | Next acceptance test |
| --- | --- | --- | --- | --- |
| 1. Portable bootstrap | Operator reports a harness established for projects; E1 shows reusable role and workflow definitions | Independent adoption from a clean environment | Select scope, credentials, commands, and delivery policy | A new operator boots a synthetic project, runs its checks, and recovers one failure using repository instructions alone |
| 2. Self-validating delivery | E1–E3 support configured loops and sampled validation; E5 records learning from failures | Sustained automatic delivery, complete documentation, and reliable status | Intent, risk decisions, exceptions, and production authorization | Ten consecutive representative changes retain revision-bound checks, review dispositions, documentation updates, status verification, and recovery evidence; record every intervention |
| 3. Reliable freshness | E5 reports drift and manual reconciliation | Durable repair across repository, tracker, documentation, and runtime | Resolve ambiguous authority and conflicting edits | Inject ten stale or reordered states; detect all within an agreed freshness budget, persist repairs, replay twice without duplicate writes, and escalate a real conflict without overwriting it |
| 4. Signal-driven intake | A desired next capability | Safe automatic intake and response across Slack, email, Sentry, and other sources | Approve source access, scope, priority, and consequential actions | Replay duplicate and reordered synthetic signals; create one work item per incident and exercise separate hotfix, backlog, and new-project routes |
| 5. Whole-system improvement | Local lessons exist; improvement remains bounded and manual | Measured autonomous improvement without weaker protections | Approve evaluation criteria and policy changes | Compare baseline and candidate on matched tasks; measure intervention minutes, escaped defects, compute, and learning time; reject regressions and demonstrate rollback |
| 6. Human understanding and transfer | Documentation and handoff patterns exist | Independent generalist and specialist takeover | Review understanding, ownership, and access | A generalist completes a change without the original operator; a specialist reproduces and resolves a seeded failure; both explain state, risk, and rollback |

Start human learning and handoff habits now. Stage 6 is the maturity goal, not a reason to postpone them until automation is complete.

## The Step 2 operating loop

1. Capture intent, acceptance behavior, accountable owner, allowed actions, and unresolved questions in a durable task record. Link the current specification.
2. Give one owner an isolated branch and workspace. Assign write ownership for files, shared runtime resources, and integration order before concurrent work starts.
3. Reproduce a defect or state the expected behavior. When a behavioral regression test is appropriate, retain the failing result before the fix and the passing result afterward. A documentation-only edit needs document checks, not artificial application tests.
4. Implement a bounded change. Use pinned tools and synthetic data. Keep external side effects inside the authorized scope.
5. Run relevant unit, contract, integration, end-to-end, and visual checks. Record inputs, revision, environment, exit status, and limitations. Choose checks for the changed risk; do not count empty suites as success.
6. Review the final diff with fresh context. Reproduce disputed findings. Fix valid findings, explain rejected findings with evidence, and preserve deferred risks with an owner. A clean agent verdict does not replace runtime acceptance.
7. Refresh evidence after changes. Before integration, verify the current head, base, required checks, open findings, holds, and merge order. Bind the action to the reviewed revision. A merged branch needs a new follow-up change, not a late push mistaken for delivery.
8. Exercise the deployed behavior within authorization. Record what actually serves the code. Update docs and tracker state, then read back the persisted result. Close only under the project's definition of done.

A coordinator owns dependencies and integration. An implementer owns the change. A reviewer checks the final diff. A validator checks behavior. A status worker performs bounded reconciliation. These are responsibilities; a small task need not create five agents. Delegate only when independent work benefits from separate context and clear ownership.

## Models, agents, and skills

The following values were read from local agent definitions at assessment time. They describe configuration, not current vendor availability or the model that executed every historical task. Effort is part of the configuration. Claude aliases do not identify an exact version.

| Role | Configured Codex identifier | Configured effort | Configured Claude alias |
| --- | --- | --- | --- |
| Search and bounded status monitoring | `gpt-6-luna` | low | `haiku` |
| Editing and evidence preparation | `gpt-5.6-terra` | medium | `sonnet` |
| Implementation and review | `gpt-6.1-sol` | high | `opus` |

E4 separately records `claude-opus-5-5` and `claude-sonnet-5-5`. These are identifiers in a stored aggregate, not independently verified provider execution logs. No inspected run evidence establishes the configured Codex routing in actual historical execution. Do not silently substitute a newer model name or infer an alias version.

For future comparisons, retain the requested and resolved model, effort, role, task class, harness version, outcome, retries, human minutes, token usage, and pricing basis. Mark missing billing as unknown. Account-backed access and API charges need separate accounting. Unknown prices must not receive a convenient substitute rate. A faster or smaller model is useful only if quality and intervention cost remain acceptable on comparable tasks.

Skills turn repeated work into discoverable procedures: intake, test execution, review response, evidence capture, status reconciliation, and handoff. Pin their source and revision; declare inputs, permissions, expected outputs, failure states, and validation. Check the installed snapshot before use. A skill file does not establish that it ran successfully. Promote repeated deterministic work into a tested command; keep judgment and exceptions explicit.

Use bounded briefs with goal, workspace, owned resources, evidence needed, next action, and stop conditions. Prefer a fresh brief when inherited context is stale or irrelevant. Preserve the decision record and unresolved risks across session changes; a compact summary must not erase constraints.

## What worked and what failed

| Lesson from the sample | Reusable practice | Remaining proof |
| --- | --- | --- |
| E2 records review scope and unexecuted checks explicitly | Report the limits beside the verdict | Re-run missing checks in a permitted environment |
| E3 provides machine-readable results | Retain raw results and summarize their exact scope | Tie results to the release revision and real user journey |
| E5 reports merges racing review fixes | Re-read remote state and require the reviewed head before merge | Fault-inject a late commit and confirm delivery stops |
| E5 reports an empty comparison that compared no useful inputs | Assert nonempty input scope and test a known difference | Confirm the negative control fails for the intended reason |
| E5 reports stale tools and served source | Record source revision, tool version, and served revision separately | Restart or reconcile safely and verify the running artifact |
| E5 reports tracker automation changing status | Fetch, compare, write conditionally, then verify persistence | Test competing updates, retries, and durable conflict escalation |
| E4 shows usage accounting exists | Measure context, retries, and estimated compute with coverage labels | Validate billing and compare matched periods before claiming savings |

## Runtime, CI, cost, and release boundaries

CI passing proves only the checks that ran. Runtime acceptance also needs the actual deployed revision, configuration, dependencies, and critical user behavior. A mocked UI test proves UI behavior against the mock. It does not prove the live API contract. Visual evidence must show the relevant before and after state and interactions, using synthetic data.

E6 shows configured runner controls. Before trusting a self-hosted runner, test isolation from secrets and other jobs, bounded CPU and memory, timeouts, cleanup, and cancellation. Keep untrusted contributions away from privileged runners. Record queue delay, execution time, retries, and runner cost separately from model cost. Define an evidence retention period, access policy, and expiry behavior. Retain enough revision-bound evidence to investigate and roll back; do not keep sensitive logs indefinitely.

Use the destination project's actual delivery policy. Permission to implement or integrate is not blanket permission to deploy or change access. Record release scope, immutable artifact, approval where required, health observation, rollback trigger, and rollback operator. Test rollback with a safe fixture before relying on it. Do not let a proposed harness improvement weaken tests, security boundaries, spending limits, or approvals to improve its success rate.

Session persistence is a separate acceptance problem. Saved terminal history, resume configuration, and registered hooks do not prove recovery. Checkpoint task state, revision, pending actions, and evidence. Interrupt a synthetic run, reopen it, verify state, and confirm that side effects do not repeat. Live reload and crash recovery remain unproven until that test passes.

## Reconciliation and signal intake design

Stage 3 needs a durable record of desired state, observed state, authority, revision, last successful check, freshness deadline, and owner. Separate detection from repair. Use idempotency keys and conditional writes; retain a retry ledger with bounded backoff. A process restart must preserve pending repairs. Conflicting human changes require escalation, not blind overwrite. Report stale or unknown state as such, rather than refreshing its timestamp without checking the source.

Stage 4 adds connectors only after access and scope are explicit. Treat incoming messages and attachments as untrusted data. Authenticate origin, minimize retained content, deduplicate by stable event and incident identity, and retain the evidence needed for triage. A signal is a candidate task, not authorization to execute instructions embedded in it.

Hotfixes require severity confirmation, incident ownership, bounded mitigation, deployment authorization, and rollback. Backlog work needs acceptance criteria and normal prioritization. New projects need scope, ownership, budget, architecture, and bootstrap review. Each route must handle duplicate delivery, cancellation, missing context, and human rejection. Measure false positives and missed actionable signals before enabling automatic response.

## Learning and takeover checklist

- Keep a short status view: current objective, deployed revision, verified behavior, pending work, stale information, risks, next decision, and accountable owner. Label unknown values.
- Produce change-triggered documentation proposals and periodic reconciliation. A generated report is not current until its claims match authoritative state.
- Keep a learning note for each significant change: why it exists, alternatives, code to review, a failed hypothesis, validation limits, and one lesson worth retaining.
- Give a new operator a repository map, runnable setup, synthetic fixture, architecture decisions, model and skill routing, access prerequisites, and escalation paths.
- Transfer ownership explicitly. Exercise cancellation, recovery, rollback, and one conflicting status update. Keep the original operator out of the first attempt and record help needed.
- Measure time to first validated change, intervention minutes, successful failure reproduction, stale-state rate, and time reserved for human learning. Faster delivery without understanding is not the goal.

## Related guides

Use [HARNESS.md](HARNESS.md) for architecture, [ADOPTION.md](ADOPTION.md) for bootstrap, [TESTING.md](TESTING.md) for validation, [CODE-REVIEW.md](CODE-REVIEW.md) for review, [RUNNERS.md](RUNNERS.md) for CI, [DEPLOY.md](DEPLOY.md) for release controls, [UPDATE.md](UPDATE.md) for freshness, and [HUMAN.md](HUMAN.md) for human attention. This assessment adds no external authoritative sources; it adds bounded observations and proposed acceptance tests.
