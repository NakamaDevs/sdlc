# HUMAN

Preguntas y respuestas opcionales para el trabajo práctico con personas, agentes y automatización.

## P: ¿De qué es responsable la persona?

La persona es responsable de la intención, las prioridades, el contexto, la aceptación de riesgos, el juicio ético y la responsabilidad final. El agente puede ejecutar trabajo delegado, pero la responsabilidad debe ser explícita.

## P: ¿Qué debe proporcionar la persona antes de empezar el trabajo?

Proporcione el problema, el comportamiento deseado, las restricciones, la evidencia requerida, el alcance seguro, el propietario, la fecha límite cuando sea real y las condiciones de parada. Enlace los documentos fuente. No exija que el agente infiera prioridades ocultas.

## P: ¿Qué debe recibir la persona durante el trabajo?

Reciba actualizaciones que empiecen con la respuesta. Incluya el resultado actual, el alcance cambiado, la evidencia, los riesgos, las decisiones y la siguiente acción. Prefiera resúmenes limitados con artefactos recuperables.

## P: ¿Cómo puede la persona dirigir sin supervisión constante?

Use puntos de control. El agente puede continuar con trabajo local reversible. Debe detenerse ante cambios de producción, acciones destructivas, acceso a secretos, mensajes externos, cambios importantes de alcance o riesgos sin resolver.

La aprobación para acceder a secretos debe indicar la clase de secreto, el objetivo, el propósito y el vencimiento. El silencio no aprueba el acceso a secretos ni su reutilización.

Use un archivo de handoff o un comentario de issue para las decisiones. La persona puede responder de forma asíncrona. El agente debe reanudar desde el estado registrado.

## P: ¿Cómo debe funcionar la integración con el editor?

El editor debe mostrar las tareas del repositorio, el issue actual, los archivos cambiados, los tests, los diagnósticos y los enlaces a la evidencia. No debe ocultar la salida de comandos ni ejecutar acciones externas en silencio.

Ofrezca acciones rápidas para tareas de mise, pero mantenga la aprobación y el alcance visibles. Permita que una persona abra el comando completo, lo detenga, inspeccione el artefacto y lo ejecute de nuevo.

## P: ¿Qué ocurre si la persona no está disponible?

El agente debe terminar el trabajo seguro y limitado, registrar un handoff y detenerse en el siguiente límite de aprobación. No debe inferir una aprobación del silencio.

Use Herdr u otro runner persistente para trabajo local o remoto de larga ejecución. Mantenga la interfaz de la persona asíncrona.

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
