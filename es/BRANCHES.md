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

Elimine el branch remoto después del merge cuando ningún stack activo dependa de él.

## Referencias

- [Documentación de branches en GitHub](https://docs.github.com/en/get-started/using-git/about-branches)
- [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)
- [COMMITS.md](COMMITS.md)
- [LINEAR.md](LINEAR.md)
- [HERDR.md](HERDR.md)
