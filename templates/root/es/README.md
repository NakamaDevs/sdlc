# Espacio raíz del equipo

Este repositorio privado coordina contexto y herramientas locales para repositorios de aplicaciones separados.
No contiene código de aplicaciones. Seleccione nombre, responsables, límites de acceso y remoto antes de publicar.

## Inicio

Use Python 3.12 o posterior. Revise los scripts y seleccione una versión exacta aprobada en mise antes de adoptar.

```sh
python3 scripts/workspace.py check
python3 scripts/workspace.py context
```

Estos comandos validan la plantilla e imprimen rutas de contexto. No clonan, inician ni validan aplicaciones.
Las tareas equivalentes de mise son `workspace:check` y `workspace:context`.

## Conectar un repositorio

Clone manualmente un repositorio autorizado bajo `repos/`. Verifique remoto, revisión e instrucciones.
Añada una entrada a `workspace.json`:

```json
{"name":"api","path":"repos/api","owner":"API team"}
```

Conserve la lista `repositories` y la versión del esquema. Este formato es de la plantilla, no de Bunko o Meta.
Repita la comprobación. Cree su página de incorporación con [la plantilla del sistema](docs/system.md).
Conserve la autoridad de las instrucciones originales. Guarde aquí descubrimiento y contexto entre repositorios.

## Aprender y operar

Empiece con [incorporación](docs/onboarding.md), [instrucciones del agente](AGENTS.md) y [entorno local](runtime/README.md).
Use el [curso genérico SDLC](https://github.com/NakamaDevs/sdlc/blob/main/es/COURSE.md) y la [guía de espacios](https://github.com/NakamaDevs/sdlc/blob/main/es/WORKSPACES.md).

Markdown es el lector predeterminado. Bunko, Aspire, Meta, Codex y Claude son adaptadores opcionales.
No se requiere versión privada, política empresarial, cuenta organizacional ni llamada de pago para inspeccionar la plantilla.
Implemente y valide tareas de inicio y pruebas específicas antes de declarar ejecutable el entorno del producto.

Use [las instrucciones iniciales](agents/bootstrap.md) con Codex o Claude. Adapte [la política](policies/team.md) y [los adaptadores](adapters/README.md) antes de implementar.
