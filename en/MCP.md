# MCP

This guide defines a safe, reviewable way to use the Model Context Protocol (MCP) with people and agents.

MCP connects an AI host to tools, resources, and prompts. It does not replace authentication, authorization, approval, input validation, or audit controls.

## Q: When should a project use MCP?

Use MCP when a capability must be reusable across agents, editors, services, or automation hosts. Keep the server contract small, typed, discoverable, and independently testable.

Use direct local commands for simple repository work when an MCP server would add more trust, setup, or failure points than value.

Treat every MCP server as a privileged integration. A tool can read data, change state, send messages, deploy software, or expose a downstream credential.

## Q: What is the MCP security model?

Separate four decisions:

1. Authentication identifies the human, agent, workload, or client.
2. Authorization decides whether that principal may call this tool on this resource.
3. Approval decides whether a side effect requires a human or policy checkpoint.
4. Validation decides whether the request is safe and well formed.

Perform authorization inside the MCP server or its trusted host boundary. Do not rely on the model, tool description, client UI, or prompt to enforce access.

For HTTP transports, follow the [MCP authorization specification](https://modelcontextprotocol.io/specification/2025-06-18/basic/authorization). Use OAuth 2.1 practices, protected resource metadata, authorization-server discovery, exact redirect URIs, PKCE for public clients, short-lived tokens, secure token storage, and resource indicators.

Bind tokens to the MCP server audience. Reject tokens issued for another resource. Never pass the incoming MCP access token through to a downstream API. The MCP server must obtain a separate downstream credential when it acts as an OAuth client.

For local STDIO servers, the MCP specification recommends environment-based credentials instead of the HTTP authorization flow. Use a process boundary, least-privilege environment, OS keychain or secret manager, and a trusted executable path. Do not put secrets in tool descriptions, prompts, logs, or returned data.

Use TLS for remote connections. Pin or verify the expected server identity when the deployment environment supports it. Treat redirects, proxies, and remote MCP URLs as trust-boundary changes.

## Q: What does stateless MCP mean?

Stateless HTTP means that each request can be handled without an in-memory session assigned to a client. This supports horizontal scaling, replacement of instances, and recovery after a process or machine stops.

Stateless transport does not mean stateless business operations. Store durable workflow state, idempotency keys, task handles, audit records, and authorization relationships in an intentional data store when the feature needs them.

Choose stateless operation when the server does not need unsolicited server-to-client messages, resource subscriptions, or per-client session state. Choose stateful operation only when the protocol features require it. Verify the exact behavior in the selected MCP SDK and protocol revision. The [MCP C# SDK transport guidance](https://csharp.sdk.modelcontextprotocol.io/v2/concepts/transports/transports.html) documents this distinction and its deployment effect.

For stateless tools:

- authenticate every request;
- authorize every side effect;
- make writes idempotent when possible;
- use a caller-supplied correlation or idempotency key;
- return bounded results;
- avoid hidden server memory;
- store long-running work outside the request process;
- make retries safe and observable;
- test duplicate, delayed, reordered, and concurrent requests.

Do not add a session store only to compensate for an unclear tool contract.

## Q: What is Code Mode?

Code Mode exposes one code-execution tool, or a small search-and-execute surface, instead of placing a large catalog of individual tools in the model context.

The model writes a compact plan. A sandbox executes that plan. The plan can compose tools, loop over results, filter intermediate data, and return only the required result.

The [Cloudflare Code Mode guidance](https://developers.cloudflare.com/agents/model-context-protocol/codemode/) describes two patterns:

- Single code tool: expose typed methods for a manageable set of upstream MCP tools.
- Search and execute: keep a large OpenAPI catalog in the sandbox and expose progressive discovery plus an authenticated request function.

Use Code Mode when composition, filtering, branching, progressive discovery, or context reduction matters. Use direct MCP tools when the tool set is small and each call is simple.

Code execution is not authorization. Keep credentials and privileged request functions in the host boundary. Enforce permissions and approvals in upstream handlers or the host callback before a side effect. Run generated code in an isolated, resource-limited sandbox with timeouts, memory limits, network restrictions, and bounded output.

Mark destructive tools as requiring approval. Record the code plan, selected tools, authorization decision, approval decision, input digest, output digest, and final result without recording secrets.

## Q: How should an MCP tool be designed?

A tool should have one clear capability and a stable schema.

- Name the action and target clearly.
- Validate every input at the server boundary.
- Define maximum sizes, timeouts, pagination, and rate limits.
- Return structured results with stable fields.
- Return concise errors without secrets or internal stack traces.
- Declare whether the operation reads, writes, deletes, sends, deploys, or changes permissions.
- Use dry-run or preview mode for risky operations.
- Require an idempotency key for retryable writes.
- Emit an audit event with principal, tool, resource, decision, correlation ID, and result.
- Keep tool results minimal. Do not return data that the caller did not need.

A tool description is untrusted input to the model. It is not a security policy.

## Q: How should authentication and authorization work together?

Authenticate the caller with the identity provider appropriate to the deployment. Then map the verified identity to an internal principal. Do not treat an email address or display name as a stable authorization subject.

Authorize the tuple `(principal, action, resource, context)` at the last responsible boundary before the operation. Check both coarse permissions for the MCP server and fine-grained permissions for each resource.

Apply default deny. Check tenant or organization scope. Check the target resource after resolving aliases. Recheck authorization after a workflow pauses or resumes.

Use separate credentials for:

- the MCP client to the MCP server;
- the MCP server to each downstream service;
- the sandbox to approved host callbacks;
- human approval to the operation being approved.

Do not let a server use a broad service account because the model requested a narrow action.

## Q: When does OpenFGA or Zanzibar-style authorization fit?

Use relationship-based authorization when access depends on relationships between principals and objects: a user belongs to a team, a team has access to a repository, or a repository contains a document.

The [OpenFGA modeling guide](https://openfga.dev/docs/modeling) models authorization with types, relations, permissions, and relationship tuples. Its basic question is whether a principal has a relation to an object. The [Zanzibar paper](https://www.usenix.org/system/files/atc19-pang.pdf) describes the consistent, global authorization model that inspired this family of systems.

Keep identity and application data in their authoritative systems. Store authorization relationships in OpenFGA or a compatible system when that separation fits the product. The [OpenFGA source-of-truth guidance](https://openfga.dev/docs/best-practices/source-of-truth) documents cases where fine-grained permissions fit and cases where application data should remain elsewhere.

Use a versioned authorization model. Pin the model identifier during a rollout. Test the model before changing tuples or application code. The [OpenFGA immutable model guidance](https://openfga.dev/docs/getting-started/immutable-models) explains why a stable model identifier helps safe migrations.

Other valid patterns include:

- [SpiceDB](https://authzed.com/docs/index) for open-source Zanzibar-style relationship authorization and consistency controls.
- [Cedar](https://docs.cedarpolicy.com/) for policy-based RBAC, ABAC, and ReBAC decisions with schemas and validation.
- An application-local policy module for a small system with no shared authorization graph.

Do not select a graph authorization service only because it is fashionable. Select it when shared relationships, cross-service checks, delegated sharing, or tenant-aware resource graphs justify the operational cost.

## Q: How should MCP integrate with OpenFGA-style checks?

Use this sequence:

1. Authenticate the MCP caller.
2. Resolve the stable principal and tenant.
3. Resolve the target resource without trusting user-provided ownership fields.
4. Ask the authorization system whether the principal may perform the named action on that resource.
5. Require approval for the side-effect class when policy requires it.
6. Execute with a narrowly scoped downstream credential.
7. Write the side effect and authorization evidence atomically when possible.
8. Return only the permitted result.

For list operations, do not fetch all objects and filter in the model. Use an authorization-aware query, bulk check, or a maintained permission index. Test that an unauthorized object never appears in the MCP result, error, cache, trace, or Code Mode intermediate value.

## Q: What should be tested?

- Authentication failure, expired token, wrong issuer, wrong audience, and wrong tenant.
- Missing permission, inherited permission, revoked permission, and permission-model migration.
- Tool input schema failures, oversized inputs, injection payloads, malformed resource identifiers, and unexpected content types.
- Duplicate, concurrent, delayed, and replayed write requests.
- Approval bypass, approval for a different resource, approval expiry, and resume after process restart.
- Token passthrough and confused-deputy attempts.
- Prompt or tool-description injection that attempts to change authorization.
- Stateless restarts, load balancing, timeout recovery, and durable task resumption.
- Data minimization, secret redaction, audit records, and tenant isolation.
- Code Mode sandbox escape, network policy, resource exhaustion, and output limits.

Record the MCP protocol revision, SDK version, server version, authorization model ID, test identities, tool names, target resources, and evidence links.

## Q: What is the adoption path?

Start with one read-only tool and a disposable test identity. Add schema validation, authentication, authorization, bounded output, audit events, and tests before adding writes.

Add stateless HTTP when horizontal scaling or recovery requires it. Add Code Mode when the measured context and round-trip cost justify a sandbox. Add OpenFGA, SpiceDB, Cedar, or another external authorization service when local checks no longer provide a clear shared model.

Keep an explicit decision record for every trust-boundary change. Review the MCP server as production software, not as a prompt extension.

## Q: How do MCP, APIs, CLIs, LLMs, and tools differ?

An LLM produces predictions or structured decisions. It does not create a trusted execution boundary.

A tool is an operation exposed to the model with a schema, description, and result contract. The tool handler remains responsible for validation, authorization, side effects, and errors.

An API is a service contract for software clients. It should remain usable without an LLM. Define stable resources, authentication, authorization, versioning, idempotency, and error behavior.

A CLI is a human- and automation-oriented interface. It is useful for local work, scripts, CI, and recovery. Keep its output readable, bounded, and machine-parseable when requested.

MCP is an interoperability protocol for hosts and servers to expose tools, resources, and prompts to AI applications. MCP can wrap or call APIs and CLIs, but it does not make their security or contracts correct.

Use all layers deliberately:

- LLM for interpretation, planning, and result synthesis.
- MCP for discoverable tool and context interoperability.
- API for durable service boundaries and non-LLM clients.
- CLI for local, CI, and operator workflows.
- Tool handler for the final validation, authorization, and side-effect boundary.

Do not put business authorization only in the prompt or tool description. Do not make an API depend on a particular model. Do not force a human to use MCP when a CLI or API is clearer. Do not expose a CLI with unrestricted shell access when a narrow typed tool is sufficient.

Keep the underlying API or CLI testable without the LLM. Test the MCP adapter separately for schema mapping, authorization propagation, error translation, timeout behavior, and output reduction.

## References

- [MCP authorization specification](https://modelcontextprotocol.io/specification/2025-06-18/basic/authorization)
- [MCP transports specification](https://modelcontextprotocol.io/specification/2025-06-18/basic/transports)
- [MCP OAuth client credentials extension](https://modelcontextprotocol.io/extensions/auth/oauth-client-credentials)
- [MCP C# SDK transport guidance](https://csharp.sdk.modelcontextprotocol.io/v2/concepts/transports/transports.html)
- [Cloudflare Code Mode MCP patterns](https://developers.cloudflare.com/agents/model-context-protocol/codemode/)
- [Cloudflare Code Mode security and integration guidance](https://developers.cloudflare.com/agents/tools/codemode/mcp/)
- [OpenFGA modeling guides](https://openfga.dev/docs/modeling)
- [OpenFGA authorization concepts](https://openfga.dev/docs/concepts)
- [OpenFGA immutable authorization models](https://openfga.dev/docs/getting-started/immutable-models)
- [SpiceDB and AuthZed documentation](https://authzed.com/docs/index)
- [Cedar policy language](https://docs.cedarpolicy.com/)
- [Zanzibar paper](https://www.usenix.org/system/files/atc19-pang.pdf)
