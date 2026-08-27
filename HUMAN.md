# human

Optional Q&A for practical human-in-the-loop work with agents and automation.

## Q: What is the human responsible for?

The human owns intent, priorities, context, risk acceptance, ethical judgment, and final accountability. The agent may execute delegated work, but responsibility must remain explicit.

## Q: What should the human provide before work starts?

Provide the problem, desired behavior, constraints, evidence required, safe scope, owner, deadline when real, and stop conditions. Link the source documents. Do not require the agent to infer hidden priorities.

## Q: What should the human receive during work?

Receive answer-first updates with current result, changed scope, evidence, risks, decisions, and next action. Prefer bounded summaries with recoverable artifacts.

## Q: How can the human steer without constant supervision?

Use checkpoints. The agent can continue through reversible local work. It must pause for production changes, destructive actions, secret access, external messages, material scope changes, or unresolved risk.

Use a handoff file or issue comment for decisions. The human can respond asynchronously. The agent should resume from recorded state.

## Q: How should editor integration work?

The editor should expose repository tasks, current issue, changed files, tests, diagnostics, and links to evidence. It should not hide command output or silently run external actions.

Offer quick actions for mise tasks, but keep approval and scope visible. Allow a person to open the full command, stop it, inspect the artifact, and rerun it.

## Q: What if the human is unavailable?

The agent should finish safe bounded work, record a handoff, and stop at the next approval boundary. It should not invent approval from silence.

Use Herdr or another persistent runner for long local or remote work. Keep the human interface asynchronous.

## Q: How do we protect human attention?

Use quiet hours, notification budgets, one clear question per handoff, compact output, grouped updates, and explicit urgency levels. Never use repeated notifications to force a response.

## Q: How do we know the human-in-the-loop works?

Check whether people can understand the state, override the agent, recover work, and make decisions without opening every log. Measure reduced interruption and improved evidence, not constant human presence.

## References

- [Human-in-the-loop software development agents](https://arxiv.org/abs/2411.12924)
- [OpenAI harness engineering](https://openai.com/index/harness-engineering/)
- [OpenAI Symphony](https://openai.com/index/open-source-codex-orchestration-symphony/)
