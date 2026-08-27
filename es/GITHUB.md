# GITHUB

Esta guía define CI, gobierno del repositorio, revisiones y uso de runners en GitHub.

## P: ¿Cuál es el diseño predeterminado de CI?

Mantenga pequeños los workflows de GitHub Actions. Deben seleccionar el runner, definir permisos y llamar tareas del repositorio.

Use `mise` como entrada de tareas locales. Prefiera Dagger para trabajo Linux que pueda ejecutarse en contenedores.

La misma lógica de build y test debe funcionar localmente y en CI. El YAML del proveedor no debe duplicarla.

Use nombres estables para checks necesarios. Un ruleset depende de esos nombres durante cambios del workflow.

## P: ¿Cuándo debe CI usar Dagger?

Prefiera Dagger cuando un job pueda ejecutarse en Linux dentro de un contenedor desechable.

Los buenos candidatos incluyen:

- compilación y tests unitarios;
- tests de integración de servicios;
- análisis estático y análisis de secretos;
- generación de SBOM y procedencia;
- builds de contenedores;
- checks de documentación;
- creación acotada de artefactos de release.

Fije la CLI, SDK, módulos, imágenes base y fuentes de paquetes de Dagger. Defina red, secretos, montajes y salidas.

Cada repositorio debe implementar y probar primero una función Dagger propia.

Cuando exista, llámela desde una tarea local de `mise` y desde GitHub Actions.

Hasta entonces, llame la misma tarea propia de `mise` en ambos entornos. Registre la adopción de Dagger como trabajo pendiente.

## P: ¿Qué trabajo debe quedar fuera de Dagger?

Mantenga un paso en su host necesario cuando un contenedor no pueda reproducir el destino.

Las excepciones comunes incluyen:

- builds de Xcode, simuladores iOS, notarización y firma de Apple;
- UI de Windows, drivers, instaladores y tests de integración nativa;
- tests de hardware Android cuando un contenedor no pueda acceder al dispositivo con seguridad;
- tests con aceleradores o hardware en el ciclo;
- entrenamiento o evaluación de inferencia con cachés de modelos muy grandes;
- herramientas con licencia vinculadas a un host controlado.

Use Dagger para el trabajo portable alrededor de la excepción. Mantenga fuera solo el paso dependiente del host.

Registre propietario, razón, riesgo, programa de parches y plan de salida para cada excepción duradera.

## P: ¿Cómo deben protegerse los workflows?

- Fije cada action de terceros a un SHA de commit completo.
- Dé a cada job el conjunto mínimo de `permissions`.
- Defina timeouts explícitos para los jobs.
- Cancele ejecuciones obsoletas con concurrencia acotada.
- No exponga secretos al código no confiable de pull requests.
- No ejecute código no confiable con privilegios en `pull_request_target`.
- Separe publicación, firma, migración y deploy en jobs aprobados.
- Proteja entornos y credenciales de release.
- Registre digests y procedencia de artefactos.
- Revise cambios de workflows, actions, runners y permisos como cambios de seguridad.

GitHub indica que un SHA completo es el único identificador inmutable para una versión de action.

## P: ¿Qué checks debe requerir un ruleset?

Requiera checks que den evidencia estable y distinta. Algunos nombres típicos son:

- formato y documentación;
- tests unitarios;
- tests de integración;
- análisis de seguridad y secretos;
- revisión de dependencias y actions;
- validación de build o paquete;
- tests específicos de plataforma cuando los archivos modificados los necesiten.

No requiera checks duplicados que ejecuten la misma ruta de evidencia.

Use selección por ruta solo cuando su lógica tenga tests. Un check omitido debe informar una decisión exitosa.

Mantenga checks de release y deploy separados de los checks de pull request.

## P: ¿Qué debe requerir el ruleset del branch predeterminado?

Use un ruleset activo para el branch predeterminado. Requiera:

- pull requests antes del merge;
- al menos una aprobación;
- revisión del propietario de código para rutas con propietario;
- conversaciones de revisión resueltas;
- checks necesarios de la revisión actual;
- protección contra borrado y actualizaciones sin avance rápido;
- historia lineal cuando el repositorio use rebase o squash.

Evalúe los rulesets antes de aplicarlos. Confirme que bots, automatización de release y procedimientos de emergencia funcionan.

Mantenga revisables los cambios del ruleset. Registre nombre, destino, checks, actores con bypass y fecha de revisión.

## P: ¿Cómo debe el equipo Devs poseer las revisiones?

Use un equipo visible de GitHub con acceso de escritura. GitHub requiere ambas condiciones para entradas CODEOWNERS de equipos.

Use este valor predeterminado cuando el equipo Devs deba revisar casi todos los cambios:

