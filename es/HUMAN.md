# HUMAN

Preguntas y respuestas opcionales para el trabajo práctico con personas, agentes y automatización.

## P: ¿De qué es responsable la persona?

La persona es responsable de la intención, las prioridades, el contexto, la aceptación de riesgos, el juicio ético y la responsabilidad final. El agente puede ejecutar trabajo delegado, pero la responsabilidad debe ser explícita.

Algunas decisiones requieren juicio humano aunque el agente pueda implementar cualquiera de las opciones. Incluyen elegir qué necesidades tienen prioridad, aceptar una limitación conocida y decidir si una demora es mejor que la incertidumbre. Nombre a la persona que puede tomar esa decisión. Un coordinador puede organizar la conversación, pero no sustituir el juicio de la persona responsable porque el trabajo esté bloqueado.

## P: ¿Qué debe proporcionar la persona antes de empezar el trabajo?

Proporcione el problema, el comportamiento deseado, las restricciones, la evidencia requerida, el alcance seguro, el propietario, la fecha límite cuando sea real y las condiciones de parada. Enlace los documentos fuente. No exija que el agente infiera prioridades ocultas.

Use los roles y el brief de tarea de [AGENT-TEAM.md](AGENT-TEAM.md) para registrar la responsabilidad y los límites de ejecución. Acuerde qué decisiones puede tomar el agente dentro de ese brief. Distinga una preferencia, como la redacción, de una restricción, como excluir datos de clientes. Explique los conflictos entre restricciones antes de que el agente empiece.

## P: ¿Qué debe recibir la persona durante el trabajo?

Reciba actualizaciones que empiecen con la respuesta. Incluya el resultado actual, el alcance cambiado, la evidencia, los riesgos, las decisiones y la siguiente acción. Prefiera resúmenes limitados con artefactos recuperables.

El progreso rutinario pertenece al registro de la tarea o a una actualización acordada. Indica qué cambió y qué ocurre después, sin exigir una respuesta. Interrumpa cuando una decisión bloquee el siguiente paso permitido, cambie el resultado esperado o resulte costosa de aplazar. Indique cuándo importa la respuesta y qué ocurre si llega después. No marque el progreso ordinario como urgente para obtener atención.

Para una decisión, haga una pregunta que la persona designada pueda responder. Indique las opciones realistas, su recomendación y la consecuencia de cada opción. Incluya la evidencia que cambiaría la recomendación y la incertidumbre que permanece. Indique qué trabajo puede continuar de forma segura mientras espera la decisión. Separe las decisiones independientes para que una pregunta sin respuesta no detenga todas las tareas.

## P: ¿Cómo puede la persona dirigir sin supervisión constante?

Use puntos de control. El agente puede continuar con trabajo local reversible. Debe detenerse ante cambios de producción, acciones destructivas, acceso a secretos, mensajes externos, cambios importantes de alcance o riesgos sin resolver.

La aprobación para acceder a secretos debe indicar la clase de secreto, el objetivo, el propósito y el vencimiento. El silencio no aprueba el acceso a secretos ni su reutilización.

Use un archivo de handoff o un comentario de issue para las decisiones. La persona puede responder de forma asíncrona. El agente debe reanudar desde el estado registrado.

Registre qué cubre una aprobación: la acción propuesta, el alcance afectado, las condiciones y cualquier límite de tiempo. Aprobar la exploración de una opción no aprueba su entrega, un gasto ni un público más amplio. Una respuesta breve puede bastar cuando se refiere claramente a una propuesta registrada. Si puede referirse a varias propuestas, aclare antes de actuar.

Cuando un hecho nuevo cambie el riesgo o el alcance, describa el cambio y pregunte si la aprobación sigue vigente. No pregunte repetidamente sobre trabajo sin cambios. Mantenga la decisión junto a la evidencia para que una sesión posterior entienda qué aprobó realmente la persona.

## P: ¿Qué ocurre cuando cambian las prioridades o se cancela el trabajo?

Trate una prioridad cambiada como una instrucción nueva, no como un obstáculo para terminar el plan anterior. Confirme qué debe parar ahora, qué sigue siendo útil y si otra persona depende del trabajo incompleto. Indique al coordinador qué compromisos o fechas requieren revisión.

Detenga el trabajo nuevo dentro del alcance cancelado. Si una acción ya está en ejecución, compruebe si es seguro detenerla antes de interrumpirla. Registre cualquier resultado incierto. Conserve el trabajo recuperable y la evidencia salvo que el propietario solicite una limpieza autorizada. Nombre al responsable de la limpieza y cualquier costo o proceso pendiente. La cancelación no autoriza borrar trabajo compartido ni revertir una acción externa.

## P: ¿Cómo debe funcionar la integración con el editor?

El editor debe mostrar las tareas del repositorio, el issue actual, los archivos cambiados, los tests, los diagnósticos y los enlaces a la evidencia. No debe ocultar la salida de comandos ni ejecutar acciones externas en silencio.

Ofrezca acciones rápidas para tareas de mise, pero mantenga la aprobación y el alcance visibles. Permita que una persona abra el comando completo, lo detenga, inspeccione el artefacto y lo ejecute de nuevo.

