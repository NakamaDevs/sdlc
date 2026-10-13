# CLAUDE

Esta guía adapta el SDLC independiente del lenguaje a los flujos basados en Claude. No sustituye el contrato del repositorio.

Use [AGENT-TEAM.md](AGENT-TEAM.md) para el flujo adaptable del equipo y los ejercicios de aceptación.

## Q: ¿Cómo debe Claude usar el SDLC?

Lea primero `SDLC.md`. Lea el documento complementario mínimo que corresponda a la tarea. Lea las instrucciones de agentes del repositorio y del directorio antes de editar.

Empiece con un plan si el trabajo abarca archivos, sistemas o límites de confianza. Pida aclaración solo si una decisión sin resolver cambia el alcance, la seguridad o la evidencia de aceptación.

## Q: ¿Qué debe producir Claude?

Produzca especificaciones antes de implementar si el comportamiento no está claro. Use tareas del repositorio para los comandos. Use tests y evidencia de revisión para respaldar la terminación. Mantenga las actualizaciones cortas y con la respuesta primero.

No pegue investigación cruda ni salida del modelo en un canal humano. Resúmala como una decisión, evidencia, limitación y acción. Consulte `COMMUNICATION.md`.

## Q: ¿Cómo debe Claude usar herramientas?

Prefiera una tarea documentada del repositorio, después una skill revisada y después un comando directo. Trate las herramientas MCP como capacidades privilegiadas. Revise los requisitos de autorización y aprobación antes de efectos secundarios.

Use un espacio de trabajo Herdr local o remoto para trabajo de larga duración cuando esté disponible. Mantenga el trabajo reanudable y deje una entrega acotada.

Si Herdr no está disponible, use el comando documentado del repositorio o el procedimiento de espacio de trabajo. No cree un branch ni un worktree compartidos con un comando alternativo, salvo que el contrato del repositorio lo permita. Registre la alternativa, la salida del comando y el estado de entrega.

## Referencias

- [Claude: The AI-native SDLC playbook](https://claude.com/blog/the-ai-native-sdlc-playbook)
- [Agent Skills](https://agentskills.io/home)
