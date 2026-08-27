# INFERENCE

This guide defines local and self-hosted inference choices for development, evaluation, and private workloads.

## Q: What is the default local path?

Use the smallest local runtime that meets the task. Use Ollama for a simple local API and model lifecycle. Use MLX for Apple Silicon experiments that need native array and GPU behavior. Use llama.cpp or another pinned runtime when its model and hardware support are required.

Keep model files, prompts, datasets, and outputs within the declared trust boundary. Use synthetic or redacted data by default. Record model identifiers, revisions, quantization, runtime versions, hardware, and evaluation results.

See the [Ollama documentation](https://docs.ollama.com/), [Ollama macOS requirements](https://docs.ollama.com/macos), and [Apple MLX](https://github.com/ml-explore/mlx).

## Q: When does macOS make sense?

Use Apple Silicon Macs for quiet local development, privacy-sensitive prototyping, on-device evaluation, and workloads that fit unified memory.

MLX is an Apple research framework for Apple Silicon. Ollama provides a simpler cross-platform serving interface. Choose MLX when native Apple Silicon control or research APIs matter. Choose Ollama when a stable local HTTP contract matters more than framework control.

Do not assume that a model tested on Apple Silicon has the same quality, throughput, memory use, or operator support on NVIDIA or AMD. Keep a cross-hardware contract test and benchmark suite.

## Q: When does DGX Spark make sense?

Use [NVIDIA DGX Spark](https://www.nvidia.com/en-us/products/workstations/dgx-spark/) as a local or lab inference and fine-tuning node when a team needs more memory and NVIDIA software compatibility than a laptop provides.

NVIDIA describes DGX Spark as a GB10 Grace Blackwell system with 128 GB unified memory and a preinstalled DGX OS. Verify current hardware, driver, CUDA, container, model, and licensing support before purchase or deployment.

Treat DGX Spark as a Linux host in the engineering matrix. Use SSH, containers, pinned environments, and remote-first Herdr sessions when the node is not at the developer desk. Do not treat it as a shared production server without isolation, identity, patching, quotas, monitoring, backups, and incident ownership.

## Q: What must every inference path prove?

- The model and artifact source are trusted and versioned.
- Input and output data classes are known.
- The endpoint enforces authentication and authorization.
- Requests have bounded size, time, concurrency, and cost.
- Prompts and outputs are not logged by default when sensitive.
- The runtime can be stopped, upgraded, and recovered.
- Quality, safety, latency, throughput, and resource limits have evidence.
- The same API contract has a tested fallback or an explicit limitation.

## Q: How should local inference connect to agents and MCP?

Expose a narrow internal API or MCP tool. Do not expose model administration, arbitrary file access, or unrestricted shell access to an agent.

Keep provider and model credentials in the host boundary. Authorize the caller before inference. Apply tenant, data-residency, quota, and model-allow-list checks before sending input.

Use Code Mode only when composition and context reduction provide a measured benefit. Keep the inference callback outside generated code and return bounded results.

## References

- [NVIDIA DGX Spark](https://www.nvidia.com/en-us/products/workstations/dgx-spark/)
- [NVIDIA local AI](https://developer.nvidia.com/topics/ai/local-ai)
- [Ollama](https://docs.ollama.com/)
- [Ollama macOS](https://docs.ollama.com/macos)
- [Apple MLX](https://github.com/ml-explore/mlx)
- [MLX documentation](https://ml-explore.github.io/mlx/build/html/index.html)
- [Modular MAX](https://docs.modular.com/stable/max/intro/)
- [MCP authorization](https://modelcontextprotocol.io/specification/2025-06-18/basic/authorization)