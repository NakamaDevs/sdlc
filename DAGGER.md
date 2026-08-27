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