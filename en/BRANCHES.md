# BRANCHES

This guide defines branch names and branch flow for people and agents.

## Q: What branch name should we use?

Use this form:

```text
<type>/<issue>-<short-title>
```

Examples:

```text
feature/PROJ-625-bilingual-sdlc-tooling
fix/PROJ-742-runner-timeout
docs/PROJ-810-update-release-guide
```

Use the project issue identifier first. Use lowercase kebab case for the short title.

Do not add an identity segment unless repository policy requires one. Do not invent an undocumented namespace.

The Linear issue, pull request, and commit metadata record ownership. The branch name records the work.

## Q: Which branch types are valid?

Use one of these branch types:

- `feature` for new behavior;
- `fix` for a defect correction;
- `docs` for documentation-only work;
- `refactor` for an internal change without behavior changes;
- `test` for test-only work;
- `build` for build-system or dependency work;
- `ci` for CI configuration;
- `chore` for bounded maintenance;
- `perf` for measured performance work;
- `revert` for a revert.

Use `feature` in branch names. Use `feat` in Conventional Commit messages.

## Q: How should the short title be written?

- Describe one outcome.
- Use stable product terms.
- Remove names, credentials, customer data, and confidential details.
- Keep the title concise enough for terminals and CI logs.
- Do not repeat the branch type.
- Do not add dates unless the date identifies the work.

Good:

```text
feature/PROJ-625-bilingual-sdlc-tooling
```

Avoid:

```text
feature/add-new-stuff
fix/urgent-fix
feature/PROJ-625-feature-for-bilingual-sdlc-tooling
```

## Q: Who can use the same naming form?

People and agents use the repository form. Repository policy can reserve a namespace for automated agents.

One owner controls each branch and worktree. Other contributors use a separate worktree or review the pull request.

## Q: Where should a branch start?

Start independent work from the current default branch. Fetch it before creating the branch.

Create a dependent branch from its direct parent only when the work forms a real stack.

Record the parent branch and stack order in each related issue and pull request.

## Q: How should stacked branches work?

Use one issue, branch, worktree, and pull request for each layer.

Use this shape:

```text
main <- feature/PROJ-100-foundation <- feature/PROJ-101-dependent-change
```

Base each pull request on its direct parent. Review only the diff against that parent.

Rebase children after their parent changes. Use `--force-with-lease` only after owner coordination.

Do not place unrelated work in a stack.

## Q: When should a branch be renamed?

Rename a local branch before publication when its issue, type, or outcome is wrong.

Coordinate before renaming a published branch. Update its pull request, worktree record, and automation references together.

Do not rename a branch only to add a contributor identity.

## Q: When is a branch complete?

A branch is ready for review when:

- its issue describes the delivered outcome;
- its commits are semantic and atomic;
- required tests and checks pass;
- the pull request lists limits and evidence;
- no unrelated change remains.

Delete the remote branch after merge when no active stack depends on it.

## References

- [GitHub branch documentation](https://docs.github.com/en/get-started/using-git/about-branches)
- [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)
- [COMMITS.md](COMMITS.md)
- [LINEAR.md](LINEAR.md)
- [HERDR.md](HERDR.md)
