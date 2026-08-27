---
source_url: https://docs.gitlab.com/runner/
source_title: GitLab Runner
source_language: en
retrieved_at: 2026-08-27
published_at: null
source_version: null
capture_scope: page
conversion: turndown-7.2.4
status: archived
license: null
canonical_id: gitlab-runner
trust: untrusted
prompt_injection_reviewed_at: 2026-08-27
body_sha256: 28110e2faf27e455d3a581b368f3c4e1094aee05065e45329eaeb54507e33586
---

[Skip to main content](#skipTarget) [Go to GitLab Docs homepage](/)

[What's new?](https://about.gitlab.com/releases/whats-new/)

[What's new?](https://about.gitlab.com/releases/whats-new/) [Get free trial](https://gitlab.com/-/trial_registrations/new?glm_source=docs.gitlab.com&glm_content=navigation-cta-docs)

Toggle menu

*   [Use GitLab](/user/)
*   [GitLab Duo](/user/gitlab_duo/)
*   [GitLab Orbit](/orbit/)
*   [Extend](/api/)
*   [Install](/install/)
*   [Administer](/administration/)
*   [Subscribe](/subscriptions/)
*   [Contribute](/development/)
*   [Solutions](/solutions/)

[Getting started](/administration/get_started/)

[Configure GitLab](/administration/configure/)

[Configure GitLab Duo](/administration/gitlab_duo/configure/)

[Configure GitLab Orbit](/orbit/self-managed/)

[Update your settings](/administration/settings/)

[Enable features behind feature flags](/administration/feature_flags/)

[Maintain GitLab](/administration/operations/)

[Monitor GitLab](/administration/monitoring/)

[Secure GitLab](/security/)

[Administer users](/administration/administer_users/)

[Administer GitLab Dedicated](/administration/dedicated/)

[Administer GitLab Runner](/runner/)

[Getting started](/user/get_started/get_started_runner/)

[Create and manage runners](/ci/runners/runners_scope/)

[Register a runner](/runner/register/)

[Runner executors](/runner/executors/)

[Configure runners](/ci/runners/configure_runners/)

[Autoscale configuration](/runner/runner_autoscale/)

[Monitor runner performance](/runner/monitoring/)

[Runner fleet configuration and best practices](/topics/runner_fleet_design_guides/)

1.  [GitLab Docs](/ "GitLab Docs") /
2.  [Administer](/administration/ "Administer") /
3.  [Administer GitLab Runner](/runner/ "Administer GitLab Runner")

Help us learn about your current experience with the documentation. [Take the survey](https://gitlab.fra1.qualtrics.com/jfe/form/SV_e5Ig7YiRmL0RSm2).

* * *

# GitLab Runner

*   Tier: Free, Premium, Ultimate
*   Offering: GitLab.com, GitLab Self-Managed, GitLab Dedicated

GitLab Runner is an application that works with GitLab CI/CD to run jobs in a pipeline.

When developers push code to GitLab, they can define automated tasks in a `.gitlab-ci.yml` file. These tasks might include running tests, building applications, or deploying code. GitLab Runner is the application that executes these tasks on computing infrastructure.

As an administrator, you are responsible for providing and managing the infrastructure where these CI/CD jobs run. This involves installing GitLab Runner applications, configuring them, and ensuring they have adequate capacity to handle your organization’s CI/CD workload.

## What GitLab Runner does

GitLab Runner connects to your GitLab instance and waits for CI/CD jobs. When a pipeline runs, GitLab sends jobs to available runners. The runner executes the job and reports the results back to GitLab.

GitLab Runner has the following features.

*   Run multiple jobs concurrently.
*   Use multiple tokens with multiple servers (even per-project).
*   Limit the number of concurrent jobs per-token.
*   Jobs can be run:
    *   Locally.
    *   Using Docker containers.
    *   Using Docker containers and executing job over SSH.
    *   Using Docker containers with autoscaling on different clouds and virtualization hypervisors.
    *   Connecting to a remote SSH server.
*   Is written in Go and distributed as single binary without any other requirements.
*   Supports Bash, PowerShell Core, and Windows PowerShell.
*   Works on GNU/Linux, macOS, and Windows (pretty much anywhere you can run Docker).
*   Allows customization of the job running environment.
*   Automatic configuration reload without restart.
*   Seamless setup with support for Docker, Docker-SSH, Parallels, or SSH running environments.
*   Enables caching of Docker containers.
*   Seamless installation as a service for GNU/Linux, macOS, and Windows.
*   Embedded Prometheus metrics HTTP server.
*   Referee workers to monitor and pass Prometheus metrics and other job-specific data to GitLab.

## Runner execution flow

This diagram shows how runners are registered and how jobs are requested and handled. It also shows which actions use [registration and authentication tokens](https://docs.gitlab.com/api/runners/#registration-and-authentication-tokens), and [job tokens](https://docs.gitlab.com/ci/jobs/ci_job_token/).

sequenceDiagram
    participant GitLab
    participant GitLabRunner
    participant Executor

    opt registration
      GitLabRunner ->>+ GitLab: POST /api/v4/runners with registration\_token
      GitLab -->>- GitLabRunner: Registered with runner\_token
    end

    loop job requesting and handling
      GitLabRunner ->>+ GitLab: POST /api/v4/jobs/request with runner\_token
      GitLab -->>+ GitLabRunner: job payload with job\_token
      GitLabRunner ->>+ Executor: Job payload
      Executor ->>+ GitLab: clone sources with job\_token
      Executor ->>+ GitLab: download artifacts with job\_token
      Executor -->>- GitLabRunner: return job output and status
      GitLabRunner -->>- GitLab: updating job output and status with job\_token
    end

## Runner deployment options

### GitLab-hosted runners

[GitLab-hosted runners](https://docs.gitlab.com/ci/runners/) are managed by GitLab and available on GitLab.com. You don’t need to install or maintain these runners - GitLab provides them as a service. However, you have limited control over the execution environment and cannot customize the infrastructure.

### Self-managed runners

Self-managed runners are GitLab Runner instances that you install, configure, and manage in your own infrastructure. You can [install](/runner/install/) and register self-managed runners on all GitLab installations. As an administrator, you typically work with self-managed runners.

Unlike GitLab-hosted runners, which are hosted and managed by GitLab, you have complete control over self-managed runners.

## GitLab Runner versions

For compatibility reasons, the GitLab Runner [major.minor](https://en.wikipedia.org/wiki/Software_versioning) version should stay in sync with the GitLab major and minor version. Older runners may still work with newer GitLab versions, and vice versa. However, features may not be available or work properly if a version difference exists.

Backward compatibility is guaranteed between minor version updates. However, sometimes minor version updates of GitLab can introduce new features that require GitLab Runner to be on the same minor version.

If you host your own runners but host your repositories on GitLab.com, keep GitLab Runner [updated](/runner/install/) to the latest version, as GitLab.com is [updated continuously](https://handbook.gitlab.com/handbook/engineering/deployments-and-releases/).

## Troubleshooting

Learn how to [troubleshoot](/runner/faq/) common issues.

## Glossary

*   **GitLab Runner**: The application that executes CI/CD jobs from GitLab pipelines on a target computing platform.
*   **Runner**: A configured instance of GitLab Runner that can execute jobs. Depending on the type of executor, this machine could be local to the runner manager (`shell` or `docker` executor) or a remote machine created by an autoscaler (`docker-autoscaler` or `kubernetes`).
*   **Runner configuration**: A single `[[runner]]` entry in the `config.toml` that displays as a **runner** in the UI.
*   **Runner manager**: The process that reads the `config.toml` file and runs all the runner configurations and job executions concurrently.
*   **Machine**: A virtual machine (VM) or pod that the runner operates in. GitLab Runner automatically generates a unique, persistent machine ID so that when multiple machines are given the same runner configuration, jobs can be routed separately but the runner configurations are grouped in the UI.
*   **Executor**: The method GitLab Runner uses to execute jobs (Docker, Shell, Kubernetes, etc.).
*   **Pipeline**: A collection of jobs that run automatically when code is pushed to GitLab.
*   **Job**: A single task in a pipeline, such as running tests or building an application.
*   **Runner token**: A unique identifier that allows a runner to authenticate with GitLab.
*   **Tags**: Labels assigned to runners that determine which jobs they can execute.
*   **Concurrent jobs**: The number of jobs a runner can execute simultaneously.
*   **Self-managed runner**: A runner installed and managed on your own infrastructure.
*   **GitLab-hosted runner**: A runner provided and managed by GitLab.

For more information, see the official [GitLab Word List](https://docs.gitlab.com/development/documentation/styleguide/word_list/#gitlab-runner) and the GitLab Architecture entry for [GitLab Runner](https://docs.gitlab.com/development/architecture/#gitlab-runner).

## Contributing

Contributions are welcome. See [`CONTRIBUTING.md`](https://gitlab.com/gitlab-org/gitlab-runner/blob/main/CONTRIBUTING.md) and the [development documentation](/runner/development/) for details.

If you’re a reviewer of GitLab Runner project, take a moment to read the [Reviewing GitLab Runner](/runner/development/reviewing-gitlab-runner/) document.

You can also review [the release process for the GitLab Runner project](https://gitlab.com/gitlab-org/gitlab-runner/blob/main/PROCESS.md).

## Changelog

See the [CHANGELOG](https://gitlab.com/gitlab-org/gitlab-runner/blob/main/CHANGELOG.md) to view recent changes.

## License

This code is distributed under the MIT license. View the [LICENSE](https://gitlab.com/gitlab-org/gitlab-runner/blob/main/LICENSE) file.

*   [What GitLab Runner does](#what-gitlab-runner-does)
*   [Runner execution flow](#runner-execution-flow)
*   [Runner deployment options](#runner-deployment-options)
*   [GitLab-hosted runners](#gitlab-hosted-runners)
*   [Self-managed runners](#self-managed-runners)
*   [GitLab Runner versions](#gitlab-runner-versions)
*   [Troubleshooting](#troubleshooting)
*   [Glossary](#glossary)
*   [Contributing](#contributing)
*   [Changelog](#changelog)
*   [License](#license)

[![GitLab Docs logo](/gitlab-logo-footer.svg)](/)

*   [Facebook](https://www.facebook.com/gitlab)
*   [LinkedIn](https://www.linkedin.com/company/gitlab-com)
*   [Twitter](https://twitter.com/gitlab)
*   [YouTube](https://www.youtube.com/channel/UCnMGQ8QHMAnVIsI3xJrihhg)

[![Creative Commons License](/by-sa.svg)](https://creativecommons.org/licenses/by-sa/4.0/)

Company

*   [About GitLab](https://about.gitlab.com/company/)
*   [View pricing](https://about.gitlab.com/pricing/)
*   [Try GitLab for free](https://about.gitlab.com/free-trial/)

Feedback

*   [View page source](https://gitlab.com/gitlab-org/gitlab-runner/-/blob/main/docs/_index.md)
*   [Edit in Web IDE](https://gitlab.com/-/ide/project/gitlab-org/gitlab-runner/edit/main/-/docs/_index.md)
*   [Contribute to GitLab](https://about.gitlab.com/community/contribute/)
*   [Suggest updates](https://gitlab.com/gitlab-org/gitlab/-/issues/new?issuable_template=Documentation)

Help & Community

*   [Get certified](https://university.gitlab.com/pages/certifications)
*   [Get support](https://about.gitlab.com/support/)
*   [Post on the GitLab forum](https://forum.gitlab.com/new-topic?title=topic%20title&body=topic%20body&tags=docs-feedback)

Resources

*   [Terms](https://about.gitlab.com/terms/)
*   [Privacy statement](https://about.gitlab.com/privacy/)
*   [Use of generative AI](/legal/use_generative_ai/)
*   [Acceptable use of user licenses](/legal/licensing_policy/)
