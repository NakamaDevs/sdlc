# SDLC

## Mantenimiento del documento

Use [UPDATE.md](UPDATE.md) para la revisión, la evidencia de comandos y los registros de actualización.

Use [REFERENCES.md](REFERENCES.md) para consultar el catálogo de referencias verificadas.

Las copias de fuentes en `../references/` son evidencia. El equipo no las mantiene como guías.

## Archivos del proyecto y guías complementarias

Los archivos principales definen comportamiento, workflow, pruebas, capacidades, investigación, decisiones y evidencia.

Los proyectos pueden usar otros nombres y rutas. Cada proyecto debe conservar las responsabilidades de esta guía.

Las guías complementarias explican prácticas específicas. No sustituyen los archivos principales ni esta norma de finalización.

- [LINEAR.md](LINEAR.md) — seguimiento de issue, milestone, owner, status, progreso y revisión.
- [HARNESS.md](HARNESS.md) — ingeniería de harness, legibilidad, ciclos de respuesta, aislamiento y Symphony.
- [ADOPTION.md](ADOPTION.md) — admisión, estructura, plantillas, secuencia de adopción y cadencia operativa.
- [JOY.md](JOY.md) — trabajo significativo, autonomía, aprendizaje, concentración y bienestar del equipo.
- [BURNOUT.md](BURNOUT.md) — riesgos de agotamiento, límites de carga, recuperación y escalación.
- [STRUCTURE.md](STRUCTURE.md) — monorepos, varios repositorios, submódulos, repositorios meta y automatización del editor.
- [HUMAN.md](HUMAN.md) — participación humana, admisión, dirección, integración con editores y protección de la atención.
- [HERDR.md](HERDR.md) — espacios de trabajo persistentes, locales o remotos.
- [OWASP.md](OWASP.md) — normas OWASP, secretos, almacenamiento, attestations y seguridad previa al lanzamiento.
- [MCP.md](MCP.md) — transportes MCP, Code Mode, operación sin estado, autenticación, autorización y aprobaciones.
- [AI-MLOPS.md](AI-MLOPS.md) — Mojo, MAX, servicio de modelos, evaluación, benchmarks y operaciones de IA.
- [RUNNERS.md](RUNNERS.md) — runners de GitHub y GitLab, alojados o propios, aislamiento y Dagger.
- [INFERENCE.md](INFERENCE.md) — inferencia local, Apple Silicon, DGX Spark y validación del servicio de modelos.
- [COMMUNICATION.md](COMMUNICATION.md) — comunicación, síntesis, verificación y divulgación.
- [NOTES.md](NOTES.md) — grabación local, transcripción, notas, consentimiento y comportamiento multiplataforma.
- [INTEGRATION.md](INTEGRATION.md) — HTTP, SSE, WebSockets, webhooks, orden y recuperación.
- [CLAUDE.md](CLAUDE.md) — admisión y operación del SDLC específicas de Claude.
- [CODEX.md](CODEX.md) — admisión y operación del SDLC específicas de Codex.
- [HOOKS.md](HOOKS.md) — Git hooks, prek, prevención de filtraciones, smoke tests y checks locales rápidos.
- [DAGGER.md](DAGGER.md) — pipelines portátiles en contenedores para build, pruebas, caché y entrega.
- [AGENT-SKILLS.md](AGENT-SKILLS.md) — evidencia, estructura, distribución, versiones y confianza de skills.
- [MISE.md](MISE.md) — herramientas, runtimes, entornos, tareas, alcance y resultados con mise.
- [ASPIRE.md](ASPIRE.md) — desarrollo, pruebas, previews, deployment, redes, secretos, IA y observabilidad con Aspire.
- [OLLAMA.md](OLLAMA.md) — servicio local de modelos, Aspire, Claude Code, confianza y validación.
- [TESTING.md](TESTING.md) — especificaciones, pruebas FIRST, capas, evidencia de UI y validación.
- [SECURITY.md](SECURITY.md) — límites de confianza, secretos, checks locales y controles de supply chain.

## Ingeniería de harness

Trate el repositorio como el sistema de registro del conocimiento que usan los agentes.

Incluya controles ejecutables, ciclos de respuesta, trabajo aislado y evidencia de revisión.

Consulte [HARNESS.md](HARNESS.md) para la guía detallada de harness y Symphony.

## Modelo de adopción y operación

Use [ADOPTION.md](ADOPTION.md) para admitir el sistema SDLC, estructurar repositorios y crear plantillas.

La guía también explica cómo mantener las prácticas.

## Audiencia

Esta guía se dirige a ingenieros, reviewers, responsables de proyecto y agentes que entregan software juntos.

Los lectores pueden definir un workflow de proyecto o revisar uno existente.

## Alcance

Esta guía define principios de entrega y contratos de proyecto independientes de las herramientas.

También da orientación opcional para herramientas seleccionadas. Esa orientación no hace obligatoria una herramienta.

La guía cubre el trabajo desde la investigación hasta el merge o release.

No sustituye las políticas de producto, legales ni de la organización.

## Términos normativos

Los términos `debe`, `no debe` y `obligatorio` expresan requisitos.

Los términos `debería` y `recomendado` expresan prácticas preferidas.

Un proyecto puede elegir otra práctica si registra sus motivos.

Los términos `puede` y `opcional` expresan opciones permitidas.

## Inicio rápido

