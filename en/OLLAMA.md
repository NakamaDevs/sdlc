# OLLAMA

This guide supports local Ollama model serving and agent workflows.

Use Ollama when the project requires local or private model execution. State the model endpoint, model name, context limits, tool permissions, and data-retention behavior.

When Aspire is present, model Ollama as an optional resource. Inject its endpoint through the AppHost resource contract. Do not hard-code a host-only URL in a containerized consumer.

For Claude Code through Ollama, verify the documented endpoint and model compatibility before enabling the workflow. Test model availability, timeouts, resource limits, tool permissions, interrupted requests, and unavailable-model behavior.

Keep model requests local by default. Do not send source, credentials, private logs, candidate data, or production data to a hosted model without an explicit trust decision.

Pin the Ollama version when it affects API or model behavior. Record the model identifier, digest or equivalent revision, host hardware, runtime configuration, and evaluation result. Treat model downloads and custom model files as supply-chain inputs.

Use bounded prompts and structured responses for agent workflows. Preserve the original request and response artifact when a summary or token reducer is used. Redact secrets before logging requests or responses.

## Minimum validation

- Confirm that the intended host or container network reaches the service.
- Verify that the selected model is installed and answers a bounded health request.
- Test a representative structured request and a refusal or error path.
- Confirm that tool calls require the intended approval boundary.
- Measure latency, memory use, context limits, and concurrency on supported hardware.
- Verify shutdown and restart without orphan processes or leaked data.

## References

- [Aspire Ollama integration](https://aspire.dev/integrations/ai/ollama/ollama-get-started/)
- [Ollama Claude Code integration](https://docs.ollama.com/integrations/claude-code)
