# OLLAMA

Esta guía apoya el servicio local de modelos de Ollama y los flujos de trabajo de agentes.

Use Ollama cuando el proyecto requiera ejecución local o privada de modelos. Indique el endpoint del modelo, el nombre del modelo, los límites de contexto, los permisos de herramientas y el comportamiento de retención de datos.

Cuando Aspire esté presente, modele Ollama como un recurso opcional. Inyecte su endpoint mediante el contrato de recursos de AppHost. No codifique una URL exclusiva del host en un consumidor en contenedor.

Para Claude Code mediante Ollama, verifique el endpoint documentado y la compatibilidad del modelo antes de activar el workflow. Pruebe disponibilidad del modelo, tiempos de espera, límites de recursos, permisos de herramientas, solicitudes interrumpidas y comportamiento sin modelo disponible.

Mantenga las solicitudes al modelo locales de forma predeterminada. No envíe código fuente, credenciales, logs privados, datos de candidatos ni datos de producción a un modelo alojado sin una decisión explícita sobre el límite de confianza.

Fije la versión de Ollama cuando afecte el comportamiento de la API o del modelo. Registre el identificador del modelo, el digest o revisión equivalente, el hardware del host, la configuración de ejecución y el resultado de evaluación. Trate las descargas de modelos y los archivos de modelos personalizados como entradas de la cadena de suministro.

Use prompts acotados y respuestas estructuradas para los flujos de trabajo de agentes. Conserve el artefacto original de solicitud y respuesta cuando use un resumen o reductor de tokens. Redacte secretos antes de registrar solicitudes o respuestas.

## Validación mínima

- Confirme que la red prevista del host o contenedor llega al servicio.
- Verifique que el modelo seleccionado está instalado y responde a una solicitud de salud acotada.
- Pruebe una solicitud estructurada representativa y una ruta de rechazo o error.
- Confirme que las llamadas de herramientas requieren el límite de aprobación previsto.
- Mida latencia, uso de memoria, límites de contexto y concurrencia en hardware compatible.
- Verifique el apagado y reinicio sin procesos huérfanos ni fuga de datos.

## Referencias

- [Integración de Aspire con Ollama](https://aspire.dev/integrations/ai/ollama/ollama-get-started/)
- [Integración de Ollama con Claude Code](https://docs.ollama.com/integrations/claude-code)
