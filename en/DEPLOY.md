# DEPLOY

This guide defines a repeatable path from reviewed source to a versioned release and a controlled deployment.

For selective promotion through DEV, see the optional topic-branch workflow in [BRANCHES.md](BRANCHES.md). Adoption requires a team decision; existing delivery defaults remain in force.

## Q: What do release, publish, and deploy mean?

Use one word for each operation:

- `build` creates an artifact from source;
- `release` approves one source revision and its versioned artifacts;
- `publish` sends an approved artifact to a registry or distribution service;
- `deploy` places an approved artifact into a runtime environment;
- `promote` moves the same artifact to another channel or environment;
- `rollback` restores a known artifact or runtime state.

A release does not prove a deployment. A deployment does not create a new release unless its artifact changes.

## Q: What does Semantic Versioning require?

Declare the public API or operational contract before you use Semantic Versioning.

Use `MAJOR.MINOR.PATCH`:

- increment `MAJOR` for incompatible public changes;
- increment `MINOR` for compatible public features or deprecations;
- increment `PATCH` for compatible corrections.

Use prerelease identifiers such as `1.8.0-rc.1` for candidates. Build metadata such as `1.8.0+build.42` does not change precedence.

Do not overwrite a published version. Publish a new version for every changed artifact.

Define how version `0.y.z` handles incompatible changes. Version `1.0.0` declares the first stable public API.

Use [CHANGELOG.md](CHANGELOG.md) to calculate and explain the proposed version.

## Q: What is the release unit?

Define each independently versioned component before automation.

A component can be:

- one application;
- one library or package;
- one command-line tool;
- one container image;
- one firmware image;
- one infrastructure module;
- one grouped product release.

For a monorepo, choose one shared version or independent component versions. Do not mix both models without explicit boundaries.

Record each component path, public contract, version source, tag form, artifact names, registry, owner, and deployment targets.

## Q: What is the recommended release state machine?

Use these states:

```text
unreleased -> planned -> reviewed -> tagged -> built -> published -> deployed -> verified
                                  \-> failed
                                  \-> rolled-back
```

Each transition must have one owner, one input revision, one check, one result, and one evidence link.

Do not skip a state silently. Record an approved exception when a component does not use one state.

## Q: Which source revision should a release use?

Select one full commit from a protected release branch. The release tag, changelog, version files, and artifacts must identify it.

Prefer the reviewed merge commit from the release pull request. Do not build a release from an unreviewed working tree.

Build every platform artifact from the same source revision. Record any platform-specific source exception.

Use a clean environment. Restore dependencies from reviewed lockfiles and pinned tools.

## Q: How should a release pull request work?

Prefer a release pull request when people must review the version and notes.

The release planner should:

1. read changes after the previous component tag;
2. propose the next Semantic Versioning value;
3. update the changelog and version sources;
4. update lockfiles or generated metadata when required;
5. link included pull requests, issues, and migrations;
6. run the complete release validation without publishing;
7. open or update one reviewable release pull request.

After approval, merge the release pull request. Then create the tag and artifacts from its exact merge commit.

This model separates release intent from privileged publication.

## Q: Which trigger modes are valid?

Support one or more explicit modes:

- automatic planning after a reviewed change reaches the release branch;
- automatic publication after an approved release pull request reaches the release branch;
- a manual `workflow_dispatch` run with typed version, component, environment, and dry-run inputs;
- a local manual procedure that invokes the same pinned repository tasks.

Prefer automatic planning and reviewed publication. Use manual dispatch for controlled cadence, recovery, or exceptional targets.

A manual button does not reduce the required checks. It only changes who starts the workflow.

The workflow file must exist on the default branch before GitHub accepts `workflow_dispatch` events.

## Q: What tasks should the repository expose?

Use stable task names across local and CI execution.

These commands are repository-specific examples:

```text
mise run release:plan
mise run release:verify
mise run release:build
mise run release:publish
mise run deploy:staging
mise run deploy:production
mise run release:verify-published
```

