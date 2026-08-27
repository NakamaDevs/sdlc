# CHANGELOG

This guide defines how a project turns reviewed changes into useful changelog and release records.

## Q: What is a changelog for?

A changelog gives people a curated record of notable changes for each released version.

It does not copy the complete Git log. The Git history preserves implementation detail. The changelog explains user and operator impact.

Keep an `Unreleased` section. Move reviewed entries into a dated version section during release preparation.

Use these standard sections when they contain entries:

- `Added` for new behavior;
- `Changed` for changed behavior;
- `Deprecated` for behavior that will be removed;
- `Removed` for removed behavior;
- `Fixed` for corrected behavior;
- `Security` for security corrections and advisories.

## Q: Which records should provide changelog input?

Use reviewed records in this order:

1. an approved change fragment or release-note field;
2. the merged pull request title and description;
3. the semantic merge or squash commit;
4. the atomic commits inside the pull request;
5. the issue, tests, migration guide, and security advisory.

Automation can collect these records. A release owner must still check meaning, audience, duplication, and security limits.

## Q: How should Conventional Commits describe a change?

Use a stable type, an optional scope, and a direct summary.

```text
feat(auth): add passkey sign-in
fix(auth): prevent lockout after 15 minutes
feat(api)!: remove the legacy token endpoint
```

The scope names the affected module or product area. Use stable names such as `auth`, `billing`, `reader`, or `api`.

Use `feat` for new compatible behavior. Use `fix` for corrected behavior.

Use `!` or a `BREAKING CHANGE:` footer for an incompatible public contract change.

Other types can inform internal history. They do not select a Semantic Versioning bump unless they declare a breaking change.

## Q: Why can merge commits drive the changelog?

A merge commit can represent one reviewed pull request on the first-parent history of the release branch.

This model preserves two useful views:

- the first-parent history shows reviewed changes in delivery order;
- the merged branch preserves atomic implementation commits when they remain useful.

Use a semantic pull request title. Configure the merge commit title from that reviewed title.

The merge body should link the pull request, issue, evidence, and migration note. Do not place secrets or private customer data there.

Read release candidates from the previous tag through the release head with `git log --first-parent`.

Do not publish the raw output as the changelog. Parse it, enrich it with pull request data, and review the result.

## Q: When is a complete commit history useful?

Keep the complete branch history when its commits are independently useful and pass the required checks.

It helps when:

- reviewers need separate design, migration, test, or generated-output steps;
- `git bisect` can identify a smaller regression boundary;
- one part can be reverted without reverting the complete pull request;
- multiple authors contributed distinct reviewed units;
- a stack needs stable parent and child boundaries;
- an audit requires the implementation sequence.

Do not preserve fixup noise only because it exists. Clean private branch history before publication when policy permits it.

## Q: When does squash merge make sense?

Use squash merge when the pull request is one logical change and its internal commits have no lasting value.

It is useful when:

- the branch contains fixups, review corrections, or temporary checkpoints;
- intermediate commits do not pass independently;
- casual contributors should not need perfect commit messages;
- the release tool expects one Conventional Commit for each pull request.

The squash title must use the semantic form. The squash body must preserve authorship, issue links, and breaking-change details.

Squash changes commit identities. It also removes the original branch boundaries from the target branch.

Do not squash a stack before checking how the new commit identities affect dependent pull requests.

## Q: When does rebase merge make sense?

Use rebase merge when every branch commit is atomic, semantic, ordered, and valid on the target branch.

It is useful when the project requires a linear history and each commit provides a useful release or debugging boundary.

Rebase merge does not preserve an explicit pull request merge commit. GitHub also creates new commit identities during this operation.

Do not use rebase merge when the changelog parser expects one merge commit for each reviewed change.

## Q: What history model is the recommended default?

Prefer this hybrid model unless repository evidence supports another model:

1. keep semantic and atomic commits on the branch;
2. use a semantic pull request title;
3. merge with a merge commit on the release branch;
4. use first-parent merge commits as changelog boundaries;
5. retain branch commits for diagnosis, audit, and selective reverts;
6. curate the generated release record before publication.

This model keeps review boundaries without discarding useful implementation history.

Use squash when branch commits are not durable records. Use rebase when each commit must become a first-class target-branch record.

Document the selected merge method in repository policy. Configure only supported methods in the Git host.

## Q: How should changes map to Semantic Versioning?

Apply the highest required bump across all included public changes:

