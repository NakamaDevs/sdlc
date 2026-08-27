# INTEGRATION

This guide selects transports and webhook patterns from behavior and correctness requirements.

## Q: When should a client use HTTP, SSE, WebSockets, or webhooks?

- HTTP request and response: use for independent commands, queries, and idempotent operations.
- SSE: use for one-way server-to-client events, progress, and notifications when the client can reconnect and resume.
- WebSockets: use for bidirectional low-latency interaction or when one connection must preserve causal ordering between client actions and server updates.
- Webhooks: use for asynchronous delivery between systems that do not share a live connection. Treat delivery as at-least-once unless the provider proves another guarantee.

Choose based on ordering, replay, recovery, connection lifetime, proxy support, fan-out, and operational cost. Do not choose a transport only because it is popular.

## Q: What must an event contract define?

Define event identity, sequence or version, causation ID, correlation ID, timestamp, producer, schema version, tenant, resource, delivery attempt, and retention.

Consumers must verify authenticity, reject stale or replayed events, handle duplicates, tolerate unknown fields, persist progress, and recover from gaps. Use a resync endpoint when an event stream can be incomplete.

## Q: What must webhooks secure?

Use signed payloads with a rotating secret or asymmetric key. Verify the signature over the exact raw body. Validate timestamps, prevent replay, authenticate the endpoint, use bounded retries with backoff, and provide idempotency.

Prefer dataless notifications when payload sensitivity is high. Fetch the resource through an authenticated API after verifying the event.

## Q: What is the WebSockets versus SSE warning?

Multiple streams can race even when each stream is reliable. The [Dashbit analysis](https://dashbit.co/blog/websockets-vs-sse) shows why UI correctness and event ordering matter more than a simple latency comparison.

If SSE and Fetch update the same state, define one authoritative update stream or add sequence handling and resynchronization. If WebSockets carry both commands and updates, still define ordering, reconnect, authorization refresh, and backpressure.

## References

- [Dashbit: WebSockets versus SSE](https://dashbit.co/blog/websockets-vs-sse)
- [Webhooks.fyi](https://webhooks.fyi/)
- [Webhooks.fyi security](https://webhooks.fyi/docs/security/)
- [W3C Server-Sent Events](https://html.spec.whatwg.org/multipage/server-sent-events.html)
- [RFC 6455 WebSockets](https://www.rfc-editor.org/rfc/rfc6455)