# RUNNERS

Esta guía define opciones seguras de runner de CI alojados y autohospedados para GitHub y GitLab.

## P: ¿Cuándo debe usar un proyecto un runner autohospedado?

Use un runner autohospedado cuando un job requiera acceso a red privada, hardware con licencia, un sistema operativo especial, hardware acelerador, cachés locales o un entorno de build controlado.

Use runners alojados para la validación ordinaria cuando cumplan el requisito. Los runners alojados reducen el trabajo de actualización y aislamiento. Los runners autohospedados transfieren ese trabajo al equipo.

Nunca ejecute código no confiable de pull request y credenciales confiables de release en el mismo runner persistente. Prefiera runners efímeros para jobs no confiables o de alto riesgo.

## P: ¿Cuál es el límite mínimo del runner?

- Separe grupos de runner públicos, internos, de release y de deploy.
- Use labels o tags que describan capacidad y confianza.
- Permita sólo el alcance requerido de repositorio o proyecto.
- Use credenciales de registro y de nube de corta duración.
- Fije la imagen del runner y reconstrúyala con regularidad.
- Elimine los espacios de trabajo y cachés después de los jobs.
- Deniegue salida de red innecesaria.
- No exponga sockets del host ni credenciales de producción a jobs de build ordinarios.
- Registre versiones de imagen, cadena de herramientas, runner, kernel y hardware.
- Supervise disco, memoria, CPU, uso de aceleradores, tiempo en cola y jobs fallidos.

## P: ¿Cómo deben funcionar los runners de GitHub Actions?

Siga la [referencia de runners autohospedados de GitHub](https://docs.github.com/en/actions/reference/runners/self-hosted-runners). Use grupos de runner y labels. Use [Actions Runner Controller](https://docs.github.com/en/actions/concepts/runners/actions-runner-controller) para grupos escalados de Kubernetes cuando se justifique el ajuste automático.

Un runner autohospedado no es un límite de seguridad. Trate los jobs como ejecución de código. Use imágenes efímeras o máquinas virtuales desechables para cambios no confiables. Separe workflows de forks de workflows con privilegios. Exija protección de entorno y revisión para jobs de release.

## P: ¿Cómo deben funcionar los runners de GitLab?

Siga la [documentación de GitLab Runner](https://docs.gitlab.com/runner/). Seleccione un executor que cumpla la necesidad de aislamiento. Use tags para dirigir los jobs. Use runners protegidos para branches protegidos y trabajo de release. Use ajuste automático o runners efímeros cuando el estado persistente cree riesgos entre jobs.

Los runners alojados de GitLab son otra opción. Consulte la [documentación de runners alojados de GitLab](https://docs.gitlab.com/ci/runners/hosted_runners/).

## P: ¿Dónde encaja Dagger?

Use [Dagger](https://dagger.io/) cuando la misma lógica de build, test o release en contenedor deba ejecutarse localmente, en GitHub Actions, en GitLab CI o en otro sistema de CI.

Dagger mueve la lógica de workflow a un pipeline programable y direccionado por contenido. No elimina riesgos de runner, secretos, red o caché. Versione el módulo de Dagger. Fije las imágenes base y dependencias. Use Dagger para grafos de build repetibles. No lo use para ocultar un workflow poco claro.

## P: ¿Qué debe probar CI?

- El job inicia desde un espacio de trabajo limpio.
- Las herramientas y dependencias están fijadas.
- El job no usa estado del host no declarado.
- Los secretos tienen alcance limitado y nunca se imprimen.
- Los artefactos tienen digests y procedencia.
- Los tests y checks de seguridad producen evidencia acotada.
- Una tarea documentada puede reproducir localmente un job fallido.
- El equipo puede reconstruir el runner sin reparación manual.

## Referencias

- [Runners autoalojados de GitHub](https://docs.github.com/en/actions/reference/runners/self-hosted-runners)
- [GitHub Actions Runner Controller](https://docs.github.com/en/actions/concepts/runners/actions-runner-controller)
- [Runners de GitLab](https://docs.gitlab.com/ci/runners/)
- [GitLab Runner](https://docs.gitlab.com/runner/)
- [Runners alojados de GitLab](https://docs.gitlab.com/ci/runners/hosted_runners/)
- [Dagger](https://dagger.io/)
- [Repositorio de Dagger](https://github.com/dagger/dagger)
- [Procedencia de SLSA](https://slsa.dev/spec/v1.2/provenance)
