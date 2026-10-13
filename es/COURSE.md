# COURSE

Este curso enseña un ciclo completo de entrega. Use una aplicación sintética de citas para los ejercicios comunes.
Una persona selecciona horario, envía la solicitud y ve confirmación. Un horario ocupado produce un conflicto.
El ejemplo no incluye pagos, envío de mensajes, acceso productivo ni datos personales.

## Uso del curso

Complete la ruta común antes de la práctica de rol. Cada lección produce evidencia, no solo lectura.
Un facilitador u otra persona revisa el criterio de salida. Registre limitaciones en la raíz privada.
Use [TEAM-START.md](TEAM-START.md), [AGENT-TEAM.md](AGENT-TEAM.md) y [WORKSPACES.md](WORKSPACES.md) como referencias prácticas.

## Ruta común

| Lección | Ejercicio | Evidencia y criterio de salida |
| --- | --- | --- |
| 1. Producto y dominio | Describir recorrido, actores, cambios de estado y regla de conflicto | Otra persona explica éxito y error sin leer código |
| 2. Descubrir el sistema | Seguir la pantalla hasta API, almacenamiento, procesos y límites externos | El mapa registra revisiones, responsables, comandos e incógnitas |
| 3. Preparar contexto | Escribir un mapa raíz corto y una página de incorporación | Un agente nuevo encuentra la prueba correcta sin suponer |
| 4. Especificar un cambio pequeño | Añadir cancelación antes del inicio de una cita | PM define la regla temporal; escenarios cubren éxito, rechazo y repetición |
| 5. Trabajar con simulaciones | Modelar respuesta de cancelación y conflicto | Pasa la prueba UI; falla la ruta desconocida; datos identifican su esquema |
| 6. Validar el proveedor | Implementar o inspeccionar cancelación con datos sintéticos aislados | Las pruebas coinciden con el contrato y cubren concurrencia o repetición |
| 7. Integrar y revisar | Ejecutar el recorrido real local e inspeccionar cambios finales | La evidencia identifica ambas revisiones y reproduce hallazgos relevantes |
| 8. Entregar y transferir | Preparar registros de entrega y reversión sin desplegar | Un lector distingue pruebas, autorización, despliegue y aceptación |

Si no hay aplicación de ejemplo, las lecciones 1 a 4 son ejercicios documentales.
Las lecciones 5 a 7 requieren una aplicación local aprobada o implementación separada de prueba.
No apruebe esas prácticas solo con escenarios escritos. Registre el entorno ejecutable pendiente.

## Prácticas por rol

| Rol | Asignación independiente | Transferencia requerida |
| --- | --- | --- |
| PM o producto | Resolver ambigüedad temporal y priorizar un cambio pequeño | Decisión, exclusiones, escenarios medibles y responsable de aceptación |
| QA | Probar límites temporales, rechazo y reintentos | Plan basado en riesgos, error reproducible, entorno y artefactos |
| Frontend | Mostrar espera, éxito, conflicto y error con la simulación acordada | Catálogo de estados, evidencia visual, accesibilidad y conexión real pendiente |
| Backend | Aplicar semántica de cancelación y repetición | Pruebas de contrato, invariantes, consumidores e implicaciones de migración |
| DevOps o plataforma | Ejecutar dos instancias aisladas y detener una | Identidad verificada, disponibilidad, aislamiento y recuperación |
| Diseño o UX | Comparar recorrido previsto con estados implementados | Inventario de estados, accesibilidad y decisiones pendientes |
| Investigación o arquitectura | Comparar dos formas de aislar estado | Fuentes primarias, ventajas, experimento, incertidumbre y propuesta |
| Seguridad o datos | Seguir datos sensibles y efectos externos | Límites de acceso, datos sintéticos, ocultación y retención |

La persona puede usar un agente, pero debe explicar evidencia y riesgo restante.
Un agente no aprueba una regla, entrega o acceso en nombre de un responsable sin identificar.

## Ejercicio de incorporación por repositorio

Cree una página por repositorio en la raíz. Manténgala junto al mapa entre repositorios.
Incluya propósito, términos, responsable, revisión, entradas, dependencias, entornos y comandos exactos de verificación.
Explique una petición completa, un error común y un procedimiento de recuperación.
Enlace la documentación hija existente en lugar de copiarla.

Añada tres ejercicios: localizar comportamiento, ejecutar una prueba limitada y diagnosticar un error local preparado.
Cada ejercicio indica requisitos, alcance seguro, evidencia esperada y criterios de finalización.
Marque áreas inaccesibles como desconocidas. Pida al responsable que valide afirmaciones de negocio y operación.
Pida a una persona nueva que repita los ejercicios. Actualice según la confusión observada, no la cobertura supuesta.

## Ejercicio de incorporación de agentes

Entregue a un agente nuevo la guía raíz, página del repositorio e instrucciones completas de una tarea.
Pídale identificar rutas permitidas, escenarios, alcance de comandos, acceso pendiente y condiciones de parada.
Después asigne un rastreo de solo lectura del recorrido. Compare la respuesta con el mapa verificado.
Solo después de aprobarlo, permita una implementación limitada en un worktree aislado.
Un revisor separado evalúa los cambios finales. Registre hallazgos, soluciones y comportamiento no verificado.

## Simulación del equipo

Ejecute descubrimiento de investigación y QA de forma independiente. Acuerde el contrato antes de implementar.
Ejecute frontend y backend en paralelo solo con responsables y límites claros.
El coordinador integra ambas revisiones y pide a QA repetir el escenario contra el proveedor real.
Introduzca una incompatibilidad deliberada. La prueba de integración debe detectarla antes de declarar completa la función.
Registre una transferencia breve y permita continuar a una sesión nueva. Así prueba la documentación como parte del sistema.

## Mantener el curso

Registre revisiones de repositorio y contrato por práctica. Repita ejercicios afectados cuando cambien comandos o comportamiento.
Revise el curso después del piloto y de cambios importantes de arquitectura.
Retire páginas duplicadas e instrucciones obsoletas. Mantenga un responsable por página de incorporación.
Use tiempo de preparación, tareas independientes, defectos detectados y preguntas para elegir la próxima mejora.
