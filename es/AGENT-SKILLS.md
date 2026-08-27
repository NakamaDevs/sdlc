# AGENT-SKILLS

Guía complementaria extraída del documento SDLC.

Este archivo define la evidencia de investigación, la estructura de Agent Skills,
su distribución, sus versiones y su confianza.

## Práctica de investigación

La investigación debe responder una pregunta definida.

Cada registro de investigación debe incluir:

- pregunta;
- fuente;
- fecha de la fuente;
- hallazgo;
- limitación;
- decisión local;
- especificación afectada;
- característica afectada;
- trabajo de seguimiento.

Prefiera fuentes primarias y autoritativas.

Separe los hechos externos de las decisiones locales.

No convierta un resumen de una fuente en un requisito de producto sin una
decisión documentada.

## Práctica de Agent Skills

Use el formato Agent Skills para capacidades reutilizables de agentes.

Una skill debe contener:

```text
skill-name/
├── SKILL.md
├── scripts/
├── references/
├── assets/
└── examples/
```

Solo `SKILL.md` es obligatorio.

Use divulgación progresiva:

1. Descubra la skill por su nombre y descripción.
2. Actívela si la tarea coincide.
3. Lea los archivos de apoyo solo cuando sean necesarios.
4. Ejecute el flujo documentado.

Cree una nueva skill compartida solo cuando:

- el flujo se repita entre proyectos;
- el flujo tenga entradas y salidas estables;
- el flujo tenga reglas claras de seguridad;
- el flujo tenga evidencia de validación;
- una skill existente no cubra la necesidad.

Antes de crear una nueva skill:

- busque en el repositorio de skills del equipo;
- busque en el ecosistema de Agent Skills;
- inspeccione las skills relacionadas existentes;
- registre las decisiones de reutilización, adaptación y reemplazo.

Las fuentes útiles incluyen:

- [Agent Skills](https://agentskills.io/home)
- [Vercel skills](https://github.com/vercel-labs/skills)
- [skills.sh](https://www.skills.sh/)
- [skill ASD-STE100](https://github.com/danyuchn/asd-ste100-skill)

Mantenga las skills compartidas neutrales al proyecto.

Mantenga las reglas específicas del proyecto en el repositorio del proyecto.

### Distribución de skills y controles de cadena de suministro

Use `npx skills` o un instalador equivalente solo desde una fuente revisada.
Inspeccione el repositorio, `SKILL.md`, scripts, references, assets, metadatos
de paquete, hooks de instalación y archivos generados antes de activarlo.

Use skills de proyecto si el flujo es parte del contrato del repositorio y debe
revisarse con el código. Use skills de usuario para preferencias personales de
bajo riesgo que deban funcionar entre repositorios. Use plugins de organización
o un paquete privado de skills si la organización es dueña del flujo, necesita
actualizaciones compartidas o permisos controlados para herramientas.

Prefiera una referencia de fuente versionada, un commit o tag inmutable, un
checksum o registro de bloqueo, una licencia revisada y una instalación
reproducible. Registre la URL de fuente, la revisión, los nombres de skills
seleccionadas, el alcance de instalación, los agentes destino, el responsable
de revisión y la política de actualización. No instale un repositorio completo
si una skill es suficiente.

Mantenga mínimos los scripts ejecutables. Inspecciónelos antes de ejecutarlos.
Prefiera scripts locales con runtimes fijados. No permita que una skill descargue
código arbitrario, lea archivos no relacionados, acceda a sistemas de producción
ni envíe código fuente y logs a un servicio alojado sin una decisión explícita de
confianza.

`npx skills add` admite instalación de proyecto y global, skills seleccionadas,
selección de agentes, rutas locales, fuentes Git y URL directas. `npx skills use`
puede usar una skill sin instalarla. Use estos modos deliberadamente y registre
la elección.

Use la fuente aprobada de skills de la organización para paquetes compartidos
revisados. Mantenga las skills específicas
del repositorio en el repositorio. Use un registro de bloqueo de skills o un
manifiesto equivalente para revisiones exactas. Revise las actualizaciones como
código y ejecute tests de cada skill antes de promoverla.

## Referencias

- [Especificación y formato de Agent Skills](https://agentskills.io/home)
- [CLI npx skills](https://github.com/vercel-labs/skills)
