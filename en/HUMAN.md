# HUMAN

Optional Q&A for practical human-in-the-loop work with agents and automation.

## Q: What is the human responsible for?

The human owns intent, priorities, context, risk acceptance, ethical judgment, and final accountability. The agent may execute delegated work, but responsibility must remain explicit.

Some decisions need human judgment even when the agent can implement either choice. These include choosing whose needs take priority, accepting a known limitation, and deciding whether a delay is better than uncertainty. Name the person who can make that decision. A coordinator can organize the discussion, but cannot replace the accountable person's judgment merely because work is blocked.

## Q: What should the human provide before work starts?

Provide the problem, desired behavior, constraints, evidence required, safe scope, owner, deadline when real, and stop conditions. Link the source documents. Do not require the agent to infer hidden priorities.

Use the roles and task brief in [AGENT-TEAM.md](AGENT-TEAM.md) to record ownership and execution boundaries. Agree on which decisions the agent can make within that brief. Distinguish a preference, such as wording, from a constraint, such as excluding customer data. Explain conflicts between constraints before the agent starts.

## Q: What should the human receive during work?

Receive answer-first updates with current result, changed scope, evidence, risks, decisions, and next action. Prefer bounded summaries with recoverable artifacts.

Routine progress belongs in the task record or an agreed update. It tells the human what changed and what happens next, without demanding an answer. Interrupt when a decision blocks the next permitted step, changes the expected outcome, or becomes costly to defer. Say when an answer matters and what happens if it arrives later. Do not label ordinary progress urgent to get attention.

For a decision, ask one question that the named person can answer. Give the realistic options, your recommendation, and the consequence of each option. Include the evidence that would change the recommendation and any uncertainty that remains. State the work that can continue safely while the decision waits. Keep unrelated decisions separate so one unanswered question does not hold every task.

## Q: How can the human steer without constant supervision?

Use checkpoints. The agent can continue through reversible local work. It must pause for production changes, destructive actions, secret access, external messages, material scope changes, or unresolved risk.

Approval for secret access must name the secret class, target, purpose, and expiry. Silence does not approve secret access or reuse.

Use a handoff file or issue comment for decisions. The human can respond asynchronously. The agent should resume from recorded state.

Record what an approval covers: the proposed action, affected scope, conditions, and any time limit. Approval to explore an option does not approve delivery, spending, or a wider audience. A short answer can be sufficient when it clearly refers to one recorded proposal. If it could refer to several proposals, clarify before acting.

When a new fact changes the risk or scope, describe that change and ask whether the approval still applies. Do not repeatedly ask about unchanged work. Keep the decision beside the task evidence so a later session can understand what the person actually approved.

## Q: What happens when priorities change or work is cancelled?

Treat a changed priority as a new instruction, not as an obstacle to finishing the old plan. Confirm what stops now, what remains useful, and whether another person depends on the unfinished work. Tell the coordinator which commitments or dates need revision.

Stop new work within the cancelled scope. If an action is already running, check whether stopping it is safe before interrupting it. Record any result whose outcome is uncertain. Preserve recoverable work and evidence unless the owner requests authorized cleanup. Name the cleanup owner and any remaining cost or process. Cancellation does not authorize deleting shared work or reversing an external action.

## Q: How should editor integration work?

The editor should expose repository tasks, current issue, changed files, tests, diagnostics, and links to evidence. It should not hide command output or silently run external actions.

Offer quick actions for mise tasks, but keep approval and scope visible. Allow a person to open the full command, stop it, inspect the artifact, and rerun it.

## Q: What if the human is unavailable?

The agent should finish safe bounded work, record a handoff, and stop at the next approval boundary. It should not invent approval from silence.

Use Herdr or another persistent runner for long local or remote work. Keep the human interface asynchronous.

The Rex server and its clients offer another option for persistent work. A disconnected client does not prove that the server-side task stopped. Record the host, session, and task identity in the handoff, without exposing credentials. Before restarting or resending work, inspect the current task state on that host. If the task finished, recover its result instead of starting a duplicate. If the outcome remains uncertain, investigate before sending the work again.

Agree in advance on a backup decision-maker when a real deadline requires one. The backup needs authority for this decision, not just availability. Send the same question and evidence through the agreed route. If no authorized person can answer, state the resulting delay and leave the blocked step untouched. A deadline can justify an interruption, but cannot create permission. Record when the task should next receive attention without repeatedly notifying the owner.

## Q: What should be checked before work resumes?

Read the latest decision and discussion before following the saved next step. Use the handoff requirements in [AGENT-TEAM.md](AGENT-TEAM.md) to check the recorded work against the current state. Confirm that the owner, goal, permitted actions, and pending question still apply. Check whether another person changed the work or completed the blocked step.

Treat old evidence as evidence about its recorded state. If the inputs, environment, or proposed action changed, check the affected assumptions again. Summarize the difference before asking for a renewed decision. Do not turn an old approval into permission for a different action. When nothing relevant changed, resume the recorded safe step without requesting the same approval again.

## Q: What does a useful handoff and restart look like?

Consider an invented reporting task. A blank date range currently selects all records, and the team has not agreed whether that behavior is appropriate. The agent can reproduce it locally, but has not checked the shared environment. A handoff could say:

- Decision needed before implementation: Should exporting require a date range, or should all dates remain available with explicit confirmation?
- I recommend requiring a date range. It adds a selection step, but reduces accidental exports of older records. Keeping all dates helps people who need complete reports, but requires a clear warning and may create larger exports.
- The task record links the reproduction, changed files, and draft scenarios to the current revision. We still need the owner's judgment about which reporting need takes priority.
- While this waits, I can prepare synthetic fixtures and draft the explanatory text. I will not change export behavior or publish anything.

Suppose the owner approves requiring a range for this task. Record that choice and its scope before resuming. On restart, read the latest discussion and inspect the current work. If another person already added range validation, reconcile that change rather than implement it twice. If the reporting requirement changed, bring that fact back to the owner. Otherwise, continue within the approved scope and report the result with current evidence. The approval does not extend to publishing the report or changing other export paths.

## Q: How do we protect human attention?

Use quiet hours, notification budgets, one clear question per handoff, compact output, grouped updates, and explicit urgency levels. Never use repeated notifications to force a response.

## Q: How do we know the human-in-the-loop works?

Check whether people can understand the state, override the agent, recover work, and make decisions without opening every log. Measure reduced interruption and improved evidence, not constant human presence.

## Q: How should humans share AI-assisted work?

Read, verify, distill, and disclose AI assistance when it affects trust or review. Share the answer and evidence first. Link large artifacts instead of pasting raw model output into a conversation.

Use [COMMUNICATION.md](COMMUNICATION.md) for the team sharing contract and [NOTES.md](NOTES.md) for recording and note-taking requirements.

## References

- [Human-in-the-loop software development agents](https://arxiv.org/abs/2411.12924)
- [OpenAI harness engineering](https://openai.com/index/harness-engineering/)
- [OpenAI Symphony](https://openai.com/index/open-source-codex-orchestration-symphony/)
