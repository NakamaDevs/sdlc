# DEPLOY

Esta guía define una ruta repetible desde el código revisado hasta un release con versión y un deployment controlado.

## P: ¿Qué significan release, publicación y deployment?

Use una palabra para cada operación:

- `build` crea un artefacto desde el código;
- `release` aprueba una revisión del código y sus artefactos con versión;
- `publish` envía un artefacto aprobado a un registro o servicio de distribución;
- `deploy` coloca un artefacto aprobado en un entorno de ejecución;
- `promote` mueve el mismo artefacto a otro canal o entorno;
- `rollback` restaura un artefacto o estado de ejecución conocido.

Un release no demuestra un deployment. Un deployment no crea otro release si el artefacto no cambia.

## P: ¿Qué requiere Semantic Versioning?

Declare la API pública o el contrato operativo antes de usar Semantic Versioning.

Use `MAJOR.MINOR.PATCH`:

- incremente `MAJOR` para cambios públicos incompatibles;
- incremente `MINOR` para funciones públicas compatibles o deprecations;
- incremente `PATCH` para correcciones compatibles.

Use identificadores de prerelease, como `1.8.0-rc.1`, para candidatos. Los metadatos, como `1.8.0+build.42`, no cambian la precedencia.

No sobrescriba una versión publicada. Publique una versión nueva para cada artefacto modificado.

Defina cómo gestiona la versión `0.y.z` los cambios incompatibles. La versión `1.0.0` declara la primera API pública estable.

Use [CHANGELOG.md](CHANGELOG.md) para calcular y explicar la versión propuesta.

## P: ¿Cuál es la unidad de release?

Defina cada componente con versión independiente antes de automatizarlo.

Un componente puede ser:

- una aplicación;
- una biblioteca o paquete;
- una herramienta de línea de comandos;
- una imagen de contenedor;
- una imagen de firmware;
- un módulo de infraestructura;
- un release agrupado de producto.

Para un monorepo, seleccione una versión compartida o versiones independientes. No mezcle ambos modelos sin límites explícitos.

Registre la ruta, el contrato público, la fuente de versión y la forma de tag.

Registre también los artefactos, el registro, el owner y los destinos.

## P: ¿Cuál es la máquina de estados recomendada para un release?

Use estos estados:

```text
unreleased -> planned -> reviewed -> tagged -> built -> published -> deployed -> verified
                                  \-> failed
                                  \-> rolled-back
```

Cada transición debe tener un owner, una revisión de entrada, un check, un resultado y un enlace de evidencia.

No omita un estado sin indicarlo. Registre una excepción aprobada cuando un componente no use un estado.

## P: ¿Qué revisión del código debe usar un release?

Seleccione un commit completo de una rama de release protegida. El tag, el changelog, las versiones y los artefactos deben identificarlo.

Prefiera el merge commit revisado del pull request de release. No cree un release desde un working tree sin revisión.

Cree todos los artefactos de plataforma desde la misma revisión. Registre las excepciones de código específicas de una plataforma.

Use un entorno limpio. Restaure las dependencias desde lockfiles revisados y herramientas fijadas.

## P: ¿Cómo debe funcionar un pull request de release?

Prefiera un pull request de release cuando las personas deban revisar la versión y las notas.

El planificador de release debe:

1. leer los cambios posteriores al tag anterior del componente;
2. proponer el valor siguiente de Semantic Versioning;
3. actualizar el changelog y las fuentes de versión;
4. actualizar lockfiles o metadatos generados cuando sea necesario;
5. enlazar los pull requests, issues y migraciones incluidos;
6. ejecutar la validación completa del release sin publicarlo;
7. abrir o actualizar un pull request de release que se pueda revisar.

Después de la aprobación, haga merge del pull request de release. Después, cree el tag y los artefactos desde su merge commit exacto.

Este modelo separa la intención del release de la publicación con privilegios.

## P: ¿Qué modos de activación son válidos?

Admita uno o varios modos explícitos:

- planificación automática después de que un cambio revisado llegue a la rama de release;
- publicación automática después de que un pull request de release aprobado llegue a la rama de release;
- una ejecución manual de `workflow_dispatch` con entradas tipadas para versión, componente, entorno y dry run;
- un procedimiento manual local que invoque las mismas tareas fijadas del repositorio.

Prefiera la planificación automática y la publicación revisada. Use el inicio manual para una cadencia controlada, recuperación o destinos excepcionales.

Un botón manual no reduce los checks obligatorios. Sólo cambia quién inicia el workflow.

El archivo del workflow debe estar en la rama predeterminada antes de que GitHub acepte eventos de `workflow_dispatch`.

## P: ¿Qué tareas debe exponer el repositorio?

Use nombres de tareas estables en la ejecución local y en CI.

Estos comandos son ejemplos específicos de un repositorio:

```text
mise run release:plan
mise run release:verify
mise run release:build
mise run release:publish
mise run deploy:staging
mise run deploy:production
mise run release:verify-published
```

Cada tarea debe admitir un dry run seguro cuando la operación subyacente lo permita.

