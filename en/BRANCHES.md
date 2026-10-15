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

Do not add an identity segment or agent namespace.

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

People and agents use the same repository form.

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

## Q: How should a repository migrate old branch names?

List each old branch that has an open pull request before you enable the new
checker. Use an exact, temporary allowlist such as `LEGACY_BRANCH_ALLOWLIST`.
The local hooks and CI must accept only the listed names. They must reject new
branches that use the old form.

Remove each entry after its pull request closes. Keep the allowlist empty when
no open branch needs it. Do not rename or rewrite a published branch only to
complete this migration.

## Q: When is a branch complete?

A branch is ready for review when:

- its issue describes the delivered outcome;
- its commits are semantic and atomic;
- required tests and checks pass;
- the pull request lists limits and evidence;
- no unrelated change remains.

Delete the remote branch after its final target merge when no active stack or pending release depends on it. For selective integration, a merge into `dev` is not the final target.

## Optional topic-branch/selective integration workflow

Adopt this alternative only through an explicit team decision. It does not replace the repository's default delivery policy. Use it when several workstreams share a DEV environment but must release independently. A workstream groups related tickets for one outcome or milestone; a small standalone feature can serve as the same release unit.

This is a topic-branch/selective integration workflow. It is not strict trunk-based development: `main` does not continuously integrate all ongoing work. The Git workflow reference explains topic promotion; the trunk-based reference explains the different continuous integration model. The rules below are this guide's proposed adaptation.

### Branches and promotion

Create each workstream from current `main`, never from `dev`. Create ticket branches from their workstream and merge them back into that workstream. Start a standalone feature from `main`. Use matching workstream and release branch names across all backend and frontend repositories involved; SHAs remain repository-specific.

The diagram uses illustrative names. Teams must approve branch names and update their naming checks before adopting new prefixes.

```text
main -> workstream/catalog -> ticket A, ticket B -> workstream/catalog @ S
                                                   |                 |
                                                   v                 v
                                                  dev        release/v1.2 <- main
                                                   |                 |
                                              automatic DEV     batch validation
                                                   |                 |
                                              acceptance of S ------>|
                                                                     v
main <------------------------------------------------------ human approval
  |
  v
CI + immutable tag -> backend -> dependent frontend

Alternative: accepted whole workstream @ S -> human approval -> main
Forbidden: dev -> source, release, or main
```

1. Merge the workstream or feature into `dev`. The configured pipeline must deploy it automatically to DEV. A merge alone does not prove deployment.
2. Accept behavior explicitly at tested revisions. Record each repository's full source SHA, deployed DEV merge SHA, artifact digest, environment, configuration and flag state, tests, reviewer, and result. A branch name is not immutable evidence.
3. Create a release batch from current `main`, for example `release/v1.2`. Merge the SAME accepted source revision into it. Do not merge `dev` into the batch or `main`. Check that the source branch still points to the accepted SHA; if it has advanced, retain the accepted revision or obtain new acceptance before promotion.
4. Include only accepted workstreams or features and their accepted dependencies. If only part of a workstream is accepted, split the release unit from `main` and repeat DEV acceptance. Do not release the whole workstream on partial evidence.
5. Validate the composed batch, then obtain human release approval before merging into `main`. A wholly accepted workstream can go directly to `main` with human approval and validation of the final composition; a batch is optional.
6. Release the approved `main` revision through CI and an immutable tag. Deploy the backend before a dependent frontend and verify compatibility during the interval. Record actual deployment and live verification separately from merge and acceptance.

### Conflicts, fixes, and composition

Retain accepted source revisions and DEV evidence until release verification is complete. Do not rebase or squash a source already used for acceptance without treating the rewritten result as a new candidate.

Fix defects on the source branch, merge it into DEV again, and repeat affected acceptance. A conflict resolution made only on `dev` is not part of the source candidate. Reproduce the required fix on the source without merging `dev` back. Never carry unrelated or unaccepted code from a DEV conflict resolution into a release.

Review the complete diff and ancestry against `main`, including conflict resolutions. Validate contracts, cross-repository dependency order, lockfiles, data compatibility, and the complete migration graph for the selected batch. Check migration ordering, duplicate heads, omitted dependencies, and upgrade from the deployed production schema. Test the rollback or forward-recovery plan. Passing tests for each separate workstream does not prove that the batch works.

If a release conflict or a new `main` revision changes behavior, put the required fix in the source, repeat DEV acceptance, and rebuild and validate the batch. Record the final batch SHA and resulting `main` SHA. Do not assume that DEV acceptance covers a different composed tree.

### Flags and activation

Keep these states separate:

| State | Required evidence or control |
| --- | --- |
| Code deployed OFF | Deployment identity; safe default; OFF tests; behavior remains disabled. |
| Accepted behavior | ON tests and explicit acceptance at source and deployed SHAs with the tested configuration. |
| Release-time activation | Infrastructure or build configuration enablement is a separately reviewed change and release; rebuild and deploy when required. |
| Runtime activation | An authorized operator uses audited controls; record actor, time, cohort, value, and rollback. |

For each flag, record its default, target cohort, owner, expiry or removal condition, and rollback procedure. Test OFF and ON, including transitions where relevant. Confirm configuration parity between DEV and the release target. A build-time value cannot be changed safely by pretending it is a runtime control.

Flags do not neutralize migrations, background jobs, authorization failures, security risks, or other side effects. Disabled code must still be safe to deploy. Turning a flag OFF does not reverse schema or data changes; provide a separate recovery plan.

### Adoption and automation gaps

Before adoption, name an owner for branch policy, DEV deployment, acceptance records, release approval, migration checks, and flag controls. Define how concurrent DEV deployments retain usable evidence and how release dependencies are selected.

This guide documents a process; it does not install enforcement. The current SDLC repository has local documentation, privacy, identity, and delivery checks, but no checked-in GitHub Actions workflows for this promotion path. Its branch checker does not accept the illustrative `workstream/` or `release/` prefixes. Repository owners must configure and test naming rules, branch protection, DEV deployment, SHA and artifact recording, promotion checks, approval gates, and audited flag controls. Verify remote settings separately; documentation is not evidence that those controls exist.

Use [DEPLOY.md](DEPLOY.md) for release artifacts and publication controls.

## References

- [GitHub branch documentation](https://docs.github.com/en/get-started/using-git/about-branches)
- [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)
- [COMMITS.md](COMMITS.md)
- [LINEAR.md](LINEAR.md)
- [HERDR.md](HERDR.md)

- [Git workflows](https://git-scm.com/docs/gitworkflows)
- [Trunk Based Development](https://trunkbaseddevelopment.com/)
