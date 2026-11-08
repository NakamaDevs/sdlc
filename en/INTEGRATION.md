# INTEGRATION

This guide selects transports and webhook patterns from behavior and correctness requirements.

## Q: When should a client use HTTP, SSE, WebSockets, or webhooks?

SSE means Server-Sent Events. It sends events from a server to a client over HTTP. WebSockets keep a bidirectional connection between a client and server. A webhook is an HTTP callback that one system sends to another system after an event.

- HTTP request and response: use for independent commands, queries, and idempotent operations.
- SSE: use for one-way server-to-client events, progress, and notifications when the client can reconnect and resume.
- WebSockets: use for bidirectional low-latency interaction or when one connection must preserve causal ordering between client actions and server updates.
- Webhooks: use for asynchronous delivery between systems that do not share a live connection. Treat delivery as at-least-once unless the provider proves another guarantee.

Choose based on ordering, replay, recovery, connection lifetime, proxy support, fan-out, and operational cost. Do not choose a transport only because it is popular.

## Q: What must an event contract define?

Define event identity, sequence or version, causation ID, correlation ID, timestamp, producer, schema version, tenant, resource, delivery attempt, and retention.

Consumers must verify authenticity, reject stale or replayed events, handle duplicates, tolerate unknown fields, persist progress, and recover from gaps. Use a resync endpoint when an event stream can be incomplete.

## Command identity and delivery attempts

A command identifies an intended action. A delivery attempt identifies one effort to send it. If a client retries after a timeout, keep the same `command_id` and request content, but give the attempt a new `attempt_id`. A deliberate second action needs a new command ID. An event has its own stable `event_id`; one command can produce several events.

Choose a deduplication scope, such as `(tenant_id, producer, event_id)`, and enforce uniqueness in durable storage. Do not use a correlation ID as the deduplication key. Reject reuse of a command key with different content rather than silently returning another operation's result. Store enough of the accepted request and result to explain a retry.

Document how long keys and results remain available. Retention must cover the supported retry and replay window. After that window, an old key cannot prove that an effect has not already happened. Require reconciliation instead of silently treating it as new work.

## Q: What must webhooks secure?

Use signed payloads with a rotating secret or asymmetric key. Verify the signature over the exact raw body. Validate timestamps, prevent replay, authenticate the endpoint, use bounded retries with backoff, and provide idempotency.

Prefer dataless notifications when payload sensitivity is high. Fetch the resource through an authenticated API after verifying the event.

## Acknowledge durable acceptance

A successful webhook response should mean the receiver has durably accepted responsibility, not merely placed work in memory. Verify the signature and validate the envelope before writing an inbox record. Commit that record before acknowledging. Return a retryable failure if durable acceptance fails. Expose processing status separately when acceptance does not mean the business action is complete.

A worker can process the inbox later. Use a unique key to handle concurrent duplicates, and a recoverable lease or equivalent mechanism for abandoned work. When the business change and processed marker share a database, commit them in one transaction. In that transaction, atomically verify that the record is unprocessed and the worker holds the current ownership token. Hold a row lock through commit, or use a conditional write whose failure rolls back the effect. A lease timer alone is not a fence: after another worker takes ownership, the stale worker must be unable to commit. Recording the marker first can lose work; recording it later in a separate transaction can repeat the effect.

For an effect outside that transaction, pass a stable idempotency key to the destination if it supports one. Persist outbound intent with the local change, then send it through a recoverable outbox. An outbox does not make the remote effect atomic. If the destination offers neither idempotency nor a way to look up the result, a timeout leaves an uncertain outcome. Reconcile it before retrying an irreversible effect. Do not claim end-to-end exactly-once behavior from transport acknowledgments or a local deduplication table.

### Duplicate delivery

| Step | What happens | Required behavior |
| --- | --- | --- |
| 1 | Event `evt-17` arrives as attempt `try-1`. | Store one inbox record under the scoped event key. |
| 2 | The worker commits a counter increment and its processed marker together. | The local effect is complete. |
| 3 | The sender repeats `evt-17` as `try-2`. | Acknowledge the existing record without incrementing again. |

### Crash between persistence and acknowledgment

| Step | What happens | Required behavior |
| --- | --- | --- |
| 1 | The receiver commits the inbox record for `evt-18`. | Responsibility survives a process restart. |
| 2 | The receiver crashes before its response reaches the sender. | The sender cannot know acceptance succeeded. |
| 3 | The sender retries with the same event ID. | Find the existing record and acknowledge it. Resume pending work; do not create another job. |

The same test must cover a crash after acknowledgment but before processing. Recovery must find accepted, unfinished records without relying on another delivery.

