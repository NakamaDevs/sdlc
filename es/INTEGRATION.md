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

## Identidad del comando e intentos de entrega

Un comando identifica una acción prevista. Un intento de entrega identifica un esfuerzo para enviarla. Si un cliente reintenta tras un timeout, mantenga el mismo `command_id` y contenido de solicitud, pero asigne un nuevo `attempt_id` al intento. Una segunda acción deliberada necesita otro ID de comando. Un evento tiene su propio `event_id` estable; un comando puede producir varios eventos.

Elija un ámbito de deduplicación, como `(tenant_id, producer, event_id)`, y aplique unicidad en almacenamiento duradero. No use un ID de correlación como clave de deduplicación. Rechace la reutilización de una clave de comando con contenido diferente en vez de devolver sin aviso el resultado de otra operación. Guarde suficiente información de la solicitud aceptada y su resultado para explicar un reintento.

Documente cuánto tiempo permanecen disponibles las claves y los resultados. La retención debe cubrir el período admitido de reintentos y repetición. Después de ese período, una clave antigua no demuestra que el efecto no haya ocurrido. Exija conciliación en vez de tratarla sin aviso como trabajo nuevo.

## P: ¿Qué deben proteger los webhooks?

Use payloads firmados con un secreto rotativo o clave asimétrica. Verifique la firma sobre el cuerpo sin procesar exacto. Valide marcas de tiempo, evite repeticiones, autentique el endpoint, use reintentos limitados con backoff y proporcione idempotencia.

Prefiera notificaciones sin datos cuando la sensibilidad del payload sea alta. Obtenga el recurso mediante una API autenticada después de verificar el evento.

## Confirme la aceptación duradera

Una respuesta satisfactoria a un webhook debe indicar que el receptor aceptó la responsabilidad de forma duradera, no que sólo colocó trabajo en memoria. Verifique la firma y valide el sobre antes de escribir un registro de entrada. Confirme la transacción de ese registro antes de responder. Devuelva un fallo que permita reintento si falla la aceptación duradera. Exponga el estado de procesamiento por separado cuando la aceptación no signifique que la acción de negocio terminó.

Un trabajador puede procesar la bandeja de entrada después. Use una clave única para manejar duplicados concurrentes y una concesión recuperable o mecanismo equivalente para el trabajo abandonado. Si el cambio de negocio y el marcador de procesamiento comparten una base de datos, confírmelos en una transacción. En esa transacción, verifique de forma atómica que el registro no esté procesado y que el trabajador tenga el token de control vigente. Mantenga un bloqueo de fila hasta confirmar la transacción o use una escritura condicional cuyo fallo revierta el efecto. Un temporizador de concesión por sí solo no impide escrituras obsoletas: después de que otro trabajador tome el control, el trabajador anterior no debe poder confirmar. Registrar primero el marcador puede perder trabajo; registrarlo después en otra transacción puede repetir el efecto.

Para un efecto fuera de esa transacción, envíe una clave de idempotencia estable al destino si la admite. Persista la intención de salida junto con el cambio local y envíela mediante una bandeja de salida recuperable. Una bandeja de salida no hace atómico el efecto remoto. Si el destino no ofrece idempotencia ni permite consultar el resultado, un timeout deja un resultado incierto. Concilie ese resultado antes de reintentar un efecto irreversible. No afirme un comportamiento de exactamente-una-vez de extremo a extremo a partir de confirmaciones de transporte o una tabla local de deduplicación.

### Entrega duplicada

| Paso | Qué ocurre | Comportamiento necesario |
| --- | --- | --- |
| 1 | El evento `evt-17` llega como intento `try-1`. | Guarde un registro de entrada con la clave de evento del ámbito elegido. |
| 2 | El trabajador confirma juntos un incremento de contador y su marcador de procesamiento. | El efecto local está completo. |
| 3 | El emisor repite `evt-17` como `try-2`. | Confirme el registro existente sin incrementar de nuevo. |

### Caída entre la persistencia y la confirmación

| Paso | Qué ocurre | Comportamiento necesario |
| --- | --- | --- |
| 1 | El receptor confirma la transacción del registro de entrada de `evt-18`. | La responsabilidad sobrevive a un reinicio del proceso. |
| 2 | El receptor cae antes de que su respuesta llegue al emisor. | El emisor no puede saber que la aceptación tuvo éxito. |
| 3 | El emisor reintenta con el mismo ID de evento. | Busque el registro existente y confírmelo. Reanude el trabajo pendiente; no cree otro trabajo. |

La misma prueba debe cubrir una caída después de confirmar la recepción pero antes de procesar. La recuperación debe encontrar los registros aceptados y sin terminar sin depender de otra entrega.

Pause además al trabajador A después de que reserve un registro. Deje que caduque su concesión, permita que el trabajador B tome el control y luego reanude A mientras B procesa el mismo evento. Compruebe que A no puede confirmar con su token de control antiguo, que B confirma juntos el efecto y el marcador de procesamiento, y que el contador cambia una sola vez. Pruebe ambas secuencias: A reanuda antes de que B confirme y después de que B confirme.

## Limite los reintentos y haga segura la repetición

Clasifique los fallos antes de reintentar. Un fallo temporal de conexión, una respuesta de sobrecarga o una dependencia no disponible pueden recuperarse. Las firmas inválidas, los esquemas no admitidos y las entradas de negocio inválidas necesitan corrección, no un bucle ilimitado de reintentos. Documente el contrato de códigos de estado del receptor para que el emisor sepa qué respuestas indican aceptación, reintento o fallo definitivo.