Each task must support a safe dry run when the underlying operation permits one.

Use Dagger for portable Linux release logic when containers can contain the work. Keep platform signing on the required trusted runner.

## Q: What must release validation check?

Before tagging, verify:

- the source branch and full commit;
- the previous tag and comparison range;
- the proposed version and changelog;
- clean dependency restoration from lockfiles;
- unit, integration, contract, and required end-to-end tests;
- static analysis, secret checks, dependency checks, and license policy;
- migration compatibility and rollback preparation;
- package and artifact metadata;
- supported operating systems and architectures;
- reproducible build inputs or documented variance.

Run package-specific dry runs before publication. Do not use production credentials during ordinary pull-request validation.

## Q: How should Git tags and GitHub Releases work?

Use an annotated or signed release tag when repository policy requires it.

Use one documented form, such as `v1.8.0` or `component-v1.8.0`. Do not create ambiguous tags.

Create the tag at the reviewed source commit. Do not move a published Semantic Versioning tag.

Draft the GitHub Release before publication. Attach all artifacts, checksums, signatures, SBOMs, and provenance before final publication.

Generated GitHub notes can provide a starting point. A release owner must verify included pull requests and user impact.

Use immutable releases when the repository and delivery model support them.

Moving compatibility tags for GitHub Actions is a separate policy. Never treat a moving tag as immutable evidence.

## Q: How should release workflows protect credentials?

Separate untrusted pull-request checks from privileged release and deployment jobs.

Use minimum `GITHUB_TOKEN` permissions for each job. Grant `contents: write`, `packages: write`, or `id-token: write` only where required.

Use OpenID Connect and short-lived credentials when the target supports them. Bind trust to the repository, workflow, reference, and environment.

Use protected environments for publication and production deployment. Require reviewers when the risk requires human approval.

Do not let untrusted code select a privileged runner, environment, package name, registry, tag, or deployment target.

Use concurrency controls to prevent two releases or deployments from changing the same component and target simultaneously.

## Q: How should artifacts preserve identity?

Build once and promote the same verified artifact when practical.

Record:

- the component and version;
- the source tag and full commit;
- the artifact filename, media type, size, and digest;
- the toolchain, runner image, operating system, and architecture;
- the dependency lock digest;
- the SBOM, signature, and provenance location;
- the registry reference and immutable digest;
- the build and verification run links.

Container tags are convenient names. Use the OCI manifest digest as the immutable deployment identity.

Set OCI annotations such as `org.opencontainers.image.version`, `org.opencontainers.image.revision`, and `org.opencontainers.image.source`.

## Q: How should publication differ by ecosystem?

Follow the target registry's version and immutability rules.

| Ecosystem | Version source | Safe preparation | Publication identity |
|---|---|---|---|
| Elixir and Hex | `mix.exs` | package validation and docs | package name plus version |
| .NET and NuGet | project package metadata | pack, inspect, sign, and test | package identifier plus version |
| Dart and Flutter | `pubspec.yaml` | analyze, test, and package | package name plus version |
| Rust and Cargo | `Cargo.toml` | `cargo publish --dry-run` | crate name plus version |
| Go modules | `go.mod` and Git tag | module compatibility tests | module path plus semantic tag |
| JavaScript and npm | `package.json` | pack, inspect, test, and provenance | package name plus version |
| Python and PyPI | `pyproject.toml` or selected source | build and inspect distributions | project name plus PEP 440 version |
| Swift Package Manager | Git tag and `Package.swift` | resolve and test supported platforms | repository plus semantic tag |
| OCI containers | build metadata and Git tag | scan, sign, and verify manifest | registry reference plus digest |

Python uses PEP 440 rules. Do not assume every valid Semantic Versioning string has identical Python meaning.

Go modules from `v2` need a major-version suffix in the module path. Follow the official compatibility exceptions.

Registry publication can be irreversible. Test the package before upload and use a staging registry when available.

## Q: How should deployment proceed after publication?

Deploy by immutable artifact identity, not by an unverified branch or moving tag.

