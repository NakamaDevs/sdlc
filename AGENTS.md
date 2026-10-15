<!-- kaicho-delivery-v2.1 -->
## NakamaDevs delivery policy — v2.1

Use [.nakama/kaicho/delivery-profiles.md](.nakama/kaicho/delivery-profiles.md)
and [.nakama/delivery.json](.nakama/delivery.json). This owner-approved policy
replaces older PR, approval, branch-namespace and delivery-gate requirements
for the routes it defines, including instructions elsewhere in this repository.
Repository mode: **solo**. Solo work may commit and push directly to the
default branch without a PR. Collaborative work retains normal CI/CD and approvals;
explicit owner override and scoped agent delivery remain available.
Every delivered commit includes `Refs TEAM-123` or `Fixes TEAM-123` in its body.
Verify the real Linear issue and project through the connected integration.
After push, verify the link or attach the immutable commit URL to Linear.
Never rewrite published history merely to add tracking metadata.
Keep existing published branches and other contributors' work. New branches use
`type/TEAM-123-description`; no username or agent namespace. Run focused checks
and record actual results. Never claim skipped CI passed. Do not create a PR
solely for policy adoption. Keep application, secret, runner and deployment
controls except for a specifically authorized owner override.
Run `python3 .nakama/kaicho_delivery.py self-test` for delivery checks.
Install the repository's configured hooks (for example `prek install --hook-type commit-msg`).
Pinned source: Kaicho `91ec23b858c2d6aa74a987901592c7493259e89d`. Tracking: NAK-946.
The local mirror removes personal account identifiers under NAK-1044; its hashes
record the sanitized local content. The external source revision is unchanged.
<!-- /kaicho-delivery-v2.1 -->

# SDLC repository agent guide

This repository is the reviewable source for the English and Spanish SDLC guides.

Kaicho defines required NakamaDevs policy. This file defines repository-specific work.

## Work tracking and isolation

- Use team `NAK` and project `SDLC` in Linear.
- Create or locate an issue before a repository change.
- Use one issue, branch, Herdr worktree, owner, and pull request for each reviewable change.
- Use `<type>/NAK-123-short-description` for every new branch.
- Do not add usernames, initials, tool names, or agent namespaces to branch names.
- Record stack parents in Linear and each pull request.

## Documentation contract

- Keep matching maintained files in `en/` and `es/`.
- Preserve heading levels, guide links, external URL order, code blocks, technical literals, lists, and tables.
- Use Simplified Technical English for English text.
- Use Simplified Technical Spanish for Spanish text.
- Keep commands, paths, versions, identifiers, and error text exact.
- Keep generic Gist files independent from private organization access.
- Put NakamaDevs policy, teams, accounts, skills, and stack preferences in `NAKAMADEVS.md`.
- Keep `NAKAMADEVS.md` as the final optional Gist file.
- Update `REFERENCES.md` when a guide adds or removes an authoritative source.

## Local validation

Run focused checks during work. Run the complete gate before push:

```sh
mise run verify
```

The export tasks must create both reading editions under `_build/gists/`.

## Code review with Codex

Use [CODE-REVIEW.md](en/CODE-REVIEW.md) and the repository-local `resolve-pr-review-threads` skill.

1. Keep incomplete work in a draft pull request.
2. Run focused checks and self-review the complete diff.
3. Move the pull request to ready for review.
4. Let the configured initial Codex review run. If none starts, post `@codex review` once.
5. Classify every finding as `valid`, `invalid`, `unclear`, or `superseded`.
6. Fix valid findings with focused evidence. Reject invalid findings only with evidence.
7. Commit and push each coherent review response.
8. Reply in the same inline thread with status, accuracy, change, evidence, limit, commit link, and stable code link.
9. Resolve complete `fixed`, `rejected`, and `superseded` threads.
10. Leave `accepted` and `blocked` threads open. Tag a person only for a real external blocker.
11. Verify CI, conflicts, base currency, approvals, and unresolved threads.
12. Use `@codex review` when the updated pull request needs another review pass.

Do not resolve a thread before the evidence and fix are available on the remote branch.

## Commits and publication

Use semantic and atomic Conventional Commits.

For this repository, use `SDLC Maintainers <maintainers@example.org>` for Git
author and committer metadata. This is an owner-approved privacy identity, not
a claim about an individual contributor. Keep individual accountability in the
private tracker and access audit. Run `mise run check:identity` before delivery;
use `python3 scripts/check_identity_history.py --all` for a complete local-ref audit.
Do not merge old local history after the privacy rewrite. Re-clone or reapply
reviewed patches so removed identifiers cannot return.

Use the approved role identity for commits. Keep any personal name, email,
account identifier, or access credential in private configuration and audits.

Publish both public Gists only after `mise run verify` passes. Keep the repository as the canonical source.
