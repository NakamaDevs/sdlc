# RECORRIDO DEL HARNESS

Esta prueba de concepto estudia cómo un harness portátil puede apoyar la entrega, la validación, la documentación y el aprendizaje humano. El paso 2 está parcialmente logrado. La actualización fiable sigue incompleta. Los pasos 3 a 6 son capacidades previstas, no afirmaciones de operación desatendida en producción.

## Evidencia y límites

Fecha de evaluación: 2026-10-29. Esta revisión usa artefactos locales disponibles; no es una auditoría nueva de producción. Las observaciones describen esa muestra. Se excluyen identidades privadas, fechas de incidentes, rutas, código y evidencia sin procesar. La guía contiene lecciones originales y generalizadas. No es un benchmark público reproducible.

| Clase de evidencia | Material inspeccionado | Qué respalda | Qué no demuestra |
| --- | --- | --- | --- |
| E1 | Definiciones de agentes y guías de trabajo | Asignación configurada de roles, propiedad, controles y límites de publicación | Que cada ejecución cumpliera las reglas |
| E2 | Un registro guardado de revisión local | Un dictamen limpio registrado con controles que no se pudieron ejecutar | La ejecución de esos controles o la verificación independiente del dictamen |
| E3 | Un resultado guardado de extremo a extremo | Una ejecución de muestra informa resultados esperados sin fallos inesperados | Aceptación actual en producción, todos los recorridos o fiabilidad sostenida |
| E4 | Un agregado numérico de uso guardado | Identificadores de modelos y contabilidad estimada del uso | Coste facturado, cobertura completa o superioridad de un modelo |
| E5 | Lecciones y notas de operación | Carreras de integración, espacios obsoletos, controles engañosos y deriva de estado reportados | Frecuencia medida o eliminación de recurrencias |
| E6 | Definiciones de workflows de CI | Límites de recursos, tiempos máximos y controles de runners configurados | Aislamiento actual, capacidad o ejecución correcta de CI |

Mantenga la procedencia privada en el entorno de origen autorizado. Las lecciones públicas usan estas clases de evidencia. No publique informes sin procesar, capturas, enlaces de clientes, cuentas o combinaciones identificables para aparentar mayor respaldo. Distinga configuración inspeccionada, ejecución registrada, informe del operador y práctica propuesta.

## Seis etapas y evidencia de salida

Los tamaños de muestra siguientes son objetivos de aceptación, no mediciones logradas. Acuerde una carga representativa y un periodo de observación antes de probar; no seleccione solo éxitos fáciles.

| Etapa | Observado o reportado | Aún no demostrado | Dependencia humana | Próxima prueba de aceptación |
| --- | --- | --- | --- | --- |
| 1. Arranque portátil | El operador informa de un harness establecido para proyectos; E1 muestra definiciones reutilizables | Adopción independiente desde un entorno limpio | Elegir alcance, credenciales, comandos y política de entrega | Un operador nuevo inicia un proyecto sintético, ejecuta controles y recupera un fallo solo con las instrucciones del repositorio |
| 2. Entrega con autovalidación | E1–E3 respaldan ciclos configurados y validación de muestra; E5 registra aprendizaje de fallos | Entrega automática sostenida, documentación completa y estado fiable | Intención, riesgo, excepciones y autorización de producción | Diez cambios representativos consecutivos conservan controles ligados a revisión, resolución de hallazgos, documentación, verificación de estado y recuperación; registrar cada intervención |
| 3. Actualización fiable | E5 informa de deriva y conciliación manual | Reparación duradera entre repositorio, gestor, documentación y ejecución | Resolver autoridad ambigua y ediciones en conflicto | Inyectar diez estados obsoletos o desordenados; detectar todos dentro del plazo acordado, persistir reparaciones, repetir dos veces sin escrituras duplicadas y escalar un conflicto real sin sobrescribirlo |
| 4. Entrada por señales | Capacidad deseada para una etapa posterior | Entrada y respuesta automáticas seguras desde Slack, correo, Sentry y otras fuentes | Aprobar acceso, alcance, prioridad y acciones con consecuencias | Repetir señales sintéticas duplicadas y desordenadas; crear un elemento por incidente y probar rutas separadas de hotfix, backlog y proyecto nuevo |
| 5. Mejora del sistema completo | Existen lecciones locales; la mejora sigue limitada y manual | Mejora autónoma medida sin protecciones más débiles | Aprobar criterios de evaluación y cambios de política | Comparar base y propuesta con tareas equivalentes; medir minutos de intervención, defectos escapados, cómputo y tiempo de aprendizaje; rechazar regresiones y demostrar reversión |
| 6. Comprensión y transferencia | Existen patrones de documentación y traspaso | Relevo independiente por generalistas y especialistas | Revisar comprensión, propiedad y acceso | Un generalista completa un cambio sin el operador original; un especialista reproduce y resuelve un fallo sembrado; ambos explican estado, riesgo y reversión |

