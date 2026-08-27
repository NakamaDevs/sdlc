# RUNNERS

This guide defines safe hosted and self-hosted CI runner choices for GitHub and GitLab.

## Q: When should a project use a self-hosted runner?

Use a self-hosted runner when a job needs private network access, licensed hardware, a special operating system, accelerator hardware, local caches, or a controlled build environment.

Use hosted runners for ordinary validation when they meet the requirement. Hosted runners reduce patching and isolation work. Self-hosted runners transfer that work to the team.

Never run untrusted pull-request code and trusted release credentials on the same persistent runner. Prefer ephemeral runners for untrusted or high-risk jobs.

## Q: What is the minimum runner boundary?

- Separate public, internal, release, and deployment runner groups.
- Use labels or tags that describe capability and trust.
- Allow only the required repository or project scope.
- Use short-lived registration and cloud credentials.
- Pin the runner image and rebuild it regularly.
- Remove workspaces and caches after jobs.
- Deny unnecessary network egress.
- Do not expose host sockets or production credentials to ordinary build jobs.
- Record image, toolchain, runner, kernel, and hardware versions.
- Monitor disk, memory, CPU, accelerator use, queue time, and failed jobs.

## Q: How should GitHub Actions runners work?

Follow the [GitHub self-hosted runner reference](https://docs.github.com/en/actions/reference/runners/self-hosted-runners). Use runner groups and labels. Use [Actions Runner Controller](https://docs.github.com/en/actions/concepts/runners/actions-runner-controller) for Kubernetes scale sets when autoscaling is justified.

A self-hosted runner is not a security boundary. Treat jobs as code execution. Use ephemeral images or disposable virtual machines for untrusted changes. Separate fork workflows from privileged workflows. Require environment protection and review for release jobs.

## Q: How should GitLab runners work?

Follow the [GitLab Runner documentation](https://docs.gitlab.com/runner/). Select an executor that meets the isolation need. Use tags to route jobs. Use protected runners for protected branches and release work. Use autoscaling or ephemeral runners when persistent state creates cross-job risk.

GitLab-hosted runners are another option. See the [GitLab-hosted runner documentation](https://docs.gitlab.com/ci/runners/hosted_runners/).

## Q: Where does Dagger fit?

Use [Dagger](https://dagger.io/) when the same containerized build, test, or release logic must run locally, in GitHub Actions, in GitLab CI, or in another CI system.

Dagger moves workflow logic into a programmable, content-addressed pipeline. It does not remove runner, secret, network, or cache risks. Version the Dagger module. Pin base images and dependencies. Use Dagger for repeatable build graphs. Do not use it to hide an unclear workflow.

## Q: What must CI prove?

- The job starts from a clean workspace.
- Tools and dependencies are pinned.
- The job does not use undeclared host state.
- Secrets are scoped and never printed.
- Artifacts have digests and provenance.
- Tests and security checks produce bounded evidence.
- A documented task can reproduce a failed job locally.
- The team can rebuild the runner without manual repair.

## References

- [GitHub self-hosted runners](https://docs.github.com/en/actions/reference/runners/self-hosted-runners)
- [GitHub Actions Runner Controller](https://docs.github.com/en/actions/concepts/runners/actions-runner-controller)
- [GitLab runners](https://docs.gitlab.com/ci/runners/)
- [GitLab Runner](https://docs.gitlab.com/runner/)
- [GitLab-hosted runners](https://docs.gitlab.com/ci/runners/hosted_runners/)
- [Dagger](https://dagger.io/)
- [Dagger repository](https://github.com/dagger/dagger)
- [SLSA provenance](https://slsa.dev/spec/v1.2/provenance)