Also pause worker A after it claims a record. Let its lease expire, allow worker B to take ownership, and then resume A while B processes the same event. Assert that A cannot commit with its old ownership token, B commits the effect and processed marker together, and the counter changes only once. Test both schedules: A resumes before B commits and after B commits.

## Bound retries and make replay safe

Classify failures before retrying. A temporary connection failure, overload response, or unavailable dependency may recover. Invalid signatures, unsupported schemas, and invalid business input need correction, not an unlimited retry loop. Document the receiver's status-code contract so the sender knows which responses mean accepted, retryable, or terminal.

Set maximum attempts and elapsed time. Use exponential backoff with jitter, respect the documented retry delay within an overall deadline, and limit concurrent retries. A timeout does not prove failure. Query the operation's status or retry with the same command key when that contract is available. Stop when the budget expires and give the failed event an owner.

Keep a restricted failed-event record with the event identity, schema version, attempts, failure reason, and enough protected payload data for diagnosis. Set retention and access controls. Alert on age, backlog, and repeated failures, not just the existence of a failure queue.

Before replay, fix the cause and check whether the effect already happened. Preview the selected events and their expected effects, choose a bounded batch, and record who authorized it. Preserve command and event identities while issuing new attempt identities. Start small and stop on unexpected effects. Correcting business intent is a new command with a link to the original, not a replay with edited content.

An authorized replay needs a fresh authenticated delivery through the supported replay path. It must not disable signature or timestamp checks. A stale delivery signature and an old but valid business event are different concerns.

## Q: What is the WebSockets versus SSE warning?

Multiple streams can race even when each stream is reliable. The [Dashbit analysis](https://dashbit.co/blog/websockets-vs-sse) shows why UI correctness and event ordering matter more than a simple latency comparison.

If SSE and Fetch update the same state, define one authoritative update stream or add sequence handling and resynchronization. If WebSockets carry both commands and updates, still define ordering, reconnect, authorization refresh, and backpressure.

## Reconnect after a gap

Define what a cursor covers: tenant, subscription, filters, ordering scope, and retention window. Treat it as opaque and validate its scope against current authorization. SSE's `Last-Event-ID` carries a resume position; it does not guarantee that the server still retains the missing events. WebSockets need an application-level resume contract too.

Advance a durable consumer cursor only after its effects commit. With parallel workers, advance through contiguous completed positions, not to the highest event received; otherwise an unfinished earlier event can be skipped. For a UI, keep the cursor consistent with the state it describes. If stored state is lost or replaced, discard the associated cursor. Use per-resource versions or another explicit ordering rule to prevent delayed updates from overwriting newer state. Timestamps alone do not establish causal order.

### Expired cursor

| Step | What happens | Required behavior |
| --- | --- | --- |
| 1 | A client disconnects at cursor `c42`. Retained history later starts after that position. | The old cursor no longer supports complete replay. |
| 2 | The client reconnects with `c42`. | Return an explicit expired-cursor result, not a successful empty stream. |
| 3 | The client fetches a fresh snapshot with watermark `c90`. | Replace the affected local state, including records deleted during the gap. |
| 4 | The client resumes after `c90`. | Apply subsequent events in the documented order and deduplicate overlaps. |

The snapshot and watermark must describe the same consistent boundary. Otherwise changes made while the snapshot loads can disappear between snapshot and subscription. Provide a snapshot-at-watermark protocol or buffer subsequent events with bounded capacity. If that buffer overflows or another gap appears, restart resynchronization rather than pretending the state is current.

## Keep old and new consumers compatible

Deploy producers and consumers independently in tests, just as they can run during a rollout. Additive optional fields are usually safer than renamed fields, changed types, new required fields, or changed meanings. Specify defaults and how to handle unknown enum values. Ignoring an unknown field does not make an unknown event type safe to process.

Keep immutable event schemas identifiable by version. Support an explicit overlap window, or translate old payloads at a documented boundary without changing their identities. A consumer must quarantine an unsupported version visibly rather than acknowledge and discard it as processed. It may acknowledge durable quarantine if the delivery contract includes ownership and recovery for that state.

Test the oldest supported producer with the newest consumer and the reverse. Include stored events and failed events replayed after deployment, duplicate deliveries, and a rollback. Remove compatibility only after the published support window ends and retained or failed events no longer depend on it.

## References

- [Dashbit: WebSockets versus SSE](https://dashbit.co/blog/websockets-vs-sse)
- [Webhooks.fyi](https://webhooks.fyi/)
- [Webhooks.fyi security](https://webhooks.fyi/docs/security/)
- [W3C Server-Sent Events](https://html.spec.whatwg.org/multipage/server-sent-events.html)
- [RFC 6455 WebSockets](https://www.rfc-editor.org/rfc/rfc6455)