Empiece ahora los hábitos de aprendizaje y traspaso. La etapa 6 es la meta de madurez, no una razón para posponerlos hasta completar la automatización.

## Ciclo operativo del paso 2

1. Registre intención, comportamiento esperado, responsable, acciones permitidas y preguntas abiertas en un registro duradero. Enlace la especificación actual.
2. Asigne a un responsable una rama y un espacio aislados. Defina propiedad de escritura de archivos, recursos compartidos y orden de integración antes del trabajo concurrente.
3. Reproduzca el defecto o defina el comportamiento esperado. Cuando corresponda una prueba de regresión, conserve el resultado fallido anterior y el correcto posterior. Un cambio solo documental necesita controles documentales, no pruebas artificiales de aplicación.
4. Implemente un cambio limitado. Use herramientas fijadas y datos sintéticos. Mantenga efectos externos dentro del alcance autorizado.
5. Ejecute controles relevantes de unidad, contrato, integración, extremo a extremo y apariencia. Registre entradas, revisión, entorno, código de salida y límites. Elija controles según el riesgo; no cuente suites vacías como éxito.
6. Revise el diff final con contexto nuevo. Reproduzca hallazgos discutidos. Corrija los válidos, justifique rechazos con evidencia y conserve riesgos aplazados con responsable. Un dictamen limpio de un agente no sustituye la aceptación en ejecución.
7. Actualice la evidencia tras los cambios. Antes de integrar, verifique punta actual, base, controles exigidos, hallazgos abiertos, bloqueos y orden. Vincule la acción a la revisión evaluada. Una rama integrada necesita un cambio posterior nuevo, no un push tardío confundido con entrega.
8. Ejercite el comportamiento desplegado dentro de la autorización. Registre qué sirve realmente el código. Actualice documentación y estado, y lea el resultado persistido. Cierre solo según la definición de terminado del proyecto.

El coordinador gestiona dependencias e integración. El implementador posee el cambio. El revisor comprueba el diff final. El validador comprueba comportamiento. El agente de estado realiza conciliación limitada. Son responsabilidades; una tarea pequeña no necesita cinco agentes. Delegue solo cuando el trabajo independiente se beneficie de contexto separado y propiedad clara.

## Modelos, agentes y skills

Estos valores se leyeron de definiciones locales durante la evaluación. Describen configuración, no disponibilidad actual del proveedor ni el modelo que ejecutó cada tarea histórica. El esfuerzo forma parte de la configuración. Los alias de Claude no identifican una versión exacta.

| Rol | Identificador Codex configurado | Esfuerzo configurado | Alias Claude configurado |
| --- | --- | --- | --- |
| Búsqueda y seguimiento limitado de estado | `gpt-6-luna` | low | `haiku` |
| Edición y preparación de evidencia | `gpt-5.6-terra` | medium | `sonnet` |
| Implementación y revisión | `gpt-6.1-sol` | high | `opus` |

