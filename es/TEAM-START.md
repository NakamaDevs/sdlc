# TEAM-START

Un equipo nuevo empieza aquí. Use esta guía para una aplicación existente o un proyecto nuevo.
La base funciona sin una herramienta privada, una empresa específica o una suscripción de agentes.

## Contenido existente

El manual ya cubre entrega, seguridad, habilidades, herramientas y decisiones humanas.
Esta ruta conecta esas referencias con ejercicios y un espacio raíz reutilizable.
Use [COURSE.md](COURSE.md) para aprender, [AGENT-TEAM.md](AGENT-TEAM.md) para delegar y [WORKSPACES.md](WORKSPACES.md) para aislar.

## Inicio en una hora

1. Nombre responsables de producto, tecnología, QA y entregas. Una persona puede tener varios roles.
2. Seleccione un recorrido pequeño de usuario. Defina su regla de negocio y dos casos de error.
3. Cree un repositorio raíz privado con la plantilla siguiente. Mantenga separados los repositorios de aplicaciones.
4. Registre solo los repositorios necesarios. Incluya acceso, revisión, responsable, comandos y conocimiento pendiente.
5. Ejecute las comprobaciones de descubrimiento. Registre el acceso pendiente como una limitación, no como un hecho supuesto.
6. Complete el primer ejercicio. Seleccione un cambio piloto limitado con evidencia de aceptación medible.

## Generar el espacio raíz

Ejecute desde una copia de este repositorio SDLC. Use Python 3.12 o posterior.
El destino no debe existir. El generador escribe solo en ese directorio nuevo.
No clona aplicaciones, instala herramientas, inicia servicios, cambia cuentas ni publica contenido.

```sh
python3 scripts/new_workspace.py /tmp/team-root --language en
cd /tmp/team-root
python3 scripts/workspace.py check
python3 scripts/workspace.py context
```

Use `--language es` para español. Revise los archivos generados antes del primer commit.
Seleccione un repositorio privado y verifique su remoto y visibilidad antes de publicar contexto del proyecto.
La comprobación valida la plantilla. No demuestra que la aplicación esté lista.

## Mantener límites claros

La raíz contiene descubrimiento, decisiones entre repositorios, incorporación, instrucciones para agentes y orquestación local.
Los repositorios de aplicaciones conservan código, pruebas, historial, acceso y proceso de entrega.
La plantilla ignora copias hijas, worktrees, configuración local, estado y artefactos de evidencia.
Revise las rutas preparadas antes de cada commit raíz. Ignorar archivos no controla el acceso.

Lea las instrucciones hijas antes de proponer cambios allí. La raíz no concede acceso adicional ni reemplaza sus políticas.
Para repositorios públicos, conserve el análisis privado en la raíz privada. Envíe únicamente el cambio autorizado al proyecto original.
Una sesión local del agente debe recibir explícitamente el contexto raíz y las instrucciones del repositorio correspondiente.

## Adopción de herramientas

| Capa | Inicio | Cuándo ampliar |
| --- | --- | --- |
| Documentación humana | Markdown y Git | Un lector local con búsqueda facilita el descubrimiento |
| Comandos con nombre | Tareas existentes | mise hace reproducibles las herramientas y los comandos |
| Portal documental | Lector existente o Markdown estático | Hay una versión aprobada de Bunko disponible |
| Entorno de ejecución | Una aplicación y datos sintéticos | Aspire coordina varios recursos necesarios |
| Agentes | Una tarea y una persona responsable | Las tareas independientes tienen límites y comprobaciones |
| Habilidades | Un procedimiento revisado | El trabajo repetido justifica una habilidad reutilizable fijada |

La instalación de Bunko de este repositorio requiere acceso privado. No es una dependencia de la plantilla generada.
Con acceso, siga el README del repositorio y use la versión fijada y su esquema de configuración.
Sin acceso, lea Markdown directamente o conecte un lector documental aprobado.
Registre la documentación raíz y las raíces hijas permitidas. Mantenga privadas las notas de revisión y bases locales.

## Primera semana

Complete el curso común y la práctica de su rol. Registre duraciones reales sin prometer un plazo fijo de adopción.
Pida a otra persona o un agente nuevo que siga la página de incorporación sin instrucciones orales.
Corrija comandos ausentes y reglas ambiguas antes de añadir automatización paralela.
Mida tiempo hasta el primer cambio validado, preguntas repetidas, hallazgos, defectos e interrupciones.
No use el volumen de código generado ni el número de agentes como medida de éxito.

## Aceptación

El piloto termina cuando una persona nueva explica el recorrido, encuentra el repositorio responsable y ejecuta la comprobación documentada.
Un agente nuevo debe recuperar tarea, revisión, permisos, resultado, limitación pendiente y siguiente paso.
El equipo debe distinguir trabajo propuesto, implementado, probado localmente, integrado, desplegado y aceptado.
Separe la publicación de ediciones de lectura de la entrega del repositorio.
