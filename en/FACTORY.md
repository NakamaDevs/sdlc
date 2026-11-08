# FACTORY

Optional Q&A for a small team that runs a software factory with agents and people.

## Q: What is a software factory for a small team?

A software factory is a repeatable production line for software changes. Agents run the loop: specification, implementation, verification, and review. People own intent, priorities, and merge decisions.

The issue tracker is the queue. Each unit of work gets one issue and one isolated workspace. Work that is not in the queue does not exist for the factory.

## Q: Which roles exist?

Each role reads a bounded set of inputs and writes a bounded set of outputs. The last column names the action the role must never take.

| Role | Reads | Writes | Must not |
|---|---|---|---|
| Owner | The daily brief | Decisions, priorities, merge approvals | Carry the queue in memory |
| Director agent | Every project, repository, cycle, brief, and research note | The daily brief, delegations as issues, mission and portfolio files | Merge, release, deploy, or spend |
| Program manager agent | One cycle, its projects, and its pull requests | Cycle goal proposals, stuck-work flags, issue reassignments | Change policy |
| Quality and process engineer agent | CI runs, test coverage, policy friction, runner health | Gap issues, policy proposals, loss records | Weaken a check |
| Delivery automation manager agent | Repeated manual steps, standups, status checks | Automation proposals, deterministic tool issues | Replace a tool with a model call |
| Allowance manager agent | Subscription usage and reset configuration | Allowance report, throttling advice | Store credentials |
| Investigator agent | External sources | Research notes | Change code |
| Developer agent | One issue and one workspace | Code, tests, and one pull request | Touch another workspace |

The Director agent reports to the owner. The manager agents and the Investigator agent report to the Director agent. A Developer agent reports to one manager agent.

## Q: What does the owner receive?

The owner receives one brief. The brief has exactly four sections: Decided, Needs your decision, Moving, Blocked.

The brief asks for at most three decisions. A fourth decision waits for the next brief.

A deterministic tool produces the brief content. The tool reads the tracker, the repositories, and the runners. An agent adds the explanation. The agent does not change the counts.

## Q: Which two cadences apply?

Agents run on demand and daily. An agent reads the tool output before it reasons. It does not reason about state it has not read.

People receive one brief per day. A cycle has at most three written goals. Quiet hours apply. No agent sends a notification during quiet hours.

## Q: How does the factory count loss?

A factory counts a stopped line as loss. The status tool counts five kinds of loss:

- Idle work-in-progress: a started item with no owner, or with no update in 14 days.
- Stale change: an open pull request with no update in 21 days.
- Blocked line: an item that waits on a blocker that nobody has started.
- Capacity loss: a runner lane that is offline.
- Allowance loss: a subscription window that resets with unused capacity.

Each count appears in the daily brief with a link to the list. A count that increases in two consecutive briefs needs a decision.

## Q: Why deterministic tools before model calls?

A deterministic tool costs less than a model call. It gives the same result for the same input. A test can check it.

A model summarizes tool output. It does not fetch state. When an agent needs a fact, it runs the tool and reads the result.

Record a repeated manual query as a tool request. The Delivery automation manager agent owns that request.

## Q: How does an agent delegate?

Use one issue, one owner, one workspace, and one pull request. A delegation that breaks this rule is not a delegation.

The delegating agent records the decision in the issue: the goal, the boundary, the stop condition, and the expected evidence. The receiving agent reports through the tracker. It does not report through chat.

The delegating agent reads the report before it acts on it. A report is a claim until the evidence is verified.

## Q: How do we keep the factory visible?

Each agent runs in one terminal session. A person can read that session from any machine. The session log is the audit record.

Keep an inventory of agents, sessions, and conversations. The inventory names the owner, the issue, the workspace, and the start time of each entry. An agent without an inventory entry does not run.

Use [HERDR.md](HERDR.md) for persistent sessions and [WORKSPACES.md](WORKSPACES.md) for workspace isolation.

## Q: How does the factory start?

Adopt the factory in this order. Do not skip a step.

1. Audit the current state: projects, issues, pull requests, runners, and agents.
2. Write the mission and the portfolio map. Name what the team builds and what it stops.
3. Build the deterministic status tool. Make it count the five kinds of loss.
4. Start the Director agent. Give it the brief format and the tool output.
5. Start the manager agents one at a time. Confirm each one during one cycle.
6. Start the Allowance manager agent. Record each reset window.
7. Restructure teams, projects, and cycles from the evidence. Do not restructure first.

## References

- [OpenAI harness engineering](https://openai.com/index/harness-engineering/)
- [OpenAI Symphony repository](https://github.com/openai/symphony)
- [Agentic Project Manager](https://arxiv.org/abs/2601.16392)
