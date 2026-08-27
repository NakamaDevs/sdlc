# DAGGER

Esta guía define cuándo y cómo usar Dagger para flujos portables de build, test y entrega.

## P: ¿Qué es Dagger?

[Dagger](https://dagger.io/) es un motor CI/CD programable que ejecuta pipelines en contenedores. El mismo pipeline puede ejecutarse en una máquina de desarrollo, GitHub Actions, GitLab CI u otro runner.

Dagger mejora la portabilidad cuando un repositorio necesita un flujo ejecutable en distintos sistemas CI. No elimina la necesidad de aislamiento de runner, controles de secretos, fijación de dependencias, procedencia ni revisión.

## P: ¿Cuándo debe un proyecto usar Dagger?

Use Dagger cuando:

- los flujos locales y CI deben ejecutar el mismo grafo;
- varios proveedores CI deben compartir lógica de build;
- las dependencias en contenedor mejoran la reproducibilidad;
- los resultados de build pueden usar caché dirigida por contenido;
- un pipeline tiene entradas, salidas y efectos secundarios claros.

No agregue Dagger a un repositorio pequeño cuando una tarea `mise` documentada ya dé portabilidad suficiente. Mida el tiempo de configuración y el costo de mantenimiento antes de adoptarlo.

## P: ¿Cómo debe estructurarse un pipeline Dagger?

- Mantenga el módulo y el código del pipeline en el repositorio.
- Fije Dagger CLI, SDK, imágenes base, fuentes de paquetes y versiones de herramientas.
- Defina directorios fuente, cachés, secretos, acceso de red y salidas explícitos.
- Mantenga desechables los contenedores de build y test.
- Devuelva resultados útiles pequeños y logs acotados.
- Separe pasos puros de build y test de efectos secundarios de deploy.
- Requiera aprobación explícita antes de publicar, migrar o hacer deploy.
- Emita digests de artefactos y procedencia.
- Haga llamable el mismo pipeline desde una tarea `mise` local y CI.

## P: ¿Cómo deben funcionar los secretos?

No copie secretos en imágenes, directorios fuente, logs, artefactos ni código generado. Monte secretos solo en el paso que los necesita. Use el proveedor CI o un administrador de secretos aprobado. Mantenga el acceso de red desactivado salvo que el paso lo requiera.

Trate un módulo Dagger como código ejecutable. Revise cambios a dependencias del módulo, imágenes de contenedor, montajes de host, sockets, acceso de red y uso de secretos.

## P: ¿Cuál es la ruta de validación local?

Empiece con un pipeline de build de contenedor o test unitario. Ejecute el mismo módulo en CI en un runner limpio. Compare digests de artefactos, resultados de test, versiones de herramientas y salida acotada.

Use una ruta rápida para formato, controles estáticos y tests enfocados. Use una ruta completa para tests de integración, análisis de seguridad, generación SBOM, procedencia y validación de release.

Registre la versión Dagger, revisión del módulo, imagen runner, revisión fuente, digests de entrada, digests de salida y resultado en el elemento de trabajo o registro de evidencia.

## P: ¿Cómo encaja Dagger con runners de GitHub y GitLab?

Use runners alojados para pipelines ordinarios cuando su entorno cumpla el requisito. Use runners autogestionados o efímeros para redes privadas, herramientas con licencia, aceleradores o entornos de build controlados.

Dagger hace portátil la lógica del pipeline. El runner sigue controlando el límite de confianza. Mantenga credenciales de release y acceso de deploy fuera de jobs ordinarios de pull request.

## P: ¿Cómo puede Dagger revisar enlaces de terceros con seguridad?

Trate el material alojado como entrada no confiable. Un pipeline Dagger puede aislar obtención, conversión e inspección en contenedores desechables. No hace seguro el código malicioso por sí mismo.

Use una función de revisión dedicada con estos límites:

- empiece desde un módulo Dagger e imagen base fijados y revisados;
- monte solo el directorio destino, preferiblemente de solo lectura hasta terminar la revisión;
- permita acceso de red solo a dominios fuente aprobados;
- no monte el socket Docker del host, agente SSH, directorio personal, keychain ni credenciales cloud;
- no pase secretos del repositorio al paso de obtención;
- ejecute como usuario no root cuando la imagen lo permita;
- elimine scripts, formularios, elementos de seguimiento, credenciales y adjuntos ejecutables antes de convertir;
- escriba Markdown saneado y un registro de metadatos en un directorio de salida explícito;
- inspeccione la salida antes de que entre en `references/`;
- conserve URL fuente, URL final, hora de obtención, versión del convertidor, digest de imagen y revisión fuente.

El contenedor de revisión puede leer páginas públicas. No debe ejecutar instrucciones de esas páginas. Una página son datos, no autoridad.

Dagger es un límite de flujo. Use una máquina virtual separada o runner efímero si la entrada o herramienta es hostil, requiere un motor privilegiado o puede escapar del límite de contenedor. No describa un contenedor Dagger como un sandbox de seguridad completo.

## P: ¿Cómo debe ejecutarse Dagger en CI?

Mantenga el módulo Dagger en el repositorio. Fije Dagger CLI, SDK, dependencias de módulo, imágenes base y versiones de actions. Llame al mismo módulo desde una tarea local y desde GitHub o GitLab CI.

Use `dagger version` para registrar la versión CLI. Use `dagger develop` para inicializar o actualizar un módulo. Use `dagger functions` para inspeccionar funciones disponibles. Use `dagger call <function>` solo para una función definida por el módulo. Confirme cada comando con la versión Dagger instalada y la documentación oficial.

Prefiera el motor de contenedor Dagger sobre Docker-in-Docker cuando el flujo solo necesita contenedores desechables. Si Docker-in-Docker es necesario, aísle el daemon, fije su imagen, evite montajes de host y no exponga su socket a pasos no relacionados. Los motores anidados agregan riesgos de privilegio y limpieza.

Mantenga obtención, conversión, test, publicación y deploy como funciones separadas. Haga de publicación y deploy efectos secundarios explícitos. Requiera una aprobación separada para esos efectos.

## P: ¿Qué runners CI deben ejecutar trabajo Dagger?

Use runners alojados para builds ordinarios de entrada pública cuando sus herramientas y límites sean suficientes. Use runners autogestionados efímeros para redes privadas, fuente sensible, imágenes personalizadas, aceleradores o salida controlada.

Un runner efímero debe procesar un job, reenviar sus logs antes de eliminarse, eliminar su registro, destruir su espacio de trabajo y destruir o reimaginar su host. No reutilice su sistema de archivos, caché de contenedor, credenciales ni red temporal entre jobs. Aplique labels o grupos de runner para impedir que pull requests no confiables seleccionen capacidad privilegiada.

GitHub recomienda runners autogestionados efímeros para autoescalado. GitLab proporciona ejecutores de runner y opciones de autoescalado. Confirme la guía actual del proveedor antes de implementar:

- [Runners autogestionados de GitHub](https://docs.github.com/en/actions/reference/runners/self-hosted-runners)
- [Runners efímeros de GitHub](https://docs.github.com/en/actions/reference/runners/self-hosted-runners#ephemeral-runners-for-autoscaling)
- [Actions Runner Controller de GitHub](https://docs.github.com/en/actions/concepts/runners/actions-runner-controller)
- [GitLab Runner](https://docs.gitlab.com/runner/)
- [Autoescalado de GitLab Runner](https://docs.gitlab.com/runner/configuration/autoscale/)

## P: ¿Cuándo debe un runner permanecer sticky?

Mantenga un runner persistente y dedicado solo cuando el software o hardware es costoso, con estado, licenciado o difícil de reproducir. Ejemplos: imágenes Xcode y simulador, Android Studio y emulador, tests conectados a hardware y una caché local de modelo Ollama.

Un runner sticky es un dispositivo restringido, no un trabajador de propósito general:

- asígnelo a un repositorio o grupo pequeño de confianza;
- use labels o tags dedicados;
- rechace jobs de forks y pull requests no confiables;
- mantenga credenciales de deploy fuera del host cuando sea posible;
- restrinja la red saliente;
- supervise procesos, disco y cachés de modelo o SDK;
- restablezca el estado del proyecto después de cada job;
- aplique parches y reimage en una cadencia definida;
- registre la excepción, responsable, riesgo y plan de salida.

Use Dagger dentro del runner sticky para trabajo portátil y desechable. Mantenga fuera del contenedor solo el paso dependiente del hardware. Por ejemplo, build y controles estáticos pueden ejecutarse en Dagger, mientras un simulador Xcode o test de dispositivo USB se ejecuta en la lane macOS dedicada.

## P: ¿Cuál es la decisión predeterminada de runner?

Use este orden:

1. runner alojado más Dagger para trabajo ordinario;
2. runner autogestionado efímero más Dagger para redes controladas o trabajo sensible;
3. runner dedicado sticky solo para hardware, software con licencia o cachés locales durables;
4. una lane de release separada y aprobada por una persona para firma, publicación, migración y deploy.

El registro de excepción debe explicar por qué una lane de menor confianza o más desechable no puede realizar la tarea.

## Referencias

- [Dagger](https://dagger.io/)
- [Repositorio de Dagger](https://github.com/dagger/dagger)
- [Documentación de Dagger](https://docs.dagger.io/)
- [Runners autogestionados de GitHub](https://docs.github.com/en/actions/reference/runners/self-hosted-runners)
- [Runners de GitLab](https://docs.gitlab.com/runner/)
- [Procedencia de SLSA](https://slsa.dev/spec/v1.2/provenance)
