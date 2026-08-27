# DAGGER

This guide defines when and how to use Dagger for portable build, test, and delivery workflows.

## Q: What is Dagger?

[Dagger](https://dagger.io/) is a programmable CI/CD engine that runs pipelines in containers. The same pipeline can run on a developer machine, GitHub Actions, GitLab CI, or another runner.

Dagger improves portability when a repository needs one executable workflow across different CI systems. It does not remove the need for runner isolation, secret controls, dependency pinning, provenance, or review.

## Q: When should a project use Dagger?

Use Dagger when:

- local and CI workflows must execute the same graph;
- multiple CI providers must share build logic;
- containerized dependencies improve reproducibility;
- build results can use content-addressed caching;
- a pipeline has clear inputs, outputs, and side effects.

Do not add Dagger to a small repository when a documented `mise` task already provides sufficient portability. Measure setup time and maintenance cost before adopting it.

## Q: How should a Dagger pipeline be structured?

- Keep the module and pipeline code in the repository.
- Pin the Dagger CLI, SDK, base images, package sources, and tool versions.
- Define explicit source directories, caches, secrets, network access, and outputs.
- Keep build and test containers disposable.
- Return small, useful results and bounded logs.
- Separate pure build and test steps from deployment side effects.
- Require explicit approval before publishing, migrating, or deploying.
- Emit artifact digests and provenance.
- Make the same pipeline callable from a local `mise` task and CI.

## Q: How should secrets work?

Do not copy secrets into images, source directories, logs, artifacts, or generated code. Mount secrets only into the step that needs them. Use the CI provider or an approved secret manager. Keep network access disabled unless the step requires it.

Treat a Dagger module as executable code. Review changes to module dependencies, container images, host mounts, sockets, network access, and secret use.

## Q: What is the local validation path?

Start with a container build or unit-test pipeline. Run the same module in CI on a clean runner. Compare artifact digests, test results, tool versions, and bounded output.

Use a fast path for formatting, static checks, and focused tests. Use a complete path for integration tests, security scans, SBOM generation, provenance, and release validation.

Record the Dagger version, module revision, runner image, source revision, input digests, output digests, and result in the work item or evidence register.

## Q: How does Dagger fit with GitHub and GitLab runners?

Use hosted runners for ordinary pipelines when their environment meets the requirement. Use self-hosted or ephemeral runners for private networks, licensed tools, accelerators, or controlled build environments.

Dagger makes pipeline logic portable. The runner still controls the trust boundary. Keep release credentials and deployment access outside ordinary pull-request jobs.

## References

- [Dagger](https://dagger.io/)
- [Dagger repository](https://github.com/dagger/dagger)
- [Dagger documentation](https://docs.dagger.io/)
- [GitHub self-hosted runners](https://docs.github.com/en/actions/reference/runners/self-hosted-runners)
- [GitLab runners](https://docs.gitlab.com/runner/)
- [SLSA provenance](https://slsa.dev/spec/v1.2/provenance)
## Q: How can Dagger review third-party links safely?

Treat hosted material as untrusted input. A Dagger pipeline can isolate retrieval, conversion, and inspection inside disposable containers. It does not make malicious code safe by itself.

Use a dedicated review function with these limits:

- start from a pinned, reviewed Dagger module and base image;
- mount only the destination directory, preferably read-only until review completes;
- allow network access only to the approved source domains;
- do not mount the host Docker socket, SSH agent, home directory, keychain, or cloud credentials;
- pass no repository secrets to the retrieval step;
- run as a non-root user when the image supports it;
- remove scripts, forms, tracking elements, credentials, and executable attachments before conversion;
- write sanitized Markdown and a metadata record to an explicit output directory;
- inspect the output before it enters `REFERENCES/`;
- retain the source URL, final URL, retrieval time, converter version, image digest, and source revision.

The review container may read public pages. It must not execute instructions found in those pages. A page is data, not authority.

Dagger is a workflow boundary. Use a separate virtual machine or ephemeral runner when the input or tool is actively hostile, requires a privileged container engine, or can escape the container boundary. Do not describe a Dagger container as a complete security sandbox.

## Q: How should Dagger run in CI?

Keep the Dagger module in the repository. Pin the Dagger CLI, SDK, module dependencies, base images, and action versions. Call the same module from a local task and from GitHub or GitLab CI.

Use `dagger version` to record the CLI version. Use `dagger develop` to initialize or update a module. Use `dagger functions` to inspect available functions. Use `dagger call <function>` only for a function that the module defines. Confirm each command against the installed Dagger version and the official documentation.

Prefer Dagger's container engine over Docker-in-Docker when the workflow only needs disposable containers. If Docker-in-Docker is required, isolate the daemon, pin its image, avoid host mounts, and do not expose its socket to unrelated steps. Nested container engines add privilege and cleanup risks.

Keep retrieval, conversion, testing, publishing, and deployment as separate functions. Make publishing and deployment explicit side effects. Require a separate approval for those effects.

## Q: Which CI runners should execute Dagger work?

Use hosted runners for ordinary public-input builds when their tools and limits are sufficient. Use ephemeral self-hosted runners for private networks, sensitive source, custom images, accelerators, or controlled egress.

An ephemeral runner must process one job, forward its logs before deletion, remove its registration, destroy its workspace, and destroy or reimage its host. Do not reuse its filesystem, container cache, credentials, or temporary network between jobs. Apply labels or runner groups so untrusted pull requests cannot select privileged capacity.

GitHub recommends ephemeral self-hosted runners for autoscaling. GitLab provides runner executors and autoscaling options. Confirm the current provider guidance before implementation:

- [GitHub self-hosted runners](https://docs.github.com/en/actions/reference/runners/self-hosted-runners)
- [GitHub ephemeral runners](https://docs.github.com/en/actions/reference/runners/self-hosted-runners#ephemeral-runners-for-autoscaling)
- [GitHub Actions Runner Controller](https://docs.github.com/en/actions/concepts/runners/actions-runner-controller)
- [GitLab Runner](https://docs.gitlab.com/runner/)
- [GitLab runner autoscaling](https://docs.gitlab.com/runner/ autoscale/)

## Q: When should a runner remain sticky?

Keep a persistent, dedicated runner only when the software or hardware is costly, stateful, licensed, or difficult to reproduce. Examples include Xcode and simulator images, Android Studio and emulator images, hardware-connected tests, and a local Ollama model cache.

A sticky runner is a restricted appliance, not a general-purpose worker:

- assign it to one repository or a small trusted group;
- use dedicated labels or tags;
- reject untrusted fork and pull-request jobs;
- keep deployment credentials off the host when possible;
- restrict outbound network access;
- monitor processes, disk use, and model or SDK caches;
- reset project state after each job;
- patch and reimage on a defined schedule;
- record the exception, owner, risk, and exit plan.

Use Dagger inside the sticky runner for portable, disposable work. Keep only the hardware-dependent step outside the container. For example, build and static checks can run in Dagger, while an Xcode simulator or a USB device test runs in the dedicated macOS lane.

## Q: What is the default runner decision?

Use this order:

1. hosted runner plus Dagger for ordinary work;
2. ephemeral self-hosted runner plus Dagger for controlled networks or sensitive work;
3. sticky dedicated runner only for hardware, licensed software, or durable local caches;
4. a separate human-approved release lane for signing, publishing, migration, and deployment.

The exception record must explain why a lower-trust or more disposable lane cannot perform the task.