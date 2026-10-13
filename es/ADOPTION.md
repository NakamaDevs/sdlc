# ADOPTION

Esta guía explica cómo las personas y los agentes de IA incorporan, aplican y mantienen el sistema SDLC.

## Adopción desde la raíz

Para un grupo existente, empiece con [TEAM-START.md](TEAM-START.md). Mantenga descubrimiento, contexto privado, cursos y adaptadores en una raíz privada separada.
La estructura local siguiente es una opción para repositorios nuevos cuyos responsables la aprueban. El piloto raíz no requiere nuevas instrucciones en aplicaciones existentes.
Use [COMPOSITION.md](COMPOSITION.md) para seleccionar o sustituir gestor, multiplexor, nube y entorno.

## Incorporación para personas

Lea primero `SDLC.md`. Trátelo como el mapa y los principios compartidos. Después, lea solo la guía complementaria del trabajo actual. Una persona debe encontrar el propósito del proyecto en menos de diez minutos. La persona debe encontrar también el hito actual, la puerta de calidad, el responsable y la siguiente acción.

Empiece con el README del repositorio. Confirme los lenguajes, sistemas operativos, destinos de deploy, herramientas necesarias y el comando de verificación local. Lea la guía local de agentes del repositorio antes de usar una regla global o de la organización.

No adopte toda tecnología opcional a la vez. Seleccione el conjunto mínimo que resuelva el problema actual de coordinación o calidad. Registre la decisión y el motivo.

## Incorporación para agentes

Use este orden:

1. Lea la guía de agentes más cercana y el README del repositorio.
2. Encuentre la especificación, la característica o tarea actual y la evidencia de aceptación.
3. Lea la guía complementaria pertinente solo si su tema afecta la tarea.
4. Descubra las tareas disponibles antes de ejecutar comandos.
5. Ejecute una tarea acotada de estado o validación.
6. Indique el resultado actual, la evidencia, el riesgo y la siguiente acción antes de cambiar archivos.
7. Actualice la especificación, los tests, la documentación, la matriz de características y el tracker cuando cambie el comportamiento.

El punto de entrada del agente debe ser corto. Debe enlazar a la fuente de verdad. No debe repetir todo el manual.

## Incorporación de issue y branch

Antes de empezar, cree o encuentre el issue requerido en el proyecto del repositorio. Confirme su responsable, alcance, evidencia de aceptación e hito.

Antes de editar, use Git o el adaptador elegido para crear o encontrar el branch y worktree asignados. Siga la política de branch del repositorio para el nombre y la base. No comparta un branch ni un worktree con otro agente.

Herdr es opcional. Confirme el worktree y su responsable mediante el adaptador elegido antes de una escritura Git compartida.

## Estructura recomendada del repositorio

Use las convenciones existentes cuando sean claras. Un repositorio nuevo puede empezar con esta estructura:

```text
README.md
AGENTS.md
ARCHITECTURE.md
mise.toml
docs/
├── spec.md
├── workflow.md
├── feature-matrix.md
├── test.md
├── decisions/
├── plans/
├── runbooks/
└── references/
apps/
packages/
scripts/
tests/
.github/workflows/
```

`AGENTS.md` debe mapear el repositorio. `README.md` debe incorporar personas. `spec.md` debe definir el comportamiento. `workflow.md` debe definir el ciclo del agente. `feature-matrix.md` debe conectar características con tests. `test.md` debe definir la validación. `plans/` debe contener planes activos y terminados.

## Dos rutas de adopción

Seleccione una ruta principal para cada regla. No mantenga dos copias independientes del mismo requisito.

### Ruta A: documentos del repositorio

Use documentos del repositorio cuando la guía:

- defina un comando, stack, owner, entorno o unidad de release local;
- deba cambiar en el mismo pull request que el código;
- deba poder leerse sin un runtime de agente;
- necesite historia visible para personas, auditores y automatización.

Copie sólo las guías genéricas necesarias. Registre su revisión de origen y las adaptaciones locales.

Mantenga un `AGENTS.md` corto que enlace los documentos locales. No pegue todo el manual en él.

