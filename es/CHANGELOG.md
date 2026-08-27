# CHANGELOG

Esta guía define cómo un proyecto convierte cambios revisados en registros útiles de changelog y release.

## P: ¿Para qué sirve un changelog?

Un changelog proporciona un registro seleccionado de los cambios importantes de cada versión publicada.

No copia todo el log de Git. El historial conserva detalles técnicos. El changelog explica el impacto para usuarios y operadores.

Mantenga una sección `Unreleased`. Mueva las entradas revisadas a una sección de versión fechada durante la preparación del release.

Use estas secciones estándar cuando contengan entradas:

- `Added` para comportamiento nuevo;
- `Changed` para comportamiento modificado;
- `Deprecated` para comportamiento que se quitará;
- `Removed` para comportamiento eliminado;
- `Fixed` para comportamiento corregido;
- `Security` para correcciones y avisos de seguridad.

## P: ¿Qué registros deben proporcionar datos para el changelog?

Use registros revisados en este orden:

1. un fragmento de cambio aprobado o campo de nota de release;
2. el título y la descripción del pull request integrado;
3. el commit semántico de merge o squash;
4. los commits atómicos del pull request;
5. el issue, los tests, la guía de migración y el aviso de seguridad.

La automatización puede recopilar estos registros. Un responsable debe verificar significado, audiencia, duplicación y límites de seguridad.

## P: ¿Cómo deben describir un cambio los Conventional Commits?

Use un tipo estable, un scope opcional y un resumen directo.

```text
feat(auth): agregar inicio de sesión con passkey
fix(auth): impedir el bloqueo después de 15 minutos
feat(api)!: quitar el endpoint de token anterior
```

El scope nombra el módulo o área de producto afectada. Use nombres estables como `auth`, `billing`, `reader` o `api`.

Use `feat` para comportamiento compatible nuevo. Use `fix` para comportamiento corregido.

Use `!` o un footer `BREAKING CHANGE:` para un cambio incompatible del contrato público.

Otros tipos pueden informar el historial interno. No seleccionan un incremento SemVer salvo que declaren un cambio incompatible.

## P: ¿Por qué pueden los commits de merge dirigir el changelog?

Un commit de merge puede representar un pull request revisado en el historial first-parent del branch de release.

Este modelo conserva dos vistas útiles:

- el historial first-parent muestra cambios revisados en orden de entrega;
- el branch integrado conserva commits atómicos de implementación cuando siguen siendo útiles.

Use un título semántico para el pull request. Configure el título del commit de merge desde ese título revisado.

El cuerpo debe enlazar el pull request, issue, evidencia y nota de migración. No incluya secretos ni datos privados.

Lea candidatos de release desde el tag anterior hasta el head con `git log --first-parent`.

No publique la salida sin procesar como changelog. Analícela, agregue datos del pull request y revise el resultado.

## P: ¿Cuándo es útil un historial completo de commits?

Conserve el historial completo cuando sus commits sean útiles por separado y pasen los checks necesarios.

Ayuda cuando:

- los revisores necesitan pasos separados de diseño, migración, test o salida generada;
- `git bisect` puede identificar un límite de regresión menor;
- una parte puede revertirse sin revertir todo el pull request;
- varios autores aportaron unidades revisadas distintas;
- un stack necesita límites estables entre padre e hijo;
- una auditoría necesita la secuencia de implementación.

No conserve ruido de fixup solo porque existe. Limpie el historial privado antes de publicarlo cuando la política lo permita.

## P: ¿Cuándo tiene sentido un squash merge?

Use squash merge cuando el pull request sea un cambio lógico y sus commits internos no tengan valor duradero.

Es útil cuando:

- el branch contiene fixups, correcciones de review o puntos de control temporales;
- los commits intermedios no pasan por separado;
- los colaboradores ocasionales no deben necesitar mensajes de commit perfectos;
- la herramienta de release espera un Conventional Commit por pull request.

El título del squash debe usar la forma semántica. El cuerpo debe conservar autoría, enlaces y detalles incompatibles.

El squash cambia las identidades de commits. También quita del branch destino los límites del branch original.

No aplique squash a un stack antes de revisar cómo las nuevas identidades afectan los pull request dependientes.

## P: ¿Cuándo tiene sentido un rebase merge?

Use rebase merge cuando cada commit sea atómico, semántico, ordenado y válido en el branch destino.

Es útil cuando el proyecto exige un historial lineal y cada commit proporciona un límite útil.

El rebase merge no conserva un commit de merge explícito. GitHub también crea nuevas identidades durante esta operación.

No use rebase merge cuando el analizador del changelog espere un commit de merge por cada cambio revisado.

## P: ¿Cuál es el modelo de historial predeterminado recomendado?

Prefiera este modelo híbrido salvo que la evidencia del repositorio respalde otro modelo:

1. conserve commits semánticos y atómicos en el branch;
2. use un título semántico para el pull request;
3. integre con un commit de merge en el branch de release;
4. use commits de merge first-parent como límites del changelog;
5. conserve commits del branch para diagnóstico, auditoría y reversiones selectivas;
6. revise el registro generado antes de publicarlo.

Este modelo conserva límites de review sin descartar un historial de implementación útil.

Use squash cuando los commits del branch no sean registros duraderos. Use rebase cuando cada commit deba ser un registro principal.

Documente el método seleccionado en la política del repositorio. Configure solo métodos compatibles en el host Git.

## P: ¿Cómo deben asignarse los cambios a Semantic Versioning?

Aplique el incremento más alto necesario entre todos los cambios públicos incluidos:

