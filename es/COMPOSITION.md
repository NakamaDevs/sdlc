# COMPOSITION

Este es un modelo operativo de ejemplo para un equipo. No es una política empresarial obligatoria.
Bifurque o copie la plantilla genérica y adáptela al trabajo real.
Mantenga las herramientas Python de referencia independientes de los lenguajes de las aplicaciones.

## Separar las capas

| Capa | Ubicación en la raíz generada | Autoridad |
| --- | --- | --- |
| Principios comunes | Guías SDLC referenciadas | Orientación reutilizable elegida por el equipo |
| Decisiones del equipo | policies/team.md | Responsables del equipo |
| Selección de herramientas | adapters/README.md | Implementación y configuración local aprobadas |
| Hechos del repositorio | docs/repositories/ | Código verificado e instrucciones hijas |
| Alcance de tarea | docs/work/ | Resultado aceptado y permisos explícitos |
| Estado local | Estado ignorado y configuración local | Una máquina o instancia |

Resuelva conflictos explícitamente. Registre regla existente, propuesta, motivo, responsable y evidencia de aceptación.
Conserve la autoridad de cada repositorio en su alcance. Una plantilla no reemplaza normas empresariales o del proyecto original.
Al cambiar una regla, actualice su archivo principal y referencias. Evite copias que compitan.

## Opciones por capacidad

| Capacidad | Opción de ejemplo | Alternativas válidas |
| --- | --- | --- |
| Gestión de tareas | Registro Markdown local | GitHub Issues, GitLab, Linear u otro gestor |
| Alojamiento del código | Git con remoto verificado | GitHub, GitLab, Git propio o sin conexión |
| Ejecución de tareas | Adaptador de comandos Python | mise, scripts existentes, ejecutor aprobado |
| Terminal persistente | Shell existente | Herdr, tmux, Zellij, espacio remoto administrado |
| Acceso privado | SSH mediante red privada aprobada | Tailscale, WireGuard, VPN empresarial, bastión controlado |
| Orquestación | Comandos explícitos de proceso | Aspire, contenedores, supervisor existente |
| Infraestructura | Entorno sintético local | AWS, Azure, GCP, nube privada, servidores físicos |
| Documentación | Markdown | Zensical, Bunko con acceso, otro lector local |
| Revisión | Git diff y revisión independiente | Bunko Review u otro visor aprobado |
| Agentes | Instrucciones portátiles de rol | Codex, Claude Code u otro entorno aprobado |

Cada adaptador declara entradas, salidas, permisos, versión, efectos, errores y comando de validación.
Un adaptador opcional ausente no impide leer documentos. Una capacidad requerida ausente permanece como limitación visible.
Ningún ejemplo instala automáticamente cuentas, conexiones, políticas VPN ni configuración nativa de agentes.

## Personalizar mediante descubrimiento

1. Registre el flujo actual con cada rol. Identifique lo que funciona y lo que causa demora o riesgo.
2. Relacione sistemas existentes con la tabla. Conserve herramientas útiles salvo evidencia que justifique sustituirlas.
3. Compare estado actual y propuesto. Incluya migración, acceso, costos y reversibilidad.
4. Los responsables eligen el piloto mínimo. Registre diferencias aceptadas en la política del equipo.
5. Implemente un adaptador y pruebe éxito, error, cancelación y acceso denegado.
6. Complete un ejercicio con una persona nueva. Compare resultados reales con el flujo anterior.
7. Adopte, ajuste o retire el cambio. Conserve instrucciones de reversión y actualice la incorporación.

## Decisiones por completar

Seleccione identificadores, nombres de ramas, revisión, retención de evidencia, notificaciones, autoridad de entrega y horarios.
Nombre quién aprueba reglas de negocio, credenciales, mensajes externos, llamadas de pago y cambios productivos.
Seleccione ubicación de habilidades y responsables de actualización. Registre modelos como una decisión de capacidad local.
Use [AGENT-TEAM.md](AGENT-TEAM.md) para roles y [REMOTE-ACCESS.md](REMOTE-ACCESS.md) para límites remotos.

## Tarea de ejemplo

El directorio generado de políticas contiene una plantilla independiente del gestor.
Úsela como descripción de GitHub, entrada de otro gestor o registro local.
Conserve resultado, responsable, alcance, escenarios, evidencia y riesgo con cualquier gestor.
No copie identificadores de ejemplo como tareas reales ni declare pruebas no ejecutadas como exitosas.

## Dirección de implementación

Python es la implementación de referencia de la plantilla nueva y herramientas locales de evidencia.
El lector y la validación SDLC existentes usan Elixir. Consérvelos durante la adopción incremental.
Bunko también incluye dependencias de navegador y orquestación. Un envoltorio Python no elimina esas dependencias.
Los adaptadores futuros en Elixir, TypeScript, Go, Swift o Dart deben cumplir el mismo contrato y ejercicios.
No mantenga varias implementaciones hasta que un consumidor real las necesite.
