# CODEX

Esta guía adapta el SDLC independiente del lenguaje a los flujos basados en Codex. No sustituye `AGENTS.md` ni el contrato del repositorio.

Use [AGENT-TEAM.md](AGENT-TEAM.md) para el flujo adaptable del equipo y los ejercicios de aceptación.

## P: ¿Cómo debe Codex usar el SDLC?

Lea `AGENTS.md`, después `SDLC.md` y después la guía complementaria mínima pertinente. Siga la cadena de instrucciones y las puertas de calidad del repositorio.

Use la herramienta de plan para trabajo importante. Use inspección de solo lectura antes de editar. Siga la política de branch del repositorio. Cree el issue, branch y worktree de Herdr requeridos antes de editar cuando la política los requiera. Use cambios basados en trunk solo cuando la política los permita.

## P: ¿Qué debe informar Codex?

Informe primero la respuesta. Incluya evidencia, limitaciones, estado actual, responsable y siguiente acción. Mantenga acotada la salida de comandos. No afirme que un comando o referencia funciona sin verificar la versión y el resultado.

Use Linear o el tracker equivalente del repositorio cuando esté configurado. Actualice el issue tras progreso importante y al terminar un hito.

## P: ¿Cómo debe Codex manejar comentarios de review?

Use [CODE-REVIEW.md](CODE-REVIEW.md) para checks de precisión, campos de respuesta, estados, evidencia y resolución de threads.

Verifique cada hallazgo antes de cambiar código. Corrija hallazgos válidos y agregue evidencia de regresión.

Rechace hallazgos inválidos solo con evidencia exacta.

Resuelva un thread después de enviar e informar su resultado final.

Solicite otro review cuando todos los threads tengan un estado final.

## P: ¿Cómo debe Codex usar MCP y herramientas locales?

Use una tarea del repositorio o una skill cuando exista. Use MCP para capacidades y API reutilizables. Use Code Mode solo con un sandbox aislado, salida acotada y aprobación explícita para efectos secundarios.

Mantenga secretos en el límite del host. No exponga credenciales a prompts, código generado ni resultados de herramientas.

## Referencias

- [Construcción de un equipo de ingeniería nativo de IA](https://learn.chatgpt.com/guides/build-ai-native-engineering-team)
- [Buenas prácticas de Codex](https://cdn.openai.com/pdf/6a2631dc-783e-479b-b1a4-af0cfbd38630/how-openai-uses-codex.pdf)
- [Convención de AGENTS.md](https://learn.chatgpt.com/docs/agent-configuration/agents-md)
