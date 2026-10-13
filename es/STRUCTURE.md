# STRUCTURE

Preguntas y respuestas opcionales para organizar un monorepo, varios repositorios y herramientas conectadas.

## Raíz privada de coordinación

Use [WORKSPACES.md](WORKSPACES.md) para coordinar repositorios existentes sin añadirles archivos de proceso. Conserve la autoridad del README y las pruebas existentes. Guarde descubrimiento e incorporación pendientes en la raíz privada.

## P: ¿Debemos usar un monorepo o varios repositorios?

Use un monorepo cuando cambios compartidos, commits atómicos, herramientas comunes y un límite de release superen el tamaño y complejidad de permisos del repositorio.

Use varios repositorios cuando los equipos necesiten propiedad independiente, cadencia de release, control de acceso, límites de cumplimiento o ciclos de vida tecnológicos.

Use evidencia de acoplamiento de cambios, tiempo de build, frecuencia de release, propiedad, necesidades de acceso y aislamiento de fallos. No elija por ideología.

## P: ¿Qué estructura funciona para un monorepo?

Mantenga un mapa raíz corto. Dé a cada componente una guía local, espacio de nombres de tareas, tests y propiedad. Mantenga la política y las herramientas compartidas en la raíz. Mantenga las reglas específicas de cada componente cerca del componente.

Use un punto de entrada de calidad en la raíz. Permita tareas enfocadas por componente. Indique el alcance y directorio de trabajo de cada tarea.

## P: ¿Qué estructura funciona para varios repositorios?

Dé a cada repositorio su propio README, mapa de agentes, herramientas fijadas, control local de calidad, propiedad, notas de release y política de dependencias. Mantenga contratos entre repositorios en documentos o esquemas versionados.

Use un repositorio índice pequeño cuando las personas necesiten un mapa compartido. Enlace repositorios con URL y revisión estables. No copie repositorios completos en el índice.

## P: ¿Cuándo debemos usar submodules?

Use submodules de Git cuando el equipo deba fijar una revisión exacta de un repositorio externo. Acepte los costos de actualización e incorporación. Documente clone recursivo, actualización, estado y recuperación de fallos.

No use submodules como gestor general de paquetes. Prefiera paquetes publicados o dependencias explícitas de repositorio cuando los consumidores no necesiten coordinación a nivel de código fuente.

## P: ¿Cuándo debemos usar meta?

Use meta cuando un grupo coordinado de repositorios necesite una superficie de comandos para desarrolladores. Cada repositorio conserva su historial y propiedad.

Fije la versión de meta. Declare la pertenencia de repositorios, política de branch, comportamiento de inicio, comportamiento de estado y manejo de fallos. Mantenga los comandos transparentes y revisables.

## P: ¿Cómo debe funcionar la automatización del editor?

Exponga las mismas tareas con nombre en el editor, terminal, CI y herramientas de agentes. El editor puede descubrir tareas y mostrar diagnósticos. La tarea del repositorio sigue siendo la fuente de verdad.

Proporcione acciones para descubrimiento, formato, lint, tests unitarios, tests de integración, tests de navegador, escaneos de seguridad, inicio local, logs y detención. Cada acción debe mostrar el comando, alcance, código de salida y ruta del artefacto.

## P: ¿Cómo evitamos bloquear a las personas?

Use tareas asíncronas para trabajo largo. Guarde estado y artefactos. Permita que una persona cierre el editor, cambie de contexto o coma sin perder la ejecución. Reanude o inspeccione el resultado después.

## Referencias

- Repositorio meta
- [Documentación de Git para submódulos](https://git-scm.com/book/en/v2/Git-Tools-Submodules)
- [OpenAI harness engineering](https://openai.com/index/harness-engineering/)
