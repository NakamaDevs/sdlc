# BRANCHES

Esta guía define nombres y flujos de branches para personas y agentes.

## P: ¿Qué nombre de branch debemos usar?

Use esta forma:

```text
<tipo>/<issue>-<título-corto>
```

Ejemplos:

```text
feature/PROJ-625-bilingual-sdlc-tooling
fix/PROJ-742-runner-timeout
docs/PROJ-810-update-release-guide
```

Use primero el identificador del issue del proyecto. Use kebab case en minúsculas para el título corto.

No agregue un segmento de identidad ni un espacio de nombres de agente.

El issue, pull request y metadatos del commit registran la propiedad. El nombre del branch registra el trabajo.

## P: ¿Qué tipos de branch son válidos?

Use uno de estos tipos:

- `feature` para comportamiento nuevo;
- `fix` para corregir un defecto;
- `docs` para cambios exclusivos de documentación;
- `refactor` para un cambio interno sin cambios de comportamiento;
- `test` para cambios exclusivos de tests;
- `build` para el sistema de build o las dependencias;
- `ci` para la configuración de CI;
- `chore` para mantenimiento acotado;
- `perf` para trabajo de rendimiento medido;
- `revert` para una reversión.

Use `feature` en nombres de branch. Use `feat` en mensajes de Conventional Commits.

## P: ¿Cómo debe escribirse el título corto?

- Describa un resultado.
- Use términos estables del producto.
- Quite nombres, credenciales, datos de clientes y detalles confidenciales.
- Mantenga el título corto para terminales y logs de CI.
- No repita el tipo de branch.
- No agregue fechas salvo que la fecha identifique el trabajo.

Bien:

```text
feature/PROJ-625-bilingual-sdlc-tooling
```

Evite:

```text
feature/add-new-stuff
fix/urgent-fix
feature/PROJ-625-feature-for-bilingual-sdlc-tooling
```

## P: ¿Quién puede usar la misma forma de nombre?

Las personas y agentes usan la misma forma del repositorio.

Un propietario controla cada branch y worktree. Otros colaboradores usan otro worktree o revisan el pull request.

## P: ¿Dónde debe iniciar un branch?

Inicie trabajo independiente desde el branch predeterminado actual. Obtenga sus cambios antes de crear el branch.

Cree un branch dependiente desde su padre directo solo cuando el trabajo forme un stack real.

Registre el branch padre y orden del stack en cada issue y pull request relacionado.

## P: ¿Cómo deben funcionar los branches apilados?

Use un issue, branch, worktree y pull request para cada capa.

Use esta forma:

```text
main <- feature/PROJ-100-foundation <- feature/PROJ-101-dependent-change
```

Base cada pull request en su padre directo. Revise solo el diff contra ese padre.

Haga rebase de los hijos después de un cambio en su padre. Use `--force-with-lease` solo después de coordinar.

No coloque trabajo no relacionado en un stack.

## P: ¿Cuándo debe cambiarse el nombre de un branch?

Cambie un branch local antes de publicarlo cuando su issue, tipo o resultado sea incorrecto.

Coordine antes de cambiar un branch publicado. Actualice juntos su pull request, registro de worktree y referencias de automatización.

No cambie un branch solo para agregar la identidad de un colaborador.

## P: ¿Cómo debe migrar un repositorio los nombres anteriores?

Enumere cada branch anterior que tenga un pull request abierto antes de activar
el checker nuevo. Use una lista temporal y exacta, como
`LEGACY_BRANCH_ALLOWLIST`. Los hooks locales y CI deben aceptar solo los
nombres de la lista. Deben rechazar los branches nuevos que usen la forma
anterior.

Quite cada entrada después de cerrar su pull request. Mantenga la lista vacía
si ningún branch abierto la necesita. No cambie ni reescriba un branch
publicado solo para completar esta migración.

## P: ¿Cuándo está completo un branch?

Un branch está listo para revisión cuando:

- su issue describe el resultado entregado;
- sus commits son semánticos y atómicos;
- pasan los tests y checks necesarios;
- el pull request enumera límites y evidencia;
- no queda ningún cambio no relacionado.

