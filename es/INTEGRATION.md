# INTEGRATION

Esta guía selecciona transportes y patrones de webhook según los requisitos de comportamiento y corrección.

## P: ¿Cuándo debe un cliente usar HTTP, SSE, WebSockets o webhooks?

SSE significa Server-Sent Events. Envía eventos desde un servidor hacia un cliente por HTTP. WebSockets mantiene una conexión bidireccional entre un cliente y un servidor. Un webhook es una devolución de llamada HTTP que un sistema envía a otro después de un evento.

- Solicitud y respuesta HTTP: úsela para comandos, consultas y operaciones idempotentes independientes.
- SSE: úselo para eventos, progreso y notificaciones unidireccionales del servidor al cliente cuando el cliente puede reconectar y reanudar.
- WebSockets: úselo para interacción bidireccional de baja latencia o cuando una conexión debe mantener el orden causal entre acciones del cliente y actualizaciones del servidor.
- Webhooks: úselo para entrega asíncrona entre sistemas sin una conexión activa compartida. Trate la entrega como al-menos-una-vez, salvo que el proveedor pruebe otra garantía.

Elija según orden, repetición, recuperación, duración de conexión, soporte de proxy, fan-out y coste operativo. No elija un transporte sólo porque es popular.

## P: ¿Qué debe definir un contrato de evento?

Defina identidad de evento, secuencia o versión, ID de causa, ID de correlación, marca de tiempo, productor, versión de esquema, tenant, recurso, intento de entrega y retención.

Los consumidores deben verificar autenticidad, rechazar eventos antiguos o repetidos, manejar duplicados, tolerar campos desconocidos, persistir progreso y recuperarse de huecos. Use un endpoint de resincronización si un flujo de eventos puede estar incompleto.

## P: ¿Qué deben proteger los webhooks?

Use payloads firmados con un secreto rotativo o clave asimétrica. Verifique la firma sobre el cuerpo sin procesar exacto. Valide marcas de tiempo, evite repeticiones, autentique el endpoint, use reintentos limitados con backoff y proporcione idempotencia.

Prefiera notificaciones sin datos cuando la sensibilidad del payload sea alta. Obtenga el recurso mediante una API autenticada después de verificar el evento.

## P: ¿Cuál es la advertencia sobre WebSockets y SSE?

Varios flujos pueden competir aunque cada flujo sea fiable. El [análisis de Dashbit](https://dashbit.co/blog/websockets-vs-sse) muestra que la corrección de la UI y el orden de eventos importan más que una comparación simple de latencia.

Si SSE y Fetch actualizan el mismo estado, defina un flujo de actualización autoritativo o agregue manejo de secuencia y resincronización. Si WebSockets lleva comandos y actualizaciones, defina también orden, reconexión, renovación de autorización y backpressure.

## Referencias

- [Dashbit: WebSockets versus SSE](https://dashbit.co/blog/websockets-vs-sse)
- [Webhooks.fyi](https://webhooks.fyi/)
- [Seguridad de Webhooks.fyi](https://webhooks.fyi/docs/security/)
- [W3C Server-Sent Events](https://html.spec.whatwg.org/multipage/server-sent-events.html)
- [RFC 6455 WebSockets](https://www.rfc-editor.org/rfc/rfc6455)