1. Defina el comportamiento en `spec.md`.
2. Registre el elemento y sus dependencias en el sistema de gestión del proyecto.
3. Defina la estrategia de pruebas en `test.md`.
4. Siga el grafo de trabajo obligatorio en `workflow.md`.
5. Registre la evidencia de capacidades en `feature-matrix.md`.
6. Ejecute los checks de calidad obligatorios.
7. Aplique la [norma canónica de finalización](#canonical-completion-standard).
8. Actualice el status del proyecto con evidencia reproducible.

## Términos importantes

- **Evidencia de aceptación:** prueba reproducible de que el comportamiento satisface sus criterios.
- **Agente:** software que ejecuta una tarea acotada para una persona u otro agente.
- **AppHost:** grafo de recursos de Aspire y su punto de entrada para la orquestación.
- **Artefacto:** archivo o registro conservado que contiene un resultado o evidencia.
- **Capacidad:** comportamiento visible para un usuario o sistema que produce un resultado.
- **Contract test:** prueba que comprueba un acuerdo de interfaz entre componentes.
- **Registro de evidencia:** registro de comandos, resultados, artefactos, fechas y owners.
- **Matriz de capacidades:** inventario que conecta cada capacidad con su implementación y evidencia.
- **Gate:** check obligatorio que el trabajo debe aprobar antes de la etapa siguiente.
- **Idempotente:** que puede repetirse sin un efecto adicional no deseado.
- **Elemento de gestión:** issue, ticket, tarea o registro equivalente del trabajo planificado.
- **Evidencia RED:** prueba fallida registrada que detecta el comportamiento ausente.
- **Evidencia GREEN:** prueba aprobada después de que la implementación satisface el comportamiento.
- **Grafo de trabajo:** secuencia obligatoria de etapas y transiciones de evidencia.

## Propósito

El sistema crea un método reutilizable para equipos que usan personas, agentes de IA o ambos.

El sistema debe admitir:

- especificaciones de comportamiento;
- decisiones de diseño de software;
- desarrollo guiado por pruebas;
- workflows con agentes;
- delegación controlada;
- gestión de proyectos;
- informes de progreso;
- revisión;
- checks de calidad;
- software funcional.

Este documento no depende de:

- lenguajes de programación;
- frameworks;
- bases de datos;
- proveedores de nube;
- interfaces de usuario;
- sistemas de seguimiento de issues;
- plataformas de agentes;
- estructuras de repositorios.

Cada proyecto puede adaptar los detalles de implementación.

El proyecto debe conservar los requisitos y las responsabilidades.

## Principio principal

El software funcional tiene prioridad.

El código no demuestra que el software funciona.

Una capacidad termina sólo cuando cumple la [norma canónica de finalización](#canonical-completion-standard).

## Principios de comunicación

Use dos niveles de comunicación.

### Comunicación técnica

Use Simplified Technical English (STE) para el contenido técnico en inglés.

Use Español Técnico Simplificado (STS) para el contenido técnico en español.

Aplique STE y STS a:

- especificaciones;
- workflows;
- descripciones de issues;
- pull requests;
- comentarios de revisión;
- notas de release;
- mensajes de error;
- instrucciones de pruebas;
- instrucciones para agentes;
- notas de handoff;
- actualizaciones de status.

Use la voz activa.

Use frases cortas.

Dé una idea en cada frase.

Use un término para cada concepto.

Conserve exactos los nombres técnicos, rutas, comandos, versiones, identificadores y mensajes de error.

No quite riesgos, limitaciones ni fallos para acortar el texto.

Use la fuente oficial de ASD-STE100 como autoridad para STE:

https://www.asd-ste100.org/

Use el skill STS del proyecto cuando el idioma de destino sea español.

Use skills STE o STS compatibles cuando el entorno los incluya.

No declare una certificación oficial si el proyecto no la tiene.

### Actualizaciones principales del proyecto

Use comunicación descendente y muestre primero la respuesta.

Use esta estructura:

1. Resolución o respuesta actual.
2. Situación.
3. Complicación o riesgo.
4. Evidencia.
5. Decisión o recomendación.
6. Owner y siguiente acción.

Ponga la respuesta principal al principio.

Agrupe los puntos de apoyo en secciones claras que no se superpongan.

Incluya evidencia para cada afirmación importante.

Separe hechos, decisiones, suposiciones y preguntas abiertas.

Use este formato para actualizar un milestone o proyecto:

```md
## Decisión

<Una frase con la respuesta actual.>

## Situación

<Lo que el equipo esperaba o terminó.>

## Complicación

<Lo que cambió, sigue pendiente o crea un riesgo.>

## Evidencia

- <Comando, enlace, prueba, resultado o documento.>
- <Comando, enlace, prueba, resultado o documento.>

## Recomendación

<La siguiente acción controlada.>

## Owner y status

- Owner: <persona o agente>
- Status: <status>
- Milestone: <milestone>
- Siguiente actualización: <condición para la siguiente actualización>
```

Use esta estructura para comentarios importantes de elementos de trabajo.

Úsela también para actualizaciones, resúmenes de revisión y handoffs humanos.

Este patrón usa Situation–Complication–Resolution y comunicación piramidal descendente.

El proyecto debe adaptarlo a su audiencia.

## Documentos obligatorios del proyecto

Cada proyecto debería mantener estos archivos o registros equivalentes:

- `spec.md` define el comportamiento observable y los límites del sistema;
- `workflow.md` define el ciclo, los roles, la evidencia y el adaptador de gestión;
- `test.md` define la estrategia, las capas, los comandos y la evidencia esperada;
- `feature-matrix.md` conecta cada capacidad con implementación, status, riesgos y evidencia;
- el registro de investigación separa hallazgos externos, limitaciones y decisiones locales;
- el registro de decisiones contiene opciones, alternativas, compromisos y consecuencias;
- el work log o registro de evidencia contiene comandos, resultados, artefactos, fechas y owners.

Los proyectos pueden usar rutas diferentes.

Los documentos deben conservar las mismas responsabilidades.

## `spec.md`: especificación de comportamiento

La especificación define el comportamiento.

No debe definir detalles de implementación, salvo que sean restricciones obligatorias.

### Secciones obligatorias

1. Status y versión.
2. Lenguaje normativo.
3. Definición del problema.
4. Objetivos.
5. Elementos fuera del objetivo.
6. Usuarios y actores externos.
7. Límites del sistema.
8. Modelos de dominio.
9. Comandos y resultados.
10. Máquinas de estado.
11. Contratos de entrada y salida.
12. Comportamiento de la interfaz de usuario.
13. Autorización y privacidad.
14. Persistencia y ciclo de vida.
15. Límites de integración.
16. Comportamiento ante errores.
17. Comportamiento de reintento y recuperación.
18. Observabilidad.
19. Compatibilidad y migración.
20. Requisitos de calidad.
21. Evidencia de aceptación.
22. Preguntas abiertas.
23. Decisiones.

### Contrato de comportamiento

Cada capacidad debe definir:

- comportamiento observable;
- entradas válidas;
- entradas no válidas;
- resultados correctos;
- fallos tipados;
- transiciones de estado;
- reglas de autorización;
- reglas de privacidad;
- comportamiento de reintento;
- comportamiento de recuperación;
- observabilidad;
- evidencia obligatoria.

Las operaciones no válidas no deben indicar éxito.

Las transiciones no válidas no deben modificar el estado.

Los reintentos deben ser seguros si la operación admite un identificador de correlación o idempotencia.

### Independencia de la implementación

La especificación no debe exigir:

- un lenguaje de programación;
- un framework;
- una base de datos;
- un proveedor de nube;
- una tecnología de frontend;
- un modelo de deployment;
- un agente específico.

Registre las opciones de implementación en architecture decision records.

## Principios de diseño de software

Use estos principios cuando mejoren el sistema:

- límites explícitos;
- cohesión alta;
- acoplamiento bajo;
- inversión de dependencias;
- contratos estables;
- lógica de dominio pura cuando sea práctico;
- transiciones de estado explícitas;
- comandos idempotentes;
- reintentos acotados;
- errores estructurados;
- efectos secundarios observables;
- fixtures deterministas;
- adaptadores sustituibles;
- interfaces pequeñas;
- cambios reversibles.

No aplique un patrón sólo porque tiene un nombre conocido.

Cada decisión debe explicar:

- el problema;
- el diseño elegido;
- las alternativas rechazadas;
- los compromisos;
- el efecto en las pruebas;
- el efecto operativo;
- el efecto en la migración o rollback.

## `feature-matrix.md`: inventario de capacidades y evidencia

Mantenga una fila por cada capacidad importante.

Cada fila debería incluir:

- nombre de la capacidad;
- referencia a la especificación;
- resultado para el usuario o sistema;
- owner de la implementación;
- ubicación de la implementación;
- evidencia de unit tests;
- evidencia de integration tests;
- evidencia de contract tests;
- evidencia de API tests;
- evidencia de UI o browser tests;
- evidencia end-to-end;
- evidencia de validación manual;
- evidencia de seguridad;
- evidencia de rendimiento cuando sea obligatoria;
- status actual;
- elemento de gestión del proyecto;
- riesgos conocidos;
- evidencia ausente;
- fecha de la última revisión.

Use status como:

- `planned`;
- `specified`;
- `in progress`;
- `partial`;
- `verified`;
- `blocked`;
- `deprecated`.

No marque una capacidad como `verified` si sólo aprueba una capa de pruebas.

Registre la evidencia existente.

Registre la evidencia pendiente.

Actualice la matriz en el mismo cambio que la capacidad, prueba o especificación.

## `test.md`: especificación de pruebas y validación

Defina la estrategia de pruebas antes de la implementación.

### Principios FIRST

Las pruebas deberían ser:

- rápidas;
- independientes;
- repetibles;
- autovalidables;
- oportunas.

Use términos equivalentes si el proyecto tiene una norma existente.

Conserve las mismas propiedades.

### Capas de pruebas

Seleccione sólo las capas adecuadas para el proyecto:

1. unit;
2. component;
3. integration;
4. contract;
5. API;
6. browser o UI;
7. end to end;
8. performance;
9. security;
10. accessibility;
11. validación exploratoria manual.

Use la capa más baja que dé confianza suficiente.

Use pruebas superiores cuando las capas inferiores no puedan demostrar el comportamiento.

### Campos del plan de pruebas

Para cada comportamiento, registre:

- comportamiento;
- riesgo;
- capa de pruebas;
- fixture o preparación;
- resultado RED esperado;
- comando RED exacto;
- límite de implementación;
- resultado GREEN esperado;
- comando GREEN exacto;
- protección para el refactor;
- riesgo de testabilidad pendiente.

Si no observó el resultado RED, registre:

`RED not yet evidenced.`

No deduzca el historial de TDD de un diff final.

### Validación local

Cada proyecto debe definir una ruta de validación local.

Debería incluir:

- herramientas obligatorias;
- preparación de dependencias;
- pruebas específicas;
- component tests;
- API tests;
- contract tests;
- integration tests;
- UI tests cuando correspondan;
- end-to-end tests cuando correspondan;
- checks de calidad completos.

Otro colaborador o agente debe poder seguir esta ruta.

## Trazabilidad de UI y computer use

Use la exploración con computer use sólo cuando aporte valor.

Antes de convertir la exploración manual en automatización, registre:

- ruta;
- viewport;
- paso;
- acción;
- selector o locator;
- estado esperado;
- estado observado;
- screenshot o evidencia del fallo;
- prueba automatizada resultante.

Prefiera selectores basados en:

- roles;
- labels;
- texto visible;
- contratos de prueba explícitos.

Evite coordenadas, clases CSS y estructuras DOM inestables como selectores principales.

Convierta los flujos manuales estables en UI tests automatizados.

Conserve la validación manual para el comportamiento que la automatización no puede certificar.

## `workflow.md`: ciclo de software con agentes

Defina cómo las personas y los agentes llevan el trabajo desde una idea hasta la entrega.

### Grafo de trabajo obligatorio

```text
research
  -> specification
  -> design decision
  -> test plan
  -> RED evidence
  -> implementation
  -> GREEN evidence
  -> focused review
  -> quality checks
  -> project update
  -> human review
  -> merge or release
```

Un proyecto debe usar este grafo como base de su ciclo.

Un proyecto puede añadir una etapa.

Sólo puede quitar una etapa cuando ésta no corresponda.

El proyecto debe registrar cada cambio y su motivo.

Debe conservar evidencia explícita entre las etapas aplicables.

### Roles de los agentes

Use sólo los roles que necesite el proyecto:

- coordinator;
- research agent;
- specification agent;
- architecture agent;
- test agent;
- implementation agent;
- review agent;
- validation agent;
- release agent.

Cada agente debe tener:

- un objetivo;
- entradas definidas;
- resultado definido;
- alcance acotado;
- archivos o sistemas permitidos;
- criterios de aceptación;
- requisitos de validación;
- estado de handoff;
- comportamiento ante bloqueos.

Los agentes no deben ampliar el alcance sin comunicarlo.

Cree otro elemento para el trabajo importante fuera del alcance.

### Reglas de delegación

Delegue el trabajo cuando sea:

- independiente;
- acotado;
- revisable;
- útil en paralelo;
- asignado a un owner claro.

No delegue trabajo muy acoplado si el resultado bloquea el progreso inmediato.

Use espacios separados cuando:

- los agentes modifican archivos que se superponen;
- las branches dependen entre sí;
- los checks largos interfieren;
- el aislamiento reduce el riesgo.

Use desarrollo basado en trunk cuando los cambios sean:

- pequeños;
- independientes;
- centrados en documentación;
- seguros para una revisión conjunta.

### Ciclo recomendado para agentes

Los agentes deberían usar este ciclo para cada elemento.

Un proyecto puede usar un ciclo más corto para trabajo acotado y de bajo riesgo.

1. Localice o cree el elemento de gestión.
2. Enlácelo con un milestone, iniciativa u objetivo.
3. Lea las instrucciones y especificaciones relacionadas.
4. Investigue las preguntas pendientes.
5. Registre fuentes, hallazgos, límites y decisiones.
6. Actualice la especificación.
7. Defina el plan de pruebas.
8. Escriba la prueba específica más pequeña.
9. Ejecute la prueba y registre la evidencia RED.
10. Implemente el cambio de comportamiento más pequeño.
11. Ejecute la prueba y registre la evidencia GREEN.
12. Ejecute pruebas cercanas.
13. Actualice la matriz de capacidades.
14. Ejecute los checks obligatorios.
15. Haga una revisión específica.
16. Actualice el elemento de gestión.
17. Termine el handoff con evidencia completa o un bloqueo explícito.

## Práctica de investigación

La investigación debe responder una pregunta definida.

Cada registro debería incluir:

- pregunta;
- fuente;
- fecha de la fuente;
- hallazgo;
- limitación;
- decisión local;
- especificación afectada;
- capacidad afectada;
- trabajo posterior.

Prefiera fuentes oficiales y primarias.

Separe los hechos externos de las decisiones locales.

No convierta un resumen en requisito sin una decisión documentada.

## Práctica de Agent Skills

Use el formato Agent Skills para capacidades reutilizables.

Un skill debería contener:

```text
skill-name/
├── SKILL.md
├── scripts/
├── references/
├── assets/
└── examples/
```

Sólo `SKILL.md` es obligatorio.

Use divulgación progresiva:

1. Descubra el skill por su nombre y descripción.
2. Actívelo cuando coincida con la tarea.
3. Lea archivos de apoyo sólo cuando los necesite.
4. Ejecute el workflow documentado.

Cree un skill compartido sólo cuando:

- el workflow se repite en varios proyectos;
- tiene entradas y resultados estables;
- tiene reglas de seguridad claras;
- tiene evidencia de validación;
- ningún skill existente cubre la necesidad.

Antes de crear un skill:

- busque en el repositorio del equipo;
- busque en el ecosistema Agent Skills;
- revise los skills relacionados;
- registre decisiones de reutilización, adaptación y sustitución.

Las referencias útiles incluyen:

- https://agentskills.io/home
- https://github.com/vercel-labs/skills
- https://www.skills.sh/
- https://github.com/danyuchn/asd-ste100-skill

Mantenga neutrales los skills compartidos.

Mantenga las reglas específicas en el repositorio del proyecto.

### Distribución y controles de supply chain para skills

Use `npx skills` o un instalador equivalente sólo desde una fuente revisada.

Revise el repositorio, `SKILL.md`, scripts, referencias, assets, metadatos, install hooks y archivos generados antes de activar.

Use skills del proyecto si el workflow forma parte del contrato del repositorio.

El equipo debe revisar esos skills con el código.

Use skills del usuario para preferencias personales de bajo riesgo que funcionen en varios repositorios.

Use plugins o paquetes privados cuando la organización sea dueña del workflow.

Úselos también para actualizaciones compartidas o permisos controlados.

Prefiera una fuente con versión, un commit o tag inmutable y un checksum o lock.
Exija también una licencia revisada y una instalación reproducible.

Registre la URL, revisión, nombres, alcance, agentes, owner y política de actualización.

No instale un repositorio completo cuando baste un skill.

Mantenga pequeños los scripts ejecutables y revíselos antes de ejecutarlos.

Prefiera scripts locales con runtimes fijados.

No permita descargas arbitrarias, lectura de archivos ajenos ni acceso a producción sin una decisión explícita.

Tampoco permita envíos de código o logs a un servicio alojado sin esa decisión.

`npx skills add` admite instalación local y global, selección, agentes, rutas locales, fuentes Git y URL directas.

`npx skills use` permite usar un skill sin instalarlo.

Use estos modos de forma deliberada y registre la opción.

Use el marketplace privado de NakamaDevs para paquetes compartidos revisados.

Mantenga los skills específicos en el repositorio.

Use un lock de skills o manifiesto equivalente para revisiones exactas.

Revise las actualizaciones como código y ejecute pruebas antes de promoverlas.

Referencias:

- [Especificación y formato de Agent Skills](https://agentskills.io/home)
- [CLI npx skills](https://github.com/vercel-labs/skills)
- [Marketplace de skills de NakamaDevs](https://github.com/NakamaDevs/skills)

## Adaptador de gestión del proyecto

Use el sistema de gestión seleccionado por el proyecto.

La herramienta registra el trabajo, pero no define los principios del ciclo.

Aplique estos requisitos a cualquier sistema de issues.

Mantenga nombres y mappings de status en `workflow.md` o una guía complementaria.

Para Linear, use [LINEAR.md](LINEAR.md) para los mappings de issue, milestone, owner, status, progreso y revisión.

### Requisitos de los elementos de trabajo

Cada elemento planificado debe tener:

- un título claro;
- un owner;
- un proyecto;
- un milestone u objetivo principal;
- alcance;
- criterios de aceptación;
- requisitos de pruebas;
- dependencias;
- status actual;
- enlaces a documentos;
- riesgos conocidos.

### Reglas de status

Use status que reflejen la realidad:

- el trabajo planificado permanece en cola;
- el trabajo activo cambia a `In Progress`;
- una implementación terminada cambia a revisión;
- el trabajo aprobado cambia a merge o release;
- el trabajo bloqueado registra el bloqueo exacto;
- el trabajo terminado cambia a `Done` sólo después de aprobar la aceptación.

No termine un elemento sólo porque el código parece terminado.

### Reglas de comentarios y actualizaciones

Publique una actualización después de:

- terminar la investigación;
- cambiar la especificación;
- reproducir un problema;
- registrar evidencia RED;
- avanzar la implementación;
- registrar evidencia GREEN;
- encontrar resultados de revisión;
- terminar los checks de calidad;
- terminar un grupo importante de tareas;
- encontrar un bloqueo;
- avanzar un milestone.

Cada actualización debería indicar:

- la respuesta o el resultado actual;
- qué cambió;
- la evidencia;
- el riesgo pendiente;
- la decisión o recomendación;
- el owner;
- el status actual.

Use STE o STS para la prosa.

Conserve exactos comandos, rutas, identificadores y mensajes de error.

No oculte fallos.

### Reglas de milestones

Agrupe el trabajo relacionado en milestones lógicos.

Cada milestone debe tener:

- un resultado;
- tareas hijas;
- dependencias;
- evidencia de aceptación;
- progreso actual;
- bloqueos conocidos;
- criterios de finalización.

Actualícelo después de terminar un grupo importante de tareas.

Mantenga su progreso alineado con el status y la evidencia de las tareas hijas.

## Calidad y revisión

Antes del handoff:

1. Ejecute las pruebas específicas.
2. Ejecute las component tests cercanas.
3. Ejecute integration tests y contract tests.
4. Ejecute UI tests y end-to-end tests cuando correspondan.
5. Ejecute checks de seguridad, accesibilidad y rendimiento cuando correspondan.
6. Ejecute el gate local completo.
7. Revise exactitud, seguridad, diseño, pruebas y divergencia documental.
8. Actualice las especificaciones y la matriz de capacidades.
9. Registre toda la evidencia en el sistema de gestión.

Una revisión debe identificar:

- defectos;
- pruebas ausentes;
- especificaciones ausentes;
- riesgos de seguridad;
- riesgos de compatibilidad;
- riesgos operativos;
- divergencia documental;
- suposiciones sin verificar.

## Seguridad y límites de confianza

Cada proyecto debe definir:

- entradas confiables y no confiables;
- manejo de credenciales;
- límites de sandbox;
- límites del sistema de archivos;
- acceso de red;
- reglas de ejecución de procesos;
- retención de artefactos;
- reglas de eliminación de datos;
- puntos de aprobación humana.

Los agentes no deben exponer secretos en:

- código;
- logs;
- prompts;
- comentarios;
- screenshots;
- artefactos.

Los agentes deben conservar el trabajo ajeno.

Los agentes no deben usar comandos destructivos sin autorización clara y un destino verificado.

## Seguridad local y confianza en herramientas

Evite una filtración antes de que llegue a un agente, repositorio, artefacto o servicio remoto.

Mantenga secretos fuera del código, historial de shell, argumentos, volcados, logs, trazas y screenshots.

Manténgalos también fuera de snapshots, crash reports y contexto comprimido.

Use scanners locales o propios de forma predeterminada.

Fije sus versiones y reglas.

Ejecútelos con tareas mise, resultados acotados y un artefacto recuperable.

Trate scanners, formatters, skills, plugins, actions, imágenes y reglas descargadas como entradas ejecutables de supply chain.

Línea mínima de seguridad local:

- Gitleaks para detectar secretos en el working tree y el historial de Git;
- Semgrep Community Edition para SAST local y reglas específicas;
- Trivy para archivos, dependencias, imágenes, errores de configuración, secretos y SBOM;
- zizmor para analizar workflows y automatización de GitHub Actions;
- OWASP Dependency-Check cuando el ecosistema y el riesgo justifiquen otra base SCA local.

Use `gitleaks git` para el historial y `gitleaks dir` para archivos cuando la versión los admita.

Use `semgrep --config=auto` sólo después de revisar la fuente de reglas y el uso de red.

Use `trivy fs` para checks locales. Añada `--scanners misconfig` para comprobar la configuración.

Use `zizmor` con archivos de workflow. Prefiera SARIF cuando CI consuma hallazgos estructurados.

Un scan limpio no demuestra seguridad.

Registre versiones, reglas o base, destino, exclusiones, resultado y puntos ciegos conocidos.

Revise cada allowlist y baseline como código.

Cada excepción debe nombrar regla, ruta exacta, motivo, owner, vencimiento y prueba sustituta.

Ejecute el scan de secretos antes del commit y en CI.

Revise el historial cuando sospeche una filtración.

Si encuentra un secreto, primero revóquelo o rótelo.

Quitar el texto del último commit no invalida una credencial filtrada.

Referencias:

- [Gitleaks](https://github.com/gitleaks/gitleaks)
- [Semgrep Community Edition](https://semgrep.dev/products/community-edition/)
- [Trivy filesystem and secret scanning](https://trivy.dev/docs/latest/target/filesystem/)
- [zizmor](https://docs.zizmor.sh/)
- [OWASP Dependency-Check guidance](https://owasp.org/www-project-developer-guide/release/implementation/dependencies/dependency_check/)

<a id="canonical-completion-standard"></a>

## Norma canónica de finalización

Un proyecto sólo puede declarar terminada una capacidad cuando:

- el comportamiento está especificado;
- el equipo comprende el diseño;
- existe el plan de pruebas;
- está registrada la evidencia RED y GREEN obligatoria;
- la implementación está terminada;
- las pruebas pertinentes pasan;
- los checks de calidad pasan;
- la documentación está actualizada;
- la matriz de capacidades está actualizada;
- el status de gestión es exacto;
- los reviewers pueden reproducir el resultado;
- el equipo acepta o registra los riesgos pendientes.

El objetivo es software funcional, confiable y revisable.

El objetivo no es la automatización máxima.


## Desarrollo local y observabilidad en tiempo de ejecución con Aspire

Aspire es opcional.

Úselo cuando el proyecto tenga varios servicios, dependencias, contenedores o
procesos que necesiten un solo ciclo de desarrollo local.

Aspire no es un framework obligatorio. El proyecto puede usar otra herramienta
de orquestación local con las mismas responsabilidades.

### Objetivos

La capa de orquestación local debería proporcionar:

- un comando para iniciar el sistema local;
- orden de dependencias;
- estado funcional de los recursos;
- detección de endpoints;
- logs de consola;
- logs estructurados;
- trazas distribuidas;
- reinicio de recursos;
- apagado limitado;
- integración con pruebas locales;
- diagnósticos legibles por agentes.

El software funcional debe permanecer como el objetivo principal.

La capa de orquestación no debe ocultar los fallos de la aplicación.

### Configuración

Cuando el proyecto use Aspire, instale la versión de Aspire CLI aprobada por
el proyecto.

Para un proyecto Aspire existente, inicialice o actualice las instrucciones
para agentes:

```sh
aspire agent init
```

Para una configuración no interactiva:

```sh
aspire agent init \
  --non-interactive \
  --skills all \
  --skill-locations standard
```

Use la ubicación de agentes admitida por el proyecto.

No instale skills globalmente, salvo que el equipo necesite disponibilidad global.

El paquete oficial de workflows de Aspire incluye:

- `aspire`;
- `aspire-init`;
- `aspire-orchestration`;
- `aspire-monitoring`;
- `aspire-deployment`;
- `aspireify`.

Use el skill principal `aspire` cuando no esté claro cuál workflow usar.

Use `aspire-orchestration` para las operaciones del ciclo de vida.

Use `aspire-monitoring` para logs, trazas, métricas y diagnósticos en tiempo de ejecución.

Use `aspireify` cuando añada Aspire a una base de código existente.

Consulte la [documentación oficial de skills de Aspire](https://aspire.dev/get-started/aspire-skills/).

### Configuración de MCP de Aspire

Use los skills de Aspire para enseñar el workflow a los agentes.

Use Aspire MCP cuando los agentes necesiten información activa de una aplicación en ejecución.

Inicie el servidor MCP con:

```sh
aspire agent mcp
```

Para Claude Code u otros clientes MCP, el proyecto puede usar esta configuración:

```json
{
  "mcpServers": {
    "aspire": {
      "command": "aspire",
      "args": [
        "agent",
        "mcp"
      ]
    }
  }
}
```

Para VS Code, use la configuración `servers` específica del cliente.

El proyecto debe generar o validar la configuración con:

```sh
aspire agent init
```

El servidor Aspire MCP usa comunicación STDIO local.

No abre un listener de red.

Es una herramienta para la etapa de desarrollo.

No la exponga mediante un endpoint público.

Consulte la [documentación oficial de Aspire MCP](https://aspire.dev/get-started/aspire-mcp-server/).

### Ciclo de observabilidad del agente

Cuando un agente trabaje en un sistema local en ejecución, use este orden:

1. Enumere los AppHost.
2. Seleccione el AppHost correcto.
3. Enumere los recursos.
4. Compruebe el estado y el funcionamiento de los recursos.
5. Detecte el endpoint de destino.
6. Reproduzca el comportamiento.
7. Lea los logs de consola.
8. Lea los logs estructurados.
9. Busque la traza distribuida relacionada.
10. Lea los logs estructurados de esa traza.
11. Formule un diagnóstico.
12. Cambie el límite pertinente más pequeño.
13. Reproduzca de nuevo el comportamiento.
14. Confirme la corrección con pruebas.
15. Registre la evidencia.

No empiece con cambios en el código.

Primero, examine el sistema en ejecución.

### Herramientas MCP de Aspire

El agente debería usar las herramientas siguientes cuando estén disponibles:

- `list_apphosts`;
- `select_apphost`;
- `list_resources`;
- `list_console_logs`;
- `list_structured_logs`;
- `list_traces`;
- `list_trace_structured_logs`;
- `execute_resource_command`;
- `doctor`;
- `list_integrations`;
- `get_integration_docs`;
- `search_docs`;
- `get_doc`.

Use consultas limitadas.

Solicite sólo el recurso, intervalo de tiempo o traza que necesite para el issue actual.

Los logs y las trazas grandes pueden quedar truncados.

Guarde localmente la evidencia pertinente cuando el proyecto lo permita.

No pegue logs completos en Linear.

### Investigación de logs y trazas

Para una solicitud fallida, registre:

- el recurso;
- el endpoint;
- el identificador de solicitud o correlación;
- la marca de tiempo;
- el estado del recurso;
- el estado funcional;
- las líneas pertinentes del log de consola;
- los campos pertinentes del log estructurado;
- el identificador de la traza;
- el span fallido;
- el tipo de error;
- la duración;
- el número de reintentos;
- la causa sospechada;
- la causa confirmada.

Use la traza para seguir la solicitud a través de los límites de los procesos.

Use logs estructurados para identificar la operación y la transición de estado.

Use logs de consola para diagnosticar fallos de inicio, apagado y procesos.

### Diseño de recursos

Cada recurso debería definir:

- un nombre estable del recurso;
- un comando de proceso o contenedor;
- los argumentos;
- las variables de entorno;
- el directorio de trabajo;
- las dependencias;
- la comprobación de disponibilidad;
- la comprobación de estado;
- el endpoint;
- el tiempo límite de inicio;
- el tiempo límite de apagado;
- el comportamiento del log;
- el comportamiento ante fallos.

El AppHost debe declarar el grafo de recursos.

La aplicación debe controlar su comportamiento.

No coloque reglas de negocio en la capa de orquestación.

### Ciclo de desarrollo local

El proyecto debería definir estos comandos:

```sh
<start-command>
<status-command>
<logs-command>
<traces-command>
<restart-command>
<stop-command>
<focused-test-command>
<full-quality-command>
```

Los comandos pueden usar Aspire CLI, Aspire MCP, scripts del proyecto u otra
herramienta local.

El proyecto debe documentar:

- cómo iniciar el sistema;
- cómo esperar la disponibilidad;
- cómo buscar endpoints;
- cómo examinar logs;
- cómo examinar trazas;
- cómo reiniciar un recurso;
- cómo detener el sistema;
- cómo recuperarse de procesos obsoletos;
- cómo recuperarse de conflictos de puertos;
- cómo restablecer datos desechables;
- cómo conservar los datos locales obligatorios;
- cómo ejecutar pruebas contra el sistema local.

### Transferencia al navegador y la API

Cuando una prueba de UI necesite un recurso en ejecución:

1. Use herramientas de orquestación para detectar el endpoint.
2. Registre el endpoint y el nombre del recurso.
3. Use la herramienta de prueba del navegador o de la API.
4. Registre la ruta, el selector, la solicitud y el estado esperado.
5. Use logs y trazas cuando falle la prueba.
6. Convierta el flujo estable en una prueba automatizada.
7. Guarde la traza de prueba en la documentación de pruebas del proyecto.

No fije puertos dinámicos en el código, salvo que el contrato del proyecto los exija.

### Seguridad

De forma predeterminada, los datos de ejecución pueden incluir:

- metadatos de recursos;
- logs de consola;
- logs estructurados;
- trazas distribuidas;
- información de endpoints.

Excluya los recursos sensibles del acceso mediante MCP cuando sea necesario.

Use el mecanismo de exclusión de recursos admitido por la plataforma.

No exponga:

- credenciales;
- tokens;
- datos privados de usuarios;
- datos de candidatos;
- datos de producción;
- variables de entorno secretas;
- cuerpos de solicitudes sensibles.

Trate los logs y las trazas como datos del proyecto.

Defina las reglas de retención y censura.

### Validación

La configuración de orquestación local es válida cuando:

- el AppHost o su equivalente inicia;
- las dependencias quedan disponibles;
- los endpoints se pueden detectar;
- una solicitud de API termina correctamente;
- un flujo del navegador termina correctamente cuando corresponde;
- los logs están disponibles;
- una traza está disponible cuando la telemetría está configurada;
- un recurso se puede reiniciar;
- el apagado no deja procesos huérfanos;
- las pruebas específicas terminan correctamente;
- el gate de calidad local completo termina correctamente.

Registre la telemetría ausente como una limitación explícita.

No declare cobertura de trazas cuando la aplicación no las emita.

### Fuentes

Use la documentación oficial de Aspire para la configuración y el comportamiento actual de los comandos:

- [Aspire skills](https://aspire.dev/get-started/aspire-skills/)
- [Aspire MCP server](https://aspire.dev/get-started/aspire-mcp-server/)

La documentación actual de Aspire indica que Aspire MCP puede exponer datos a
los agentes de IA locales. Estos datos incluyen el estado de los recursos,
los logs de consola, los logs estructurados, las trazas distribuidas y los
comandos de recursos. También indica que primero deberían instalarse los skills de
Aspire. Añada MCP cuando necesite datos activos de ejecución. [Skills de
Aspire](https://aspire.dev/get-started/aspire-skills/), [servidor MCP de
Aspire](https://aspire.dev/get-started/aspire-mcp-server/)


### Pruebas y entornos efímeros con Aspire

Las pruebas con Aspire son opcionales. Úselas cuando el AppHost pueda crear un
grafo local realista de dependencias o un entorno desechable de vista previa.

Use `Aspire.Hosting.Testing` y `DistributedApplicationTestingBuilder` para pruebas funcionales y de integración.
Cree un AppHost por suite cuando las pruebas puedan compartir recursos aislados de forma segura.
Deséchelo cuando termine la suite. Crear un AppHost para cada prueba añade costes de inicio y contenedores.

Use las API documentadas de acceso a recursos para obtener endpoints dinámicos,
cadenas de conexión, estados de recursos y logs. No fije puertos en el código.
Tampoco los detecte mediante la salida del proceso.

Cree un entorno efímero local cuando la prueba necesite dependencias reales.
Use volúmenes desechables, nombres únicos de recursos y credenciales sólo para pruebas.
Use tiempos límite de inicio y limpie el entorno después de la suite.
Restablezca el estado entre pruebas cuando comparta el AppHost.

Cree un entorno efímero publicado de vista previa cuando las pruebas necesiten un endpoint enrutable.
Esto se aplica a pruebas del navegador o de integración externa.
Use `aspire publish` para crear los artefactos de destino.
Después, aplíquelos con el destino o pipeline de despliegue aprobado.
Añada un identificador único del entorno y metadatos de branch o commit.
Añada también un tiempo de vida, datos desechables, un límite de autenticación y una limpieza automática.

Un AppHost publicado no es automáticamente un entorno de vista previa.
El destino debe proporcionar aislamiento, exposición de endpoints, inyección de secretos, limpieza de datos, observabilidad y eliminación.
Registre el comando y la versión específicos del destino.

El gate de vista previa debe esperar la disponibilidad y ejecutar pruebas de contrato de API.
También debe ejecutar smoke tests del navegador cuando correspondan y comprobar logs y trazas.
Debe publicar artefactos limitados y eliminar el entorno tras el TTL o un reintento fallido de limpieza.
Nunca use datos de producción en un entorno de vista previa.

En CI, use un runner con un entorno de ejecución de contenedores admitido.
La documentación de Aspire admite runners Linux alojados en GitHub para contenedores de prueba Linux.
Para este uso, los runners alojados Windows y macOS necesitan un entorno configurado en un runner self-hosted.

Referencias:

- [Administración del AppHost en pruebas](https://aspire.dev/testing/manage-app-host/)
- [Acceso a recursos en pruebas](https://aspire.dev/testing/accessing-resources/)
- [Escenarios avanzados de pruebas](https://aspire.dev/testing/advanced-scenarios/)
- [Pruebas en pipelines de CI/CD](https://aspire.dev/testing/testing-in-ci/)

### Control de observación, recarga en caliente y reconstrucción de Aspire

Use las funciones de observación y recarga en caliente de AppHost para los cambios del ciclo interno.
Úselas cuando el recurso seleccionado las admita.
Mantenga el proceso AppHost en ejecución mientras se recarga el código de la aplicación.
No reconstruya ni vuelva a crear todos los recursos después de cambiar sólo el código fuente.

Separe los cambios en tres clases:

- cambios en el código fuente: recargue o reinicie sólo el proyecto o proceso afectado;
- cambios en la topología de AppHost: reconstruya el AppHost y concilie el grafo de recursos;
- cambios en imágenes, paquetes, toolchains o infraestructura: reconstruya el artefacto afectado y repita las comprobaciones de disponibilidad y humo.

Mantenga las bases de datos y otros recursos con estado durante el ciclo interno.
Hágalo cuando la prueba no necesite un estado limpio.
Use tareas explícitas para restablecer el esquema, los datos iniciales y los volúmenes.
Use un entorno efímero limpio para validar la release y la compatibilidad.

Muestre el comportamiento de observación en tareas con nombre.
La tarea debe indicar si reutilizó AppHost, reinició un recurso, reconstruyó una imagen o recreó el entorno.
Evite observadores anidados que compitan por los mismos archivos o puertos.

Use tareas separadas para `dev:watch`, `dev:restart`, `dev:rebuild` y `dev:clean`.
Las tareas de reconstrucción y limpieza deben exigir confirmación explícita o un destino desechable.

Referencia: [Recarga en caliente y observación de Aspire](https://aspire.dev/app-host/hot-reload-and-watch/)

### Redes, detección de servicios y HTTPS local con Aspire

Modele las dependencias de servicios con referencias de Aspire.
Use `WithReference` o la integración equivalente del lenguaje para proporcionar datos de endpoints y configuración.
Resuelva los endpoints desde el contexto de red que los consume.

Mantenga separados los endpoints del host, del contenedor y los públicos.
Aspire documenta contextos de red distintos para localhost, la red puente de contenedores e Internet.
Una URL que funciona en el host puede fallar dentro de un contenedor.

Use YARP cuando el sistema local necesite un punto de entrada HTTPS, enrutamiento de rutas, archivos estáticos o un proxy.
Asigne al gateway un hostname local estable y una asociación de certificado.
Por ejemplo, use `https://interview.mensetsukan.localhost:15180/` sólo después de comprobar el certificado, puerto, ruta y backend.

No considere un hostname local como prueba del comportamiento de ingress en producción.
Pruebe el mismo contrato de ruta mediante el ingress o gateway desplegado.

Referencias:

- [Descripción general de redes de Aspire](https://aspire.dev/fundamentals/networking-overview/)
- [Detección de servicios de Aspire](https://aspire.dev/fundamentals/service-discovery/)
- [Redes de contenedores de Aspire](https://aspire.dev/fundamentals/container-networking/)
- [Integración YARP de Aspire](https://aspire.dev/integrations/reverse-proxies/yarp/)

### Ciclo de vida, pipelines y gates de estado de Aspire

Use dependencias del ciclo de vida para la configuración y disponibilidad.
Un recurso de migración, datos iniciales o configuración debe terminar correctamente antes de recibir tráfico dependiente.
Mantenga las migraciones idempotentes y haga deterministas los datos iniciales.

Use pipelines de Aspire para los pasos explícitos de build, aprovisionamiento, migración, deploy, smoke test y notificación.
Asigne a cada paso un nombre estable y declare sus dependencias.
Mantenga los pasos específicos del deploy en su pipeline, no en el inicio de la aplicación.

Use comprobaciones de disponibilidad para decidir cuándo un recurso puede recibir tráfico.
Use comprobaciones de actividad para decidir cuándo debe reiniciarse un proceso.
No use una comprobación de actividad como comprobación de disponibilidad.
Las respuestas de estado no deben revelar credenciales, tokens ni datos privados.

Referencias:

- [Pipelines de Aspire](https://aspire.dev/deployment/pipelines/)
- [Ciclo de vida de aplicaciones Aspire](https://aspire.dev/deployment/app-lifecycle/)
- [Comprobaciones de estado de Aspire](https://aspire.dev/fundamentals/health-checks/)

### Contenedores de desarrollo e integraciones de IA con Aspire

Use un Dev Container local o un Codespace remoto cuando el proyecto necesite un shell de desarrollo reproducible.
Úselos también para un entorno de ejecución de contenedores o un proceso de incorporación.
Registre las funciones del host que permanezcan fuera del contenedor.
Por ejemplo, registre el acceso al socket de Docker, navegador, GPU, certificados y credenciales de cloud.

Use la integración Ollama de Aspire para servir modelos locales o privados.
Use la integración OpenAI cuando el proyecto acepte el límite de un proveedor alojado.
Mantenga las credenciales del proveedor fuera del código fuente de AppHost.
Vincúlelas mediante la inyección de secretos aprobada.

Ollama también puede proporcionar un endpoint local para Claude Code.
Trate ese endpoint como un límite de modelo local.
Pruebe la disponibilidad del modelo, los límites de solicitudes, los permisos de herramientas y los fallos.

Referencias:

- [Dev Containers de Aspire](https://aspire.dev/get-started/dev-containers/)
- [Integración Ollama de Aspire](https://aspire.dev/integrations/ai/ollama/ollama-get-started/)
- [Integración OpenAI de Aspire](https://aspire.dev/integrations/ai/openai/openai-get-started/)
- [Integración de Ollama con Claude Code](https://docs.ollama.com/integrations/claude-code)

### Alojamiento personalizado, comunicación segura y Seq con Aspire

Cree una integración de alojamiento personalizada cuando un recurso tenga un ciclo de vida y contrato de configuración estables.
El recurso también debe tener un comportamiento de estado y un modelo de endpoints reutilizables.
Mantenga la integración pequeña.
No oculte el comportamiento específico del despliegue tras un nombre genérico de recurso.

Use los puntos de integración documentados para comunicación segura, TLS, certificados, almacenes de confianza y asociaciones de endpoints.
Pruebe por separado la rotación, la validación del hostname, los certificados caducados y los fallos de confianza.

Use Seq como destino local opcional para logs estructurados.
Mantenga los logs de la aplicación estructurados e independientes del proveedor.
Compruebe la censura de los campos sensibles antes de que los logs lleguen a Seq o a otro destino remoto.

Referencias:

- [Integraciones de alojamiento personalizadas de Aspire](https://aspire.dev/integrations/custom-integrations/hosting-integrations/)
- [Comunicación segura de Aspire](https://aspire.dev/integrations/custom-integrations/secure-communication/)
- [Integración Seq de Aspire](https://aspire.dev/integrations/observability/seq/seq-get-started/)

### Secretos con SOPS

Use SOPS para cifrar los valores de configuración almacenados.
Prefiera identidades age para un equipo pequeño o la identidad KMS de cloud aprobada para entornos controlados.
SOPS admite identidades offline e integraciones KMS de cloud.

Mantenga los archivos cifrados separados del texto sin cifrar generado.
Descifre sólo en el entorno de un proceso o en un archivo temporal con permisos restrictivos.
También puede descifrar en el gestor de secretos de destino.
No transmita secretos mediante argumentos de comandos, nombres de tareas, logs, trazas, screenshots, prompts o URL del navegador.

Para Aspire local, descifre sólo el conjunto de secretos de desarrollo.
Inyéctelo mediante el entorno aprobado o la ruta de parámetros de AppHost.
Para CI, use una identidad de carga de trabajo o el almacén de secretos de CI.
Use esa identidad o almacén para acceder a la clave SOPS.
Para entornos desplegados, descifre en el límite de despliegue.
También puede convertir los valores al gestor de secretos del proveedor.
No copie un secreto de producción sin cifrar al repositorio ni al artefacto de vista previa.

Revise `.sops.yaml`, los grupos de claves, las reglas de creación, el acceso, la rotación, la revocación y la recuperación.
Pruebe que cada desarrollador, job de CI e identidad de despliegue acceda sólo al entorno previsto.

Referencia: [SOPS](https://getsops.io/)

## Herramientas estándar con mise

Use JDX mise para proporcionar un workflow único para herramientas, entornos de ejecución, variables y tareas en varios sistemas operativos.

Fije las herramientas en el archivo `mise.toml` del repositorio.
Use `mise install` para instalarlas. Use `mise ls --current` para examinar las versiones seleccionadas.
Use `mise doctor` para diagnosticar problemas de configuración y confianza.

Use `mise env` para examinar el entorno del proyecto.
Use `mise env --json` cuando otra herramienta necesite datos estructurados.
Use `mise exec -- COMMAND` para ejecutar un comando con el entorno del proyecto sin cambiar el shell principal.

Defina comandos de build, formato, lint, test, auditoría, desarrollo y release como tareas `mise run` con nombre.
Mantenga los nombres de las tareas estables entre sistemas operativos.
Use dependencias de tareas para establecer el orden. Devuelva un status distinto de cero cuando ocurra un fallo.

Mantenga los valores privados en una configuración local ignorada o en un gestor de secretos aprobado.
No haga commit de credenciales, tokens, URL privadas ni datos de candidatos.
Revise `mise.toml`, los lockfiles, plugins y hooks de instalación como cambios ejecutables de supply chain.

En una máquina nueva, instale la versión aprobada de mise.
Examine la configuración activa con `mise config` y confíe en la configuración revisada.
Ejecute `mise install` y examine las versiones con `mise ls --current`.
Ejecute las tareas específicas y después `mise run check`.

CI debe usar los mismos nombres de tareas que el desarrollo local.
Debe registrar la versión de mise, versiones seleccionadas, sistema operativo, arquitectura, comando y resultado.
No dependa de los archivos de inicio del shell. Invoque mise de forma explícita en CI y la automatización.

Pruebe todos los sistemas operativos admitidos. Registre como evidencia las omisiones específicas de cada plataforma.
Use un programa multiplataforma cuando la lógica de las tareas sea compleja.
Limite el trabajo paralelo con `MISE_JOBS` cuando los runners tengan recursos limitados.

Referencias oficiales: [mise](https://mise.jdx.dev/), [configuración](https://mise.jdx.dev/configuration.html), [`mise env`](https://mise.jdx.dev/cli/env.html), [`mise run`](https://mise.jdx.dev/cli/run.html) y [`mise trust`](https://mise.jdx.dev/cli/trust.html).

## Tareas de mise delimitadas y detectables

Mantenga las definiciones de tareas cerca del código que las controla.
Coloque las tareas del repositorio en el archivo `mise.toml` raíz.
Coloque las tareas de un componente en el archivo `mise.toml` de ese componente.
Coloque las tareas más profundas en la configuración secundaria más cercana o en un directorio documentado.

Use `mise tasks` desde el directorio actual para detectar tareas en la jerarquía activa.
Use `mise tasks --all` sólo cuando un agente necesite el inventario completo del monorepo.
Use `mise tasks info --json TASK` para examinar el origen, directorio, dependencias, entorno, entradas, salidas y comando.
Use `mise tasks deps TASK` para examinar el orden.
Use `mise tasks validate --errors-only` antes de depender de una tarea.

Asigne a cada tarea un nombre estable y una descripción corta.
Use nombres como `build`, `test`, `lint`, `check` y `serve` dentro de un proyecto.
Use un nombre calificado o un directorio explícito cuando dos proyectos tengan el mismo nombre de tarea.
No oculte las tareas normales de verificación.
Oculte sólo los ayudantes internos que los agentes no deben llamar directamente.

Una tarea debe ejecutar sólo los archivos y servicios de su alcance.
Establezca `dir` de forma explícita cuando una tarea cruce el límite de un componente.
Transmita los argumentos mediante un contrato de uso declarado.
No permita cambios silenciosos de directorio, instalaciones sin versión fija, lecturas de producción ni deploys externos.

Exponga una tarea segura de entrada por proyecto, como `mise run check`.
Haga que dependa de las comprobaciones locales obligatorias.
Documente la raíz del proyecto, las raíces de componentes, los sistemas admitidos, los requisitos previos y las salidas esperadas.
Los agentes deberían detectar las tareas antes de ejecutarlas.

Use `mise mcp` cuando la plataforma de agentes admita MCP.
Expone recursos de tareas, herramientas, entorno y configuración.
Mantenga la aprobación de ejecución y los límites de confianza en la política del agente o repositorio.

## Selección de un lenguaje de scripting para automatizar el repositorio

Seleccione el lenguaje que mejor se ajuste al límite del repositorio y a las restricciones de los sistemas operativos.
No seleccione un lenguaje sólo porque sea conocido.

- Use el lenguaje principal del repositorio para scripts, fixtures, migraciones y pruebas que conozcan el dominio. Esto conserva modelos, errores y mantenimiento en un ecosistema.
- Use Go para automatización portable, comprobaciones previas, orquestación de pruebas y control de procesos. Úselo cuando un binario estático deba ejecutarse en varios sistemas.
- Use TypeScript para herramientas de Node o web y para transformar JSON y YAML. Úselo también para automatización que ya dependa de Node.
- Use Elixir para tareas nativas de Mix y herramientas que conozcan la supervisión. Úselo para comportamientos que necesiten el límite de la aplicación Elixir.
- Use Elixir y OTP para orquestación duradera, árboles de supervisión, workflows simultáneos, aislamiento de fallos, reintentos y coordinación con estado. Mantenga visibles en las pruebas los comportamientos de OTP y la semántica de apagado.
- Use Python para procesar datos, adaptadores científicos o de machine learning y herramientas que dependan de su ecosistema de paquetes.
- Use Rust para tareas que necesiten mucho rendimiento, memoria o CPU. Úselo cuando las mediciones demuestren que un lenguaje más simple no cumple el requisito. Mantenga pequeño el límite de Rust y exponga un contrato estable de comando o biblioteca.
- Use Zig para bibliotecas y frameworks nativos portables. Úselo cuando los requisitos principales incluyan compilación cruzada, interoperabilidad con C o C++, o destinos WebAssembly. Mantenga una ABI de C estable en los límites de integración y pruebe cada destino.
- Use un script POSIX o PowerShell pequeño sólo para un adaptador del sistema operativo. Mueva la lógica compleja a un programa probado.

Registre la selección en la descripción de la tarea o en una decisión de arquitectura.
La selección debe indicar el entorno de ejecución obligatorio y los sistemas operativos admitidos.
También debe indicar la ruta de instalación de dependencias y el comportamiento de errores.
Incluya los códigos de salida y el comando de prueba.
Registre también el owner de mantenimiento. Prefiera un lenguaje que mise ya fije.
Evite añadir otro entorno de ejecución para una tarea de una línea.

La automatización debe ejecutar los argumentos directamente cuando sea posible.
Valide las entradas antes de ejecutar procesos. No genere código de shell con valores que no sean de confianza.
Mantenga stdout conciso y estable. Envíe los diagnósticos a stderr. Devuelva un status distinto de cero cuando ocurra un fallo.

### Ruta de portabilidad con Zig

Zig es una buena opción para bibliotecas nativas pequeñas, herramientas de línea de comandos y adaptadores de frameworks.
Puede destinar estos elementos a muchos sistemas operativos o a WebAssembly.
Su compilador puede usar combinaciones explícitas de CPU, sistema operativo y ABI.
Esto mejora la repetibilidad, pero no elimina las restricciones de API, libc, linker, entorno de ejecución, host ni navegador.

Use Zig para la portabilidad cuando la evaluación demuestre una necesidad real de:

- compilar de forma cruzada una base de código para destinos nativos admitidos;
- compilar o enlazar fuentes de C y algunas fuentes de C++ mediante el toolchain de Zig;
- exponer una ABI pequeña compatible con C a C, C++, Swift, Go, Rust u otro host;
- producir un módulo WebAssembly para un navegador u otro host;
- integrar un núcleo portable en interfaces específicas de cada plataforma.

Para C y C++, prefiera una ABI de C pequeña y documentada.
Use anchos de enteros, reglas de propiedad, reglas de asignación, valores de error y visibilidad de símbolos explícitos.
Trate el name mangling, las excepciones, RTTI, la ABI de biblioteca estándar y el entorno del compilador como límites.
No prometa compatibilidad binaria de C++ sólo porque un compilador de C++ pueda compilar el código fuente.

Para WebAssembly, seleccione el destino según el contrato del host.
Use un destino independiente para hosts de navegador o JavaScript.
Use un destino WASI cuando el entorno de ejecución proporcione WASI.
Defina importaciones, exportaciones, propiedad de memoria, acceso a archivos, relojes, threads y límites de capacidades.
Pruebe el módulo en cada entorno de ejecución admitido.

Use libghostty como caso de estudio, no como garantía universal.
El proyecto describe `libghostty-vt` como una biblioteca de C y Zig compatible con macOS, Linux, Windows y WebAssembly.
La API completa de integración tiene límites específicos de plataforma.
Separe el núcleo portable de la GUI nativa y de las integraciones del sistema operativo.

### Evaluación de Zig

1. Fije la versión del compilador Zig en mise y registre las notas de release correspondientes.
2. Ejecute `zig version`, `zig targets`, `zig test` y la tarea de build del repositorio en la plataforma host.
3. Cree una matriz de destinos para cada arquitectura, sistema, ABI, opción de libc y host WebAssembly admitidos.
4. Compile un consumidor de smoke test para la ABI de C. Compruebe símbolos exportados, tipos de headers, propiedad, errores y convenciones de llamada.
5. Ejecute pruebas nativas en runners nativos. Ejecute los artefactos cruzados en un emulador, contenedor, dispositivo o runner de destino.
6. Ejecute pruebas WebAssembly en cada navegador o entorno WASI admitido. Pruebe las capacidades denegadas y la interrupción.
7. Mida el inicio, la memoria, el tamaño binario y el rendimiento antes de seleccionar Zig o Rust. Mantenga el límite más pequeño que cumpla la evidencia.

No seleccione Zig sólo porque pueda compilar de forma cruzada.
Confirme bibliotecas, depuración, sanitizers, licencias, linker, política de soporte y capacidad del equipo para actualizar el toolchain.

## Salida eficiente de comandos para agentes

Los agentes no deben recibir logs completos de forma predeterminada.
Un wrapper debería conservar la salida original en un artefacto limitado y devolver un resumen compacto.
El resumen debe incluir el comando, código de salida, duración, resultado y paso fallido.
También debe incluir el número de advertencias, errores y ruta del artefacto.

Use un formateador o resumidor cuando una herramienta produzca una salida repetitiva.
Prefiera `xcbeautify` o `xcpretty` para la salida de `xcodebuild`.
Aplique el mismo patrón a herramientas de compilación, test, paquetes, contenedores e infraestructura.
Mantenga disponible la salida sin procesar para revisiones y recuperaciones.

Conserve la información de los fallos.
Un formateador no debe ocultar el primer error, comando, nombre de prueba, archivo, línea, código de salida ni resultado final.
Use `set -o pipefail` en pipelines para que el wrapper devuelva el fallo del productor.
Use salidas legibles por máquinas, como JSON o JUnit, cuando un consumidor necesite análisis fiable.

Use una reducción estructurada antes de una reducción semántica.
Primero, quite las líneas de progreso repetidas, agrupe registros idénticos y agrupe pruebas por resultado.
Muestre los números. Después, resuma el texto sólo cuando los bytes originales puedan recuperarse.
El resumidor debe indicar su método y sus límites.

Caveman y herramientas similares pueden reducir el contexto, logs, código, tablas y salidas elegibles.
Úselas sólo cuando los datos originales puedan recuperarse, la transformación esté medida y la tarea supere su gate.
Mantenga sin comprimir las credenciales, el código necesario, los errores exactos, patches, comandos y evidencia de seguridad.
También puede conservarlos byte por byte.
Trate los gateways alojados como un límite de confianza separado.
No envíe logs privados ni código fuente a un servicio alojado sin aprobación.

Cada reductor de salida debe definir:

- los formatos de entrada y salida;
- si la transformación no tiene pérdidas;
- la ruta de recuperación;
- los campos que debe conservar;
- el tamaño máximo de salida;
- las reglas de censura;
- el comportamiento ante fallos;
- un fixture de prueba y un límite de calidad.

Añada el reductor a mise como una tarea con nombre.
Por ejemplo, `mise run test --output compact` puede devolver un resumen compacto para agentes.
`mise run test --output raw` conserva el flujo completo.
No use la salida compacta como evidencia única.

## Validación de salidas y evidencia

Un comando está preparado para agentes cuando un agente puede detectarlo, examinar su alcance y ejecutarlo con entradas limitadas.
El agente también debe poder identificar el resultado mediante el código de salida y el resumen.
Debe poder localizar el artefacto completo cuando sea necesario.
Pruebe el reductor con salidas correctas, advertencias, varios fallos, truncamientos, datos malformados, secretos y procesos interrumpidos.

Registre el comando, origen de la tarea, archivos de configuración, versiones de entornos de ejecución, sistema operativo y arquitectura.
Registre también el formato del resumen, la ruta del artefacto, el código de salida y el resultado de validación.
Actualice la matriz de funciones o el work log cuando cambie el comando.

Referencias:

- [Tareas de mise](https://mise.jdx.dev/cli/tasks.html)
- [Información de tareas de mise](https://mise.jdx.dev/cli/tasks/info.html)
- [Validación de tareas de mise](https://mise.jdx.dev/cli/tasks/validate.html)
- [MCP de mise](https://mise.jdx.dev/cli/mcp.html)
- [Caveman](https://caveman.so/)
- [xcbeautify](https://github.com/cpisciotta/xcbeautify)
- [xcpretty](https://github.com/xcpretty/xcpretty)

## Rutas de despliegue

Mantenga el AppHost o el grafo equivalente como fuente de la topología local.
Mantenga explícitas las decisiones de despliegue en producción.
Una ruta de despliegue debe indicar su destino, origen de imagen o ejecutable y entradas de configuración.
También debe indicar la fuente de secretos, el límite de red y el modelo de persistencia.
Debe incluir comprobaciones de estado, método de rollback y destino de observabilidad.

Use el destino más simple que cumpla el requisito del producto:

- Use un entorno OCI local para desarrollo y pruebas de integración deterministas.
- Use un host con OCI, proxy inverso y gestor de servicios cuando una máquina sea suficiente. Use systemd, launchd o el gestor de Windows admitido para reinicios y apagados.
- Use Docker Compose u otro formato compose generado para un despliegue pequeño de varios servicios. Valide el archivo generado antes de aplicarlo.
- Use Kubernetes cuando el sistema necesite programación, réplicas, actualizaciones progresivas o identidad de carga de trabajo. Úselo también para varios nodos o un plano de control estándar.
- Use una plataforma de cloud administrada cuando el equipo necesite redes, identidad, escalado, backups o controles de conformidad del proveedor.
- Use una VPC privada o un clúster bare metal cuando lo exijan la ubicación de datos o el aislamiento. Úselos también para controlar el hardware u operar offline.

Cuando el destino de Aspire admita despliegue, use el flujo `aspire publish` o `aspire deploy` aprobado.
En caso contrario, use los artefactos publicados con las herramientas de la plataforma de destino.
No suponga que un comando AppHost admite todos los destinos o todas las versiones de Aspire.
Registre la versión exacta de Aspire y la integración del destino en la especificación de despliegue.

### Ruta de Kubernetes

Trate los manifiestos de Kubernetes, charts de Helm y operators como artefactos de despliegue.
Genérelos desde el AppHost sólo cuando el generador admita los tipos de recursos obligatorios.
En caso contrario, escriba un conjunto pequeño y explícito que conserve el contrato de AppHost.

Valide los manifiestos con la versión de Kubernetes de destino.
Antes de producción, ejecute una simulación del servidor y las comprobaciones de políticas, imágenes y referencias secretas.
Ejecute también un smoke test en un clúster desechable.
Use comportamientos de disponibilidad, actividad, inicio y apagado que coincidan con el contrato de la aplicación.
Mantenga explícitos los volúmenes persistentes y las migraciones.
Nunca coloque credenciales de producción en un manifiesto ni en una imagen.

Haga deploy mediante una identidad controlada y un contexto registrado.
Use un namespace o límite equivalente del entorno.
Prefiera un despliegue progresivo, gates de estado observables y un comando explícito de rollback.
Fije las versiones de `kubectl`, Helm y clúster mediante mise o la imagen aprobada del runner.

### Ruta de cloud y host simple

Para un host simple, publique una imagen OCI o un ejecutable autónomo.
Configure un gestor de servicios, terminación TLS, firewall, backups, rotación de logs y comprobaciones de estado.
Configure también un directorio de rollback o una etiqueta de imagen.
Pruebe el reinicio tras reiniciar el host y perder una dependencia.

Para un despliegue en cloud, seleccione recursos nativos del proveedor adecuados para la carga.
Los ejemplos incluyen Azure Container Apps, Azure App Service o AKS.
También incluyen Google Cloud Run, GKE o Compute Engine y Amazon ECS, EKS o EC2.
Use herramientas del proveedor cuando la integración Aspire no cubra el destino.
Mantenga uniformes entre destinos los nombres de AppHost, contrato del entorno, rutas de estado y reglas de dependencias.

Use identidad de carga de trabajo o administrada cuando la plataforma la admita.
Mantenga los secretos en el gestor del proveedor. Use redes privadas para dependencias internas.
Restrinja ingress y egress.
Defina reglas de residencia, retención, backup, recuperación y eliminación de datos antes del despliegue.

## Rancher Desktop para workflows locales de contenedores y Kubernetes

Rancher Desktop es un entorno local de desarrollo y pruebas.
No es un clúster de producción.
Puede proporcionar un motor Moby compatible con Docker o containerd con `nerdctl`.
Sólo un entorno de ejecución de contenedores está activo cada vez.
Las imágenes y los contenedores no se comparten cuando cambia ese entorno.

Use el entorno compatible con Docker cuando las tareas llamen a `docker` o Docker Compose.
Use containerd y `nerdctl` sólo cuando el repositorio documente esa interfaz.
Active Kubernetes local sólo cuando una prueba necesite su comportamiento.
Fije la versión de Kubernetes.
Registre en la evidencia el entorno, contexto de Kubernetes, arquitectura de CPU, memoria y asignación de disco.

Ejecute las mismas tareas `mise run` en Rancher Desktop y en los demás entornos OCI admitidos.
Descargue las imágenes obligatorias antes de las pruebas con tiempo limitado.
Separe los almacenes locales de imágenes y volúmenes desechables de los datos de producción.
Detenga las cargas después de las pruebas.
Compruebe que no quede ningún proceso huérfano ni recurso del clúster.

No considere la disponibilidad de Rancher Desktop como prueba de un despliegue remoto de Kubernetes.
Después de la aceptación local, ejecute una prueba en un clúster remoto desechable o de staging.

## Capacidad de pruebas y observabilidad en línea

Un despliegue admite pruebas en línea cuando un runner externo puede detectar su endpoint y autenticarse con una identidad desechable.
El runner debe poder ejecutar un recorrido seguro y relacionar la solicitud con un identificador de traza.
También debe poder observar logs y métricas y comunicar un resultado limitado.
Use un entorno dedicado de vista previa o staging.
No ejecute pruebas de aceptación con datos de producción.

Exponga comportamientos separados de disponibilidad y actividad.
Mantenga los endpoints de estado libres de secretos.
Devuelva un identificador de correlación o contexto de traza para cada solicitud de prueba.
Pruebe inicio, fallo de dependencias, tiempo límite, reintento, fallo de autorización, fallo de migración, apagado ordenado y rollback.
Use pruebas de API para contratos y Playwright para el comportamiento del navegador.

Prefiera los SDK de OpenTelemetry y OpenTelemetry Collector como límite de la aplicación.
Exporte OTLP desde la aplicación a un sidecar local, agente de nodo o gateway privado.
El collector puede censurar, agrupar, muestrear, reintentar, enrutar y exportar telemetría sin vincular el código a un proveedor.

### Valores predeterminados de proveedores

- Azure: use Azure Monitor con Application Insights y Log Analytics. Use la distribución de Azure Monitor OpenTelemetry o la ingestión OTLP según el lenguaje y entorno admitidos. Guarde la cadena de conexión o endpoint en un almacén de secretos o asociación de entorno. Compruebe trazas, métricas, excepciones y logs estructurados en Application Insights. Consulte los logs retenidos en Log Analytics.
- Google Cloud: use Cloud Logging, Cloud Monitoring y Cloud Trace. Prefiera OpenTelemetry con un collector y OTLP para mantener el código independiente del proveedor. Enrute la telemetría mediante el collector de Google, Ops Agent o la ruta admitida. Compruebe entradas de log, métricas, spans y condiciones de alerta en Google Cloud Observability.
- AWS: use CloudWatch Logs, CloudWatch Metrics, Application Signals y AWS X-Ray como destinos administrados. Use CloudWatch agent, AWS Distro for OpenTelemetry o un OpenTelemetry Collector upstream o personalizado según el lenguaje y la plataforma. Compruebe métricas de servicios, logs, trazas y alarmas en la consola de AWS seleccionada.

Los valores predeterminados del proveedor son rutas prácticas.
No sustituyen el contrato de telemetría de la aplicación.
Mantenga uniformes entre proveedores los nombres de recursos y servicios, versión, entorno, región e identificadores de correlación.

### Ruta de VPC y bare metal

Para una VPC privada o un host bare metal, ejecute OpenTelemetry Collector dentro de la red de confianza.
Use mTLS u otro transporte aprobado entre las aplicaciones y el collector.
Restrinja los receptores del collector a la red de la aplicación.
Permita sólo el egress obligatorio al backend de telemetría.
No exponga un receptor OTLP directamente a Internet.

Seleccione una topología de collector que cumpla las necesidades de fallos y escala.
Use un sidecar para un aislamiento fuerte de la carga.
Use un agente de nodo o host para la recopilación local.
Use un gateway para el enrutamiento centralizado.
Configure colas limitadas, reintentos, contrapresión, almacenamiento en disco permitido, muestreo y censura.
Defina el comportamiento cuando el backend no esté disponible.
La aplicación debe permanecer segura cuando falle la exportación de telemetría.

Un backend personalizado puede usar herramientas de almacenamiento y análisis compatibles con OpenTelemetry.
Documente el receptor, procesadores, exportadores, dashboards, alertas, retención, control de acceso, backup y ciclo de eliminación.
Pruebe la ruta sin enviar datos privados ni de producción.
Restrinja el acceso a diagnósticos sin procesar y devuelva resúmenes compactos a los agentes.

## Validación y rollback del despliegue

Cada ruta debe exponer tareas de mise con nombres como `deploy:validate`, `deploy:publish`, `deploy:apply`, `deploy:smoke`, `deploy:observe` y `deploy:rollback`.
Proteja las tareas destructivas o de producción con un entorno explícito y aprobación humana.

El gate de despliegue debe:

- hacer build con un toolchain de versión fija;
- validar la configuración y los artefactos generados;
- escanear dependencias e imágenes según la política;
- hacer deploy a un destino desechable o de staging;
- ejecutar smoke tests de API y navegador;
- comprobar el estado, los logs, las métricas y las trazas;
- registrar la versión, destino, endpoint, commit, resultado de pruebas y enlaces a artefactos;
- hacer rollback a la última versión funcional conocida cuando falle un gate de estado.

La evidencia debe mostrar el éxito de la aplicación y de la plataforma.
Un push de imagen o comando de despliegue correcto no demuestra que los usuarios puedan acceder a la aplicación.

Referencias de despliegue:

- [Despliegue de Aspire](https://learn.microsoft.com/en-us/dotnet/aspire/deployment/overview)
- [Motor de contenedores de Rancher Desktop](https://docs.rancherdesktop.io/ui/preferences/container-engine/general/)
- [Kubernetes de Rancher Desktop](https://docs.rancherdesktop.io/ui/preferences/kubernetes/)
- [OpenTelemetry de Azure Monitor](https://learn.microsoft.com/en-us/azure/azure-monitor/app/opentelemetry-enable)
- [Instrumentación y observabilidad de Google Cloud](https://docs.cloud.google.com/stackdriver/docs/instrumentation/overview)
- [OpenTelemetry de AWS CloudWatch](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-OTLPGettingStarted.html)
- [AWS Distro for OpenTelemetry y X-Ray](https://docs.aws.amazon.com/xray/latest/devguide/xray-services-adot.html)