Elimine el branch remoto después de la fusión en su destino final cuando ningún stack activo ni publicación pendiente dependa de él. En la integración selectiva, una fusión en `dev` no es el destino final.

## Flujo opcional de ramas temáticas e integración selectiva

Adopte esta alternativa solo mediante una decisión explícita del equipo. No sustituye la política de entrega predeterminada del repositorio. Úsela cuando varias líneas de trabajo comparten un entorno DEV pero deben publicarse de forma independiente. Una línea de trabajo agrupa tickets relacionados para un resultado o hito; una funcionalidad pequeña e independiente puede ser la misma unidad de publicación.

Este es un flujo de ramas temáticas e integración selectiva. No es desarrollo estricto basado en tronco: `main` no integra continuamente todo el trabajo en curso. La referencia de Git explica la promoción de temas; la referencia de desarrollo basado en tronco explica el modelo distinto de integración continua. Las reglas siguientes son la adaptación propuesta por esta guía.

### Ramas y promoción

Cree cada línea de trabajo desde `main` actual, nunca desde `dev`. Cree las ramas de tickets desde su línea de trabajo y fusiónelas de vuelta en ella. Inicie una funcionalidad independiente desde `main`. Use nombres coincidentes de ramas de trabajo y publicación en todos los repositorios de backend y frontend involucrados; los SHA son específicos de cada repositorio.

El diagrama usa nombres ilustrativos. Los equipos deben aprobar los nombres de ramas y actualizar sus comprobaciones antes de adoptar prefijos nuevos.

```text
main -> workstream/catalog -> ticket A, ticket B -> workstream/catalog @ S
                                                   |                 |
                                                   v                 v
                                                  dev        release/v1.2 <- main
                                                   |                 |
                                              automatic DEV     batch validation
                                                   |                 |
                                              acceptance of S ------>|
                                                                     v
main <------------------------------------------------------ human approval
  |
  v
CI + immutable tag -> backend -> dependent frontend

Alternative: accepted whole workstream @ S -> human approval -> main
Forbidden: dev -> source, release, or main
```

1. Fusione la línea de trabajo o funcionalidad en `dev`. El pipeline configurado debe desplegarla automáticamente en DEV. Una fusión por sí sola no demuestra el despliegue.
2. Acepte el comportamiento explícitamente en las revisiones probadas. Registre el SHA completo de origen de cada repositorio, el SHA de fusión desplegado en DEV, el resumen del artefacto, el entorno, la configuración y estado de las banderas, las pruebas, el revisor y el resultado. Un nombre de rama no es evidencia inmutable.
3. Cree un lote de publicación desde `main` actual, por ejemplo `release/v1.2`. Fusione la MISMA revisión de origen aceptada en él. No fusione `dev` en el lote ni en `main`. Compruebe que la rama de origen sigue apuntando al SHA aceptado; si avanzó, conserve la revisión aceptada u obtenga una nueva aceptación antes de promoverla.
4. Incluya solo líneas de trabajo o funcionalidades aceptadas y sus dependencias aceptadas. Si solo se acepta una parte, separe la unidad de publicación desde `main` y repita la aceptación en DEV. No publique toda la línea de trabajo con evidencia parcial.
5. Valide el lote compuesto y obtenga aprobación humana de publicación antes de fusionarlo en `main`. Una línea de trabajo totalmente aceptada puede pasar directamente a `main` con aprobación humana y validación de la composición final; el lote es opcional.
6. Publique la revisión aprobada de `main` mediante CI y una etiqueta inmutable. Despliegue el backend antes de un frontend dependiente y compruebe la compatibilidad durante el intervalo. Registre el despliegue real y la verificación en vivo por separado de la fusión y la aceptación.

### Conflictos, correcciones y composición

Conserve las revisiones de origen aceptadas y la evidencia de DEV hasta completar la verificación de publicación. No reorganice ni compacte un origen ya usado para aceptación sin tratar el resultado reescrito como un candidato nuevo.

