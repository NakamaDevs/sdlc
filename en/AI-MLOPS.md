# AI-MLOPS

This guide explains when Mojo and MAX can support AI and ML systems. They are optional. Use them when measured performance, hardware portability, or inference operations justify the added toolchain.

## Q: What are Mojo and MAX?

[Mojo](https://docs.modular.com/mojo/manual/) is Modular's systems language for AI infrastructure and heterogeneous hardware. Its documentation covers CPU and GPU programming, SIMD, and Python integration.

[MAX](https://docs.modular.com/stable/max/intro/) is Modular's AI serving and modeling platform. It provides OpenAI-compatible inference endpoints, model execution across supported CPUs and GPUs, graph and kernel customization, and self-hosted or managed deployment options.

MAX kernels use Mojo. Mojo can extend MAX with custom operations and GPU kernels. Treat vendor performance statements as hypotheses until the target model, hardware, precision, batch size, latency target, and workload are benchmarked.

## Q: When should a project use Mojo?

Use Mojo for performance-intensive AI kernels, preprocessing, postprocessing, custom operators, memory-sensitive data paths, and hardware-specific acceleration that must remain portable across supported targets.

Keep application orchestration, data workflows, evaluation harnesses, and control-plane code in the repository's main language unless Mojo provides a measured benefit.

Prefer a narrow FFI or service boundary. Keep the Mojo component replaceable. Define tensor layouts, numeric precision, ownership, error behavior, and fallback behavior in the specification.

Do not choose Mojo only because it is Python-like. Confirm compiler, package, editor, operating-system, accelerator, licensing, and deployment support for the target matrix.

## Q: When should a project use MAX?

Use MAX when the team needs a supported model-serving path with an OpenAI-compatible API, hardware abstraction, optimized graph execution, or custom model and kernel extensions.

Use the official [MAX `serve` reference](https://docs.modular.com/max/cli/serve) for the exact command and options. Pin the MAX and Mojo versions. Record the model revision, tokenizer revision, runtime image, hardware, precision, and serving flags.

The official documentation includes a CLI pattern such as `max serve --model google/gemma-3-12b-it`. The command can download model files when they are absent. Downloads depend on the configured registry, credentials, license acceptance, network access, and cache state. Treat these factors as deployment inputs. Verify them in a disposable environment before production use.

## Q: What is the AI and MLOps validation path?

- Define model, dataset, prompt, safety, privacy, latency, throughput, cost, and availability requirements.
- Record model and dataset provenance, licenses, hashes, preprocessing, evaluation code, and known limitations.
- Test functional behavior with fixed fixtures and deterministic seeds where possible.
- Test quality against a versioned evaluation set. Separate quality regression from performance regression.
- Benchmark cold start, warm latency, time to first token, tokens per second, batch behavior, memory, and accelerator utilization.
- Test fallback behavior when the accelerator, model cache, network, or downstream provider fails.
- Test prompt injection, tool authorization, data exfiltration, model refusal, and output handling when the model can call tools.
- Scan images, dependencies, model artifacts, and custom kernels. Keep secrets outside model prompts and artifacts.
- Emit bounded telemetry for request count, latency, errors, model revision, hardware, and resource use. Do not log prompts or outputs by default when they contain sensitive data.
- Re-run the benchmark after each runtime, compiler, model, driver, or hardware change.

## Q: How should MAX connect to MCP and Code Mode?

Keep the MAX endpoint behind a narrow service contract. MCP tools should expose tasks such as `generate`, `embed`, `classify`, or `health`, not arbitrary model-server administration.

Authenticate and authorize MCP callers before inference. Apply tenant, model, quota, and data-residency checks before sending input to MAX. Keep provider credentials and internal endpoints outside tool results and generated Code Mode code.

Use Code Mode for composition, filtering, and result shaping when it reduces context. Keep the model call, tool call, and approval boundaries explicit. A sandbox may call an approved inference function, but it must not receive unrestricted network access or serving credentials.

## Q: What are the deployment choices?

- Local development: use a pinned MAX installation or official container. Use small models and synthetic data.
- CI: run CPU smoke tests and contract tests by default. Run accelerator benchmarks on labeled hardware.
- Preview environments: publish a disposable endpoint with a fixed model revision and non-production data.
- Private cloud or VPC: run the official container or supported deployment path when data residency requires it. Verify accelerator drivers, image provenance, networking, secrets, and telemetry.
- Managed service: use it when operational burden, scaling, or hardware capacity exceeds the value of self-hosting. Record the provider boundary and data-processing terms.

Do not claim hardware portability until the target hardware and software matrix passes the same contract and benchmark suite.

## Q: How should the feature matrix represent AI and MLOps?

Track each model-serving capability as a feature with:

- model and artifact revision;
- inference API contract;
- supported hardware and operating systems;
- Mojo or MAX version;
- quality test evidence;
- latency and throughput evidence;
- security and privacy evidence;
- deployment evidence;
- observability evidence;
- fallback behavior;
- known limitations and next review date.

Mark a capability `verified` only when the required quality, security, and operational evidence exists for the target deployment.

## References

- [Mojo Manual](https://docs.modular.com/mojo/manual/)
- [Mojo language basics](https://mojolang.static.modular.com/docs/manual/basics/)
- [Modular MAX overview](https://docs.modular.com/stable/max/intro/)
- [MAX platform](https://max.modular.com/)
- [MAX `serve` command](https://docs.modular.com/max/cli/serve)
- [Modular open-source repository](https://github.com/modular/modular)
- [MCP authorization specification](https://modelcontextprotocol.io/specification/2025-06-18/basic/authorization)
- [Cloudflare Code Mode MCP patterns](https://developers.cloudflare.com/agents/model-context-protocol/codemode/)
