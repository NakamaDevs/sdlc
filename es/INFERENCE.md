# INFERENCE

Esta guía define opciones de inferencia local y autoalojada para desarrollo, evaluación y cargas de trabajo privadas.

## P: ¿Cuál es la ruta local predeterminada?

Use el runtime local más pequeño que cumpla la tarea. Use Ollama para una API local simple y el ciclo de vida del modelo. Use MLX para experimentos de Apple Silicon que necesiten comportamiento nativo de arrays y GPU. Use llama.cpp u otro runtime fijado cuando se requiera soporte para su modelo y hardware.

Mantenga los archivos de modelo, prompts, datasets y salidas dentro del límite de confianza declarado. Use datos sintéticos o con datos sensibles ocultos de forma predeterminada. Registre los identificadores y las revisiones de los modelos, la cuantización, las versiones de runtime, el hardware y los resultados de evaluación.

Consulte la [documentación de Ollama](https://docs.ollama.com/), los [requisitos de Ollama para macOS](https://docs.ollama.com/macos) y [Apple MLX](https://github.com/ml-explore/mlx).

## P: ¿Cuándo tiene sentido macOS?

Use Macs con Apple Silicon para desarrollo local silencioso, prototipos sensibles a la privacidad, evaluación en el dispositivo y cargas de trabajo que caben en memoria unificada.

MLX es un framework de investigación de Apple para Apple Silicon. Ollama ofrece una interfaz de servicio multiplataforma más simple. Elija MLX cuando importen el control nativo de Apple Silicon o las API de investigación. Elija Ollama cuando un contrato HTTP local estable importe más que el control del framework.

No suponga que un modelo probado en Apple Silicon tiene la misma calidad, rendimiento, uso de memoria o soporte del operador en NVIDIA o AMD. Mantenga un test de contrato y un conjunto de benchmarks entre hardware.

## P: ¿Cuándo tiene sentido DGX Spark?

Use [NVIDIA DGX Spark](https://www.nvidia.com/en-us/products/workstations/dgx-spark/) como nodo local o de laboratorio para inferencia y fine-tuning cuando un equipo necesite más memoria y compatibilidad con software NVIDIA que una laptop ofrece.

NVIDIA describe DGX Spark como un sistema GB10 Grace Blackwell con 128 GB de memoria unificada y DGX OS preinstalado. Verifique el soporte actual de hardware, driver, CUDA, contenedor, modelo y licencia antes de comprar o desplegar.

Trate DGX Spark como un host Linux en la matriz de ingeniería. Use SSH, contenedores, entornos fijados y sesiones de Herdr primero remoto cuando el nodo no esté en el escritorio del desarrollador. No lo trate como servidor de producción compartido sin aislamiento, identidad, parches, cuotas, monitorización, backups y responsabilidad de incidentes.

## P: ¿Qué debe demostrar toda ruta de inferencia?

- La fuente del modelo y del artefacto es confiable y está versionada.
- Se conocen las clases de datos de entrada y salida.
- El endpoint exige autenticación y autorización.
- Las solicitudes tienen tamaño, tiempo, concurrencia y costo limitados.
- Los prompts y las salidas no se registran de forma predeterminada cuando son sensibles.
- El runtime se puede detener, actualizar y recuperar.
- La calidad, la seguridad, la latencia, el rendimiento y los límites de recursos tienen evidencia.
- El mismo contrato de API tiene un fallback probado o una limitación explícita.

## P: ¿Cómo debe conectarse la inferencia local con agentes y MCP?

Exponga una API interna limitada o una herramienta MCP. No exponga a un agente la administración del modelo, el acceso arbitrario a archivos ni el acceso sin restricciones al shell.

Mantenga las credenciales de proveedor y modelo en el límite del host. Autorice al llamador antes de la inferencia. Aplique checks de tenant, residencia de datos, cuota y lista permitida de modelos antes de enviar la entrada.

Use Code Mode sólo cuando la composición y la reducción de contexto proporcionen un beneficio medido. Mantenga el callback de inferencia fuera del código generado y devuelva resultados limitados.

## Referencias

- [NVIDIA DGX Spark](https://www.nvidia.com/en-us/products/workstations/dgx-spark/)
- [IA local de NVIDIA](https://developer.nvidia.com/topics/ai/local-ai)
- [Ollama](https://docs.ollama.com/)
- [Ollama para macOS](https://docs.ollama.com/macos)
- [Apple MLX](https://github.com/ml-explore/mlx)
- [Documentación de MLX](https://ml-explore.github.io/mlx/build/html/index.html)
- [Modular MAX](https://docs.modular.com/stable/max/intro/)
- [Autorización de MCP](https://modelcontextprotocol.io/specification/2025-06-18/basic/authorization)
