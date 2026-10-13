# TESTING

Esta guía define especificaciones, tests FIRST, capas de test, evidencia de UI y validación.

Use [WORKSPACES.md](WORKSPACES.md) para el flujo adaptable del equipo y los ejercicios de aceptación.

## `test.md`: especificación de test y validación

Defina la estrategia de test antes de implementar.

### Principios FIRST

Los tests deben ser:

- rápidos;
- independientes;
- repetibles;
- autovalidables;
- oportunos.

Un proyecto puede usar términos equivalentes.

Debe conservar estas propiedades.

### Capas de test

Seleccione sólo las capas adecuadas para el proyecto:

1. unit;
2. component;
3. integration;
4. contract;
5. API;
6. browser o UI;
7. end to end;
8. performance;
9. security;
10. accessibility;
11. validación exploratoria manual.

Use la capa más baja que dé confianza suficiente.

Use capas superiores cuando las capas inferiores no puedan probar el comportamiento.

### Plan de test obligatorio

Para cada comportamiento, registre:

- comportamiento;
- riesgo;
- capa de test;
- fixture o configuración;
- resultado RED esperado;
- comando RED exacto;
- límite de implementación;
- resultado GREEN esperado;
- comando GREEN exacto;
- protección de refactor;
- riesgo de capacidad de test sin resolver.

El equipo debe observar y registrar evidencia RED antes de implementar.

Si esto es imposible, registre:

`RED not yet evidenced.`

Explique por qué el equipo no pudo observar RED.

No infiera el historial de TDD desde un diff final.

Cada cambio de comportamiento debe tener un test automatizado del comportamiento.

Si la automatización es inviable, registre una excepción con:

- propietario;
- motivo;
- procedimiento manual;
- resultado esperado;
- vencimiento.

Agregue tests para estos comportamientos cuando correspondan:

- éxito;
- fallo;
- autorización;
- límite;
- regresión;
- seguridad.

### Validación local

Cada proyecto debe definir una ruta de validación local.

Debe incluir:

- herramientas requeridas;
- configuración de dependencias;
- tests enfocados;
- tests de componentes;
- tests de API;
- tests de contract;
- tests de integración;
- tests de UI, cuando correspondan;
- tests end-to-end, cuando correspondan;
- tests de seguridad, cuando correspondan;
- tests de accesibilidad, cuando correspondan;
- checks de calidad completos.

Otra persona o agente debe ejecutar esta ruta desde un checkout limpio.

Para cada paso de validación, registre:

- comando;
- entradas;
- resultado esperado;
- ruta de artefactos;
- plataformas compatibles.

## Trazabilidad de UI y computer-use

Use exploración de computer-use sólo cuando aporte valor.

Antes de convertir exploración manual en automatización, registre:

- ruta;
- viewport;
- paso;
- acción;
- selector o locator;
- estado esperado;
- estado observado;
- captura de pantalla o evidencia de fallo;
- test automatizado resultante.

Prefiera selectores basados en:

- roles;
- labels;
- texto visible;
- contratos de test explícitos.

No use coordenadas, clases CSS ni estructura DOM inestable como selectores principales.

Convierta flujos manuales estables en tests de UI automatizados.

Mantenga validación manual para el comportamiento que la automatización no pueda certificar.

Esto incluye comportamiento visual, de accesibilidad y de interacción.

## `workflow.md`: ciclo de vida de software con agentes

Defina cómo las personas y los agentes llevan trabajo desde una idea hasta la entrega.

### Grafo de trabajo estándar

```text
research
  -> specification
  -> design decision
  -> test plan
  -> RED evidence
  -> implementation
  -> GREEN evidence
  -> focused review
  -> quality checks
  -> project update
  -> human review
  -> merge or release
```

Un proyecto puede agregar o quitar etapas.

Debe conservar evidencia explícita entre etapas.

### Roles de agentes

Use sólo los roles que el proyecto necesita:

- coordinador;
- agente de investigación;
- agente de especificación;
- agente de arquitectura;
- agente de test;
- agente de implementación;
- agente de revisión;
- agente de validación;
- agente de release.

Cada agente debe tener:

- un objetivo;
- entradas definidas;
- salida definida;
- alcance limitado;
- archivos o sistemas permitidos;
- criterios de aceptación;
- requisitos de validación;
- estado de entrega;
- comportamiento ante bloqueos.

Los agentes no deben ampliar el alcance sin aviso.

Cree un elemento de trabajo separado para trabajo importante fuera de alcance.

### Reglas de delegación

Delegue trabajo cuando sea:

- independiente;
- limitado;
- revisable;
- útil en paralelo;
- asignado a un propietario claro.

No delegue trabajo acoplado que bloquee el progreso inmediato.

Use espacios de trabajo separados cuando:

- los agentes modifiquen archivos superpuestos;
- los branches dependan entre sí;
- los checks largos interfieran;
- el aislamiento reduzca el riesgo.

Use desarrollo basado en trunk cuando los cambios sean:

- pequeños;
- independientes;
- centrados en documentación;
- seguros de revisar juntos.

### Bucle de agente

Para cada elemento de trabajo:

1. Localice o cree el elemento de gestión del proyecto.
2. Enlácelo a un hito, iniciativa o meta del proyecto.
3. Lea instrucciones del proyecto y especificaciones relacionadas.
4. Investigue preguntas sin resolver.
5. Registre fuentes, hallazgos, límites y decisiones.
6. Actualice la especificación.
7. Defina el plan de test.
8. Escriba el test enfocado más pequeño.
9. Ejecute el test y registre evidencia RED.
10. Implemente el cambio de comportamiento más pequeño.
11. Ejecute el test enfocado y registre evidencia GREEN.
12. Ejecute tests cercanos.
13. Actualice la matriz de funciones.
14. Ejecute los checks de calidad requeridos.
15. Haga una revisión enfocada.
16. Actualice el elemento de gestión del proyecto.
17. Entregue evidencia completa o un bloqueo explícito.
