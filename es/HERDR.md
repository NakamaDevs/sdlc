# HERDR

Preguntas y respuestas opcionales para el trabajo persistente de agentes, primero local o primero remoto.

## P: ¿Qué problema resuelve Herdr?

Herdr mantiene el trabajo del agente en un espacio de trabajo persistente. Esto ayuda cuando una laptop entra en reposo, se cierra una tapa, se cierra una terminal o un test largo continúa.

Úselo para conservar la salida visible de comandos, servidores de desarrollo de larga ejecución, ejecuciones de tests, sesiones del navegador y espacios de trabajo de agentes. Mantenga el trabajo inspeccionable y recuperable.

## P: ¿Cuál es el workflow primero local?

Empiece en el espacio de trabajo local de Herdr cuando la máquina local tenga las herramientas, los datos, las credenciales y el acceso de red requeridos. Mantenga el checkout del repositorio y los artefactos locales. Use tabs o panes con etiquetas para el agente, el servidor, los tests y los logs.

Lea una cantidad limitada de salida. Mantenga abierto el pane para inspección de una persona. Registre un marcador de éxito o fallo y la ruta del artefacto.

## P: ¿Cuál es el workflow primero remoto?

Use una instancia remota de Herdr cuando el trabajo necesite disponibilidad persistente, hardware más potente, una red estable o separación de la laptop. Use un espacio de trabajo aislado, credenciales de mínimo privilegio, acceso de red aprobado y limpieza explícita.

Conéctese desde la laptop como visor o controlador. El trabajo debe continuar si la laptop se desconecta. No copie secretos en comandos de pane ni en chat.

Obtenga aprobación explícita antes de que una tarea remota lea un secreto o use una credencial. Registre el aprobador, propósito, alcance y vencimiento. No reutilice esa aprobación para otra tarea u objetivo.

## P: ¿Cómo debe usar Herdr un agente?

Use la skill y la versión de Herdr aprobadas por el repositorio. Lea las instrucciones de la skill antes de operar panes o agentes vecinos. Reutilice tabs con etiquetas. Ejecute comandos largos en un pane visible. Espere un marcador literal de éxito o fallo. Lea una cantidad limitada de salida reciente.

Verifique los comandos con la skill fijada y la ayuda de herdr. No suponga nombres de pane, rutas de socket, banderas ni identificadores del espacio de trabajo.

## P: ¿Cómo mantenemos esto sin bloqueo para las personas?

Haga que cada tarea larga se pueda reanudar. Registre el comando, el directorio de trabajo, el entorno, el propietario, la hora de inicio, el marcador de estado, la ruta del artefacto y la acción de limpieza. Una persona puede irse a comer y volver al resultado.

Use notificaciones sólo para finalización, fallo, aprobación o una decisión importante. Mantenga el progreso rutinario en el pane o en el artefacto.

## P: ¿Cuáles son las reglas de seguridad?

Use espacios de trabajo aislados. No comparta un branch entre agentes que editan. No exponga públicamente el plano de control de Herdr. Proteja los sockets y las credenciales. Detenga los recursos remotos y elimine los datos temporales después de la tarea.

Antes de limpiar, conserve la evidencia requerida y confirme que la tarea no necesita el recurso. Detenga los procesos, revoque las credenciales temporales, elimine los datos temporales y verifique que la limpieza tuvo éxito. Registre cada recurso retenido, su propietario, su vencimiento y el motivo.

## Referencias

- [Herdr](https://herdr.dev/)
- [Guía de agentes de Herdr](https://herdr.dev/agent-guide.md)
- [Skill de Herdr v0.8.2](https://github.com/herdrdev/herdr/blob/v0.8.2/skills/herdr/SKILL.md)