Corrija los defectos en la rama de origen, fusiónela en DEV de nuevo y repita la aceptación afectada. Una resolución de conflicto hecha solo en `dev` no forma parte del candidato de origen. Reproduzca la corrección necesaria en el origen sin fusionar `dev` de vuelta. Nunca lleve código ajeno o no aceptado de una resolución de conflicto en DEV a una publicación.

Revise el diff completo y la ascendencia respecto a `main`, incluidas las resoluciones de conflictos. Valide contratos, orden de dependencias entre repositorios, archivos de bloqueo, compatibilidad de datos y el grafo completo de migraciones del lote seleccionado. Compruebe el orden de migraciones, las cabezas duplicadas, las dependencias omitidas y la actualización desde el esquema desplegado en producción. Pruebe el plan de reversión o recuperación hacia adelante. Las pruebas aprobadas de cada línea de trabajo por separado no demuestran que el lote funciona.

Si un conflicto de publicación o una revisión nueva de `main` cambia el comportamiento, ponga la corrección necesaria en el origen, repita la aceptación en DEV y reconstruya y valide el lote. Registre el SHA final del lote y el SHA resultante de `main`. No suponga que la aceptación en DEV cubre un árbol compuesto diferente.

### Banderas y activación

Mantenga estos estados separados:

| Estado | Evidencia o control requerido |
| --- | --- |
| Código desplegado OFF | Identidad del despliegue; valor predeterminado seguro; pruebas OFF; comportamiento desactivado. |
| Comportamiento aceptado | Pruebas ON y aceptación explícita en los SHA de origen y desplegados con la configuración probada. |
| Activación en la publicación | La habilitación de infraestructura o configuración de compilación es un cambio y una publicación revisados por separado; recompile y despliegue cuando sea necesario. |
| Activación en ejecución | Un operador autorizado usa controles auditados; registre actor, hora, grupo objetivo, valor y reversión. |

Para cada bandera, registre su valor predeterminado, grupo objetivo, responsable, vencimiento o condición de eliminación y procedimiento de reversión. Pruebe OFF y ON, incluidas las transiciones pertinentes. Confirme la paridad de configuración entre DEV y el destino de publicación. Un valor de compilación no se puede cambiar de forma segura como si fuera un control de ejecución.

Las banderas no neutralizan migraciones, tareas en segundo plano, fallos de autorización, riesgos de seguridad ni otros efectos secundarios. El código desactivado debe ser seguro para desplegar. Poner una bandera en OFF no revierte cambios de esquema ni de datos; proporcione un plan de recuperación separado.

### Adopción y carencias de automatización

Antes de adoptar el flujo, nombre responsables de la política de ramas, despliegue DEV, registros de aceptación, aprobación de publicación, comprobaciones de migraciones y controles de banderas. Defina cómo los despliegues concurrentes en DEV conservan evidencia utilizable y cómo se seleccionan las dependencias de publicación.

Esta guía documenta un proceso; no instala controles. El repositorio SDLC actual tiene comprobaciones locales de documentación, privacidad, identidad y entrega, pero no tiene flujos de GitHub Actions versionados para esta promoción. Su comprobador de ramas no acepta los prefijos ilustrativos `workstream/` o `release/`. Los responsables deben configurar y probar las reglas de nombres, protección de ramas, despliegue DEV, registro de SHA y artefactos, comprobaciones de promoción, aprobaciones y controles auditados de banderas. Verifique la configuración remota por separado; la documentación no demuestra que esos controles existan.

Use [DEPLOY.md](DEPLOY.md) para artefactos de publicación y controles de distribución.

## Referencias

- [Documentación de branches en GitHub](https://docs.github.com/en/get-started/using-git/about-branches)
- [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)
- [COMMITS.md](COMMITS.md)
- [LINEAR.md](LINEAR.md)
- [HERDR.md](HERDR.md)

- [Git workflows](https://git-scm.com/docs/gitworkflows)
- [Trunk Based Development](https://trunkbaseddevelopment.com/)