Defina un máximo de intentos y de tiempo transcurrido. Use backoff exponencial con variación aleatoria, respete la demora de reintento documentada dentro de un plazo total y limite los reintentos concurrentes. Un timeout no demuestra un fallo. Consulte el estado de la operación o reintente con la misma clave de comando cuando ese contrato esté disponible. Deténgase cuando se agote el límite y asigne un responsable al evento fallido.

Guarde un registro restringido de eventos fallidos con identidad del evento, versión de esquema, intentos, causa del fallo y suficientes datos protegidos del payload para el diagnóstico. Defina retención y controles de acceso. Alerte sobre antigüedad, trabajo acumulado y fallos repetidos, no sólo sobre la existencia de una cola de fallos.

Antes de repetir, corrija la causa y compruebe si el efecto ya ocurrió. Revise los eventos seleccionados y sus efectos previstos, elija un lote limitado y registre quién lo autorizó. Conserve las identidades de comando y evento y emita nuevas identidades de intento. Empiece con pocos eventos y deténgase ante efectos inesperados. Corregir la intención de negocio es un comando nuevo con un vínculo al original, no una repetición con contenido editado.

Una repetición autorizada necesita una entrega autenticada nueva mediante la ruta de repetición admitida. No debe desactivar las comprobaciones de firma ni de marca de tiempo. Una firma de entrega antigua y un evento de negocio antiguo pero válido son cuestiones diferentes.

## P: ¿Cuál es la advertencia sobre WebSockets y SSE?

Varios flujos pueden competir aunque cada flujo sea fiable. El [análisis de Dashbit](https://dashbit.co/blog/websockets-vs-sse) muestra que la corrección de la UI y el orden de eventos importan más que una comparación simple de latencia.

Si SSE y Fetch actualizan el mismo estado, defina un flujo de actualización autoritativo o agregue manejo de secuencia y resincronización. Si WebSockets lleva comandos y actualizaciones, defina también orden, reconexión, renovación de autorización y backpressure.

## Reconecte después de un hueco

Defina qué cubre un cursor: tenant, suscripción, filtros, ámbito de orden y período de retención. Trátelo como opaco y valide su ámbito con la autorización actual. `Last-Event-ID` de SSE transporta una posición de reanudación; no garantiza que el servidor aún conserve los eventos que faltan. WebSockets también necesita un contrato de reanudación a nivel de aplicación.

Avance un cursor duradero del consumidor sólo después de confirmar sus efectos. Con trabajadores paralelos, avance por posiciones completadas contiguas, no hasta el evento recibido más alto; de lo contrario puede omitir un evento anterior sin terminar. En una UI, mantenga el cursor coherente con el estado que describe. Si se pierde o reemplaza el estado guardado, descarte el cursor asociado. Use versiones por recurso u otra regla de orden explícita para impedir que las actualizaciones tardías sobrescriban un estado más reciente. Las marcas de tiempo por sí solas no establecen un orden causal.

### Cursor caducado

| Paso | Qué ocurre | Comportamiento necesario |
| --- | --- | --- |
| 1 | Un cliente se desconecta en el cursor `c42`. El historial retenido comienza después de esa posición más tarde. | El cursor antiguo ya no permite una repetición completa. |
| 2 | El cliente reconecta con `c42`. | Devuelva un resultado explícito de cursor caducado, no un flujo vacío satisfactorio. |
| 3 | El cliente obtiene una instantánea nueva con marca de posición `c90`. | Reemplace el estado local afectado, incluidos los registros eliminados durante el hueco. |
| 4 | El cliente reanuda después de `c90`. | Aplique los eventos posteriores en el orden documentado y deduplique los solapamientos. |

La instantánea y su marca de posición deben describir el mismo límite coherente. De lo contrario, los cambios realizados mientras carga la instantánea pueden perderse entre ésta y la suscripción. Proporcione un protocolo de instantánea en una marca de posición o almacene temporalmente los eventos posteriores con capacidad limitada. Si esa capacidad se desborda o aparece otro hueco, reinicie la resincronización en vez de aparentar que el estado está al día.

## Mantenga compatibles los consumidores antiguos y nuevos

Despliegue productores y consumidores de forma independiente en las pruebas, como pueden ejecutarse durante un despliegue gradual. Agregar campos opcionales suele ser más seguro que renombrar campos, cambiar tipos, introducir campos obligatorios o cambiar significados. Especifique valores predeterminados y cómo manejar valores de enumeración desconocidos. Ignorar un campo desconocido no hace seguro procesar un tipo de evento desconocido.

Mantenga identificables por versión los esquemas inmutables de eventos. Admita un período explícito de coexistencia o traduzca payloads antiguos en un límite documentado sin cambiar sus identidades. Un consumidor debe poner una versión no admitida en cuarentena de forma visible en vez de confirmarla y descartarla como procesada. Puede confirmar la cuarentena duradera si el contrato de entrega incluye responsabilidad y recuperación para ese estado.

Pruebe el productor admitido más antiguo con el consumidor más nuevo y a la inversa. Incluya eventos almacenados y eventos fallidos repetidos tras el despliegue, entregas duplicadas y una reversión. Retire la compatibilidad sólo después de que termine el período de soporte publicado y los eventos retenidos o fallidos ya no dependan de ella.

## Referencias

- [Dashbit: WebSockets versus SSE](https://dashbit.co/blog/websockets-vs-sse)
- [Webhooks.fyi](https://webhooks.fyi/)
- [Seguridad de Webhooks.fyi](https://webhooks.fyi/docs/security/)
- [W3C Server-Sent Events](https://html.spec.whatwg.org/multipage/server-sent-events.html)
- [RFC 6455 WebSockets](https://www.rfc-editor.org/rfc/rfc6455)
