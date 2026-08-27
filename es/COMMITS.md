# COMMITS

Esta guía define commits semánticos y atómicos para personas y agentes.

## P: ¿Qué forma de commit debemos usar?

Use Conventional Commits:

```text
<tipo>(<alcance-opcional>): <resumen>
```

Ejemplos:

```text
feat(reader): add rendered page capture
fix(ci): stop privileged jobs on fork requests
docs(branches): remove identity segments
```

Use un cuerpo cuando la razón, riesgo, migración o evidencia necesite más detalle.

## P: ¿Qué tipos de commit debemos usar?

- `feat` agrega comportamiento observable.
- `fix` corrige un defecto.
- `docs` cambia solo documentación.
- `refactor` cambia estructura sin cambiar comportamiento.
- `test` cambia tests sin cambiar el comportamiento del producto.
- `build` cambia dependencias o el sistema de build.
- `ci` cambia la configuración de CI.
- `chore` ejecuta mantenimiento acotado.
- `perf` mejora rendimiento medido.
- `style` cambia formato sin cambiar significado.
- `revert` revierte un commit anterior.

Use el tipo correcto más específico. No use `chore` para ocultar una feature o fix.

## P: ¿Qué hace semántico a un commit?

El tipo y resumen deben describir el efecto del commit.

Escriba el resumen como una acción imperativa. Use minúscula después de los dos puntos. No agregue un punto final.

Mantenga exactos los nombres técnicos. No cambie comandos, rutas, identificadores, versiones ni errores para facilitar su lectura.

Use un alcance estable cuando ayude al lector. Algunos ejemplos son `reader`, `docs`, `ci`, `security` y `runners`.

## P: ¿Qué hace atómico a un commit?

Un commit atómico tiene un propósito coherente. Puede revisarse, probarse y revertirse como una unidad.

Incluya los tests necesarios con el comportamiento que protegen. Incluya archivos generados con su cambio fuente.

Mantenga una migración de esquema con el código que la necesita cuando separarlos rompa el repositorio.

Separe cambios con resultados o riesgos de revisión independientes. No divida un cambio funcional en fragmentos inutilizables.

## P: ¿Qué pertenece en el cuerpo del commit?

Use el cuerpo para explicar:

- por qué es necesario el cambio;
- qué comportamiento cambió;
- qué límites permanecen;
- cómo se verificó el resultado;
- si un operador debe actuar.

Ajuste el texto para una salida legible en terminal. Use voz activa y oraciones cortas.

No pegue transcripciones completas de agentes, logs grandes, secretos, tokens ni datos de clientes.

## P: ¿Cómo debe un commit referenciar el trabajo?

Agregue el issue de Linear cuando no sea claro en el branch o pull request.

Ejemplo:

```text
Refs PROJ-625
```

Use un pie de cambio incompatible solo para un cambio de contrato incompatible real:

```text
BREAKING CHANGE: The capture task now requires --canonical-id.
```

Describa los pasos de migración en el cuerpo o pull request.

## P: ¿Cómo deben manejarse los fallos y trabajo parcial?

No confirme un estado roto conocido salvo que el commit documente un fixture intencional.

Use el estado local del worktree para experimentos. Confirme después de que la unidad coherente más pequeña pase sus checks.

Si un check necesario no puede ejecutarse, registre la limitación exacta. No afirme que el check pasó.

## P: ¿Cómo debe funcionar la autoría?

Use la identidad humana aprobada para commits del repositorio. Configúrela explícitamente cuando no exista una identidad global de Git.

No invente coautores. Agregue un coautor solo cuando esa persona contribuyó y aprobó la atribución.

El uso de un agente no necesita un token de identidad en el branch ni resumen del commit.

## P: ¿Cuál es la secuencia de commits para un cambio grande?

Use la secuencia más pequeña que permanezca útil después de cada commit.

Una secuencia común es:

1. agregue o actualice tests que definan el comportamiento;
2. implemente el comportamiento y haga pasar los tests;
3. actualice la documentación para usuarios y operadores;
4. actualice índices generados o metadatos de release.

Combine pasos cuando separarlos cree un commit roto. Separe documentación o cambios de política no relacionados.

## P: ¿Qué deben comprobar los revisores?

- El mensaje corresponde con el diff.
- El commit tiene un propósito.
- Los tests protegen el comportamiento modificado.
- La salida generada corresponde con su fuente.
- Ningún secreto o archivo no relacionado entró al commit.
- El commit puede revertirse sin limpieza oculta.

## Referencias

- [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)
- [Documentación de git commit](https://git-scm.com/docs/git-commit)
- [BRANCHES.md](BRANCHES.md)
- [TESTING.md](TESTING.md)
- [COMMUNICATION.md](COMMUNICATION.md)