Use Dagger para la lógica portátil de release en Linux cuando los contenedores puedan contener el trabajo. Mantenga la firma de plataforma en el runner de confianza necesario.

## P: ¿Qué debe comprobar la validación del release?

Antes de crear el tag, compruebe:

- la rama de código y el commit completo;
- el tag anterior y el intervalo de comparación;
- la versión propuesta y el changelog;
- la restauración limpia de dependencias desde lockfiles;
- las pruebas unitarias, de integración, de contrato y end-to-end necesarias;
- el análisis estático, los checks de secretos, dependencias y licencias;
- la compatibilidad de migraciones y la preparación del rollback;
- los metadatos de paquetes y artefactos;
- los sistemas operativos y las arquitecturas compatibles;
- las entradas reproducibles del build o la variación documentada.

Ejecute los dry runs específicos del paquete antes de publicarlo. No use credenciales de producción durante la validación normal de pull requests.

## P: ¿Cómo deben funcionar los tags y GitHub Releases?

Use un tag anotado o firmado cuando la política del repositorio lo requiera.

Use una forma documentada, como `v1.8.0` o `component-v1.8.0`. No cree tags ambiguos.

Cree el tag en el commit revisado. No mueva un tag publicado de Semantic Versioning.

Cree el borrador de GitHub Release antes de la publicación. Adjunte los artefactos, checksums, firmas, SBOM y provenance antes de publicarlo.

Las notas generadas de GitHub pueden ser un punto de partida. Un owner debe comprobar los pull requests y el efecto para el usuario.

Use releases inmutables cuando el repositorio y el modelo de entrega los admitan.

Los tags móviles de compatibilidad para GitHub Actions tienen otra política. No trate un tag móvil como evidencia inmutable.

## P: ¿Cómo deben proteger las credenciales los workflows de release?

Separe los checks de pull requests no confiables de los jobs de release y deployment con privilegios.

Use los permisos mínimos de `GITHUB_TOKEN` para cada job. Conceda `contents: write`, `packages: write` o `id-token: write` sólo cuando sea necesario.

Use OpenID Connect y credenciales de corta duración cuando el destino los admita. Limite la confianza al repositorio, workflow, reference y entorno.

Use entornos protegidos para la publicación y el deployment de producción. Exija reviewers cuando el riesgo necesite una aprobación humana.

No permita que código no confiable seleccione un runner, entorno, paquete, registro, tag o destino de deployment con privilegios.

Use controles de concurrencia para impedir que dos releases o deployments cambien el mismo componente y destino al mismo tiempo.

## P: ¿Cómo deben conservar su identidad los artefactos?

Cree el artefacto una vez y promueva el mismo artefacto verificado cuando sea práctico.

Registre:

- el componente y la versión;
- el tag de código y el commit completo;
- el nombre, media type, tamaño y digest del artefacto;
- el toolchain, la imagen del runner, el sistema operativo y la arquitectura;
- el digest de los lockfiles de dependencias;
- la ubicación del SBOM, la firma y la provenance;
- la referencia del registro y el digest inmutable;
- los enlaces de los runs de build y verificación.

Los tags de contenedores son nombres prácticos. Use el digest del manifest OCI como identidad inmutable para el deployment.

Configure anotaciones OCI, como `org.opencontainers.image.version`, `org.opencontainers.image.revision` y `org.opencontainers.image.source`.

## P: ¿Cómo debe cambiar la publicación entre ecosistemas?

Siga las reglas de versión e inmutabilidad del registro de destino.

| Ecosistema | Fuente de versión | Preparación segura | Identidad de publicación |
|---|---|---|---|
| Elixir y Hex | `mix.exs` | validación del paquete y documentación | nombre y versión del paquete |
| .NET y NuGet | metadatos del paquete del proyecto | crear, inspeccionar, firmar y probar | identificador y versión del paquete |
| Dart y Flutter | `pubspec.yaml` | analizar, probar y empaquetar | nombre y versión del paquete |
| Rust y Cargo | `Cargo.toml` | `cargo publish --dry-run` | nombre y versión del crate |
| Módulos de Go | `go.mod` y tag de Git | pruebas de compatibilidad del módulo | ruta del módulo y tag semántico |
| JavaScript y npm | `package.json` | empaquetar, inspeccionar, probar y crear provenance | nombre y versión del paquete |
| Python y PyPI | `pyproject.toml` o la fuente seleccionada | crear e inspeccionar distribuciones | nombre de proyecto y versión PEP 440 |
| Swift Package Manager | tag de Git y `Package.swift` | resolver y probar las plataformas | repositorio y tag semántico |
| Contenedores OCI | metadatos del build y tag de Git | analizar, firmar y comprobar el manifest | referencia del registro y digest |

Python usa las reglas PEP 440. No suponga que todas las cadenas válidas de Semantic Versioning tienen el mismo significado en Python.

Los módulos de Go desde `v2` necesitan el sufijo de versión principal en la ruta. Siga las excepciones oficiales de compatibilidad.

La publicación en un registro puede ser irreversible. Pruebe el paquete antes de cargarlo y use un registro de staging cuando esté disponible.

