# FACTORY

Preguntas y respuestas opcionales para un equipo pequeño que opera una fábrica de software con agentes y personas.

## P: ¿Qué es una fábrica de software para un equipo pequeño?

Una fábrica de software es una línea de producción repetible para cambios de software. Los agentes ejecutan el ciclo: especificación, implementación, verificación y revisión. Las personas son responsables de la intención, las prioridades y las decisiones de merge.

El rastreador de issues es la cola. Cada unidad de trabajo recibe un issue y un espacio de trabajo aislado. El trabajo que no está en la cola no existe para la fábrica.

## P: ¿Qué roles existen?

Cada rol lee un conjunto limitado de entradas y escribe un conjunto limitado de salidas. La última columna indica la acción que el rol nunca debe ejecutar.

| Rol | Lee | Escribe | No debe |
|---|---|---|---|
| Propietario | El resumen diario | Decisiones, prioridades, aprobaciones de merge | Guardar la cola en la memoria |
| Agente director | Cada proyecto, repositorio, ciclo, resumen y nota de investigación | El resumen diario, delegaciones como issues, archivos de misión y portafolio | Hacer merge, release, deploy o gastar |
| Agente gestor de programa | Un ciclo, sus proyectos y sus pull requests | Propuestas de metas del ciclo, señales de trabajo detenido, reasignaciones de issues | Cambiar la política |
| Agente ingeniero de calidad y proceso | Ejecuciones de CI, cobertura de tests, fricción de la política, salud de los runners | Issues de brechas, propuestas de política, registros de pérdida | Debilitar una comprobación |
| Agente gestor de automatización de entrega | Pasos manuales repetidos, standups, comprobaciones de estado | Propuestas de automatización, issues de herramientas deterministas | Reemplazar una herramienta con una llamada al modelo |
| Agente gestor de cuota | Uso de la suscripción y configuración de reinicio | Informe de cuota, consejos de limitación | Guardar credenciales |
| Agente investigador | Fuentes externas | Notas de investigación | Cambiar código |
| Agente desarrollador | Un issue y un espacio de trabajo | Código, tests y un pull request | Tocar otro espacio de trabajo |

El agente director reporta al propietario. Los agentes gestores y el agente investigador reportan al agente director. Un agente desarrollador reporta a un agente gestor.

## P: ¿Qué recibe el propietario?

El propietario recibe un resumen. El resumen tiene exactamente cuatro secciones: Decidido, Necesita su decisión, En movimiento, Bloqueado.

El resumen pide como máximo tres decisiones. Una cuarta decisión espera al siguiente resumen.

Una herramienta determinista produce el contenido del resumen. La herramienta lee el rastreador, los repositorios y los runners. Un agente añade la explicación. El agente no cambia los conteos.

## P: ¿Qué dos cadencias aplican?

Los agentes se ejecutan bajo demanda y a diario. Un agente lee la salida de la herramienta antes de razonar. No razona sobre un estado que no ha leído.

Las personas reciben un resumen al día. Un ciclo tiene como máximo tres metas escritas. Las horas de silencio aplican. Ningún agente envía una notificación durante las horas de silencio.

## P: ¿Cómo cuenta la fábrica las pérdidas?

Una fábrica cuenta una línea detenida como pérdida. La herramienta de estado cuenta cinco tipos de pérdida:

- Trabajo en curso inactivo: un elemento iniciado sin propietario, o sin actualización en 14 días.
- Cambio estancado: un pull request abierto sin actualización en 21 días.
- Línea bloqueada: un elemento que espera a un bloqueador que nadie ha iniciado.
- Pérdida de capacidad: un carril de runner que está fuera de línea.
- Pérdida de cuota: una ventana de suscripción que se reinicia con capacidad sin usar.

Cada conteo aparece en el resumen diario con un enlace a la lista. Un conteo que aumenta en dos resúmenes consecutivos necesita una decisión.

## P: ¿Por qué herramientas deterministas antes que llamadas al modelo?

Una herramienta determinista cuesta menos que una llamada al modelo. Da el mismo resultado para la misma entrada. Un test puede comprobarla.

Un modelo resume la salida de la herramienta. No obtiene el estado. Cuando un agente necesita un dato, ejecuta la herramienta y lee el resultado.

Registre una consulta manual repetida como una solicitud de herramienta. El agente gestor de automatización de entrega es responsable de esa solicitud.

## P: ¿Cómo delega un agente?

Use un issue, un propietario, un espacio de trabajo y un pull request. Una delegación que rompe esta regla no es una delegación.

El agente que delega registra la decisión en el issue: la meta, el límite, la condición de parada y la evidencia esperada. El agente que recibe reporta a través del rastreador. No reporta a través del chat.

El agente que delega lee el reporte antes de actuar sobre él. Un reporte es una afirmación hasta que la evidencia se verifica.

## P: ¿Cómo mantenemos visible la fábrica?

Cada agente se ejecuta en una sesión de terminal. Una persona puede leer esa sesión desde cualquier máquina. El log de la sesión es el registro de auditoría.

Mantenga un inventario de agentes, sesiones y conversaciones. El inventario indica el propietario, el issue, el espacio de trabajo y la hora de inicio de cada entrada. Un agente sin entrada en el inventario no se ejecuta.

Use [HERDR.md](HERDR.md) para sesiones persistentes y [WORKSPACES.md](WORKSPACES.md) para el aislamiento de espacios de trabajo.

## P: ¿Cómo empieza la fábrica?

Adopte la fábrica en este orden. No omita ningún paso.

1. Audite el estado actual: proyectos, issues, pull requests, runners y agentes.
2. Escriba la misión y el mapa del portafolio. Indique qué construye el equipo y qué detiene.
3. Construya la herramienta determinista de estado. Haga que cuente los cinco tipos de pérdida.
4. Inicie el agente director. Dele el formato del resumen y la salida de la herramienta.
5. Inicie los agentes gestores de uno en uno. Confirme cada uno durante un ciclo.
6. Inicie el agente gestor de cuota. Registre cada ventana de reinicio.
7. Reestructure equipos, proyectos y ciclos a partir de la evidencia. No reestructure primero.

## Referencias

- [Ingeniería de harness de OpenAI](https://openai.com/index/harness-engineering/)
- [Repositorio de OpenAI Symphony](https://github.com/openai/symphony)
- [Agentic Project Manager](https://arxiv.org/abs/2601.16392)
