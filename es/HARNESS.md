# HARNESS

La ingeniería de harness hace claros y aplicables el repositorio, las herramientas, los test, la observabilidad y el workflow para personas y agentes de IA.

Las personas definen la intención, las restricciones, las prioridades y la aceptación. Los agentes ejecutan dentro de un harness local del repositorio. El harness debe facilitar la ruta correcta y dificultar la ruta insegura.

## El repositorio como sistema de registro

Mantenga el conocimiento importante de ingeniería en artefactos versionados del repositorio. Use una entrada corta del agente como mapa. Ponga las especificaciones detalladas, las decisiones de arquitectura, los planes de ejecución, las reglas de calidad, la evidencia de test y las guías operativas en archivos enlazados.

Use divulgación progresiva. Los agentes deben encontrar el documento relevante, leer sólo la profundidad requerida, ejecutar la tarea aprobada y devolver evidencia limitada. No dependa del historial privado de chat ni de memoria humana no documentada.

## Claridad y límites aplicables

Exponga el comportamiento de la aplicación mediante comandos estables, logs estructurados, traces, métricas, health checks, rutas del navegador, contratos de API y fixtures de test. Codifique los límites de arquitectura, la dirección de dependencias, la validación de esquema, las reglas de seguridad y los checks de calidad en linters o test estructurales cuando sea posible.

Una regla es más fuerte cuando el repositorio puede comprobarla. Los mensajes de error deben explicar el invariante fallido y la siguiente acción de reparación.

## Bucles de retroalimentación y autonomía

Construya el ciclo en este orden: especificación, implementación, tests, review, observabilidad, recuperación y limpieza. Cuando un agente falle, identifique la capacidad, la herramienta, el límite o el documento ausente. Mejore el harness en vez de depender sólo de un prompt más grande.

Aumente la autonomía sólo cuando el repositorio demuestre un descubrimiento fiable de tareas, ejecución aislada, recursos limitados, validación de tests, review, rollback y escalación humana. La autonomía es un resultado de la evidencia, no un permiso predeterminado.

## Trabajo aislado y observable

Dé a cada cambio independiente un espacio de trabajo o entorno aislado cuando puedan interferir procesos, puertos, datos, logs o credenciales concurrentes. El entorno debe poder iniciar desde el repositorio. Exponga sus logs, métricas, traces, estado del navegador y artefactos de test mediante herramientas locales aprobadas.

Conserve la evidencia sin procesar para que se pueda recuperar. Devuelva resúmenes compactos a los agentes, pero conserve el artefacto completo para review y diagnóstico.

## Evaluación de Symphony

OpenAI describe Symphony como un orquestador que convierte un panel de project management en un plano de control para agentes de código. Una tarea abierta puede corresponder a un espacio de trabajo aislado de un agente. El estado del ticket puede representar el estado del workflow. El trabajo bloqueado puede formar un grafo de dependencias. La política puede reiniciar ejecuciones fallidas o detenidas.

Use este patrón cuando el proyecto tenga contratos de issue claros, transiciones de estado fiables, espacios de trabajo aislados, ejecución limitada, artefactos revisables y una ruta de recuperación segura. Mantenga el seguimiento de issues separado de los detalles de implementación. Un issue puede producir varios pull request o sólo investigación y planificación.

No suponga que Symphony ni otro orquestador de agentes se generaliza automáticamente. Valide la toma de tareas, la prevención de duplicados, la cancelación, los límites de reintento, el manejo de dependencias, la limpieza de espacios de trabajo, el aislamiento de secretos, la propiedad del pull request y la escalación humana antes de la operación continua.

## Lista de revisión del harness

1. ¿Puede un agente nuevo encontrar el mapa del repositorio, la especificación actual, las tareas aprobadas y el gate de calidad?
2. ¿Puede el agente ejecutar checks locales con herramientas fijadas y salida limitada?
3. ¿Puede el agente observar la aplicación sin recibir secretos innecesarios ni logs completos?
4. ¿Puede el trabajo independiente ejecutarse sin puertos, datos, credenciales ni estado mutable compartidos?
5. ¿Puede el trabajo fallido detenerse, reintentarse, recuperarse, revisarse y revertirse?
6. ¿Se comprueban mecánicamente las reglas de arquitectura y la actualidad de la documentación?
7. ¿Son explícitos los puntos de aprobación humana para sistemas externos, datos de producción, acciones destructivas y excepciones de seguridad?

## Actualizaciones durables del harness

Los harness deben aprender de la evidencia de ejecución sin cambiar sus propias reglas en silencio. Registre intentos fallidos, latencia de herramientas, resultados de tests, pasos de recuperación y comentarios del operador. Convierta un fallo repetido en una tarea revisada, un test, un guardrail o un cambio de documentación.

[AutoSaddler](https://arxiv.org/abs/2608.23041) es investigación sobre la optimización automática de harness con actualizaciones durables de traces de ejecución de agentes. Trátelo como evidencia de investigación, no como permiso para automodificación sin review. Mantenga los cambios de política revisables, versionados, reversibles y atribuibles.

La [discusión de Omar Sanusi](https://x.com/omarsar0/status/2092246879702769956) es una referencia de discusión secundaria. No es una fuente normativa. Valide sus afirmaciones con el repositorio, los tests y la investigación primaria.

## Referencias

- [Harness engineering: leveraging Codex in an agent-first world](https://openai.com/index/harness-engineering/)
- [An open-source spec for Codex orchestration: Symphony](https://openai.com/index/open-source-codex-orchestration-symphony/)
- [Repositorio de OpenAI Symphony](https://github.com/openai/symphony)
