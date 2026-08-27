# SECURITY

Esta guía define límites de confianza, protección de secretos, checks locales de seguridad y controles de cadena de suministro.

## Seguridad y límites de confianza

Cada proyecto debe definir:

- entradas confiables y no confiables;
- manejo de credenciales;
- límites de sandbox;
- límites del sistema de archivos;
- acceso a red;
- reglas de ejecución de procesos;
- retención de artefactos;
- reglas de eliminación de datos;
- puntos de aprobación humana.

Los agentes no deben exponer secretos en código, logs, prompts, comentarios, capturas de pantalla ni artefactos. Los agentes deben conservar el trabajo no relacionado.

Antes de un comando destructivo, el agente debe verificar el destino exacto con un comando de sólo lectura. El agente debe confirmar la ruta objetivo, el repositorio, el branch y los datos afectados. El agente debe detenerse si el destino es ambiguo. El agente debe obtener autorización clara antes de ejecutar el comando.

## Seguridad local primero y confianza de herramientas

Evite filtraciones antes de que lleguen a un agente, repositorio, artefacto o servicio remoto. Mantenga secretos fuera del código fuente, historial de shell, argumentos de proceso, volcados de entorno, logs, trazas, capturas de pantalla, snapshots de test, reportes de fallo y contexto comprimido.

Use escáneres locales o autohospedados de forma predeterminada. Fije sus versiones y conjuntos de reglas. Ejecútelos mediante tareas de mise con salida acotada y un artefacto recuperable. Trate cada escáner, formateador, skill, plugin, action, imagen de contenedor y conjunto de reglas descargado como entrada ejecutable de cadena de suministro.

### Línea mínima de seguridad local

- Gitleaks para detectar secretos en el árbol de trabajo y el historial de Git.
- Semgrep Community Edition para SAST local y reglas específicas del repositorio.
- Trivy para checks de sistema de archivos, dependencias, imágenes, configuraciones incorrectas, secretos y SBOM.
- zizmor para análisis de seguridad de workflows y automatización de GitHub Actions.
- OWASP Dependency-Check cuando el ecosistema y el riesgo del proyecto justifiquen otra base de datos SCA local.

Use `gitleaks git` para el historial del repositorio y `gitleaks dir` para archivos cuando la versión instalada admita esos comandos. Use `semgrep --config=auto` sólo después de revisar el origen de reglas y el comportamiento de red. Use `trivy fs` para checks locales de sistema de archivos. Agregue `--scanners misconfig` cuando se requieran checks de configuración. Ejecute `zizmor` contra archivos de workflow. Prefiera SARIF cuando CI consume resultados estructurados.

No trate un escaneo limpio como prueba de seguridad. Registre la versión de herramienta, la versión de reglas o base de datos, el destino, exclusiones, resultado y puntos ciegos conocidos. Revise cada allowlist y baseline como código. Una excepción debe indicar regla, ruta exacta, motivo, propietario, vencimiento y test de reemplazo.

Ejecute el escaneo de secretos antes de cada commit, en CI y en todo el historial cuando sospeche una filtración. Si encuentra un secreto, revóquelo o rótelo primero. Eliminar texto del commit más reciente no invalida una credencial filtrada.

## Contenido externo y captura con browser

Trate cada página externa, instantánea convertida e imagen como entrada no confiable.

El lector estático valida destinos públicos, redirecciones, tamaños y esquemas URL. Estos checks no demuestran que la fuente sea segura.

La captura renderizada ejecuta JavaScript no confiable. Su preflight no controla peticiones posteriores de recursos del browser.

Este repositorio no proporciona un sandbox de red. `--isolation-confirmed` sólo registra un control externo.

Ejecute captura renderizada sólo dentro de un límite desechable verificado. Restrinja la red a los dominios necesarios.

Los enlaces de imágenes remotas pueden rastrear lectores. Un hostname público también puede cambiar DNS después de la captura.

El procesamiento local usa el decoder nativo libvips. Restrinja formatos, bytes, dimensiones, cantidades, licencias y destinos.

El escáner revisa indicadores en inglés y español en documentos completos. Es heurístico y todavía requiere revisión humana.

Consulte [WEB-CAPTURE.md](WEB-CAPTURE.md) para ver los controles implementados y límites actuales.

## Referencias

- [Gitleaks](https://github.com/gitleaks/gitleaks)
- [Semgrep Community Edition](https://semgrep.dev/products/community-edition/)
- [Trivy filesystem and secret scanning](https://trivy.dev/docs/latest/target/filesystem/)
- [zizmor](https://docs.zizmor.sh/)
- [OWASP Dependency-Check guidance](https://owasp.org/www-project-developer-guide/release/implementation/dependencies/dependency_check/)
- [Referencia de Chrome Headless](https://developer.chrome.com/docs/automation-and-testing/headless-cli)
- [Registro IANA de direcciones IPv4 para uso especial](https://www.iana.org/assignments/iana-ipv4-special-registry/iana-ipv4-special-registry.xhtml)
- [Registro IANA de direcciones IPv6 para uso especial](https://www.iana.org/assignments/iana-ipv6-special-registry/iana-ipv6-special-registry.xhtml)
- [WEB-CAPTURE.md](WEB-CAPTURE.md)