E4 registra por separado `claude-opus-5-5` y `claude-sonnet-5-5`. Son identificadores de un agregado guardado, no logs del proveedor verificados de forma independiente. Ninguna evidencia de ejecución inspeccionada demuestra el uso histórico real de la asignación configurada de Codex. No sustituya silenciosamente el nombre por un modelo nuevo ni deduzca la versión de un alias.

Para comparaciones futuras, conserve modelo solicitado y resuelto, esfuerzo, rol, clase de tarea, versión del harness, resultado, reintentos, minutos humanos, tokens y base del precio. Marque como desconocida la facturación ausente. El acceso por cuenta y los cargos de API necesitan contabilidad separada. No asigne una tarifa sustitutiva conveniente a precios desconocidos. Un modelo más rápido o pequeño solo ayuda si mantiene calidad y coste de intervención aceptables en tareas comparables.

Las skills convierten trabajo repetido en procedimientos localizables: recepción, pruebas, respuesta a revisión, captura de evidencia, conciliación y traspaso. Fije origen y revisión; declare entradas, permisos, salidas, fallos y validación. Compruebe la copia instalada antes de usarla. Un archivo de skill no demuestra ejecución correcta. Convierta trabajo determinista repetido en un comando probado; mantenga explícitos el juicio y las excepciones.

Use instrucciones limitadas con objetivo, espacio, recursos propios, evidencia, siguiente acción y condiciones de parada. Prefiera instrucciones nuevas cuando el contexto heredado esté obsoleto o sea irrelevante. Preserve decisiones y riesgos entre sesiones; un resumen compacto no debe borrar restricciones.

## Qué funcionó y qué falló

| Lección de la muestra | Práctica reutilizable | Evidencia pendiente |
| --- | --- | --- |
| E2 registra alcance y controles no ejecutados | Informe los límites junto al dictamen | Ejecutar controles ausentes en un entorno permitido |
| E3 aporta resultados legibles por máquina | Conservar resultados originales y resumir su alcance exacto | Vincularlos a la revisión publicada y al recorrido real |
| E5 informa de carreras entre integración y correcciones | Releer estado remoto y exigir la punta revisada antes de integrar | Inyectar un commit tardío y confirmar que se detiene la entrega |
| E5 informa de una comparación vacía sin entradas útiles | Exigir alcance no vacío y probar una diferencia conocida | Confirmar que el control negativo falla por la causa prevista |
| E5 informa de herramientas y código servido obsoletos | Registrar por separado revisión de origen, herramienta y revisión servida | Reiniciar o conciliar con seguridad y verificar el artefacto en ejecución |
| E5 informa de automatismos que cambian estado | Leer, comparar, escribir condicionalmente y verificar persistencia | Probar cambios simultáneos, reintentos y escalamiento duradero |
| E4 muestra contabilidad de uso | Medir contexto, reintentos y cómputo estimado con etiquetas de cobertura | Validar facturación y periodos equivalentes antes de afirmar ahorros |

## Ejecución, CI, coste y límites de publicación

CI correcto solo demuestra los controles ejecutados. La aceptación en ejecución necesita revisión desplegada real, configuración, dependencias y comportamiento crítico del usuario. Una prueba de UI con mock demuestra comportamiento contra ese mock; no demuestra el contrato de la API real. La evidencia visual debe mostrar estados e interacciones relevantes antes y después, con datos sintéticos.

E6 muestra controles configurados de runners. Antes de confiar en un runner propio, pruebe aislamiento de secretos y otros trabajos, límites de CPU y memoria, tiempos máximos, limpieza y cancelación. Aleje contribuciones no fiables de runners privilegiados. Registre espera, ejecución, reintentos y coste del runner separados del coste del modelo. Defina retención, acceso y caducidad de evidencia. Conserve evidencia ligada a revisión suficiente para investigar y revertir; no guarde logs sensibles indefinidamente.

