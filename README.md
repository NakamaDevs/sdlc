# NakamaDevs SDLC

This repository provides SDLC guidance for people and AI agents.

Este repositorio contiene guías del SDLC para personas y agentes de IA.

## Choose a language / Seleccione un idioma

- [English](en/README.md)
- [Español](es/README.md)

## New teams / Equipos nuevos

Start with the [English adoption path](en/TEAM-START.md) or [la ruta en español](es/TEAM-START.md). Generate a separate private root with the Python starter, then follow the role-based course.

Empiece con la ruta de adopción. Genere una raíz privada separada con la plantilla Python y siga el curso por rol.

## Repository structure / Estructura del repositorio

| Path | Purpose / Propósito |
|---|---|
| `en/` | Maintained English guides. / Guías mantenidas en inglés. |
| `es/` | Maintained Spanish guides. / Guías mantenidas en español. |
| `references/` | Shared source snapshots. / Instantáneas compartidas de fuentes. |
| `lib/sdlc/reader/` | Local reader and HTML-to-Markdown library. / Lector local y biblioteca HTML a Markdown. |
| `scripts/` | Repeatable document and security checks. / Checks repetibles de documentación y seguridad. |
| `test/` | Reader tests and local fixtures. / Tests del lector y fixtures locales. |
| `.agents/skills/` | Repository workflows for agents. / Workflows del repositorio para agentes. |
| `AGENTS.md` | Repository agent map and delivery rules. / Mapa de agentes y reglas de entrega. |

The English and Spanish indexes list the same maintained guides in the same order.

Los índices en inglés y español enumeran las mismas guías mantenidas en el mismo orden.

Source snapshots stay in their original language. They are evidence copies, not maintained translations.

Las instantáneas de fuentes conservan su idioma original. Son copias de evidencia, no traducciones mantenidas.

See [English update rules](en/UPDATE.md) or [las reglas de actualización en español](es/UPDATE.md).

## Public Gist mirrors / Espejos públicos en Gist

The repository is canonical. These public Gists are generated reading editions.

El repositorio es canónico. Estos Gists públicos son ediciones generadas para lectura.

- [English / Inglés — `sldc-en`](https://gist.github.com/2ee0c10e6cb95231fd252d15ebfc8bbb)
- [Español / Spanish — `sldc-es`](https://gist.github.com/048bf4208a4ede278917c6a93c3e7ac6)

## Local documentation and review with Bunko

Bunko is the single application dependency for the docs site, code reviewer,
and annotations. `bunko.lock.json` pins the private release and its SHA256;
`scripts/bunko.py` verifies and caches it. Application code is not vendored here.

Use Python 3.12 or newer, Git, Node.js 24, npm, uv, and an authenticated GitHub
CLI with read access to `NakamaDevs/Bunko`. Then run:

```sh
python3 scripts/bunko.py doctor
python3 scripts/bunko.py setup
python3 scripts/bunko.py start
python3 scripts/bunko.py status
python3 scripts/bunko.py build
python3 scripts/bunko.py stop
```

The equivalent mise tasks are `workspace:check`, `workspace:setup`,
`workspace:start`, `workspace:status`, `docs:build`, and `workspace:stop`.
Start prints the docs and reviewer URLs. Ports and hostnames are isolated per
checkout. Runtime files live in `_build/bunko`; notes remain separately in
`_build/state/notes.duckdb`. Stop this workspace before changing its release pin.
Keep the notes database when removing runtime files.

`workspace.json` declares the repositories and documentation roots. Repository
paths are relative to that file. To review manually managed checkouts, copy it
to the ignored `workspace.local.json`, add their paths to `repositories`, and
add documentation roots to `documentation`. They do not need to be registered
in Meta. Bunko does not clone, pull, push, or switch their branches.

```sh
python3 scripts/bunko.py start --config workspace.local.json
python3 scripts/bunko.py stop --config workspace.local.json
```

A local config has a separate runtime identity; stop it with the same config.
For another repository, copy the reviewed bootstrap, release pin, and a minimal
workspace configuration. To upgrade, replace the pin with the new release's
verified pin; do not edit the cached installation. Restore the previous pin to
roll back. Optional Tidewave runs with `start --dev-tools`.