### Ruta B: skills y referencias reutilizables

Use una skill o referencia versionada cuando la guía:

- aplique sin cambios en varios repositorios;
- defina un procedimiento repetible para agentes;
- necesite scripts, fixtures o validación reutilizables;
- tenga un owner y una ruta de actualización revisados.

Mantenga las skills del proyecto en `.agents/skills/` cuando formen parte del contrato del repositorio.

Fije las skills y referencias compartidas a una revisión revisada. Enlácelas desde `AGENTS.md` y registre su límite de confianza.

No oculte orientación humana obligatoria dentro de una skill. Proporcione un documento o referencia legible para cada workflow obligatorio.

### Perfiles opcionales de organización

Mantenga las guías genéricas útiles sin acceso a la organización.

Ponga nombres privados, equipos, cuentas, excepciones de branch, marketplaces de skills y preferencias de stack en un perfil opcional.

Coloque cada perfil opcional después de todos los archivos genéricos del Gist. Marque los enlaces inaccesibles e indique qué política sustituye la guía genérica.

Use un check de exportación para aplicar este orden.

## Plantillas para fijar la práctica

Proporcione plantillas para issues, hitos, especificaciones, decisiones, planes de test, registros de trabajo, pull requests y notas de release. Cada plantilla debe solicitar la evidencia mínima para la revisión.

Mantenga las plantillas junto al repositorio o en un paquete de organización versionado. Use marcadores para nombres, identificadores, entornos y fechas. No ponga credenciales reales, URL privadas, datos de candidatos ni valores de producción en los ejemplos.

Haga ejecutables las plantillas cuando sea posible. Una plantilla de tarea debe enlazar al comando de validación. Una plantilla de característica debe requerir una fila de test. Una plantilla de deploy debe requerir destino, puerta de salud, observabilidad, rollback y limpieza.

## Adopción mínima viable

Adopte primero estos controles:

- un mapa del repositorio;
- un comando local de calidad fijado;
- una plantilla de especificación de comportamiento;
- un formato de test y evidencia;
- un flujo de issue e hito;
- un análisis de secretos;
- un responsable documentado para mantener el sistema actualizado.

Agregue Aspire, Ollama, runtimes de lenguaje adicionales, entornos preview, agentes remotos y orquestación avanzada solo cuando la base sea confiable.

## Secuencia de adopción

Use una característica piloto pequeña. Mida el tiempo de configuración, descubrimiento de tareas, validación y revisión. Mida también defectos escapados, preguntas repetidas y deriva de documentación.

Después:

1. Corrija mapas, comandos, fixtures o rutas de evidencia faltantes.
2. Promueva la guía repetida a una plantilla, tarea, linter o test.
3. Aplique el patrón a una segunda característica y a un segundo repositorio.
4. Elimine reglas que no mejoren la seguridad, calidad, velocidad o claridad.
5. Publique el patrón estable como una skill de organización versionada o una plantilla de repositorio.

No mida la adopción por el tamaño de los documentos ni por el número de herramientas instaladas. Mida si las personas y los agentes producen software funcional y revisable con menos suposiciones.

## Cadencia operativa

Al empezar, confirme el issue, el hito, el responsable, la especificación, el plan de test y el comando local.

Durante el trabajo, registre el progreso importante, las decisiones, los fallos y la evidencia. Mantenga el estado del issue alineado con la realidad.

Al terminar, ejecute la puerta de calidad. Actualice la matriz de características y la documentación. Adjunte evidencia acotada. Revise los riesgos y registre la siguiente acción de mantenimiento.

En una cadencia regular, compruebe documentación, enlaces, tareas, secretos, dependencias, workflows y fuentes de skills.

Elimine la guía obsoleta y cierre los planes obsoletos.

## Definición de éxito

El sistema funciona cuando una persona o agente nuevo encuentra la fuente y el control local correctos.

El lector entiende los fallos, hace un cambio acotado y deja actuales el repositorio y el tracker.

El éxito requiere juicio. Los documentos guían decisiones. No sustituyen la experiencia de dominio, la revisión, la aprobación de seguridad ni el control de cambios de producción.