- `MAJOR` for an incompatible public API or operational contract change;
- `MINOR` for compatible new public behavior or a new deprecation;
- `PATCH` for compatible corrections;
- no release for changes that do not change a released component.

Version `0.y.z` indicates initial development under Semantic Versioning. Define the project policy for breaking changes before `1.0.0`.

Do not calculate a version from commit type alone. Confirm the declared public API and actual compatibility impact.

For multiple packages, calculate each package version from its affected public contract. Record dependency-driven bumps separately.

## Q: How should commit types map to changelog sections?

Use this default mapping, then curate the result:

| Input | Default section | Default bump | Include when |
|---|---|---|---|
| `feat` | `Added` | `MINOR` | Users receive compatible new behavior. |
| `fix` | `Fixed` | `PATCH` | Users receive corrected behavior. |
| any breaking change | `Changed` or `Removed` | `MAJOR` | Users must migrate. |
| `perf` | `Changed` | project decision | The measured change affects users or operators. |
| `security` label or advisory | `Security` | impact decision | Publication does not expose an uncorrected weakness. |
| `docs`, `test`, `ci`, `build`, `chore` | omitted by default | none | Include only direct user or operator impact. |
| `revert` | reverse the original entry | impact decision | The release no longer contains the original change. |

A type is an automation signal. It is not a substitute for review.

## Q: What should each release entry contain?

Each notable entry should contain:

- a short user-focused result;
- the affected scope or component;
- the pull request or issue link;
- a migration link for breaking changes;
- a security advisory link when disclosure is safe;
- a contributor credit when policy permits it.

Each version section should contain:

- the exact version and release date;
- the source tag and full source commit;
- a comparison link to the previous release;
- known limits, deprecations, and migration requirements;
- artifact, provenance, and deployment links when applicable.

## Q: What is the repeatable generation workflow?

Use one deterministic task locally and in CI:

1. identify the previous release tag and target source commit;
2. collect reviewed change boundaries for the selected history model;
3. parse Conventional Commit types, scopes, breaking changes, and reverts;
4. join pull request, issue, label, contributor, and change-fragment data;
5. reject malformed or ambiguous release inputs;
6. calculate the proposed version for each release component;
7. render the `Unreleased` section or release candidate;
8. let a release owner edit user-facing text and migration details;
9. verify links, version files, package metadata, and comparison ranges;
10. commit the reviewed changelog and version update in a release pull request.

The release task must produce the same candidate from the same source revision and configuration.

## Q: Which automation tools can support this model?

Select one tool after you test its history and package model.

- Release Please creates release pull requests from Conventional Commits. It supports merge and squash histories with documented limits.
- semantic-release calculates versions and publishes releases from release-branch commits. It favors complete automation.
- Changesets stores reviewed version intent in change fragments. It is useful for multi-package repositories.
- git-cliff generates configurable changelogs from Git history and Conventional Commits.
- GitHub generated release notes group merged pull requests through `.github/release.yml` labels.

Pin the selected tool and action revision. Test merge commits, squash commits, reverts, backports, prereleases, and empty releases.

Do not combine independent version calculators without one declared authority.

## Q: What is the manual fallback?

Use the same inputs and review standard without automation:

1. compare the previous tag with the target source commit;
2. list merged pull requests and first-parent commits;
3. classify each notable user or operator change;
4. select the highest required version bump;
5. update the version files and changelog;
6. review the result with another person;
7. follow [DEPLOY.md](DEPLOY.md) to tag, publish, and deploy.

Record the exact comparison range and final source commit. The manual path must remain reproducible.

## References

- [Semantic Versioning 2.0.0](https://semver.org/spec/v2.0.0.html)
- [Conventional Commits 1.0.0](https://www.conventionalcommits.org/en/v1.0.0/)
- [Keep a Changelog 1.1.0](https://keepachangelog.com/en/1.1.0/)
- [Git log and first-parent history](https://git-scm.com/docs/git-log)
- [GitHub pull request merge methods](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/incorporating-changes-from-a-pull-request/about-pull-request-merges)
- [GitHub generated release notes](https://docs.github.com/en/repositories/releasing-projects-on-github/automatically-generated-release-notes)
- [Release Please](https://github.com/googleapis/release-please)
- [semantic-release](https://semantic-release.gitbook.io/semantic-release)
- [Changesets](https://github.com/changesets/changesets)
- [git-cliff](https://git-cliff.org/docs/)
- [COMMITS.md](COMMITS.md)
- [BRANCHES.md](BRANCHES.md)
- [DEPLOY.md](DEPLOY.md)
