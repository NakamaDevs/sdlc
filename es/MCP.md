# MCP

Esta guía define una forma segura y revisable de usar Model Context Protocol (MCP) con personas y agentes.

MCP conecta un host de IA con tools, recursos y prompts. No reemplaza la autenticación, la autorización, la aprobación, la validación de entradas ni los controles de auditoría.

## P: ¿Cuándo debe un proyecto usar MCP?

Use MCP cuando una capacidad deba reutilizarse entre agentes, editores, servicios o hosts de automatización. Mantenga el contrato del server pequeño, tipado, detectable y comprobable de forma independiente.

Use comandos locales directos para trabajo simple del repositorio. Úselos cuando un server MCP agregue más puntos de confianza, configuración o fallo que valor.

Trate cada server MCP como una integración con privilegios. Un tool puede leer datos, cambiar estado, enviar mensajes, hacer deploy de software o exponer una credencial de un servicio posterior.

## P: ¿Cuál es el modelo de seguridad de MCP?

Separe cuatro decisiones:

1. La autenticación identifica a la persona, el agente, la carga de trabajo o el cliente.
2. La autorización decide si ese principal puede llamar a este tool sobre este recurso.
3. La aprobación decide si un efecto secundario necesita un punto de control humano o de política.
4. La validación decide si la solicitud es segura y está bien formada.

Ejecute la autorización dentro del server MCP o de su límite confiable del host. No confíe en el modelo, la descripción del tool, la UI del cliente ni el prompt para imponer acceso.

