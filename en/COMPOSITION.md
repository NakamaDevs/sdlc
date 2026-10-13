# COMPOSITION

This is a sample operating system for a team. It is not a mandatory company policy.
Fork or copy the generic starter, then adapt it to the team's actual work.
Keep its Python reference tools independent from the languages used by applications.

## Separate the layers

| Layer | Location in the generated root | Authority |
| --- | --- | --- |
| Shared principles | Referenced SDLC guides | Reusable guidance, selected by the team |
| Team decisions | policies/team.md | Accountable team owners |
| Tool selection | adapters/README.md | Approved local implementation and configuration |
| Repository facts | docs/repositories/ | Verified source and child instructions |
| Task scope | docs/work/ | Current accepted outcome and explicit permissions |
| Local state | Ignored state and local configuration | One machine or runtime instance |

Resolve a conflict explicitly. Record the existing rule, proposed change, reason, owner, and acceptance evidence.
Keep child repository constraints authoritative within their scope. A template does not override an employer or upstream project.
When adopting a changed rule, update its authoritative file and its pointers. Avoid competing copies.

## Capability choices

| Capability | Sample option | Valid alternatives |
| --- | --- | --- |
| Task tracking | Local Markdown task record | GitHub Issues, GitLab, Linear, another tracker |
| Source hosting | Git with a verified remote | GitHub, GitLab, self-hosted Git, offline Git |
| Task execution | Python command adapter | mise, existing scripts, approved build runner |
| Persistent terminal | Existing shell | Herdr, tmux, Zellij, managed remote workspace |
| Private access | SSH through an approved private network | Tailscale, WireGuard, corporate VPN, controlled bastion |
| Orchestration | Explicit process commands | Aspire, containers, existing development supervisor |
| Infrastructure | Local synthetic environment | AWS, Azure, GCP, private cloud, bare metal |
| Documentation | Markdown | Zensical, Bunko with access, another local reader |
| Review | Git diff and independent review | Bunko Review, another approved diff viewer |
| Agents | Portable role briefs | Codex, Claude Code, another approved runtime |

Each adapter states inputs, outputs, permissions, version, effects, failure behavior, and validation command.
A missing optional adapter must not block document discovery. A missing required capability must remain a visible gap.
No sample installs a cloud account, tracker connection, VPN policy, or native agent configuration automatically.

## Customize through discovery

1. Inventory the current workflow with each role. Record what works and what causes delay or risk.
2. Map existing commands and systems to the capability table. Retain working tools unless evidence supports replacement.
3. Write a current-state and proposed-state comparison. Include migration effort, access, costs, and reversibility.
4. Let the relevant owners choose the smallest pilot. Record accepted deviations in the team policy.
5. Implement one adapter and test its success, failure, cancellation, and denied-access behavior.
6. Complete a course exercise with a newcomer. Compare actual results with the previous workflow.
7. Adopt, revise, or remove the change. Keep rollback instructions and update the onboarding page.

## Policy decisions to fill

Choose task identifiers, branch naming, review gates, evidence retention, notifications, release authority, and working hours.
Name who can approve product rules, credentials, external messages, paid calls, and production changes.
Choose where skills live and who reviews upgrades. Record model selection as a local capability decision.
Use [AGENT-TEAM.md](AGENT-TEAM.md) for roles and [REMOTE-ACCESS.md](REMOTE-ACCESS.md) for remote boundaries.

## Sample task

The generated policies directory contains a tracker-neutral task template.
Use it as a GitHub issue body, another tracker entry, or a local work record.
Keep outcome, owner, scope, acceptance scenarios, evidence, and remaining risk regardless of the tracker.
Do not copy sample identifiers as real tasks or report unexecuted checks as passed.

## Implementation direction

Python is the reference implementation for the new starter and local evidence tools.
The existing SDLC reader and validation use Elixir. Keep those working during incremental adoption.
The existing Bunko application also includes browser and orchestration dependencies. A Python wrapper does not remove those dependencies.
Future Elixir, TypeScript, Go, Swift, or Dart adapters must implement the same capability contract and acceptance exercises.
Do not maintain several implementations until a real consumer requires them.
