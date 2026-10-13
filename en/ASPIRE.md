# ASPIRE

Companion guidance extracted from the SDLC document.

This file is the focused reference for optional Aspire development, testing, preview environments, deployment, networking, lifecycle, secrets, AI integrations, and observability.
Use [WORKSPACES.md](WORKSPACES.md) for the composable team workflow and acceptance exercises.

## Aspire local development and runtime observability

Aspire is optional.

Use it when the project has multiple services, dependencies, containers, or
processes that need one local development loop.

Aspire is not a required framework. The project may use another local
orchestration tool with the same responsibilities.

### Goals

The local orchestration layer should provide:

- one command to start the local system;
- dependency ordering;
- resource health;
- endpoint discovery;
- console logs;
- structured logs;
- distributed traces;
- resource restart;
- bounded shutdown;
- local test integration;
- agent-readable diagnostics.

Working software must remain the primary goal.

The orchestration layer must not hide application failures.

### Setup

When the project uses Aspire, install the project-approved Aspire CLI version.
Confirm that the installed version supports each command in this guide.

For an existing Aspire project, use this command only when the installed Aspire version supports it:

```sh
aspire agent init
```

For non-interactive setup, use this command only when the installed version supports these options:

```sh
aspire agent init \
  --non-interactive \
  --skills all \
  --skill-locations standard
```

Use the project-supported agent location.

Do not install skills globally unless the team requires global availability.

The official Aspire workflow bundle includes:

- `aspire`;
- `aspire-init`;
- `aspire-orchestration`;
- `aspire-monitoring`;
- `aspire-deployment`;
- `aspireify`.

Use the top-level `aspire` skill when the correct workflow is unclear.

Use `aspire-orchestration` for lifecycle operations.

Use `aspire-monitoring` for logs, traces, metrics, and runtime diagnosis.

Use `aspireify` when adding Aspire to an existing codebase.