Use this sequence:

1. select the approved release and target environment;
2. confirm environment protection and change approval;
3. deploy to the smallest safe target or staging environment;
4. run bounded health, migration, telemetry, and user-path checks;
5. expand through the selected rollout strategy;
6. watch error rate, latency, saturation, business signals, and rollback triggers;
7. record the deployed digest, environment, time, actor, and evidence;
8. close the deployment only after the verification window passes.

Use canary, rolling, blue-green, or another strategy only when the system can measure and reverse it.

## Q: How should rollback work?

Define rollback before deployment. Include application, configuration, database, queue, cache, and external-contract effects.

Prefer redeploying a previously verified artifact. Do not rebuild an old version and call it the same artifact.

Use forward recovery when data or contract changes make rollback unsafe.

Do not move or replace a published version after rollback. Publish a corrective version when the released content must change.

Record the reason, trigger, artifact, data action, owner, start time, end time, result, and follow-up issue.

## Q: What is the manual release procedure?

Use this procedure when CI publication is unavailable or deliberately disabled:

1. confirm the approved release pull request and full merge commit;
2. run the pinned complete verification task in a clean environment;
3. generate and review the changelog and proposed version;
4. create the approved release tag at the exact commit;
5. build each artifact with pinned tools;
6. verify checksums, signatures, SBOMs, provenance, and package metadata;
7. create a draft GitHub Release and attach verified artifacts;
8. publish each registry artifact with authorized credentials;
9. verify each published artifact from a clean consumer environment;
10. publish the GitHub Release and record all evidence;
11. deploy only through the protected deployment procedure.

Another person should verify a privileged manual release when project risk requires separation of duties.

## Q: What proves release completion?

A release is complete only when:

- the version, changelog, tag, source commit, and artifacts agree;
- all required checks passed on the released source;
- the registries return the expected immutable identities;
- checksums, signatures, SBOMs, and provenance are available when required;
- the GitHub Release links the correct artifacts and migration details;
- deployment status is explicit and separate from publication status;
- Linear or the selected tracker contains bounded evidence and remaining risks.

## References

- [Semantic Versioning 2.0.0](https://semver.org/spec/v2.0.0.html)
- [GitHub release management](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository)
- [GitHub generated release notes](https://docs.github.com/en/repositories/releasing-projects-on-github/automatically-generated-release-notes)
- [GitHub Actions workflow syntax](https://docs.github.com/en/actions/reference/workflows-and-actions/workflow-syntax)
- [GitHub deployments and environments](https://docs.github.com/en/actions/reference/workflows-and-actions/deployments-and-environments)
- [GitHub OpenID Connect guidance](https://docs.github.com/en/actions/how-tos/secure-your-work/security-harden-deployments/oidc-in-cloud-providers)
- [Release Please](https://github.com/googleapis/release-please)
- [semantic-release](https://semantic-release.gitbook.io/semantic-release)
- [Changesets](https://github.com/changesets/changesets)
- [git-cliff](https://git-cliff.org/docs/)
- [Hex package publication](https://hex.pm/docs/publish)
- [NuGet package versioning](https://learn.microsoft.com/en-us/nuget/concepts/package-versioning)
- [Cargo publication](https://doc.rust-lang.org/cargo/reference/publishing.html)
- [Go module release workflow](https://go.dev/doc/modules/release-workflow)
- [npm publication](https://docs.npmjs.com/cli/commands/npm-publish/)
- [Python version specifiers](https://packaging.python.org/en/latest/specifications/version-specifiers/)
- [Swift package publication](https://docs.swift.org/swiftpm/documentation/packagemanagerdocs/releasingpublishingapackage/)
- [OCI image annotations](https://github.com/opencontainers/image-spec/blob/main/annotations.md)
- [CHANGELOG.md](CHANGELOG.md)
- [GITHUB.md](GITHUB.md)
- [DAGGER.md](DAGGER.md)
- [RUNNERS.md](RUNNERS.md)
- [SECURITY.md](SECURITY.md)