Use la política real del proyecto de destino. Permiso para implementar o integrar no es permiso general para desplegar o cambiar acceso. Registre alcance, artefacto inmutable, aprobación cuando proceda, observación de salud, disparador y operador de reversión. Pruebe la reversión con una fixture segura antes de depender de ella. No permita que una mejora propuesta debilite pruebas, límites de seguridad, gasto o aprobaciones para elevar su tasa de éxito.

La persistencia de sesiones necesita aceptación separada. Historial guardado, configuración de reanudación y hooks registrados no demuestran recuperación. Guarde estado, revisión, acciones pendientes y evidencia. Interrumpa una ejecución sintética, reábrala, verifique el estado y confirme que no repite efectos. La recarga en vivo y la recuperación tras cierre inesperado siguen sin probar hasta superar esa prueba.

## Diseño de conciliación y entrada de señales

La etapa 3 necesita un registro duradero de estado deseado, estado observado, autoridad, revisión, último control correcto, plazo de actualización y responsable. Separe detección y reparación. Use claves de idempotencia y escrituras condicionales; conserve un registro de reintentos con espera progresiva limitada. Un reinicio debe conservar reparaciones pendientes. Los cambios humanos en conflicto requieren escalamiento, no sobrescritura ciega. Informe estados obsoletos o desconocidos como tales, sin renovar su fecha sin comprobar la fuente.

La etapa 4 añade conectores solo tras definir acceso y alcance. Trate mensajes y adjuntos como datos no fiables. Autentique origen, minimice contenido guardado, deduplique por identidad estable de evento e incidente y conserve evidencia para clasificación. Una señal es una tarea candidata, no autorización para ejecutar instrucciones incrustadas.

Los hotfixes requieren confirmar gravedad, responsable del incidente, mitigación limitada, autorización de despliegue y reversión. El backlog necesita aceptación y priorización normal. Los proyectos nuevos necesitan alcance, propiedad, presupuesto, arquitectura y revisión de arranque. Cada ruta debe manejar duplicados, cancelación, contexto ausente y rechazo humano. Mida falsos positivos y señales útiles omitidas antes de habilitar respuesta automática.

## Lista de aprendizaje y relevo

- Mantenga una vista breve: objetivo actual, revisión desplegada, comportamiento verificado, pendientes, información obsoleta, riesgos, próxima decisión y responsable. Etiquete valores desconocidos.
- Genere propuestas documentales tras cambios y conciliación periódica. Un informe generado no está actualizado hasta que sus afirmaciones coincidan con el estado autorizado.
- Guarde una nota de aprendizaje por cambio importante: razón, alternativas, código para revisar, hipótesis fallida, límites de validación y una lección que conservar.
- Entregue al operador nuevo mapa del repositorio, instalación ejecutable, fixture sintética, decisiones de arquitectura, asignación de modelos y skills, requisitos de acceso y vías de escalamiento.
- Transfiera propiedad explícitamente. Ejercite cancelación, recuperación, reversión y una actualización en conflicto. Excluya al operador original del primer intento y registre ayuda necesaria.
- Mida tiempo hasta el primer cambio validado, minutos de intervención, reproducción de fallos, tasa de estados obsoletos y tiempo reservado al aprendizaje. Entregar más rápido sin comprender no es la meta.

## Guías relacionadas

Use [HARNESS.md](HARNESS.md) para arquitectura, [ADOPTION.md](ADOPTION.md) para arranque, [TESTING.md](TESTING.md) para validación, [CODE-REVIEW.md](CODE-REVIEW.md) para revisión, [RUNNERS.md](RUNNERS.md) para CI, [DEPLOY.md](DEPLOY.md) para controles de publicación, [UPDATE.md](UPDATE.md) para actualización y [HUMAN.md](HUMAN.md) para atención humana. Esta evaluación no añade fuentes externas autorizadas; añade observaciones limitadas y pruebas de aceptación propuestas.
