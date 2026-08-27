# HOOKS

Esta guía define hooks prácticos de Git para comentarios locales rápidos, protección de secretos y handoff seguro a CI.

## P: ¿Cuándo debe un proyecto usar hooks de Git?

Use hooks para checks que sean rápidos, deterministas, locales y útiles antes de un commit o push. Algunos ejemplos son formato, validación de archivos en staging, checks de espacios en blanco, tests unitarios ligeros y detección de secretos.

No ponga suites de integración lentas, checks que dependan de red, despliegue de producción ni acciones destructivas en cada hook de commit. Ponga esos checks en tareas explícitas, CI o workflows protegidos del servidor.

Los hooks son comentarios para el desarrollador. No son el límite final de seguridad. Una persona puede omitirlos, un clone puede no instalarlos y un atacante puede enviar código sin ejecutarlos.

## P: ¿Cuál es la herramienta de hooks recomendada?

Use prek cuando el repositorio quiera una implementación rápida en Rust que mantenga compatibilidad con la configuración y los hooks de `pre-commit` upstream.

Mantenga la configuración en `.pre-commit-config.yaml` para una compatibilidad amplia. Use `prek.toml` sólo cuando el repositorio acepte comportamiento específico de `prek`. Fije las revisiones de hooks remotos y registre la versión mínima de `prek`.

Los comandos verificados incluyen:

- `prek install` — instala la integración de hooks del repositorio.
- `prek uninstall` — elimina la integración.
- `prek run` — ejecuta los hooks configurados para archivos en staging.
- `prek run --all-files` — ejecuta los hooks configurados para todo el repositorio.
- `prek run <hook-id>` — ejecuta un hook.
- `prek run --files path/to/file` — ejecuta archivos seleccionados.
- `prek run --hook-stage manual` — ejecuta un hook de etapa manual.

Consulte la guía rápida de prek y la referencia de configuración.

## P: ¿Cómo deben los hooks ser rápidos y útiles?

- Ejecute sólo archivos relevantes en staging.
- Use herramientas integradas o locales cuando sean estables y portables.
- Mantenga los formateadores separados de los validadores.
- Almacene en caché instalaciones de herramientas, no salidas de build no confiables.
- Imprima el check fallido y un comando de reparación.
- Evite el acceso de red durante commits normales.
- Mueva los checks costosos a `pre-push`, una tarea explícita de `mise` o CI.
- Permita una etapa manual para checks que necesiten ejecución deliberada.
- Mantenga un comando del repositorio como salida admitida, por ejemplo `mise run check:fast`.
- Mida la duración del hook y elimine checks que no cambien decisiones.

Un hook debe terminar con suficiente rapidez para que los desarrolladores no aprendan a omitirlo.

## P: ¿Cuál es la escalera ligera de validación local?

Ejecute primero la capa útil más pequeña:

1. `git diff --cached --check` para errores de espacios en blanco y marcadores de conflicto.
2. `prek run` para formato, lint, esquema y checks de secretos de archivos en staging.
3. Tests unitarios enfocados en el comportamiento cambiado.
4. Un smoke test que inicia la ruta real más pequeña y comprueba una solicitud o comando exitoso.
5. `mise run check:fast` o el equivalente del repositorio.
6. `prek run --all-files`, tests completos, escaneos de seguridad y `mise run verify` antes del handoff.

Defina `check:fast`, `smoke` y `verify` como tareas del repositorio cuando el proyecto necesite esos nombres. Cada tarea debe documentar su alcance, duración esperada, dependencias y evidencia.

Un smoke test debe probar un límite ejecutable real. Debe usar datos desechables, timeouts limitados, entradas deterministas y un marcador claro de éxito. Debe limpiar su proceso y recursos temporales.

## P: ¿Cómo deben los hooks evitar filtraciones de Git?

Use un escaneo de secretos del contenido en staging antes de un commit. Use un escaneo de historial o rango en CI. [Gitleaks](https://github.com/gitleaks/gitleaks) documenta integraciones nativas, Docker, pre-commit y GitHub Action.

Escanee antes de commit, antes de push y después de responder a un incidente. Revise `.gitleaks.toml` y `.gitleaksignore` como archivos sensibles de seguridad. Una excepción debe identificar la regla exacta, la ruta y el motivo seguro. Nunca agregue un secreto real a una allowlist.

Ejecute la tarea de Gitleaks aprobada por el repositorio. Confirme el comando con la versión fijada y `gitleaks --help`.

Antes de hacer commit, inspeccione el contenido exacto en staging:

- `git status --short`
- `git diff --cached --stat`
- `git diff --cached`
- `git diff --cached --check`

Si detecta un secreto, deténgase. Revóquelo o rótelo primero. Elimínelo del árbol de trabajo y del historial con un proceso aprobado. Después vuelva a escanear el historial completo y verifique que el secreto ya no funciona.

No dependa de eliminar un archivo en un commit posterior. El historial de Git, tags, forks, cachés, logs de CI, artefactos y comentarios de issue pueden retener el valor.

## P: ¿Cuándo se puede omitir un hook?

Una omisión es una decisión explícita y temporal. Registre el motivo y ejecute el check omitido antes de push o merge.

Use omisiones sólo para un falso positivo, una dependencia local no disponible, una recuperación de emergencia o un workflow deliberado de staging. Nunca use una omisión para ocultar un secreto, un test fallido o una excepción de seguridad sin review.

`git commit --no-verify` y `SKIP=<hook-id> prek run` pueden omitir checks locales. Trate ambos como eventos visibles en el worklog o pull request cuando afecten la evidencia.

## P: ¿Qué pertenece a CI y a los controles del servidor?

CI debe repetir los checks críticos en un entorno limpio. Los branch protegidos y la política del servidor deben aplicar los checks requeridos. Use CI para escaneos de secretos de historial completo, escaneos de dependencias y contenedores, tests completos, smoke tests contra servicios desechables y procedencia de artefactos.

Use controles de servidor pre-receive o equivalentes cuando la plataforma de alojamiento los admita y la organización requiera un límite de rechazo estricto. Mantenga las mismas reglas de detección versionadas y revisables.

El hook local y la tarea de CI deben llamar al mismo comando del repositorio cuando sea posible. Esto evita que el comportamiento local y de CI se desvíe.

## P: ¿Qué debe contener una lista de adopción?

- Un runner de hooks fijado y una configuración.
- Una ruta rápida para archivos en staging.
- Una ruta manual para todo el repositorio.
- Detección de secretos antes de commit y en CI.
- Tests enfocados en el comportamiento cambiado.
- Un smoke test real.
- Comandos de reparación documentados.
- Una ruta de omisión e incidente documentada.
- Versiones de herramientas y sistemas operativos admitidos.
- Evidencia en la matriz de funciones o el elemento de trabajo.

## Referencias

- [Documentación de hooks de Git](https://git-scm.com/docs/githooks)
- [Comando Git hook](https://git-scm.com/docs/git-hook)
- Guía rápida de prek
- Configuración de prek
- Etapas de hooks de prek
- [Documentación de pre-commit](https://pre-commit.com/)
- [Gitleaks](https://github.com/gitleaks/gitleaks)
- [OWASP Secrets Management Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Secrets_Management_Cheat_Sheet.html)