- `MAJOR` para un cambio incompatible de API pública o contrato operativo;
- `MINOR` para comportamiento público compatible nuevo o una deprecación nueva;
- `PATCH` para correcciones compatibles;
- ningún release para cambios que no modifican un componente publicado.

La versión `0.y.z` indica desarrollo inicial en Semantic Versioning. Defina la política para cambios incompatibles antes de `1.0.0`.

No calcule una versión solo desde el tipo de commit. Confirme la API pública declarada y el impacto real.

Para varios paquetes, calcule cada versión desde su contrato público afectado. Registre por separado los incrementos por dependencias.

## P: ¿Cómo deben asignarse los tipos a las secciones del changelog?

Use este mapping predeterminado y después revise el resultado:

| Entrada | Sección predeterminada | Incremento predeterminado | Incluya cuando |
|---|---|---|---|
| `feat` | `Added` | `MINOR` | Los usuarios reciben comportamiento compatible nuevo. |
| `fix` | `Fixed` | `PATCH` | Los usuarios reciben comportamiento corregido. |
| cualquier cambio incompatible | `Changed` o `Removed` | `MAJOR` | Los usuarios deben migrar. |
| `perf` | `Changed` | decisión del proyecto | El cambio medido afecta a usuarios u operadores. |
| label `security` o aviso | `Security` | decisión por impacto | La publicación no expone una debilidad sin corregir. |
| `docs`, `test`, `ci`, `build`, `chore` | omitido de forma predeterminada | ninguno | Incluya solo impacto directo. |
| `revert` | revertir la entrada original | decisión por impacto | El release ya no contiene el cambio original. |

Un tipo es una señal de automatización. No sustituye el review.

## P: ¿Qué debe contener cada entrada de release?

Cada entrada importante debe contener:

- un resultado breve enfocado en el usuario;
- el scope o componente afectado;
- el enlace del pull request o issue;
- un enlace de migración para cambios incompatibles;
- un enlace al aviso de seguridad cuando sea seguro publicarlo;
- un crédito al colaborador cuando la política lo permita.

Cada sección de versión debe contener:

- la versión exacta y fecha de release;
- el tag fuente y commit fuente completo;
- un enlace de comparación con el release anterior;
- límites, deprecaciones y requisitos de migración conocidos;
- enlaces de artefactos, procedencia y deploy cuando correspondan.

## P: ¿Cuál es el workflow repetible de generación?

Use una tarea determinista de forma local y en CI:

1. identifique el tag anterior y el commit fuente destino;
2. recopile límites revisados para el modelo de historial seleccionado;
3. analice tipos, scopes, cambios incompatibles y reversiones;
4. una datos de pull request, issue, label, colaborador y fragmento;
5. rechace entradas de release mal formadas o ambiguas;
6. calcule la versión propuesta para cada componente;
7. genere la sección `Unreleased` o el candidato de release;
8. permita que un responsable edite el texto y los detalles de migración;
9. verifique enlaces, archivos de versión, metadatos y rangos de comparación;
10. incluya el changelog y versión revisados en un pull request de release.

La tarea debe producir el mismo candidato desde la misma revisión y configuración.

## P: ¿Qué herramientas pueden respaldar este modelo?

Seleccione una herramienta después de probar su modelo de historial y paquetes.

- Release Please crea pull requests de release desde Conventional Commits. Admite historiales merge y squash con límites documentados.
- semantic-release calcula versiones y publica releases desde commits del branch de release. Favorece la automatización completa.
- Changesets guarda intención de versión revisada en fragmentos. Es útil para repositorios con varios paquetes.
- git-cliff genera changelogs configurables desde el historial Git y Conventional Commits.
- Las notas generadas por GitHub agrupan pull requests mediante labels en `.github/release.yml`.

Fije la revisión de herramienta y action. Pruebe merges, squash, reversiones, backports, prereleases y releases vacíos.

No combine calculadores de versión independientes sin declarar una autoridad.

## P: ¿Cuál es la alternativa manual?

Use las mismas entradas y el mismo estándar de review sin automatización:

1. compare el tag anterior con el commit fuente destino;
2. enumere pull requests y commits first-parent integrados;
3. clasifique cada cambio importante para usuarios u operadores;
4. seleccione el incremento de versión más alto;
5. actualice los archivos de versión y changelog;
6. revise el resultado con otra persona;
7. siga [DEPLOY.md](DEPLOY.md) para crear el tag, publicar y hacer deploy.

Registre el rango exacto y el commit fuente final. La ruta manual debe ser reproducible.

## Referencias

- [Semantic Versioning 2.0.0](https://semver.org/spec/v2.0.0.html)
- [Conventional Commits 1.0.0](https://www.conventionalcommits.org/en/v1.0.0/)
- [Keep a Changelog 1.1.0](https://keepachangelog.com/en/1.1.0/)
- [Git log e historial first-parent](https://git-scm.com/docs/git-log)
- [Métodos de merge de pull requests en GitHub](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/incorporating-changes-from-a-pull-request/about-pull-request-merges)
- [Notas de release generadas por GitHub](https://docs.github.com/en/repositories/releasing-projects-on-github/automatically-generated-release-notes)
- [Release Please](https://github.com/googleapis/release-please)
- [semantic-release](https://semantic-release.gitbook.io/semantic-release)
- [Changesets](https://github.com/changesets/changesets)
- [git-cliff](https://git-cliff.org/docs/)
- [COMMITS.md](COMMITS.md)
- [BRANCHES.md](BRANCHES.md)
- [DEPLOY.md](DEPLOY.md)