Para transportes HTTP, siga la [especificación de autorización de MCP](https://modelcontextprotocol.io/specification/2025-06-18/basic/authorization). Use prácticas de OAuth 2.1, metadatos de recursos protegidos, detección del server de autorización, URI de redirección exactas, PKCE para clientes públicos, tokens de corta duración, almacenamiento seguro de tokens e indicadores de recursos.

Vincule los tokens al público del server MCP. Rechace tokens emitidos para otro recurso. Nunca reenvíe el token de acceso MCP entrante a una API posterior. El server MCP debe obtener una credencial posterior separada cuando actúe como cliente OAuth.

Para servers STDIO locales, la especificación MCP recomienda credenciales basadas en el entorno, en lugar del flujo de autorización HTTP. Use un límite de proceso, un entorno de mínimo privilegio, el llavero del SO o un gestor de secretos y una ruta de ejecutable confiable. No ponga secretos en descripciones de tools, prompts, logs ni datos devueltos.

Use TLS para conexiones remotas. Fije o verifique la identidad esperada del server cuando el entorno de deploy lo permita. Trate las redirecciones, los proxies y las URL MCP remotas como cambios del límite de confianza.

## P: ¿Qué significa MCP stateless?

HTTP stateless significa que cada solicitud puede manejarse sin una sesión en memoria asignada a un cliente. Esto admite el escalado horizontal, el reemplazo de instancias y la recuperación después de que un proceso o una máquina se detenga.

El transporte stateless no significa operaciones de negocio stateless. Guarde el estado durable del workflow, las claves de idempotencia, los identificadores de tareas, los registros de auditoría y las relaciones de autorización en un almacén de datos intencional cuando la función los necesite.

Elija una operación stateless cuando el server no necesite mensajes no solicitados de server a cliente, suscripciones de recursos ni estado de sesión por cliente. Elija una operación stateful solo cuando las funciones del protocolo la requieran. Verifique el comportamiento exacto en el SDK MCP y la revisión del protocolo seleccionados. La [guía de transporte de MCP C# SDK](https://csharp.sdk.modelcontextprotocol.io/v2/concepts/transports/transports.html) documenta esta diferencia y su efecto en el deploy.

Para tools stateless:

- autentique cada solicitud;
- autorice cada efecto secundario;
- haga las escrituras idempotentes cuando sea posible;
- use una clave de correlación o idempotencia dada por quien llama;
- devuelva resultados acotados;
- evite memoria oculta en el server;
- guarde el trabajo de larga duración fuera del proceso de solicitud;
- haga los reintentos seguros y observables;
- pruebe solicitudes duplicadas, retrasadas, reordenadas y simultáneas.

No agregue un almacén de sesiones solo para compensar un contrato de tool no claro.

## P: ¿Qué es Code Mode?

Code Mode expone un tool de ejecución de código, o una superficie pequeña de búsqueda y ejecución. Así no pone un catálogo grande de tools individuales en el contexto del modelo.

El modelo escribe un plan compacto. Un sandbox ejecuta ese plan. El plan puede combinar tools, iterar resultados, filtrar datos intermedios y devolver solo el resultado requerido.

La [guía de Cloudflare Code Mode](https://developers.cloudflare.com/agents/model-context-protocol/codemode/) describe dos patrones:

- Tool de código único: exponga métodos tipados para un conjunto manejable de tools MCP anteriores.
- Búsqueda y ejecución: mantenga un catálogo OpenAPI grande en el sandbox. Exponga detección progresiva y una función de solicitud autenticada.

Use Code Mode cuando importen la composición, el filtrado, la ramificación, la detección progresiva o la reducción de contexto. Use tools MCP directos cuando el conjunto de tools sea pequeño y cada llamada sea simple.

La ejecución de código no es autorización. Mantenga las credenciales y las funciones de solicitud con privilegios en el límite del host. Imponga permisos y aprobaciones en los handlers anteriores o en el callback del host antes de un efecto secundario. Ejecute el código generado en un sandbox aislado y con recursos limitados. Use timeouts, límites de memoria, restricciones de red y salida acotada.

Marque los tools destructivos como sujetos a aprobación. Registre el plan de código, los tools seleccionados, la decisión de autorización, la decisión de aprobación, el resumen de entrada, el resumen de salida y el resultado final. No registre secretos.

## P: ¿Cómo debe diseñarse un tool MCP?

Un tool debe tener una capacidad clara y un esquema estable.

- Nombre la acción y el objetivo con claridad.
- Valide cada entrada en el límite del server.
- Defina tamaños máximos, timeouts, paginación y límites de tasa.
- Devuelva resultados estructurados con campos estables.
- Devuelva errores concisos sin secretos ni stack traces internos.
- Declare si la operación lee, escribe, elimina, envía, hace deploy o cambia permisos.
- Use el modo dry-run o preview para operaciones riesgosas.
- Exija una clave de idempotencia para escrituras que se puedan reintentar.
- Emita un evento de auditoría con principal, tool, recurso, decisión, ID de correlación y resultado.
- Mantenga los resultados del tool al mínimo. No devuelva datos que quien llama no necesita.

Una descripción de tool es una entrada no confiable para el modelo. No es una política de seguridad.

## P: ¿Cómo deben funcionar juntas la autenticación y la autorización?

Autentique a quien llama con el proveedor de identidad adecuado para el deploy. Después, asigne la identidad verificada a un principal interno. No trate una dirección de correo ni un nombre visible como sujeto de autorización estable.

Autorice la tupla `(principal, action, resource, context)` en el último límite responsable antes de la operación. Compruebe los permisos generales del server MCP y los permisos detallados de cada recurso.

Aplique la denegación predeterminada. Compruebe el ámbito del tenant o de la organización. Compruebe el recurso objetivo después de resolver los alias. Vuelva a comprobar la autorización después de que un workflow se pause o se reanude.

Use credenciales separadas para:

- el cliente MCP hacia el server MCP;
- el server MCP hacia cada servicio posterior;
- el sandbox hacia los callbacks aprobados del host;
- la aprobación humana hacia la operación aprobada.

No permita que un server use una cuenta de servicio amplia porque el modelo solicitó una acción limitada.

## P: ¿Cuándo encaja la autorización basada en OpenFGA o Zanzibar?

Use autorización basada en relaciones cuando el acceso dependa de relaciones entre principales y objetos. Por ejemplo, una persona pertenece a un equipo, un equipo accede a un repositorio o un repositorio contiene un documento.

La [guía de modelado de OpenFGA](https://openfga.dev/docs/modeling) modela la autorización con tipos, relaciones, permisos y tuplas de relaciones. Su pregunta básica es si un principal tiene una relación con un objeto. El [artículo de Zanzibar](https://www.usenix.org/system/files/atc19-pang.pdf) describe el modelo de autorización global y consistente. Este modelo inspiró esta familia de sistemas.

Mantenga la identidad y los datos de la aplicación en sus sistemas de autoridad. Guarde las relaciones de autorización en OpenFGA o un sistema compatible cuando esa separación se ajuste al producto. La [guía de fuente de verdad de OpenFGA](https://openfga.dev/docs/best-practices/source-of-truth) documenta casos donde encajan permisos detallados. También documenta casos donde los datos de aplicación deben estar en otro lugar.

Use un modelo de autorización versionado. Fije el identificador del modelo durante un rollout. Pruebe el modelo antes de cambiar tuplas o código de aplicación. La [guía de modelos inmutables de OpenFGA](https://openfga.dev/docs/getting-started/immutable-models) explica por qué un identificador estable de modelo ayuda a migraciones seguras.

Otros patrones válidos incluyen:

- [SpiceDB](https://authzed.com/docs/index) para autorización de relaciones Zanzibar de código abierto y controles de consistencia.
- [Cedar](https://docs.cedarpolicy.com/) para decisiones RBAC, ABAC y ReBAC basadas en políticas con esquemas y validación.
- Un módulo de política local de la aplicación para un sistema pequeño sin grafo de autorización compartido.

No seleccione un servicio de autorización de grafos solo porque está de moda. Selecciónelo cuando relaciones compartidas, comprobaciones entre servicios, compartición delegada o grafos de recursos por tenant justifiquen el costo operativo.

## P: ¿Cómo debe integrarse MCP con comprobaciones tipo OpenFGA?

Use esta secuencia:

1. Autentique a quien llama a MCP.
2. Resuelva el principal estable y el tenant.
3. Resuelva el recurso objetivo sin confiar en campos de propiedad dados por la persona.
4. Pregunte al sistema de autorización si el principal puede hacer la acción nombrada sobre ese recurso.
5. Exija aprobación para la clase de efecto secundario cuando la política la requiera.
6. Ejecute con una credencial posterior de ámbito limitado.
7. Escriba de forma atómica el efecto secundario y la evidencia de autorización cuando sea posible.
8. Devuelva solo el resultado permitido.

Para operaciones de lista, no recupere todos los objetos para filtrarlos en el modelo. Use una consulta que considere la autorización, una comprobación masiva o un índice de permisos mantenido. Pruebe que un objeto no autorizado nunca aparezca en el resultado MCP, el error, la caché, el trace ni un valor intermedio de Code Mode.

## P: ¿Qué debe probarse?

- Fallo de autenticación, token vencido, emisor incorrecto, público incorrecto y tenant incorrecto.
- Permiso ausente, permiso heredado, permiso revocado y migración del modelo de permisos.
- Fallos del esquema de entrada del tool, entradas de tamaño excesivo, cargas de inyección, identificadores de recursos mal formados y tipos de contenido no esperados.
- Solicitudes de escritura duplicadas, simultáneas, retrasadas y repetidas.
- Omisión de aprobación, aprobación para otro recurso, vencimiento de aprobación y reanudación después de reiniciar el proceso.
- Intentos de reenvío de token y de confused deputy.
- Inyección en un prompt o una descripción de tool que intente cambiar la autorización.
- Reinicios stateless, balanceo de carga, recuperación de timeout y reanudación durable de tareas.
- Minimización de datos, ocultación de secretos, registros de auditoría y aislamiento de tenant.
- Escape del sandbox de Code Mode, política de red, agotamiento de recursos y límites de salida.

Registre la revisión del protocolo MCP, la versión del SDK, la versión del server, el ID del modelo de autorización, las identidades de test, los nombres de tools, los recursos objetivo y los enlaces de evidencia.

## P: ¿Cuál es la ruta de adopción?

Empiece con un tool de solo lectura y una identidad de test descartable. Agregue validación de esquema, autenticación, autorización, salida acotada, eventos de auditoría y tests antes de agregar escrituras.

Agregue HTTP stateless cuando el escalado horizontal o la recuperación lo requieran. Agregue Code Mode cuando el costo medido de contexto y viajes de ida y vuelta justifique un sandbox. Agregue OpenFGA, SpiceDB, Cedar u otro servicio externo de autorización cuando las comprobaciones locales ya no ofrezcan un modelo compartido claro.

Mantenga un registro de decisión explícito para cada cambio del límite de confianza. Revise el server MCP como software de producción, no como una extensión del prompt.

## P: ¿En qué se diferencian MCP, APIs, CLIs, LLMs y tools?

Un LLM produce predicciones o decisiones estructuradas. No crea un límite de ejecución confiable.

Un tool es una operación expuesta al modelo con un contrato de esquema, descripción y resultado. El handler del tool sigue siendo responsable de la validación, la autorización, los efectos secundarios y los errores.

Una API es un contrato de servicio para clientes de software. Debe seguir siendo usable sin un LLM. Defina recursos estables, autenticación, autorización, versionado, idempotencia y comportamiento de errores.

Una CLI es una interfaz para personas y automatización. Es útil para trabajo local, scripts, CI y recuperación. Mantenga su salida legible, acotada y analizable por máquinas cuando se solicite.

MCP es un protocolo de interoperabilidad para que hosts y servers expongan tools, recursos y prompts a aplicaciones de IA. MCP puede envolver o llamar APIs y CLIs, pero no hace correctos sus contratos ni su seguridad.

Use todas las capas de forma deliberada:

- LLM para interpretación, planificación y síntesis de resultados.
- MCP para interoperabilidad de tools y contexto detectables.
- API para límites durables de servicio y clientes sin LLM.
- CLI para workflows locales, de CI y de operadores.
- Handler de tool para el límite final de validación, autorización y efectos secundarios.

No ponga la autorización de negocio solo en el prompt o la descripción del tool. No haga que una API dependa de un modelo concreto. No obligue a una persona a usar MCP cuando una CLI o API sea más clara. No exponga una CLI con acceso shell sin restricciones cuando baste un tool tipado y limitado.

Mantenga la API o CLI subyacente comprobable sin el LLM. Pruebe el adaptador MCP por separado para el mapeo de esquema, la propagación de autorización, la traducción de errores, el comportamiento de timeout y la reducción de salida.

## Referencias

- [Especificación de autorización de MCP](https://modelcontextprotocol.io/specification/2025-06-18/basic/authorization)
- [Especificación de transportes MCP](https://modelcontextprotocol.io/specification/2025-06-18/basic/transports)
- [Extensión de credenciales de cliente OAuth de MCP](https://modelcontextprotocol.io/extensions/auth/oauth-client-credentials)
- [Guía de transporte de MCP C# SDK](https://csharp.sdk.modelcontextprotocol.io/v2/concepts/transports/transports.html)
- [Patrones MCP de Cloudflare Code Mode](https://developers.cloudflare.com/agents/model-context-protocol/codemode/)
- [Guía de seguridad e integración de Cloudflare Code Mode](https://developers.cloudflare.com/agents/tools/codemode/mcp/)
- [Guías de modelado de OpenFGA](https://openfga.dev/docs/modeling)
- [Conceptos de autorización de OpenFGA](https://openfga.dev/docs/concepts)
- [Modelos de autorización inmutables de OpenFGA](https://openfga.dev/docs/getting-started/immutable-models)
- [Documentación de SpiceDB y AuthZed](https://authzed.com/docs/index)
- [Lenguaje de políticas Cedar](https://docs.cedarpolicy.com/)
- [Artículo de Zanzibar](https://www.usenix.org/system/files/atc19-pang.pdf)