## P: ¿Cómo debe continuar el deployment después de la publicación?

Haga el deployment por la identidad inmutable del artefacto. No use una rama sin verificar ni un tag móvil.

Use esta secuencia:

1. seleccione el release aprobado y el entorno de destino;
2. confirme la protección del entorno y la aprobación del cambio;
3. haga el deployment al destino seguro más pequeño o al entorno de staging;
4. ejecute checks acotados de salud, migración, telemetría y rutas de usuario;
5. amplíe mediante la estrategia de rollout seleccionada;
6. observe la tasa de errores, latencia, saturación, señales del negocio y condiciones de rollback;
7. registre el digest, entorno, hora, actor y evidencia del deployment;
8. cierre el deployment sólo después de que termine el periodo de verificación.

Use canary, rolling, blue-green u otra estrategia sólo cuando el sistema pueda medirla y revertirla.

## P: ¿Cómo debe funcionar el rollback?

Defina el rollback antes del deployment. Incluya los efectos en aplicación, configuración, base de datos, queue, cache y contratos externos.

Prefiera volver a desplegar un artefacto verificado. No reconstruya una versión anterior y la llame el mismo artefacto.

Use forward recovery cuando los cambios de datos o contratos hagan inseguro el rollback.

No mueva ni sustituya una versión publicada después del rollback. Publique una versión correctiva cuando deba cambiar el contenido.

Registre el motivo, la condición, el artefacto, la acción de datos y el owner.

Registre también las horas, el resultado y el issue de seguimiento.

## P: ¿Cuál es el procedimiento manual de release?

Use este procedimiento cuando la publicación en CI no esté disponible o esté desactivada por decisión:

1. confirme el pull request de release aprobado y el merge commit completo;
2. ejecute la tarea completa de verificación fijada en un entorno limpio;
3. genere y revise el changelog y la versión propuesta;
4. cree el tag aprobado de release en el commit exacto;
5. cree cada artefacto con herramientas fijadas;
6. compruebe checksums, firmas, SBOM, provenance y metadatos del paquete;
7. cree un borrador de GitHub Release y adjunte los artefactos verificados;
8. publique cada artefacto de registro con credenciales autorizadas;
9. compruebe cada artefacto publicado desde un entorno consumidor limpio;
10. publique el GitHub Release y registre toda la evidencia;
11. haga el deployment sólo mediante el procedimiento protegido.

Otra persona debe comprobar un release manual con privilegios cuando el riesgo necesite separación de responsabilidades.

## P: ¿Qué demuestra que un release terminó?

Un release termina sólo cuando:

- la versión, el changelog, el tag, el commit y los artefactos coinciden;
- todos los checks obligatorios pasaron en el código publicado;
- los registros devuelven las identidades inmutables previstas;
- los checksums, firmas, SBOM y provenance están disponibles cuando son necesarios;
- el GitHub Release enlaza los artefactos y los detalles de migración correctos;
- el status del deployment está explícito y separado del status de publicación;
- Linear o el tracker seleccionado contiene evidencia acotada y los riesgos restantes.

## Referencias

- [Semantic Versioning 2.0.0](https://semver.org/spec/v2.0.0.html)
- [Gestión de releases de GitHub](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository)
- [Notas de release generadas por GitHub](https://docs.github.com/en/repositories/releasing-projects-on-github/automatically-generated-release-notes)
- [Sintaxis de workflows de GitHub Actions](https://docs.github.com/en/actions/reference/workflows-and-actions/workflow-syntax)
- [Deployments y entornos de GitHub](https://docs.github.com/en/actions/reference/workflows-and-actions/deployments-and-environments)
- [Guía de OpenID Connect para GitHub](https://docs.github.com/en/actions/how-tos/secure-your-work/security-harden-deployments/oidc-in-cloud-providers)
- [Release Please](https://github.com/googleapis/release-please)
- [semantic-release](https://semantic-release.gitbook.io/semantic-release)
- [Changesets](https://github.com/changesets/changesets)
- [git-cliff](https://git-cliff.org/docs/)
- [Publicación de paquetes Hex](https://hex.pm/docs/publish)
- [Versionado de paquetes NuGet](https://learn.microsoft.com/en-us/nuget/concepts/package-versioning)
- [Publicación en Cargo](https://doc.rust-lang.org/cargo/reference/publishing.html)
- [Workflow de release para módulos de Go](https://go.dev/doc/modules/release-workflow)
- [Publicación en npm](https://docs.npmjs.com/cli/commands/npm-publish/)
- [Especificadores de versión de Python](https://packaging.python.org/en/latest/specifications/version-specifiers/)
- [Publicación de paquetes Swift](https://docs.swift.org/swiftpm/documentation/packagemanagerdocs/releasingpublishingapackage/)
- [Anotaciones de imágenes OCI](https://github.com/opencontainers/image-spec/blob/main/annotations.md)
- [CHANGELOG.md](CHANGELOG.md)
- [GITHUB.md](GITHUB.md)
- [DAGGER.md](DAGGER.md)
- [RUNNERS.md](RUNNERS.md)
- [SECURITY.md](SECURITY.md)
