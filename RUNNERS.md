# RUNNERS

This guide defines safe hosted and self-hosted CI runner choices for GitHub and GitLab.

## Q: When should a project use a self-hosted runner?

Use one when the job needs private network access, licensed hardware, a special operating system, accelerator hardware, local caches, or a controlled build environment.

Use hosted runners for ordinary validation when they meet the requirement. Hosted runners reduce patching and isolation work. Self-hosted runners transfer that work to the team.

Never place untrusted pull-request code and trusted release credentials on the same persistent runner. Prefer ephemeral runners for untrusted or high-risk jobs.

## Q: What is the minimum runner boundary?

- Separate public, internal, release, and deployment runner groups.
- Use labels or tags that describe capability, not trust alone.
- Allow only the required repository or project scope.
- Use short-lived registration and cloud credentials.
- Keep the runner image pinned and rebuild it regularly.
- Remove workspaces and caches after jobs.
- Deny unnecessary network egress.
- Do not expose host sockets or production credentials to ordinary build jobs.
- Record image, toolchain, runner, kernel, and hardware versions.
- Monitor disk, memory, CPU, accelerator use, queue time, and failed jobs.

## Q: How should GitHub Actions runners work?

Follow the [GitHub self-hosted runner reference](https://docs.github.com/en/actions/reference/runners/self-hosted-runners). Use runner groups and labels. Use [Actions Runner Controller](https://docs.github.com/en/actions/concepts/runners/actions-runner-controller) for Kubernetes scale sets when autoscaling is justified.

A self-hosted runner is not a security boundary by itself. Treat jobs as code execution. Use ephemeral images or disposable virtual machines for untrusted changes. Separate fork workflows from privileged workflows. Require environment protection and review for release jobs.

## Q: How should GitLab runners work?

Follow the [GitLab Runner documentation](https://docs.gitlab.com/runner/) and choose the executor that matches the isolation need. Use tags to route jobs. Use protected runners for protected branches and release work. Use autoscaling or ephemeral runners when persistent state would create cross-job risk.

GitLab-hosted runners are a separate option. See the [GitLab-hosted runner documentation](https://docs.gitlab.com/ci/runners/hosted_runners/).

## Q: Where does Dagger fit?

Use [Dagger](https://dagger.io/) when the same containerized build, test, or release logic must run locally, in GitHub Actions, in GitLab CI, or in another CI system.

Dagger improves portability by moving workflow logic into a programmable, content-addressed pipeline. It does not remove runner trust, secret, network, or cache risks. Keep the Dagger module versioned. Pin base images and dependencies. Use Dagger for repeatable build graphs, not for hiding an unclear workflow.

## Q: What must CI prove?

- The job starts from a clean workspace.
- Tools and dependencies are pinned.
- The job does not use undeclared host state.
- Secrets are scoped and not printed.
- Artifacts have digests and provenance.
- Tests and security checks produce bounded evidence.
- A failed job is reproducible locally through the documented task.
- The runner can be rebuilt without manual repair.

## References

- [GitHub self-hosted runners](https://docs.github.com/en/actions/reference/runners/self-hosted-runners)
- [GitHub Actions Runner Controller](https://docs.github.com/en/actions/concepts/runners/actions-runner-controller)
- [GitLab runners](https://docs.gitlab.com/ci/runners/)
- [GitLab Runner](https://docs.gitlab.com/runner/)
- [GitLab-hosted runners](https://docs.gitlab.com/ci/runners/hosted_runners/)
- [Dagger](https://dagger.io/)
- [Dagger repository](https://github.com/dagger/dagger)
- [SLSA provenance](https://slsa.dev/spec/v1.2/provenance)