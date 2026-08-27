# SDLC repository agent guide

This repository is the reviewable source for the English and Spanish SDLC guides.

Kaicho defines required NakamaDevs policy. This file defines repository-specific work.

## Work tracking and isolation

- Use team `NAK` and project `SDLC` in Linear.
- Create or locate an issue before a repository change.
- Use one issue, branch, Herdr worktree, owner, and pull request for each reviewable change.
- Follow the workspace branch policy. Automated agents use the reserved `cx` namespace.
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
4. Let the configured initial Codex review run.
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

Pass this identity for repository commits:

```text
SDLC Maintainers <maintainers@example.org>
```

Publish both public Gists only after `mise run verify` passes. Keep the repository as the canonical source.
