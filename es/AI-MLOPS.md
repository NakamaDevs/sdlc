# AI-MLOPS

Esta guía explica cuándo Mojo y MAX pueden respaldar sistemas de IA y ML. Son opcionales. Úselos cuando el rendimiento medido, la portabilidad de hardware o las operaciones de inferencia justifiquen la cadena de herramientas adicional.

## Q: ¿Qué son Mojo y MAX?

[Mojo](https://docs.modular.com/mojo/manual/) es el lenguaje de sistemas de Modular para infraestructura de IA y hardware heterogéneo. Su documentación cubre programación CPU y GPU, SIMD e integración Python.

[MAX](https://docs.modular.com/stable/max/intro/) es la plataforma de Modular para serving y modelos de IA. Proporciona endpoints de inferencia compatibles con OpenAI, ejecución de modelos en CPU y GPU compatibles, personalización de grafos y kernels, y opciones de deploy autogestionado o administrado.

Los kernels MAX usan Mojo. Mojo puede extender MAX con operaciones personalizadas y kernels GPU. Trate las afirmaciones de rendimiento del proveedor como hipótesis hasta medir el modelo, hardware, precisión, tamaño de batch, objetivo de latencia y carga de trabajo.

## Q: ¿Cuándo debe un proyecto usar Mojo?

Use Mojo para kernels de IA intensivos en rendimiento, preprocesamiento, postprocesamiento, operadores personalizados, rutas de datos sensibles a memoria y aceleración específica de hardware que debe seguir portable entre destinos compatibles.

Mantenga la orquestación de aplicación, flujos de datos, harnesses de evaluación y código de plano de control en el lenguaje principal del repositorio, salvo que Mojo aporte un beneficio medido.

Prefiera un límite FFI o de servicio estrecho. Mantenga el componente Mojo reemplazable. Defina layouts de tensor, precisión numérica, propiedad, comportamiento de error y comportamiento de fallback en la especificación.

No elija Mojo solo porque se parece a Python. Confirme soporte de compilador, paquete, editor, sistema operativo, acelerador, licencia y deploy para la matriz objetivo.

## Q: ¿Cuándo debe un proyecto usar MAX?

Use MAX cuando el equipo necesite una ruta compatible de serving de modelos con una API compatible con OpenAI, abstracción de hardware, ejecución de grafos optimizada o extensiones de modelos y kernels personalizados.

Use la [referencia oficial de MAX `serve`](https://docs.modular.com/max/cli/serve) para el comando y opciones exactos. Fije las versiones de MAX y Mojo. Registre revisión de modelo, revisión de tokenizer, imagen runtime, hardware, precisión y banderas de serving.

La documentación oficial incluye un patrón CLI como `max serve --model google/gemma-3-12b-it`. El comando puede descargar archivos de modelo si faltan. Las descargas dependen del registry configurado, credenciales, aceptación de licencia, acceso de red y estado de caché. Trate estos factores como entradas de deploy. Verifíquelos en un entorno desechable antes de uso de producción.

## Q: ¿Cuál es la ruta de validación de IA y MLOps?

- Defina requisitos de modelo, dataset, prompt, seguridad, privacidad, latencia, rendimiento, costo y disponibilidad.
- Registre procedencia, licencias, hashes, preprocesamiento, código de evaluación y limitaciones conocidas del modelo y dataset.
- Pruebe comportamiento funcional con fixtures fijos y seeds deterministas cuando sea posible.
- Pruebe calidad con un conjunto de evaluación versionado. Separe la regresión de calidad de la regresión de rendimiento.
- Mida inicio en frío, latencia caliente, tiempo al primer token, tokens por segundo, batch, memoria y uso de acelerador.
- Pruebe fallback cuando falle el acelerador, caché de modelo, red o proveedor posterior.
- Pruebe prompt injection, autorización de herramientas, exfiltración de datos, rechazo del modelo y manejo de salida cuando el modelo pueda llamar herramientas.
- Analice imágenes, dependencias, artefactos de modelo y kernels personalizados. Mantenga secretos fuera de prompts y artefactos.
- Emita telemetría acotada de solicitudes, latencia, errores, revisión de modelo, hardware y uso de recursos. No registre prompts ni salidas por defecto si contienen datos sensibles.
- Repita el benchmark después de cada cambio de runtime, compilador, modelo, driver o hardware.

## Q: ¿Cómo debe conectarse MAX a MCP y Code Mode?

Mantenga el endpoint MAX detrás de un contrato de servicio estrecho. Las herramientas MCP deben exponer tareas como `generate`, `embed`, `classify` o `health`, no administración arbitraria del servidor de modelos.

Autentique y autorice a llamadores MCP antes de inferencia. Aplique controles de tenant, modelo, cuota y residencia de datos antes de enviar entrada a MAX. Mantenga credenciales de proveedor y endpoints internos fuera de resultados de herramientas y código generado por Code Mode.

Use Code Mode para composición, filtrado y forma de resultados cuando reduzca contexto. Mantenga explícitos los límites de llamada de modelo, llamada de herramienta y aprobación. Un sandbox puede llamar una función de inferencia aprobada, pero no debe recibir acceso de red ni credenciales de serving sin límites.

## Q: ¿Cuáles son las opciones de deploy?

- Desarrollo local: use una instalación MAX fijada o contenedor oficial. Use modelos pequeños y datos sintéticos.
- CI: ejecute tests smoke CPU y tests de contrato por defecto. Ejecute benchmarks de acelerador en hardware etiquetado.
- Entornos preview: publique un endpoint desechable con una revisión de modelo fija y datos no productivos.
- Nube privada o VPC: ejecute el contenedor oficial o ruta de deploy compatible cuando la residencia de datos lo requiera. Verifique drivers de acelerador, procedencia de imagen, red, secretos y telemetría.
- Servicio administrado: úselo cuando la carga operativa, escalado o capacidad de hardware excedan el valor de autogestionar. Registre el límite del proveedor y los términos de procesamiento de datos.

No afirme portabilidad de hardware hasta que la matriz objetivo de hardware y software pase el mismo conjunto de contrato y benchmark.

## Q: ¿Cómo debe representar la matriz de características IA y MLOps?

Registre cada capacidad de serving de modelo como característica con:

- revisión de modelo y artefacto;
- contrato API de inferencia;
- hardware y sistemas operativos compatibles;
- versión de Mojo o MAX;
- evidencia de test de calidad;
- evidencia de latencia y rendimiento;
- evidencia de seguridad y privacidad;
- evidencia de deploy;
- evidencia de observabilidad;
- comportamiento de fallback;
- limitaciones conocidas y siguiente fecha de revisión.

Marque una capacidad como `verified` solo cuando exista la evidencia requerida de calidad, seguridad y operación para el deploy objetivo.

## Referencias

- [Manual de Mojo](https://docs.modular.com/mojo/manual/)
- [Conceptos básicos del lenguaje Mojo](https://mojolang.static.modular.com/docs/manual/basics/)
- [Descripción general de Modular MAX](https://docs.modular.com/stable/max/intro/)
- [Plataforma MAX](https://max.modular.com/)
- [Comando `serve` de MAX](https://docs.modular.com/max/cli/serve)
- [Repositorio de código abierto de Modular](https://github.com/modular/modular)
- [Especificación de autorización de MCP](https://modelcontextprotocol.io/specification/2025-06-18/basic/authorization)
- [Patrones de MCP Code Mode de Cloudflare](https://developers.cloudflare.com/agents/model-context-protocol/codemode/)
