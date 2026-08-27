---
source_url: https://docs.github.com/en/actions/reference/runners/self-hosted-runners
source_title: GitHub self-hosted runners
source_language: en
retrieved_at: 2026-08-27
published_at: null
source_version: null
capture_scope: page
conversion: turndown-7.2.4
status: archived
license: null
canonical_id: github-self-hosted-runners
trust: untrusted
prompt_injection_reviewed_at: 2026-08-27
body_sha256: b9d0fc6e9ccaf19fe7755f17c8d3ab14a63b3239c872ff634288328e68a0bfe5
---

[Skip to main content](#main-content)

[GitHub Docs](/en)

Version: Free, Pro, & Team

Search or ask Copilot

Search or askCopilot

Select language: current language is English

Search or ask Copilot

Search or askCopilot

Open menu

Collapse sidebarExpand sidebar

Scroll breadcrumbs left

1.  [Home](/en "Home")
2.  [GitHub Actions](/en/actions "GitHub Actions")
3.  [Reference](/en/actions/reference "Reference")
4.  [Runners](/en/actions/reference/runners "Runners")
5.  [Self-hosted runners](/en/actions/reference/runners/self-hosted-runners "Self-hosted runners")

Scroll breadcrumbs right

## [GitHub Actions](/en/actions)

*   *   [](#)
        
*   Get started
    
    *   [Quickstart](/en/actions/get-started/quickstart)
        
    *   [Understand GitHub Actions](/en/actions/get-started/understand-github-actions)
        
    *   [Continuous integration](/en/actions/get-started/continuous-integration)
        
    *   [Continuous deployment](/en/actions/get-started/continuous-deployment)
        
    *   [Actions vs Apps](/en/actions/get-started/actions-vs-apps)
        
*   Concepts
    
    *   Workflows and actions
        
        *   [Workflows](/en/actions/concepts/workflows-and-actions/workflows)
            
        *   [Variables](/en/actions/concepts/workflows-and-actions/variables)
            
        *   [Contexts](/en/actions/concepts/workflows-and-actions/contexts)
            
        *   [Expressions](/en/actions/concepts/workflows-and-actions/expressions)
            
        *   [Reusing workflow configurations](/en/actions/concepts/workflows-and-actions/reusing-workflow-configurations)
            
        *   [Custom actions](/en/actions/concepts/workflows-and-actions/custom-actions)
            
        *   [Deployment environments](/en/actions/concepts/workflows-and-actions/deployment-environments)
            
        *   [Concurrency](/en/actions/concepts/workflows-and-actions/concurrency)
            
        *   [Workflow artifacts](/en/actions/concepts/workflows-and-actions/workflow-artifacts)
            
        *   [Dependency caching](/en/actions/concepts/workflows-and-actions/dependency-caching)
            
        *   [Notifications for workflow runs](/en/actions/concepts/workflows-and-actions/notifications-for-workflow-runs)
            
    *   Runners
        
        *   [GitHub-hosted runners](/en/actions/concepts/runners/github-hosted-runners)
            
        *   [Larger runners](/en/actions/concepts/runners/larger-runners)
            
        *   [Self-hosted runners](/en/actions/concepts/runners/self-hosted-runners)
            
        *   [Private networking](/en/actions/concepts/runners/private-networking)
            
        *   [Runner groups](/en/actions/concepts/runners/runner-groups)
            
        *   [Runner scale sets](/en/actions/concepts/runners/runner-scale-sets)
            
        *   [Actions Runner Controller](/en/actions/concepts/runners/actions-runner-controller)
            
        *   [Support for ARC](/en/actions/concepts/runners/support-for-arc)
            
    *   Security
        
        *   [Secrets](/en/actions/concepts/security/secrets)
            
        *   [GITHUB\_TOKEN](/en/actions/concepts/security/github_token)
            
        *   [OpenID Connect](/en/actions/concepts/security/openid-connect)
            
        *   [Artifact attestations](/en/actions/concepts/security/artifact-attestations)
            
        *   [Script injections](/en/actions/concepts/security/script-injections)
            
        *   [Compromised runners](/en/actions/concepts/security/compromised-runners)
            
        *   [Kubernetes admissions controller](/en/actions/concepts/security/kubernetes-admissions-controller)
            
    *   [Metrics](/en/actions/concepts/metrics)
        
    *   [Billing and usage](/en/actions/concepts/billing-and-usage)
        
*   How-tos
    
    *   Write workflows
        
        *   [Use workflow templates](/en/actions/how-tos/write-workflows/use-workflow-templates)
            
        *   Choose when workflows run
            
            *   [Trigger a workflow](/en/actions/how-tos/write-workflows/choose-when-workflows-run/trigger-a-workflow)
                
            *   [Control jobs with conditions](/en/actions/how-tos/write-workflows/choose-when-workflows-run/control-jobs-with-conditions)
                
            *   [Control workflow concurrency](/en/actions/how-tos/write-workflows/choose-when-workflows-run/control-workflow-concurrency)
                
        *   Choose where workflows run
            
            *   [Choose the runner for a job](/en/actions/how-tos/write-workflows/choose-where-workflows-run/choose-the-runner-for-a-job)
                
            *   [Run jobs in a container](/en/actions/how-tos/write-workflows/choose-where-workflows-run/run-jobs-in-a-container)
                
        *   Choose what workflows do
            
            *   [Use jobs](/en/actions/how-tos/write-workflows/choose-what-workflows-do/use-jobs)
                
            *   [Find and customize actions](/en/actions/how-tos/write-workflows/choose-what-workflows-do/find-and-customize-actions)
                
            *   [Use GitHub CLI](/en/actions/how-tos/write-workflows/choose-what-workflows-do/use-github-cli)
                
            *   [Add scripts](/en/actions/how-tos/write-workflows/choose-what-workflows-do/add-scripts)
                
            *   [Use secrets](/en/actions/how-tos/write-workflows/choose-what-workflows-do/use-secrets)
                
            *   [Use variables](/en/actions/how-tos/write-workflows/choose-what-workflows-do/use-variables)
                
            *   [Pass job outputs](/en/actions/how-tos/write-workflows/choose-what-workflows-do/pass-job-outputs)
                
            *   [Set default values for jobs](/en/actions/how-tos/write-workflows/choose-what-workflows-do/set-default-values-for-jobs)
                
            *   [Deploy to environment](/en/actions/how-tos/write-workflows/choose-what-workflows-do/deploy-to-environment)
                
            *   [Run job variations](/en/actions/how-tos/write-workflows/choose-what-workflows-do/run-job-variations)
                
    *   Reuse automations
        
        *   [Reuse workflows](/en/actions/how-tos/reuse-automations/reuse-workflows)
            
        *   [Create workflow templates](/en/actions/how-tos/reuse-automations/create-workflow-templates)
            
        *   [Share across private repositories](/en/actions/how-tos/reuse-automations/share-across-private-repositories)
            
        *   [Share with your organization](/en/actions/how-tos/reuse-automations/share-with-your-organization)
            
    *   Secure your work
        
        *   Use artifact attestations
            
            *   [Use artifact attestations](/en/actions/how-tos/secure-your-work/use-artifact-attestations/use-artifact-attestations)
                
            *   [Increase security rating](/en/actions/how-tos/secure-your-work/use-artifact-attestations/increase-security-rating)
                
            *   [Enforce artifact attestations](/en/actions/how-tos/secure-your-work/use-artifact-attestations/enforce-artifact-attestations)
                
            *   [Verify attestations offline](/en/actions/how-tos/secure-your-work/use-artifact-attestations/verify-attestations-offline)
                
            *   [Manage attestations](/en/actions/how-tos/secure-your-work/use-artifact-attestations/manage-attestations)
                
        *   Security harden deployments
            
            *   [OIDC in AWS](/en/actions/how-tos/secure-your-work/security-harden-deployments/oidc-in-aws)
                
            *   [OIDC in Azure](/en/actions/how-tos/secure-your-work/security-harden-deployments/oidc-in-azure)
                
            *   [OIDC in Google Cloud Platform](/en/actions/how-tos/secure-your-work/security-harden-deployments/oidc-in-google-cloud-platform)
                
            *   [OIDC in HashiCorp Vault](/en/actions/how-tos/secure-your-work/security-harden-deployments/oidc-in-hashicorp-vault)
                
            *   [OIDC in JFrog](/en/actions/how-tos/secure-your-work/security-harden-deployments/oidc-in-jfrog)
                
            *   [OIDC in Octopus Deploy](/en/actions/how-tos/secure-your-work/security-harden-deployments/oidc-in-octopus-deploy)
                
            *   [OIDC in PyPI](/en/actions/how-tos/secure-your-work/security-harden-deployments/oidc-in-pypi)
                
            *   [OIDC in cloud providers](/en/actions/how-tos/secure-your-work/security-harden-deployments/oidc-in-cloud-providers)
                
            *   [OIDC with reusable workflows](/en/actions/how-tos/secure-your-work/security-harden-deployments/oidc-with-reusable-workflows)
                
    *   Deploy
        
        *   Configure and manage deployments
            
            *   [Control deployments](/en/actions/how-tos/deploy/configure-and-manage-deployments/control-deployments)
                
            *   [View deployment history](/en/actions/how-tos/deploy/configure-and-manage-deployments/view-deployment-history)
                
            *   [Manage environments](/en/actions/how-tos/deploy/configure-and-manage-deployments/manage-environments)
                
            *   [Review deployments](/en/actions/how-tos/deploy/configure-and-manage-deployments/review-deployments)
                
            *   [Create custom protection rules](/en/actions/how-tos/deploy/configure-and-manage-deployments/create-custom-protection-rules)
                
            *   [Configure custom protection rules](/en/actions/how-tos/deploy/configure-and-manage-deployments/configure-custom-protection-rules)
                
        *   Deploy to third-party platforms
            
            *   [Node.js to Azure App Service](/en/actions/how-tos/deploy/deploy-to-third-party-platforms/nodejs-to-azure-app-service)
                
            *   [Python to Azure App Service](/en/actions/how-tos/deploy/deploy-to-third-party-platforms/python-to-azure-app-service)
                
            *   [Java to Azure App Service](/en/actions/how-tos/deploy/deploy-to-third-party-platforms/java-to-azure-app-service)
                
            *   [.NET to Azure App Service](/en/actions/how-tos/deploy/deploy-to-third-party-platforms/net-to-azure-app-service)
                
            *   [PHP to Azure App Service](/en/actions/how-tos/deploy/deploy-to-third-party-platforms/php-to-azure-app-service)
                
            *   [Docker to Azure App Service](/en/actions/how-tos/deploy/deploy-to-third-party-platforms/docker-to-azure-app-service)
                
            *   [Azure Static Web App](/en/actions/how-tos/deploy/deploy-to-third-party-platforms/azure-static-web-app)
                
            *   [Azure Kubernetes Service](/en/actions/how-tos/deploy/deploy-to-third-party-platforms/azure-kubernetes-service)
                
            *   [Amazon Elastic Container Service](/en/actions/how-tos/deploy/deploy-to-third-party-platforms/amazon-elastic-container-service)
                
            *   [Google Kubernetes Engine](/en/actions/how-tos/deploy/deploy-to-third-party-platforms/google-kubernetes-engine)
                
            *   [Sign Xcode applications](/en/actions/how-tos/deploy/deploy-to-third-party-platforms/sign-xcode-applications)
                
    *   Create and publish actions
        
        *   [Manage custom actions](/en/actions/how-tos/create-and-publish-actions/manage-custom-actions)
            
        *   [Create a CLI action](/en/actions/how-tos/create-and-publish-actions/create-a-cli-action)
            
        *   [Set exit codes](/en/actions/how-tos/create-and-publish-actions/set-exit-codes)
            
        *   [Publish in GitHub Marketplace](/en/actions/how-tos/create-and-publish-actions/publish-in-github-marketplace)
            
        *   [Release and maintain actions](/en/actions/how-tos/create-and-publish-actions/release-and-maintain-actions)
            
        *   [Use immutable releases](/en/actions/how-tos/create-and-publish-actions/using-immutable-releases-and-tags-to-manage-your-actions-releases)
            
    *   Manage workflow runs
        
        *   [Manually run a workflow](/en/actions/how-tos/manage-workflow-runs/manually-run-a-workflow)
            
        *   [Re-run workflows and jobs](/en/actions/how-tos/manage-workflow-runs/re-run-workflows-and-jobs)
            
        *   [Cancel a workflow run](/en/actions/how-tos/manage-workflow-runs/cancel-a-workflow-run)
            
        *   [Disable and enable workflows](/en/actions/how-tos/manage-workflow-runs/disable-and-enable-workflows)
            
        *   [Skip workflow runs](/en/actions/how-tos/manage-workflow-runs/skip-workflow-runs)
            
        *   [Delete a workflow run](/en/actions/how-tos/manage-workflow-runs/delete-a-workflow-run)
            
        *   [Download workflow artifacts](/en/actions/how-tos/manage-workflow-runs/download-workflow-artifacts)
            
        *   [Remove workflow artifacts](/en/actions/how-tos/manage-workflow-runs/remove-workflow-artifacts)
            
        *   [Manage caches](/en/actions/how-tos/manage-workflow-runs/manage-caches)
            
        *   [Approve runs from forks](/en/actions/how-tos/manage-workflow-runs/approve-runs-from-forks)
            
    *   Manage runners
        
        *   GitHub-hosted runners
            
            *   [Use GitHub-hosted runners](/en/actions/how-tos/manage-runners/github-hosted-runners/use-github-hosted-runners)
                
            *   [Customize runners](/en/actions/how-tos/manage-runners/github-hosted-runners/customize-runners)
                
            *   [View current jobs](/en/actions/how-tos/manage-runners/github-hosted-runners/view-current-jobs)
                
            *   Connect to a private network
                
                *   [Connect with OIDC](/en/actions/how-tos/manage-runners/github-hosted-runners/connect-to-a-private-network/connect-with-oidc)
                    
                *   [Connect with WireGuard](/en/actions/how-tos/manage-runners/github-hosted-runners/connect-to-a-private-network/connect-with-wireguard)
                    
        *   Self-hosted runners
            
            *   [Add runners](/en/actions/how-tos/manage-runners/self-hosted-runners/add-runners)
                
            *   [Run scripts](/en/actions/how-tos/manage-runners/self-hosted-runners/run-scripts)
                
            *   [Customize containers](/en/actions/how-tos/manage-runners/self-hosted-runners/customize-containers)
                
            *   [Configure the application](/en/actions/how-tos/manage-runners/self-hosted-runners/configure-the-application)
                
            *   [Apply labels](/en/actions/how-tos/manage-runners/self-hosted-runners/apply-labels)
                
            *   [Use in a workflow](/en/actions/how-tos/manage-runners/self-hosted-runners/use-in-a-workflow)
                
            *   [Manage access](/en/actions/how-tos/manage-runners/self-hosted-runners/manage-access)
                
            *   [Monitor and troubleshoot](/en/actions/how-tos/manage-runners/self-hosted-runners/monitor-and-troubleshoot)
                
            *   [Remove runners](/en/actions/how-tos/manage-runners/self-hosted-runners/remove-runners)
                
        *   Larger runners
            
            *   [Manage larger runners](/en/actions/how-tos/manage-runners/larger-runners/manage-larger-runners)
                
            *   [Control access](/en/actions/how-tos/manage-runners/larger-runners/control-access)
                
            *   [Use larger runners](/en/actions/how-tos/manage-runners/larger-runners/use-larger-runners)
                
            *   [Use custom images](/en/actions/how-tos/manage-runners/larger-runners/use-custom-images)
                
        *   Actions Runner Controller
            
            *   [Authenticate to the API](/en/actions/how-tos/manage-runners/use-actions-runner-controller/authenticate-to-the-api)
                
            *   [Deploy runner scale sets](/en/actions/how-tos/manage-runners/use-actions-runner-controller/deploy-runner-scale-sets)
                
            *   [Use ARC in a workflow](/en/actions/how-tos/manage-runners/use-actions-runner-controller/use-arc-in-a-workflow)
                
        *   [Use proxy servers](/en/actions/how-tos/manage-runners/use-proxy-servers)
            
    *   Monitor workflows
        
        *   [Use the visualization graph](/en/actions/how-tos/monitor-workflows/use-the-visualization-graph)
            
        *   [View workflow run history](/en/actions/how-tos/monitor-workflows/view-workflow-run-history)
            
        *   [View job execution time](/en/actions/how-tos/monitor-workflows/view-job-execution-time)
            
        *   [Add a status badge](/en/actions/how-tos/monitor-workflows/add-a-status-badge)
            
        *   [Use workflow run logs](/en/actions/how-tos/monitor-workflows/use-workflow-run-logs)
            
        *   [View job condition logs](/en/actions/how-tos/monitor-workflows/view-job-condition-logs)
            
        *   [Enable debug logging](/en/actions/how-tos/monitor-workflows/enable-debug-logging)
            
    *   [Troubleshoot workflows](/en/actions/how-tos/troubleshoot-workflows)
        
    *   Administer
        
        *   [View metrics](/en/actions/how-tos/administer/view-metrics)
            
    *   [Get support](/en/actions/how-tos/get-support)
        
*   Reference
    
    *   Workflows and actions
        
        *   [Workflow syntax](/en/actions/reference/workflows-and-actions/workflow-syntax)
            
        *   [Events that trigger workflows](/en/actions/reference/workflows-and-actions/events-that-trigger-workflows)
            
        *   [Workflow commands](/en/actions/reference/workflows-and-actions/workflow-commands)
            
        *   [Variables](/en/actions/reference/workflows-and-actions/variables)
            
        *   [Expressions](/en/actions/reference/workflows-and-actions/expressions)
            
        *   [Contexts](/en/actions/reference/workflows-and-actions/contexts)
            
        *   [Deployments and environments](/en/actions/reference/workflows-and-actions/deployments-and-environments)
            
        *   [Dependency caching](/en/actions/reference/workflows-and-actions/dependency-caching)
            
        *   [Reusing workflow configurations](/en/actions/reference/workflows-and-actions/reusing-workflow-configurations)
            
        *   [Metadata syntax](/en/actions/reference/workflows-and-actions/metadata-syntax)
            
        *   [Workflow cancellation](/en/actions/reference/workflows-and-actions/workflow-cancellation)
            
        *   [Dockerfile support](/en/actions/reference/workflows-and-actions/dockerfile-support)
            
    *   Runners
        
        *   [GitHub-hosted runners](/en/actions/reference/runners/github-hosted-runners)
            
        *   [Larger runners](/en/actions/reference/runners/larger-runners)
            
        *   [Self-hosted runners](/en/actions/reference/runners/self-hosted-runners)
            
    *   Security
        
        *   [Secure use](/en/actions/reference/security/secure-use)
            
        *   [Securely using pull\_request\_target](/en/actions/reference/security/securely-using-pull_request_target)
            
        *   [Secrets](/en/actions/reference/security/secrets)
            
        *   [OIDC](/en/actions/reference/security/oidc)
            
    *   [Limits](/en/actions/reference/limits)
        
    *   GitHub Actions Importer
        
        *   [Supplemental arguments and settings](/en/actions/reference/github-actions-importer/supplemental-arguments-and-settings)
            
        *   [Custom transformers](/en/actions/reference/github-actions-importer/custom-transformers)
            
*   Tutorials
    
    *   [Create an example workflow](/en/actions/tutorials/create-an-example-workflow)
        
    *   Build and test code
        
        *   [Go](/en/actions/tutorials/build-and-test-code/go)
            
        *   [Java with Ant](/en/actions/tutorials/build-and-test-code/java-with-ant)
            
        *   [Java with Gradle](/en/actions/tutorials/build-and-test-code/java-with-gradle)
            
        *   [Java with Maven](/en/actions/tutorials/build-and-test-code/java-with-maven)
            
        *   [.NET](/en/actions/tutorials/build-and-test-code/net)
            
        *   [Node.js](/en/actions/tutorials/build-and-test-code/nodejs)
            
        *   [PowerShell](/en/actions/tutorials/build-and-test-code/powershell)
            
        *   [Python](/en/actions/tutorials/build-and-test-code/python)
            
        *   [Ruby](/en/actions/tutorials/build-and-test-code/ruby)
            
        *   [Rust](/en/actions/tutorials/build-and-test-code/rust)
            
        *   [Swift](/en/actions/tutorials/build-and-test-code/swift)
            
        *   [Xamarin apps](/en/actions/tutorials/build-and-test-code/xamarin-apps)
            
    *   [Authenticate with GITHUB\_TOKEN](/en/actions/tutorials/authenticate-with-github_token)
        
    *   [Migrate to GitHub runners](/en/actions/tutorials/migrate-to-github-runners)
        
    *   Create actions
        
        *   [Create a JavaScript action](/en/actions/tutorials/create-actions/create-a-javascript-action)
            
        *   [Create a composite action](/en/actions/tutorials/create-actions/create-a-composite-action)
            
    *   Publish packages
        
        *   [Publish Docker images](/en/actions/tutorials/publish-packages/publish-docker-images)
            
        *   [Publish Java packages with Gradle](/en/actions/tutorials/publish-packages/publish-java-packages-with-gradle)
            
        *   [Publish Java packages with Maven](/en/actions/tutorials/publish-packages/publish-java-packages-with-maven)
            
        *   [Publish Node.js packages](/en/actions/tutorials/publish-packages/publish-nodejs-packages)
            
    *   Manage your work
        
        *   [Add labels to issues](/en/actions/tutorials/manage-your-work/add-labels-to-issues)
            
        *   [Close inactive issues](/en/actions/tutorials/manage-your-work/close-inactive-issues)
            
        *   [Add comments with labels](/en/actions/tutorials/manage-your-work/add-comments-with-labels)
            
        *   [Schedule issue creation](/en/actions/tutorials/manage-your-work/schedule-issue-creation)
            
    *   [Store and share data](/en/actions/tutorials/store-and-share-data)
        
    *   Use containerized services
        
        *   [Create a Docker container action](/en/actions/tutorials/use-containerized-services/create-a-docker-container-action)
            
        *   [Use Docker service containers](/en/actions/tutorials/use-containerized-services/use-docker-service-containers)
            
        *   [Create PostgreSQL service containers](/en/actions/tutorials/use-containerized-services/create-postgresql-service-containers)
            
        *   [Create Redis service containers](/en/actions/tutorials/use-containerized-services/create-redis-service-containers)
            
    *   Migrate to GitHub Actions
        
        *   Automated migrations
            
            *   [Use GitHub Actions Importer](/en/actions/tutorials/migrate-to-github-actions/automated-migrations/use-github-actions-importer)
                
            *   [Azure DevOps migration](/en/actions/tutorials/migrate-to-github-actions/automated-migrations/azure-devops-migration)
                
            *   [Bamboo migration](/en/actions/tutorials/migrate-to-github-actions/automated-migrations/bamboo-migration)
                
            *   [Bitbucket Pipelines migration](/en/actions/tutorials/migrate-to-github-actions/automated-migrations/bitbucket-pipelines-migration)
                
            *   [CircleCI migration](/en/actions/tutorials/migrate-to-github-actions/automated-migrations/circleci-migration)
                
            *   [GitLab migration](/en/actions/tutorials/migrate-to-github-actions/automated-migrations/gitlab-migration)
                
            *   [Jenkins migration](/en/actions/tutorials/migrate-to-github-actions/automated-migrations/jenkins-migration)
                
            *   [Travis CI migration](/en/actions/tutorials/migrate-to-github-actions/automated-migrations/travis-ci-migration)
                
        *   Manual migrations
            
            *   [Migrate from Azure Pipelines](/en/actions/tutorials/migrate-to-github-actions/manual-migrations/migrate-from-azure-pipelines)
                
            *   [Migrate from CircleCI](/en/actions/tutorials/migrate-to-github-actions/manual-migrations/migrate-from-circleci)
                
            *   [Migrate from GitLab CI/CD](/en/actions/tutorials/migrate-to-github-actions/manual-migrations/migrate-from-gitlab-cicd)
                
            *   [Migrate from Jenkins](/en/actions/tutorials/migrate-to-github-actions/manual-migrations/migrate-from-jenkins)
                
            *   [Migrate from Travis CI](/en/actions/tutorials/migrate-to-github-actions/manual-migrations/migrate-from-travis-ci)
                
    *   Actions Runner Controller
        
        *   [Get started](/en/actions/tutorials/use-actions-runner-controller/get-started)
            
        *   [Troubleshoot](/en/actions/tutorials/use-actions-runner-controller/troubleshoot)
            
    *   [Develop agentic workflows](/en/actions/tutorials/develop-agentic-workflows-in-github-actions)
        

# Self-hosted runners reference

Find information about setting up and using self-hosted runners.

Copy as Markdown

## In this article

*   [Requirements for self-hosted runner machines](#requirements-for-self-hosted-runner-machines)
*   [Routing precedence for self-hosted runners](#routing-precedence-for-self-hosted-runners)
*   [Autoscaling](#autoscaling)
*   [Communication](#communication)

## [Requirements for self-hosted runner machines](#requirements-for-self-hosted-runner-machines)

You can use a machine as a self-hosted runner as long as it meets these requirements:

*   You can install and run the self-hosted runner application on the machine. See [Supported operating systems](#supported-operating-systems) and [Supported processor architectures](#supported-processor-architectures).
*   The machine can communicate with GitHub Actions.
*   The machine has enough hardware resources for the type of workflows you plan to run. The self-hosted runner application itself only requires minimal resources.
*   If you want to run workflows that use Docker container actions or service containers, you must use a Linux machine and Docker must be installed.

### [Supported operating systems](#supported-operating-systems)

#### [Linux](#linux)

*   Red Hat Enterprise Linux 8 or later
*   CentOS 8 or later
*   Oracle Linux 8 or later
*   Fedora 29 or later
*   Debian 10 or later
*   Ubuntu 20.04 or later
*   Linux Mint 20 or later
*   openSUSE 15.2 or later
*   SUSE Enterprise Linux (SLES) 15 SP2 or later

#### [Windows](#windows)

*   Windows 10 64-bit
*   Windows 11 64-bit
*   Windows Server 2016 64-bit
*   Windows Server 2019 64-bit
*   Windows Server 2022 64-bit

#### [macOS](#macos)

*   macOS 11.0 (Big Sur) or later

### [Supported processor architectures](#supported-processor-architectures)

*   `x64` - Linux, macOS, Windows.
*   `ARM64` - Linux, macOS, Windows (currently in public preview).
*   `ARM32` - Linux.

## [Routing precedence for self-hosted runners](#routing-precedence-for-self-hosted-runners)

When routing a job to a self-hosted runner, GitHub looks for a runner that matches the job's `runs-on` labels and groups:

*   If GitHub finds an online and idle runner that matches the job's `runs-on` labels and groups, the job is then assigned and sent to the runner.
    *   If the runner doesn't pick up the assigned job within 60 seconds, the job is re-queued so that a new runner can accept it.
*   If GitHub doesn't find an online and idle runner that matches the job's `runs-on` labels and groups, then the job will remain queued until a runner comes online.
*   If the job remains queued for more than 24 hours, the job will fail.

## [Autoscaling](#autoscaling)

Autoscaling allows you to dynamically adjust the number of self-hosted runners based on demand. This helps optimize resource utilization and ensures sufficient runner capacity during peak times while reducing costs during periods of low activity. There are multiple approaches to implementing autoscaling for self-hosted runners, each with different trade-offs in terms of complexity, reliability, and responsiveness.

### [Actions Runner Controller](#actions-runner-controller)

GitHub-hosted runners inherently autoscale based on your needs. GitHub-hosted runners can be a low-maintenance and cost-effective alternative to developing or implementing autoscaling solutions. For more information, see [GitHub-hosted runners](/en/actions/concepts/runners/github-hosted-runners).

Actions Runner Controller (ARC) is the reference implementation of GitHub's scale set APIs and the recommended Kubernetes-based solution for autoscaling self-hosted runners. ARC provides a complete, production-ready autoscaling solution for teams running GitHub Actions in Kubernetes environments.

GitHub recommends ARC for organizations with Kubernetes infrastructure and teams that have Kubernetes expertise. ARC handles the full lifecycle of runners within your cluster, from provisioning to job execution to cleanup.

For more information, see [Actions Runner Controller](/en/actions/concepts/runners/actions-runner-controller) and [Support for Actions Runner Controller](/en/actions/concepts/runners/support-for-arc).

### [GitHub Actions Runner Scale Set Client](#github-actions-runner-scale-set-client)

The GitHub Actions Runner Scale Set Client is a standalone Go-based module that empowers platform teams, integrators, and infrastructure providers to build custom autoscaling solutions for GitHub Actions runners across VMs, containers, on-premise infrastructure, and cloud services, with support for Windows, Linux, and macOS platforms.

The client orchestrates GitHub API interactions for scale sets while leaving infrastructure provisioning to you. You define how runners are created, scaled, and destroyed, and configure runners with multiple labels for flexible job routing and targeting. This gives organizations granular control over runner lifecycle management and real-time telemetry for job execution.

The client is designed to work out of the box with basic configurations, allowing teams to quickly implement autoscaling. However, its true power lies in its flexibility—the client is built to be extended and customized to meet each organization's specific infrastructure requirements, compliance constraints, and operational workflows. Whether you need simple scaling logic or complex, multi-environment provisioning strategies, the client adapts to your needs.

The GitHub Actions Runner Scale Set Client is an open source project. The [actions/scaleset repository](https://github.com/actions/scaleset) contains the complete source code, comprehensive documentation, and practical examples to help you get started. You'll find implementation guides, sample configurations for various infrastructure scenarios, and reference architectures demonstrating how to integrate the client with different provisioning systems. The repository also includes contributing guidelines for teams interested in extending the client or sharing their autoscaling patterns with the community.

> **Note:** The Runner Scale Set Client is not a replacement for Actions Runner Controller (ARC), which remains the reference implementation of the scale set APIs and the recommended Kubernetes solution for autoscaling runners. Instead, the client is a complementary tool for interfacing with the same scale set APIs to build custom autoscaling solutions outside of Kubernetes.

### [Ephemeral runners for autoscaling](#ephemeral-runners-for-autoscaling)

GitHub recommends implementing autoscaling with ephemeral self-hosted runners; autoscaling with persistent self-hosted runners is not recommended. In certain cases, GitHub cannot guarantee that jobs are not assigned to persistent runners while they are shut down. With ephemeral runners, this can be guaranteed because GitHub only assigns one job to a runner.

This approach allows you to manage your runners as ephemeral systems, since you can use automation to provide a clean environment for each job. This helps limit the exposure of any sensitive resources from previous jobs, and also helps mitigate the risk of a compromised runner receiving new jobs.

Warning

The runner application log files for ephemeral runners must be forwarded to an external log storage solution for troubleshooting and diagnostic purposes. While it is not required for ephemeral runners to be deployed, GitHub recommends ensuring runner logs are forwarded and preserved externally before deploying an ephemeral runner autoscaling solution in a production environment. For more information, see [Monitoring and troubleshooting self-hosted runners](/en/actions/how-tos/manage-runners/self-hosted-runners/monitor-and-troubleshoot#reviewing-the-self-hosted-runner-application-log-files).

To add an ephemeral runner to your environment, include the `--ephemeral` parameter when registering your runner using `config.sh`. For example:

```shell
./config.sh --url https://github.com/octo-org --token example-token --ephemeral
```

The GitHub Actions service will then automatically de-register the runner after it has processed one job. You can then create your own automation that wipes the runner after it has been de-registered.

Note

If a job is labeled for a certain type of runner, but none matching that type are available, the job does not immediately fail at the time of queueing. Instead, the job will remain queued until the 24 hour timeout period expires.

Alternatively, you can create ephemeral, just-in-time runners using the REST API. For more information, see [REST API endpoints for self-hosted runners](/en/rest/actions/self-hosted-runners).

### [Runner software updates on self-hosted runners](#runner-software-updates-on-self-hosted-runners)

By default, self-hosted runners will automatically perform a software update whenever a new version of the runner software is available. If you use ephemeral runners in containers then this can lead to repeated software updates when a new runner version is released. Turning off automatic updates allows you to update the runner version on the container image directly on your own schedule.

To turn off automatic software updates and install software updates yourself, specify the `--disableupdate` flag when registering your runner using `config.sh`. For example:

```shell
./config.sh --url https://github.com/YOUR-ORGANIZATION --token EXAMPLE-TOKEN --disableupdate
```

If you disable automatic updates, you must still update your runner version regularly. New functionality in GitHub Actions requires changes in both the GitHub Actions service _and_ the runner software. The runner may not be able to correctly process jobs that take advantage of new features in GitHub Actions without a software update.

If you disable automatic updates, you will be required to update your runner version within 30 days of a new version being made available. You may want to subscribe to notifications for releases in the [`actions/runner` repository](https://github.com/actions/runner/releases). For more information, see [Configuring notifications](/en/subscriptions-and-notifications/get-started/configuring-notifications#about-custom-notifications).

For instructions on how to install the latest runner version, see the installation instructions for [the latest release](https://github.com/actions/runner/releases).

Warning

Any updates released for the software, including major, minor, or patch releases, are considered as an available update. If you do not perform a software update within 30 days, the GitHub Actions service will not queue jobs to your runner. In addition, if a critical security update is required, the GitHub Actions service will not queue jobs to your runner until it has been updated.

### [Webhooks for autoscaling](#webhooks-for-autoscaling)

You can create your own autoscaling environment by using payloads received from the [`workflow_job`](/en/webhooks/webhook-events-and-payloads#workflow_job) webhook. This webhook is available at the repository, organization, and enterprise levels, and the payload for this event contains an `action` key that corresponds to the stages of a workflow job's life-cycle; for example when jobs are `queued`, `in_progress`, and `completed`. You must then create your own scaling automation in response to these webhook payloads.

*   For more information about the `workflow_job` webhook, see [Webhook events and payloads](/en/webhooks/webhook-events-and-payloads#workflow_job).
*   To learn how to work with webhooks, see [Webhooks documentation](/en/webhooks).

> **Note:** This approach relies on the timeliness of webhook delivery for making scaling decisions, which can introduce delays and reliability concerns. Consider using Actions Controller or the Scale Set Client for larger volume autoscaling scenarios.

### [Authentication requirements](#authentication-requirements)

You can register and delete repository and organization self-hosted runners using [the API](/en/rest/actions/self-hosted-runners). To authenticate to the API, your autoscaling implementation can use an access token or a GitHub app.

Your access token will require the following scope:

*   For private repositories, use an access token with the [`repo` scope](/en/apps/oauth-apps/building-oauth-apps/scopes-for-oauth-apps#available-scopes).
*   For public repositories, use an access token with the [`public_repo` scope](/en/apps/oauth-apps/building-oauth-apps/scopes-for-oauth-apps#available-scopes).
*   For organizations, use an access token with the [`admin:org` scope](/en/apps/oauth-apps/building-oauth-apps/scopes-for-oauth-apps#available-scopes).

To authenticate using a GitHub App, it must be assigned the following permissions:

*   For repositories, assign the `administration` permission.
*   For organizations, assign the `organization_self_hosted_runners` permission.

You can register and delete enterprise self-hosted runners using [the API](/en/rest/actions/self-hosted-runners). To authenticate to the API, your autoscaling implementation can use an access token.

Your access token will require the `manage_runners:enterprise` scope.

## [Communication](#communication)

Self-hosted runners connect to GitHub to receive job assignments and download new versions of the runner application.

The GitHub Actions runner application is open source. You can contribute and file issues in the [runner](https://github.com/actions/runner) repository. When a new version is released, the runner application automatically updates itself when a job is assigned to the runner, or within a week of release if the runner hasn't been assigned any jobs.

### [Requirements for communication with GitHub](#requirements-for-communication-with-github)

*   The self-hosted runner application must be running on the host machine to accept and run GitHub Actions jobs.
*   The host machine must have appropriate network access with at least 70 kilobits per second upload and download speed.
*   The host machine must be able to make outbound HTTPS connections over port 443.
*   Depending on the function of the workflows assigned to your self-hosted runner, the host machine must be able to communicate with the GitHub domains listed below.

### [Accessible domains by function](#accessible-domains-by-function)

Note

Some of the domains listed are configured using `CNAME` records. Some firewalls might require you to add rules recursively for all `CNAME` records. Note that the `CNAME` records might change in the future, and that only the domains listed will remain constant.

**Needed for essential operations:**

Shell

github.com
api.github.com
\*.actions.githubusercontent.com

```shell
github.com
api.github.com
*.actions.githubusercontent.com
```

**Needed for downloading actions:**

Shell

codeload.github.com

```shell
codeload.github.com
```

**Needed for uploading/downloading job summaries, logs, workflow artifacts, and caches:**

Shell

results-receiver.actions.githubusercontent.com
\*.blob.core.windows.net

```shell
results-receiver.actions.githubusercontent.com
*.blob.core.windows.net
```

**Needed for runner version updates:**

Shell

objects.githubusercontent.com
objects-origin.githubusercontent.com
github-releases.githubusercontent.com
github-registry-files.githubusercontent.com

```shell
objects.githubusercontent.com
objects-origin.githubusercontent.com
github-releases.githubusercontent.com
github-registry-files.githubusercontent.com
```

**Needed for retrieving OIDC tokens:**

Shell

\*.actions.githubusercontent.com

```shell
*.actions.githubusercontent.com
```

**Needed for downloading or publishing packages or containers to GitHub Packages:**

Shell

\*.pkg.github.com
pkg-containers.githubusercontent.com
ghcr.io

```shell
*.pkg.github.com
pkg-containers.githubusercontent.com
ghcr.io
```

**Needed for Git Large File Storage**

Shell

github-cloud.githubusercontent.com
github-cloud.s3.amazonaws.com

```shell
github-cloud.githubusercontent.com
github-cloud.s3.amazonaws.com
```

**Needed for jobs for Dependabot updates**

Shell

dependabot-actions.githubapp.com

```shell
dependabot-actions.githubapp.com
```

**Needed for downloading release assets:**

Shell

release-assets.githubusercontent.com

```shell
release-assets.githubusercontent.com
```

**Needed for VNet:**

Shell

api.snapcraft.io
\*.core.windows.net

```shell
api.snapcraft.io
*.core.windows.net
```

In addition, your workflow may require access to other network resources.

If you use an IP address allow list for your GitHub organization or enterprise account, you must add your self-hosted runner's IP address to the allow list. See [Managing allowed IP addresses for your organization](/en/enterprise-cloud@latest/organizations/keeping-your-organization-secure/managing-allowed-ip-addresses-for-your-organization#using-github-actions-with-an-ip-allow-list) or [Enforcing policies for security settings in your enterprise](/en/enterprise-cloud@latest/admin/policies/enforcing-policies-for-your-enterprise/enforcing-policies-for-security-settings-in-your-enterprise) in the GitHub Enterprise Cloud documentation.

## Help and support

### Did you find what you needed?

 Yes No

[Privacy policy](/en/site-policy/privacy-policies/github-privacy-statement)

### Help us make these docs great!

All GitHub docs are open source. See something that's wrong or unclear? Submit a pull request.

[Make a contribution](https://github.com/github/docs/blob/main/content/actions/reference/runners/self-hosted-runners.md)

[Learn how to contribute](/contributing)

### Still need help?

[Ask the GitHub community](https://github.com/orgs/community/discussions)

[Contact support](https://support.github.com)

## Legal

*   © 2026 GitHub, Inc.
*   [Terms](/en/site-policy/github-terms/github-terms-of-service)
*   [Privacy](/en/site-policy/privacy-policies/github-privacy-statement)
*   [Status](https://www.githubstatus.com/)
*   [Pricing](https://github.com/pricing)
*   [Expert services](https://services.github.com)
*   [Blog](https://github.blog)