See the [official Aspire skills documentation](https://aspire.dev/get-started/aspire-skills/).

### Aspire MCP setup

Use Aspire skills to teach agents the workflow.

Use Aspire MCP when agents need live information from a running application.

Start the MCP server with this command only when the installed version supports it:

```sh
aspire agent mcp
```

For Claude Code or other MCP clients, the project may use this configuration:

```json
{
  "mcpServers": {
    "aspire": {
      "command": "aspire",
      "args": [
        "agent",
        "mcp"
      ]
    }
  }
}
```

For VS Code, use the client-specific `servers` configuration.

The project must generate or validate the configuration with this command only when the installed version supports it:

```sh
aspire agent init
```

The Aspire MCP server uses local STDIO communication.

It does not open a network listener.

It is a development-time tool.

Do not expose it through a public endpoint.

See the [official Aspire MCP documentation](https://aspire.dev/get-started/aspire-mcp-server/).

### Agent observability loop

When an agent works on a running local system, use this order:

1. List AppHosts.
2. Select the correct AppHost.
3. List resources.
4. Check resource state and health.
5. Discover the target endpoint.
6. Reproduce the behavior.
7. Read console logs.
8. Read structured logs.
9. Find the related distributed trace.
10. Read structured logs for that trace.
11. Form one diagnosis.
12. Change the smallest relevant boundary.
13. Reproduce the behavior again.
14. Confirm the fix with tests.
15. Record the evidence.

Do not start by changing code.

First inspect the running system.

### Aspire MCP tools

The agent should use the following tools when available:

- `list_apphosts`;
- `select_apphost`;
- `list_resources`;
- `list_console_logs`;
- `list_structured_logs`;
- `list_traces`;
- `list_trace_structured_logs`;
- `execute_resource_command`;
- `doctor`;
- `list_integrations`;
- `get_integration_docs`;
- `search_docs`;
- `get_doc`.

Use bounded queries.

Request only the resource, time range, or trace needed for the current issue.

Large logs and traces may be truncated.

Save relevant evidence locally when the project permits it.

Do not paste complete logs into Linear.

### Log and trace investigation

For a failing request, record:

- resource;
- endpoint;
- request or correlation identifier;
- timestamp;
- resource state;
- health state;
- relevant console log lines;
- relevant structured log fields;
- trace identifier;
- failing span;
- error type;
- duration;
- retry count;
- suspected cause;
- confirmed cause.

Use the trace to follow the request across process boundaries.

Use structured logs to identify the operation and state transition.

Use console logs to diagnose startup, shutdown, and process failures.

### Resource design

Every resource should define:

- stable resource name;
- process or container command;
- arguments;
- environment variables;
- working directory;
- dependencies;
- readiness check;
- health check;
- endpoint;
- startup timeout;
- shutdown timeout;
- log behavior;
- failure behavior.

The AppHost must declare the resource graph.

The application must own application behavior.

Do not place business rules in the orchestration layer.

### Local development loop

The project should define these commands:

```sh
<start-command>
<status-command>
<logs-command>
<traces-command>
<restart-command>
<stop-command>
<focused-test-command>
<full-quality-command>
```

The commands may use Aspire CLI, Aspire MCP, project scripts, or another local
tool.

The project must document:

- how to start the system;
- how to wait for readiness;
- how to find endpoints;
- how to inspect logs;
- how to inspect traces;
- how to restart one resource;
- how to stop the system;
- how to recover from stale processes;
- how to recover from port conflicts;
- how to reset disposable data;
- how to preserve required local data;
- how to run tests against the local system.

### Browser and API handoff

When a UI test needs a running resource:

1. Use orchestration tools to discover the endpoint.
2. Record the endpoint and resource name.
3. Use the browser or API test tool.
4. Record the route, selector, request, and expected state.
5. Use logs and traces when the test fails.
6. Convert the stable flow into an automated test.
7. Store the test trace in the project test documentation.

Do not hard-code dynamic ports unless the project contract requires them.

### Security

By default, runtime data may include:

- resource metadata;
- console logs;
- structured logs;
- distributed traces;
- endpoint information.

Exclude sensitive resources from MCP access when required.

Use the platform-supported resource exclusion mechanism.

Do not expose:

- credentials;
- tokens;
- private user data;
- candidate data;
- production data;
- secret environment variables;
- sensitive request bodies.

Treat logs and traces as project data.

Define their retention and redaction rules.

### Validation

The local orchestration setup is valid when:

- the AppHost or equivalent starts;
- dependencies reach readiness;
- endpoints are discoverable;
- one API request succeeds;
- one browser flow succeeds when applicable;
- logs are available;
- a trace is available when telemetry is configured;
- one resource can restart;
- shutdown leaves no orphan process;
- focused tests pass;
- the complete local quality gate passes.

Record missing telemetry as an explicit limitation.

Do not claim trace coverage when the application does not emit traces.

### Aspire testing and ephemeral environments

Aspire testing is optional. Use it when the AppHost can create a realistic local dependency graph or a disposable preview environment.

Use `Aspire.Hosting.Testing` and `DistributedApplicationTestingBuilder` for functional and integration tests. Create one AppHost per test suite when tests can share isolated resources safely. Dispose it at suite completion. Creating the AppHost for every test adds startup and container cost.

Use the documented resource-access APIs to obtain dynamic endpoints, connection strings, resource state, and logs. Do not hard-code ports or discover them through process output.

Create a local ephemeral environment when the test needs real dependencies. Use disposable volumes, unique resource names, test-only credentials, bounded startup timeouts, and cleanup after the suite. Reset state between tests when sharing the AppHost.

Create a published ephemeral preview environment when browser or external integration tests need a routable endpoint. Use `aspire publish` to create target artifacts, then use the approved deployment target or pipeline to apply them. Add a unique environment identifier, branch or commit metadata, a time-to-live, disposable data, an authentication boundary, and an automatic cleanup step.

A published AppHost is not automatically a preview environment. The deployment target must provide isolation, endpoint exposure, secret injection, data cleanup, observability, and deletion. Record the target-specific command and version.

The preview gate must wait for readiness, run API contract tests, run browser smoke tests when applicable, verify logs and traces, publish bounded artifacts, and delete the environment after the TTL or failed cleanup retry. Never use production data in a preview environment.

In CI, use a runner with a supported container runtime. Aspire documentation states that GitHub-hosted Linux runners are suitable for Linux test containers, while hosted Windows and macOS runners require a configured self-hosted container runtime for this use case.

Further guidance:

- [Manage the AppHost in tests](https://aspire.dev/testing/manage-app-host/)
- [Access resources in tests](https://aspire.dev/testing/accessing-resources/)
- [Advanced testing scenarios](https://aspire.dev/testing/advanced-scenarios/)
- [Testing in CI/CD pipelines](https://aspire.dev/testing/testing-in-ci/)

### Aspire watch, hot reload, and rebuild control

Use the AppHost watch and hot-reload features for inner-loop changes when the selected resource supports them. Keep the AppHost process running while application code reloads. Do not rebuild or recreate every resource after a source-only change.

Separate changes into three classes:

- application source changes: reload or restart only the affected project or process;
- AppHost topology changes: rebuild the AppHost and reconcile the resource graph;
- image, package, toolchain, or infrastructure changes: rebuild the affected artifact and rerun the required readiness and smoke checks.

Keep databases and other stateful resources persistent during the inner loop when the test does not require a clean state. Use explicit reset tasks for schema, seed data, and volumes. Use a clean ephemeral environment for release and compatibility validation.

Make watch behavior visible in named tasks. The task must report whether it reused the AppHost, restarted a resource, rebuilt an image, or recreated the environment. Avoid nested watchers that compete for the same files or ports.

Use separate tasks for `dev:watch`, `dev:restart`, `dev:rebuild`, and `dev:clean`. The rebuild and clean tasks must require explicit confirmation or a disposable target.

See [Aspire Hot Reload and watch](https://aspire.dev/app-host/hot-reload-and-watch/).

### Aspire networking, service discovery, and local HTTPS

Model service dependencies with Aspire references. Use `WithReference` or its language-equivalent integration to provide endpoint and configuration data to consumers. Resolve endpoints from the consuming network context.

Keep host, container, and public endpoints distinct. Aspire documents different network contexts for localhost, the container bridge network, and the public internet. A URL that works on the host may not work inside a container.

Use YARP when the local system needs one HTTPS entry point, path routing, static files, or a proxy boundary. Give the gateway a stable local hostname and certificate mapping, such as `https://interview.mensetsukan.localhost:15180/`, only after verifying the certificate, port, route, and backend health.

Do not treat a local hostname as proof of production ingress behavior. Test the same route contract through the deployed ingress or gateway.

Further guidance:

- [Aspire networking overview](https://aspire.dev/fundamentals/networking-overview/)
- [Aspire service discovery](https://aspire.dev/fundamentals/service-discovery/)
- [Aspire container networking](https://aspire.dev/fundamentals/container-networking/)
- [Aspire YARP integration](https://aspire.dev/integrations/reverse-proxies/yarp/)

### Aspire lifecycle, pipelines, and health gates

Use lifecycle dependencies for setup and readiness. A migration, seed, or setup resource must finish successfully before dependent application resources receive traffic. Keep migrations idempotent and make seed data deterministic.

Use Aspire pipelines for explicit build, provision, migration, deploy, smoke-test, and notification steps. Give each step a stable name and declared dependencies. Keep deployment-specific steps in the deployment pipeline, not in application startup.

Use readiness checks to decide when a resource can receive traffic. Use liveness checks to decide when a process should restart. Do not use a liveness check as a readiness check. Health responses must not disclose credentials, tokens, or private data.

Further guidance:

- [Aspire pipelines](https://aspire.dev/deployment/pipelines/)
- [Aspire app lifecycle](https://aspire.dev/deployment/app-lifecycle/)
- [Aspire health checks](https://aspire.dev/fundamentals/health-checks/)

### Aspire dev containers and AI integrations

Use a local Dev Container or a remote Codespace when the project needs a reproducible development shell, container runtime, or onboarding path. Record which host capabilities remain outside the container, such as Docker socket access, browser access, GPU access, certificates, and cloud credentials.

Use the Aspire Ollama integration for local or private model serving. Use the OpenAI integration when the project accepts a hosted provider boundary. Keep provider credentials outside the AppHost source and bind them through approved secret injection.

Ollama can also provide a local endpoint for Claude Code. Treat that endpoint as a local model boundary and test model availability, request limits, tool permissions, and failure behavior.

Further guidance:

- [Aspire Dev Containers](https://aspire.dev/get-started/dev-containers/)
- [Aspire Ollama integration](https://aspire.dev/integrations/ai/ollama/ollama-get-started/)
- [Aspire OpenAI integration](https://aspire.dev/integrations/ai/openai/openai-get-started/)
- [Ollama Claude Code integration](https://docs.ollama.com/integrations/claude-code)

### Aspire custom hosting, secure communication, and Seq

Create a custom hosting integration when a resource has a stable lifecycle, configuration contract, health behavior, and endpoint model that should be reusable. Keep the integration thin. Do not hide deployment-specific behavior behind a generic resource name.

Use the documented secure-communication integration points for TLS, certificates, trust stores, and endpoint bindings. Test certificate rotation, hostname validation, expired certificates, and failed trust separately.

Use Seq as an optional local structured-log sink. Keep application logs structured and vendor-neutral. Verify that sensitive fields are redacted before logs reach Seq or any remote sink.

Further guidance:

- [Aspire custom hosting integrations](https://aspire.dev/integrations/custom-integrations/hosting-integrations/)
- [Aspire secure communication](https://aspire.dev/integrations/custom-integrations/secure-communication/)
- [Aspire Seq integration](https://aspire.dev/integrations/observability/seq/seq-get-started/)

### Secrets with SOPS

Use SOPS to encrypt configuration values at rest. Prefer age identities for a small repository team, or the approved cloud KMS identity for controlled deployment environments. SOPS supports offline identities and cloud KMS integrations.

Keep encrypted files separate from generated plaintext. Decrypt only into a process environment, a short-lived file with restrictive permissions, or the target secret manager. Do not pass secrets through command-line arguments, task names, logs, traces, screenshots, prompts, or browser URLs.

For local Aspire, decrypt only the development secret set and inject it through the approved environment or AppHost parameter path. For CI, use workload identity or the CI secret store to access the SOPS key. For deployed environments, decrypt in the deployment boundary or convert the values into the provider secret manager. Do not copy a production plaintext secret into the repository or preview artifact.

Review `.sops.yaml`, key groups, creation rules, identity access, rotation, revocation, and recovery. Test that a developer, CI job, and deployment identity can access only the intended environment.

See [SOPS](https://getsops.io/).

## Deployment pathways

Keep the AppHost or equivalent resource graph as the source of local topology. Keep production deployment decisions explicit. A deployment path must state its target, image or executable source, configuration inputs, secret source, network boundary, persistence model, health checks, rollback method, and observability destination.

Use the simplest target that satisfies the product requirement:

- Use a local OCI runtime for development and deterministic integration tests.
- Use one host with an OCI runtime, a reverse proxy, and a service manager when one machine is sufficient. Use systemd, launchd, or the supported Windows service manager for restart and shutdown.
- Use Docker Compose or another generated compose format for a small multi-service deployment. Validate the generated file before applying it.
- Use Kubernetes when the system needs scheduling, replicas, rolling updates, workload identity, multi-node capacity, or a standard cluster control plane.
- Use a managed cloud platform when the team needs provider-managed networking, identity, scaling, backups, or compliance controls.
- Use a private VPC or bare-metal cluster when data locality, network isolation, hardware control, or offline operation requires it.

When the selected Aspire target supports deployment, use the project-approved `aspire publish` or `aspire deploy` flow. When it does not, use the published artifacts with the target platform tooling. Do not assume that one AppHost command supports every target or every Aspire version. Record the exact Aspire version and target integration in the deployment specification.

### Kubernetes pathway

Treat Kubernetes manifests, Helm charts, or operators as deployment artifacts. Generate them from the AppHost only when the generator supports the required resource types. Otherwise write a small explicit chart or manifest set that preserves the AppHost contract.

Validate manifests against the target Kubernetes version. Run a server-side dry run, policy checks, image and secret reference checks, and a disposable-cluster smoke test before production. Use readiness, liveness, startup, and shutdown behavior that matches the application contract. Keep persistent volumes and migrations explicit. Never place production credentials in a manifest or image.

Deploy through a controlled identity and a recorded context. Use a namespace or equivalent environment boundary. Prefer progressive rollout, observable health gates, and an explicit rollback command. Keep `kubectl`, Helm, and cluster versions pinned through mise or the approved runner image.

### Cloud and simple-host pathway

For a simple host, publish an OCI image or a self-contained executable. Configure a service manager, TLS termination, firewall rules, backups, log rotation, health checks, and a rollback directory or image tag. Test restart after host reboot and loss of a dependency.

For cloud deployment, choose provider-native compute that matches the workload. Examples include Azure Container Apps, Azure App Service, or AKS; Google Cloud Run, GKE, or Compute Engine; and Amazon ECS, EKS, or EC2. Use provider deployment tooling when the Aspire integration does not cover the target. Keep the AppHost resource names, environment contract, health paths, and dependency rules consistent across targets.

Use workload identity or managed identity where the platform supports it. Keep secrets in the provider secret manager. Use private networking for internal dependencies. Restrict ingress and egress. Define data residency, retention, backup, recovery, and deletion rules before deployment.

## Rancher Desktop for local container and Kubernetes workflows

Rancher Desktop is a local development and test environment. It is not a production cluster. It can provide a Docker-compatible Moby engine or containerd with `nerdctl`. Only one container runtime is active at a time, and images and containers are not shared when the runtime changes.

Use the Docker-compatible runtime when project tasks call `docker` or Docker Compose. Use containerd and `nerdctl` only when the repository documents that interface. Enable local Kubernetes only when a test needs Kubernetes behavior. Pin the Kubernetes version and record the runtime, Kubernetes context, CPU architecture, memory, and disk allocation in the test evidence.

Run the same `mise run` tasks against Rancher Desktop as against the other supported OCI runtimes. Pull required images before time-limited tests. Keep local image stores and disposable volumes separate from production data. Stop workloads after tests and verify that no orphan process or cluster resource remains.

Do not treat Rancher Desktop availability as proof that a remote Kubernetes deployment works. Follow local acceptance with a disposable remote-cluster or staging acceptance test.

## Online testability and observability

A deployment is testable online when an external test runner can discover its endpoint, authenticate with a disposable identity, execute a safe journey, correlate the request with a trace identifier, observe logs and metrics, and report a bounded result. Use a dedicated preview or staging environment. Do not run acceptance tests against production data.

Expose separate readiness and liveness behavior. Keep health endpoints free of secrets. Return a correlation identifier or trace context for each test request. Test startup, dependency failure, timeout, retry, authorization failure, migration failure, graceful shutdown, and rollback. Use API tests for contract behavior and Playwright for browser behavior.

Prefer OpenTelemetry SDKs and the OpenTelemetry Collector as the application boundary. Export OTLP from the application to a local sidecar, node agent, or private gateway. The collector can redact, batch, sample, retry, route, and export telemetry without coupling application code to one vendor.

### Provider defaults

- Azure: use Azure Monitor with Application Insights and Log Analytics. Use the Azure Monitor OpenTelemetry distribution or OTLP ingestion according to the supported language and runtime. Store the connection string or endpoint in a secret store or environment binding. Verify traces, metrics, exceptions, and structured logs in Application Insights and query retained logs in Log Analytics.
- Google Cloud: use Cloud Logging, Cloud Monitoring, and Cloud Trace. Prefer OpenTelemetry with a collector and OTLP for vendor-neutral application code. Route telemetry through the Google-built collector, Ops Agent, or the platform-supported collector path. Verify log entries, metrics, trace spans, and alert conditions in Google Cloud Observability.
- AWS: use CloudWatch Logs, CloudWatch Metrics, Application Signals, and AWS X-Ray as the managed destinations. Use the CloudWatch agent, AWS Distro for OpenTelemetry, or an upstream or custom OpenTelemetry Collector according to language and platform support. Verify service metrics, logs, traces, and alarms in the selected AWS console.

Provider defaults are convenience paths. They do not replace the application telemetry contract. Keep resource names, service names, deployment version, environment, region, and correlation identifiers consistent across providers.

### VPC and bare-metal pathway

For a private VPC or bare-metal host, run an OpenTelemetry Collector inside the trusted network. Use mTLS or another approved transport between applications and the collector. Restrict collector receivers to the application network. Permit only the required egress to the telemetry backend. Do not expose an OTLP receiver directly to the public internet.

Choose a collector topology that matches failure and scale needs: a sidecar for strong workload isolation, a node or host agent for local collection, or a gateway for centralized routing. Configure bounded queues, retries, backpressure, disk buffering when allowed, sampling, redaction, and a defined behavior when the backend is unavailable. The application must remain safe when telemetry export fails.

A custom backend may use OpenTelemetry-compatible storage and analysis tools. Document the receiver, processors, exporters, dashboards, alerts, retention, access control, backup, and deletion lifecycle. Test the path without sending private or production data. Keep raw diagnostic access restricted and return compact summaries to agents.

## Deployment validation and rollback

Every deployment path must expose named mise tasks such as `deploy:validate`, `deploy:publish`, `deploy:apply`, `deploy:smoke`, `deploy:observe`, and `deploy:rollback`. Keep destructive or production tasks protected by an explicit environment and human approval.

The deployment gate must:

- build from a pinned toolchain;
- validate configuration and generated artifacts;
- scan dependencies and images according to policy;
- deploy to a disposable or staging target;
- run API and browser smoke tests;
- verify health, logs, metrics, and traces;
- record the version, target, endpoint, commit, test result, and artifact links;
- roll back to the last known-good version when a health gate fails.

The evidence must show both application success and platform success. A successful image push or deployment command is not proof that users can reach the application.

## References

Use the official Aspire documentation for setup and current command behavior. Aspire documentation can change by version. Confirm the command and options against the installed version.

- [Aspire skills](https://aspire.dev/get-started/aspire-skills/)
- [Aspire MCP server](https://aspire.dev/get-started/aspire-mcp-server/)

Aspire documentation states that Aspire MCP can expose resource state, console logs, structured logs, distributed traces, and resource commands to local AI agents. Confirm this behavior for the installed version.

- [Manage the AppHost in tests](https://aspire.dev/testing/manage-app-host/)
- [Access resources in tests](https://aspire.dev/testing/accessing-resources/)
- [Advanced testing scenarios](https://aspire.dev/testing/advanced-scenarios/)
- [Testing in CI/CD pipelines](https://aspire.dev/testing/testing-in-ci/)
- [Aspire Hot Reload and watch](https://aspire.dev/app-host/hot-reload-and-watch/)
- [Aspire networking overview](https://aspire.dev/fundamentals/networking-overview/)
- [Aspire service discovery](https://aspire.dev/fundamentals/service-discovery/)
- [Aspire container networking](https://aspire.dev/fundamentals/container-networking/)
- [Aspire YARP integration](https://aspire.dev/integrations/reverse-proxies/yarp/)
- [Aspire pipelines](https://aspire.dev/deployment/pipelines/)
- [Aspire app lifecycle](https://aspire.dev/deployment/app-lifecycle/)
- [Aspire health checks](https://aspire.dev/fundamentals/health-checks/)
- [Aspire Dev Containers](https://aspire.dev/get-started/dev-containers/)
- [Aspire Ollama integration](https://aspire.dev/integrations/ai/ollama/ollama-get-started/)
- [Aspire OpenAI integration](https://aspire.dev/integrations/ai/openai/openai-get-started/)
- [Ollama Claude Code integration](https://docs.ollama.com/integrations/claude-code)
- [Aspire custom hosting integrations](https://aspire.dev/integrations/custom-integrations/hosting-integrations/)
- [Aspire secure communication](https://aspire.dev/integrations/custom-integrations/secure-communication/)
- [Aspire Seq integration](https://aspire.dev/integrations/observability/seq/seq-get-started/)
- [SOPS](https://getsops.io/)

Deployment guidance:

- [Aspire deployment](https://learn.microsoft.com/en-us/dotnet/aspire/deployment/overview)
- [Rancher Desktop container engine](https://docs.rancherdesktop.io/ui/preferences/container-engine/general/)
- [Rancher Desktop Kubernetes](https://docs.rancherdesktop.io/ui/preferences/kubernetes/)
- [Azure Monitor OpenTelemetry](https://learn.microsoft.com/en-us/azure/azure-monitor/app/opentelemetry-enable)
- [Google Cloud instrumentation and observability](https://docs.cloud.google.com/stackdriver/docs/instrumentation/overview)
- [AWS CloudWatch OpenTelemetry](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-OTLPGettingStarted.html)
- [AWS Distro for OpenTelemetry and X-Ray](https://docs.aws.amazon.com/xray/latest/devguide/xray-services-adot.html)
