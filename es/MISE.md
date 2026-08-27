# MISE

Guía complementaria extraída del documento SDLC.

Este archivo es la referencia para JDX mise, entornos de ejecución, entornos y detección de tareas.
También cubre el alcance de tareas, la ejecución multiplataforma y la salida eficiente de los agentes.

## Herramientas estándar con mise

Use JDX mise para dar un workflow para herramientas, entornos de ejecución, variables de entorno y tareas en todos los sistemas operativos.

Fije las herramientas en el archivo `mise.toml` del repositorio. Use `mise install` para instalarlas.
Use `mise ls --current` para revisar las versiones seleccionadas. Use `mise doctor` para diagnosticar problemas de configuración y confianza.

Use `mise env` para revisar el entorno del proyecto. Use `mise env --json` si otra herramienta necesita datos estructurados.
Use `mise exec -- COMMAND` si una orden debe ejecutarse con el entorno del proyecto. No cambie el shell principal.

Defina las órdenes de `build`, `format`, `lint`, `test`, `audit`, desarrollo y `release` como tareas `mise run` con nombre.
Mantenga los nombres de tareas estables en todos los sistemas operativos. Use dependencias de tareas para el orden.
Devuelva un estado distinto de cero si hay un fallo.

`mise trust` aprueba configuración ejecutable para una ruta de repositorio de confianza. Revise la configuración antes de ejecutarla. No confíe en un repositorio sin revisar, una configuración cambiada ni un directorio padre por implicación.

Guarde los valores privados en configuración local ignorada o en un gestor de secretos aprobado.
No haga commit de credenciales, tokens, URL privadas ni datos de candidatos.
Revise `mise.toml`, archivos de bloqueo, complementos y hooks de instalación como cambios ejecutables de la cadena de suministro.

En una máquina nueva, instale la versión aprobada de mise. Revise la configuración activa con `mise config`.
Confíe en la configuración revisada. Ejecute `mise install`. Revise las versiones con `mise ls --current`.
Ejecute las tareas específicas. Después, ejecute `mise run check`.

CI debe usar los mismos nombres de tareas que el desarrollo local. Debe registrar la versión de mise y las versiones de entornos de ejecución seleccionados.
También debe registrar el sistema operativo, la arquitectura, la orden y el resultado. No dependa de archivos de inicio del shell.
Invoque mise de forma explícita en CI y la automatización.

Pruebe cada sistema operativo compatible. Registre como evidencia las omisiones específicas de cada plataforma.
Use un programa multiplataforma si la lógica de tareas se vuelve compleja. Limite el trabajo paralelo con `MISE_JOBS` si los runners tienen recursos limitados.

## Tareas mise con alcance definido y detectables

Mantenga las definiciones de tareas cerca del código propietario. Ponga las tareas de todo el repositorio en el `mise.toml` raíz.
Ponga las tareas de componentes en el `mise.toml` de cada componente. Ponga tareas de proyectos o secciones más profundas en la configuración hija más cercana.
También puede ponerlas en un directorio de tareas documentado.

Use `mise tasks` desde el directorio actual para detectar tareas en la jerarquía de configuración activa.
Use `mise tasks --all` sólo si un agente necesita el inventario completo del monorepositorio.
Use `mise tasks info --json TASK` para revisar el origen, directorio, dependencias, entorno, entradas, salidas y orden de una tarea antes de ejecutarla.
Use `mise tasks deps TASK` para revisar el orden. Use `mise tasks validate --errors-only` antes de depender de una tarea.

Trate una tarea como de alcance definido sólo cuando su declaración nombre su directorio de trabajo, entradas, salidas, servicios, uso de red, credenciales y efectos secundarios. Una tarea con alcance desconocido no es segura para que un agente la ejecute.

Dé a cada tarea un nombre estable y una descripción corta. Use nombres como `build`, `test`, `lint`, `check` y `serve` dentro de un proyecto.
Use un nombre calificado o un directorio explícito si dos proyectos tienen el mismo nombre de tarea.
No oculte las tareas de verificación normales. Oculte sólo auxiliares internos que los agentes no deben llamar directamente.

Una tarea debe ejecutar sólo los archivos y servicios dentro de su alcance. Establezca `dir` de forma explícita si una tarea cruza un límite de componente.
Pase argumentos mediante un contrato de uso declarado. No deje que una tarea cambie de directorio sin aviso.
Tampoco deje que instale herramientas sin fijar, lea datos de producción o haga deploy en un sistema externo.

Exponga una tarea de entrada segura por proyecto, como `mise run check`. Haga que esa tarea dependa de los checks locales requeridos.
Documente en la guía del repositorio la raíz del proyecto y las raíces de componentes.
Documente también los sistemas operativos compatibles, los requisitos previos y las salidas esperadas.
Los agentes deben detectar las tareas antes de ejecutarlas.

Use `mise mcp` si una plataforma de agentes admite MCP. Expone recursos de tareas, herramientas, entornos y configuración.
Mantenga la aprobación para ejecutar tareas y los límites de confianza en la política del agente o repositorio.

## Referencias

Referencias oficiales: [mise](https://mise.jdx.dev/), [configuración](https://mise.jdx.dev/configuration.html), [`mise env`](https://mise.jdx.dev/cli/env.html), [`mise run`](https://mise.jdx.dev/cli/run.html) y [`mise trust`](https://mise.jdx.dev/cli/trust.html).
