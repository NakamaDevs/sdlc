# GITHUB

This guide defines GitHub CI, repository governance, reviews, and runner use.

## Q: What is the default CI design?

Keep GitHub Actions workflows thin. They should select the runner, set permissions, and call repository-owned tasks.

Use `mise` as the local task entry point. Prefer Dagger for Linux work that can run in containers.

The same build and test logic must run locally and in CI. Provider YAML must not contain a second implementation.

Use stable required-check names. A ruleset depends on those names across workflow refactors.

## Q: When should CI use Dagger?

Prefer Dagger when a job can run on Linux inside a disposable container.

Good candidates include:

- compilation and unit tests;
- service integration tests;
- static analysis and secret scanning;
- SBOM and provenance generation;
- container builds;
- documentation checks;
- bounded release artifact creation.

Pin the Dagger CLI, SDK, modules, base images, and package sources. Keep network, secrets, mounts, and outputs explicit.

Each adopting repository must first implement and test a repository-owned Dagger function.

After that function exists, call it from a local `mise` task and GitHub Actions.

Until then, call the same repository-owned `mise` task in both environments. Record Dagger adoption as pending work.

## Q: Which work should stay outside Dagger?

Keep a step on its required host when a container cannot reproduce the target.

Common exceptions include:

- Xcode builds, iOS simulators, notarization, and Apple signing;
- Windows UI, driver, installer, and native integration tests;
- Android hardware tests when a container cannot access the device safely;
- accelerator and hardware-in-the-loop tests;
- inference training or evaluation with very large model caches;
- licensed tools tied to a controlled host.

Use Dagger for portable work around the exception. Keep only the host-dependent step outside it.

Record the owner, reason, risk, patch schedule, and exit plan for every durable exception.

## Q: How should workflows be secured?

- Pin each third-party action to a complete commit SHA.
- Give each job the smallest `permissions` set.
- Set explicit job timeouts.
- Cancel obsolete runs with bounded concurrency.
- Do not expose secrets to untrusted pull-request code.
- Do not run untrusted checkout code in a privileged `pull_request_target` job.
- Keep publish, signing, migration, and deployment in separate approved jobs.
- Protect environments and release credentials.
- Record artifact digests and provenance.
- Review changes to workflows, actions, runners, and permissions as security changes.

GitHub states that a complete commit SHA is the only immutable action release identifier.

## Q: Which checks should a ruleset require?

Require checks that provide stable, distinct evidence. Typical names include:

- formatting and documentation;
- unit tests;
- integration tests;
- security and secret scanning;
- dependency and action review;
- build or package validation;
- platform-specific tests when the changed files need them.

Do not require duplicate checks that execute the same evidence path.

Use path selection only when the selection logic has tests. A skipped required check must still report a successful decision.

Keep release and deployment checks separate from pull-request checks.

## Q: What should the default branch ruleset require?

Use an active ruleset for the default branch. Require:

- pull requests before merge;
- at least one approval;
- code-owner review for owned paths;
- resolved review conversations;
- required status checks from the current revision;
- protection against branch deletion and non-fast-forward updates;
- linear history when the repository uses rebase or squash merges.

Evaluate rulesets before enforcement. Confirm that bots, release automation, and emergency procedures still work.

Keep ruleset changes reviewable. Record the ruleset name, target, checks, bypass actors, and last review date.

## Q: How should the Devs team own reviews?

Use a visible GitHub team with write access. GitHub requires both conditions for team CODEOWNERS entries.

Use this default when the repository wants the Devs team on almost every change:

```text
* @NakamaDevs/devs
```

The verified organization team is `Devs`, with slug `devs`.

On 2026-08-27, only the `Admins` team had repository access. Grant `Devs` write access before activating this entry.

Add narrower owners after the default when a path needs another specialist team.

Protect `.github/`, security policy, release automation, runner configuration, and ownership files with explicit owners.

Enable team code-review assignment when reviews should rotate across Devs members. Choose an algorithm and assignment count deliberately.

CODEOWNERS requests reviews. It does not replace ruleset enforcement, repository access, or branch protection.

## Q: How should administrator bypass work?

Do not grant a broad, silent bypass to every administrator.

Use the smallest named bypass list. Prefer the ruleset option that permits bypass through a pull request.

That path preserves the pull request, review discussion, and audit history.

Use an emergency bypass only for a service incident, security response, or broken governance path.

The bypass actor must record:

- the incident or Linear issue;
- the exact blocked rule;
- the reason normal review could not complete;
- the commit and deployment result;
- the follow-up review and corrective action.

Review bypass access at least every 30 days. Remove actors that no longer need it.

## Q: Which runner should a job use?

Use this order:

1. GitHub-hosted runner plus Dagger for ordinary work;
2. ephemeral self-hosted runner for controlled networks or sensitive work;
3. dedicated persistent runner only for hardware, licensed tools, or large durable caches;
4. separate approved release capacity for signing and deployment.

Use runner groups as access boundaries. Use labels for routing inside an approved group.

Do not treat a label as an authorization control.

## Q: How should ephemeral runners work?

GitHub recommends ephemeral self-hosted runners for autoscaling. Use one job for each runner registration.

Forward logs before deletion. Remove registration and destroy the runner workspace after each job.

Use Actions Runner Controller when Kubernetes is the approved autoscaling platform.

Do not route untrusted fork code to a runner with private network, signing, cloud, or production access.

See [RUNNERS.md](RUNNERS.md) for hosted, self-hosted, and ephemeral patterns.

## Q: How should persistent runners work?

Treat each persistent runner as a restricted appliance.

- Assign it to one repository or a small trusted runner group.
- Reject untrusted pull requests.
- Keep deployment credentials off the host when possible.
- Reset the workspace after each job.
- Patch and reimage on a schedule.
- Monitor disk, processes, caches, and network use.
- Keep large model or SDK caches separate from repository state.

Use a persistent runner only when repeated setup cost or hardware access justifies its risk.

## Q: How should governance changes be verified?

Review the workflow diff and ruleset diff separately. Test pull requests from trusted branches and untrusted forks.

Confirm each required check reports on success, failure, and intentional skip paths.

Confirm CODEOWNERS requests the expected team. Confirm a normal administrator cannot bypass unless the ruleset lists that actor.

Run a bounded runner smoke test. Record runner image, labels, group, job URL, result, and cleanup evidence.

## References

- [Dagger documentation](https://docs.dagger.io/)
- [GitHub CODEOWNERS](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners)
- [GitHub ruleset rules](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/available-rules-for-rulesets)
- [Create a GitHub ruleset](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/creating-rulesets-for-a-repository)
- [Secure use of GitHub Actions](https://docs.github.com/en/actions/reference/security/secure-use)
- [GitHub self-hosted runners](https://docs.github.com/en/actions/reference/runners/self-hosted-runners)
- [GitHub runner groups](https://docs.github.com/en/actions/concepts/runners/runner-groups)
- [GitHub Actions Runner Controller](https://docs.github.com/en/actions/concepts/runners/actions-runner-controller)
- [GitHub team review settings](https://docs.github.com/en/organizations/organizing-members-into-teams/managing-code-review-settings-for-your-team)
- [DAGGER.md](DAGGER.md)
- [RUNNERS.md](RUNNERS.md)