## P: ¿Qué ocurre si la persona no está disponible?

El agente debe terminar el trabajo seguro y limitado, registrar un handoff y detenerse en el siguiente límite de aprobación. No debe inferir una aprobación del silencio.

Use Herdr u otro runner persistente para trabajo local o remoto de larga ejecución. Mantenga la interfaz de la persona asíncrona.

El servidor y los clientes de Rex ofrecen otra opción para mantener tareas persistentes. La desconexión de un cliente no demuestra que la tarea se detuvo en el servidor. Registre el host, la sesión y la identidad de la tarea en el handoff, sin exponer credenciales. Antes de reiniciar o reenviar el trabajo, inspeccione el estado actual de la tarea en ese host. Si la tarea terminó, recupere su resultado en vez de iniciar un duplicado. Si el resultado sigue siendo incierto, investigue antes de enviar el trabajo otra vez.

Acuerde antes una persona suplente para decidir cuando una fecha límite real lo requiera. La persona suplente necesita autoridad para esta decisión, no solo disponibilidad. Envíe la misma pregunta y evidencia por la vía acordada. Si nadie autorizado puede responder, indique la demora resultante y no ejecute el paso bloqueado. Una fecha límite puede justificar una interrupción, pero no crear permiso. Registre cuándo debe recibir atención la tarea sin notificar repetidamente al propietario.

## P: ¿Qué debe comprobar antes de reanudar el trabajo?

Lea la decisión y la conversación más recientes antes de seguir el próximo paso guardado. Use los requisitos de handoff de [AGENT-TEAM.md](AGENT-TEAM.md) para comparar el trabajo registrado con el estado actual. Confirme que el propietario, el objetivo, las acciones permitidas y la pregunta pendiente siguen vigentes. Compruebe si otra persona cambió el trabajo o completó el paso bloqueado.

Trate la evidencia antigua como evidencia de su estado registrado. Si cambiaron las entradas, el entorno o la acción propuesta, compruebe de nuevo los supuestos afectados. Resuma la diferencia antes de pedir una nueva decisión. No convierta una aprobación antigua en permiso para una acción distinta. Cuando nada relevante cambió, reanude el paso seguro registrado sin pedir la misma aprobación otra vez.

## P: ¿Cómo es un handoff útil y su reanudación?

Considere una tarea inventada de informes. Un rango de fechas vacío selecciona actualmente todos los registros, y el equipo no acordó si ese comportamiento es adecuado. El agente puede reproducirlo localmente, pero no comprobó el entorno compartido. Un handoff podría decir:

- Decisión necesaria antes de implementar: ¿La exportación debe exigir un rango de fechas o permitir todas las fechas con confirmación explícita?
- Recomiendo exigir un rango de fechas. Añade un paso de selección, pero reduce las exportaciones accidentales de registros antiguos. Mantener todas las fechas ayuda a quienes necesitan informes completos, pero requiere una advertencia clara y puede crear exportaciones mayores.
- El registro de la tarea enlaza la reproducción, los archivos cambiados y los escenarios preliminares con la revisión actual. Aún necesitamos el juicio del propietario sobre qué necesidad de informes tiene prioridad.
- Mientras esperamos, puedo preparar datos de prueba sintéticos y redactar el texto explicativo. No cambiaré el comportamiento de exportación ni publicaré nada.

Suponga que el propietario aprueba exigir un rango para esta tarea. Registre esa decisión y su alcance antes de reanudar. Al reanudar, lea la conversación más reciente e inspeccione el trabajo actual. Si otra persona ya añadió la validación del rango, coordine ese cambio en vez de implementarlo dos veces. Si cambió el requisito del informe, comunique ese hecho al propietario. Si no cambió, continúe dentro del alcance aprobado e informe del resultado con evidencia actual. La aprobación no incluye publicar el informe ni cambiar otras rutas de exportación.

## P: ¿Cómo protegemos la atención de las personas?

Use horas de silencio, presupuestos de notificaciones, una pregunta clara por handoff, salida compacta, actualizaciones agrupadas y niveles de urgencia explícitos. Nunca use notificaciones repetidas para forzar una respuesta.

## P: ¿Cómo sabemos que el proceso con personas funciona?

Compruebe si las personas pueden entender el estado, reemplazar al agente, recuperar el trabajo y tomar decisiones sin abrir cada log. Mida menos interrupciones y mejor evidencia, no presencia humana constante.

## P: ¿Cómo deben las personas compartir trabajo asistido por IA?

Lea, verifique, destile y revele la asistencia de IA cuando afecte la confianza o el review. Comparta primero la respuesta y la evidencia. Enlace artefactos grandes en vez de pegar la salida sin procesar del modelo en una conversación.

Use [COMMUNICATION.md](COMMUNICATION.md) para el contrato de uso compartido del equipo. Use [NOTES.md](NOTES.md) para los requisitos de registro y toma de notas.

## Referencias

- [Agentes de desarrollo de software con intervención humana](https://arxiv.org/abs/2411.12924)
- [Ingeniería de harness de OpenAI](https://openai.com/index/harness-engineering/)
- [OpenAI Symphony](https://openai.com/index/open-source-codex-orchestration-symphony/)
