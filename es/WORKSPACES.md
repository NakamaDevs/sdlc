# WORKSPACES

Use un repositorio raíz privado para coordinar. Es un meta repositorio, no un historial combinado de aplicaciones.
Lea [STRUCTURE.md](STRUCTURE.md) para elegir estructura y [ASPIRE.md](ASPIRE.md) para las herramientas de ejecución.

## Estructura raíz

```text
team-root/
  AGENTS.md
  CLAUDE.md
  README.md
  mise.toml
  workspace.json
  skills.lock.json
  docs/
    system.md
    onboarding.md
    repositories/
    decisions/
    work/
  agents/
  runtime/
  scripts/
  repos/          # ignored child checkouts
  worktrees/      # ignored task checkouts
  state/          # ignored runtime state
  artifacts/      # ignored evidence
```

El manifiesto raíz registra rutas y responsables. Mantenga credenciales y destinos privados en configuración local ignorada.
Un manifiesto es un inventario, no autorización para clonar, ejecutar o publicar un repositorio.
Use un adaptador Meta opcional cuando el equipo necesite comandos de grupo. Revise el alcance de cada comando antes de ejecutarlo.
Mantenga una copia base limpia por aplicación. Cree worktrees solo para los repositorios que cambia la tarea.

## Copias pequeñas y ejecución mínima

Clone solo los repositorios necesarios. Un worktree reutiliza objetos Git, pero necesita sus propios archivos y estado de ejecución.
La copia dispersa reduce las rutas materializadas. La clonación parcial reduce descargas iniciales cuando el servidor la admite.
Ninguna aísla datos ni elimina dependencias. Un historial superficial puede impedir cálculos de base, cambios y entregas.

Use copia dispersa después de comprobar metadatos, paquetes compartidos, datos de prueba y entradas de generación necesarios.
Compare una vez con una copia completa antes de adoptar el perfil disperso. Amplíe las rutas si falta una dependencia.
Registre rutas seleccionadas y versión de Git. No presente el resultado disperso como evidencia completa de integración.

Seleccione un perfil explícito por tarea:

| Perfil | Recursos reales | Límite de evidencia |
| --- | --- | --- |
| docs | Solo documentación | Lectura, enlaces, descubrimiento |
| frontend-mock | Interfaz y servidor simulado local | Comportamiento del navegador con contratos sintéticos |
| backend-contract | API y servicios de datos aislados | Comportamiento del proveedor y cumplimiento del contrato |
| integrated-local | Aplicaciones cambiadas y dependencias | Comportamiento entre servicios con revisiones identificadas |
| release-check | Grafo completo requerido | Aceptación de entrega en un entorno aprobado |

Documente y conserve el perfil normal de inicio. Cada tarea selecciona explícitamente un perfil menor.
Instale solo sus dependencias. Limite procesos, contenedores, memoria, puertos y concurrencia de pruebas.

## Ciclo de vida del worktree

Cree una rama desde la base verificada y un directorio único. Inspeccione los worktrees existentes antes de crear otro.
Registre juntos revisión, tarea, responsable, ruta e instancia de ejecución.
Confirme la copia real antes de editar, probar, migrar o cargar datos.
Después de entregar, conserve evidencia y datos necesarios. Detenga solo procesos propios y elimine únicamente un worktree limpio y entregado.
No fuerce la eliminación si los cambios o responsables son ambiguos.

## Identidad de ejecución

Cada instancia de escritura necesita identidad propia. Registre estos campos antes del inicio:

| Límite | Valor requerido |
| --- | --- |
| Código | Copia absoluta, rama y commit de cada aplicación |
| Rutas | Nombre, puertos descubiertos, dominios y conexión entre interfaz y API |
| Base de datos | Motor, base o esquema, usuario, migraciones y revisión de datos |
| Trabajo asíncrono | Espacio de colas, identidad del proceso y responsable del planificador |
| Almacenamiento | Espacio de depósito o directorio y prefijo de archivos |
| Caché | Prefijo de claves o servicio aislado con separación verificada |
| Integraciones | Destinos simulados o de prueba y efectos externos bloqueados |
| Evidencia | Directorios de registros, trazas, pruebas y artefactos |

Aislar puertos no basta. Dos procesos con puertos distintos pueden consumir la misma cola o modificar la misma base.
Un motor compartido es aceptable solo con bases de escritura y credenciales independientes verificadas.
No comparta estado de escritura entre instancias. Nunca restaure ni cargue datos automáticamente al reiniciar.

Antes de modificar datos, verifique la identidad desde la conexión de la aplicación y el proceso, no solo la configuración.
Bloquee la operación si no coincide. Una segunda instancia debe conservar datos, rutas y procesos de la primera.
Pruebe con dos registros sintéticos testigo y trabajos de cola distintos. Detenga una instancia y verifique que la otra funciona.

## Integración con Aspire

Mantenga AppHost y adaptadores en la raíz. Vincule cada recurso con una copia explícita y una entrada del registro de instancias.
Use destinos descubiertos para los clientes de prueba. Mantenga el panel y diagnóstico locales o con acceso controlado.
La plantilla contiene un contrato de ejecución, no un AppHost universal. Implemente el grafo para los lenguajes y versión fijada.
Valide primero un servicio, una dependencia, disponibilidad, registros y reinicio. Después añada una segunda instancia aislada.

Reinicie el recurso de aplicación para cambios de aplicación. Recargue AppHost si cambian sus definiciones de recursos.
Conserve las bases durante ambas operaciones. Registre cualquier reinicio de datos deliberado como acción separada.
La evidencia incluye inicio, petición, disponibilidad, registros, aislamiento, parada y limpieza.
Declare plataformas no verificadas y telemetría ausente.

## Contratos simulados y evidencia

Use datos sintéticos ligados a una revisión del esquema API y un proveedor responsable. Ambos responsables revisan cambios semánticos.
Cubra éxito, vacío, carga, validación, autorización, ausencia, conflicto, espera agotada y error de servidor cuando corresponda.
Incluya importes, valores nulos, paginación, orden, fechas e idempotencia cuando la función dependa de ellos.
Las rutas simuladas desconocidas deben fallar. Desactive el paso accidental hacia servicios reales.

En pruebas de backend, simule servicios externos en el límite de integración. Mantenga bajo prueba la lógica real de negocio.
Use servicios de datos desechables reales para transacciones, bloqueos, migraciones o colas.
Compare respuestas simuladas con el esquema actual y pruebas representativas del proveedor.
Actualice juntos datos y contratos. Una instantánea no demuestra compatibilidad semántica.

Ejecute pruebas simuladas rápidas durante la implementación. Antes de integrar, pruebe el mismo escenario contra el proveedor local real.
Registre revisiones de consumidor, proveedor, esquema y datos, entorno, comando, resultado y artefactos.
Una prueba simulada demuestra la interfaz. Una prueba del proveedor demuestra el backend. Un recorrido integrado demuestra su conexión.
El despliegue y la aceptación de negocio requieren evidencia separada y los permisos del equipo.

## Referencias

- [Worktree de Git](https://git-scm.com/docs/git-worktree)
- [Copia dispersa de Git](https://git-scm.com/docs/git-sparse-checkout)
- [Clonación de Git](https://git-scm.com/docs/git-clone)