```text
* @NakamaDevs/devs
```

El equipo verificado de la organización es `Devs`, con slug `devs`.

El 2026-08-27, solo `Admins` tenía acceso al repositorio. Dé acceso de escritura a `Devs` antes de activar esta entrada.

Agregue propietarios más específicos después del valor predeterminado cuando una ruta necesite otro equipo especialista.

Proteja `.github/`, política de seguridad, automatización de release, runners y archivos de propiedad con propietarios explícitos.

Active la asignación cuando las revisiones deban rotar entre miembros de Devs. Seleccione algoritmo y cantidad deliberadamente.

CODEOWNERS solicita revisiones. No sustituye la aplicación del ruleset, acceso al repositorio ni protección del branch.

## P: ¿Cómo debe funcionar el bypass de administradores?

No otorgue bypass amplio y silencioso a todos los administradores.

Use la lista de bypass más pequeña. Prefiera la opción del ruleset que permite bypass mediante un pull request.

Esa ruta conserva el pull request, discusión de revisión e historia de auditoría.

Use bypass de emergencia solo para incidentes, respuesta de seguridad o un fallo del gobierno.

El actor de bypass debe registrar:

- el incidente o issue de Linear;
- la regla bloqueada exacta;
- la razón por la cual no terminó la revisión normal;
- el commit y resultado del deploy;
- la revisión posterior y acción correctiva.

Revise el acceso de bypass al menos cada 30 días. Quite los actores que ya no lo necesiten.

## P: ¿Qué runner debe usar un job?

Use este orden:

1. runner alojado por GitHub con Dagger para trabajo ordinario;
2. runner efímero autoalojado para redes controladas o trabajo sensible;
3. runner persistente dedicado solo para hardware, licencias o cachés grandes;
4. capacidad de release separada y aprobada para firma y deploy.

Use grupos de runners como límites de acceso. Use etiquetas para dirigir jobs dentro de un grupo aprobado.

No trate una etiqueta como un control de autorización.

## P: ¿Cómo deben funcionar los runners efímeros?

GitHub recomienda runners autoalojados efímeros para escalamiento automático. Use un job para cada registro de runner.

Envíe logs antes de borrar. Quite el registro y destruya el espacio de trabajo después de cada job.

Use Actions Runner Controller cuando Kubernetes sea la plataforma de escalamiento aprobada.

No dirija código no confiable de forks a un runner con acceso privado, firma, nube o producción.

Consulte [RUNNERS.md](RUNNERS.md) para patrones de runners alojados, autoalojados y efímeros.

## P: ¿Cómo deben funcionar los runners persistentes?

Trate cada runner persistente como un dispositivo restringido.

- Asígnelo a un repositorio o grupo pequeño y confiable.
- Rechace pull requests no confiables.
- Mantenga credenciales de deploy fuera del host cuando sea posible.
- Restablezca el espacio de trabajo después de cada job.
- Aplique parches y regenere la imagen con un programa definido.
- Monitoree disco, procesos, cachés y uso de red.
- Separe cachés grandes de modelos o SDK del estado del repositorio.

Use un runner persistente solo cuando el costo repetido o acceso a hardware justifique su riesgo.

## P: ¿Cómo deben verificarse los cambios de gobierno?

Revise por separado el diff del workflow y del ruleset. Pruebe pull requests confiables y de forks no confiables.

Confirme que cada check informa éxito, fallo y omisión intencional.

Confirme que CODEOWNERS solicita al equipo correcto. Confirme que un administrador normal no pueda omitir reglas sin estar listado.

Ejecute un smoke test acotado del runner. Registre imagen, etiquetas, grupo, URL del job, resultado y evidencia de limpieza.

## Referencias

- [Documentación de Dagger](https://docs.dagger.io/)
- [CODEOWNERS de GitHub](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners)
- [Reglas de rulesets de GitHub](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/available-rules-for-rulesets)
- [Crear un ruleset de GitHub](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/creating-rulesets-for-a-repository)
- [Uso seguro de GitHub Actions](https://docs.github.com/en/actions/reference/security/secure-use)
- [Runners autoalojados de GitHub](https://docs.github.com/en/actions/reference/runners/self-hosted-runners)
- [Grupos de runners de GitHub](https://docs.github.com/en/actions/concepts/runners/runner-groups)
- [Actions Runner Controller](https://docs.github.com/en/actions/concepts/runners/actions-runner-controller)
- [Configuración de revisiones de equipo](https://docs.github.com/en/organizations/organizing-members-into-teams/managing-code-review-settings-for-your-team)
- [DAGGER.md](DAGGER.md)
- [RUNNERS.md](RUNNERS.md)
