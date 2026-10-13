# Registro de descubrimiento del sistema

Estado: pendiente de descubrimiento. Sustituya cada incógnita con evidencia verificada o una pregunta asignada.

## Producto

Registre propósito, roles, términos, recorrido principal, reglas y responsable de aceptación.
Separe decisiones aprobadas de hipótesis. Añada revisión fuente y fecha de observación.

## Plantilla por repositorio

Cree una página por repositorio bajo docs/repositories/ con estos campos:

- Propósito, responsable, acceso, ruta, remoto, rama y commit.
- Entradas, recorrido de petición, datos, procesos, dependencias externas y consumidores.
- Instrucciones existentes y referencias de arquitectura.
- Comandos exactos de instalación, prueba limitada, integración, inicio, estado y parada con directorio.
- Nombres de configuración local requerida, nunca valores secretos.
- Datos sintéticos, errores conocidos, recuperación y afirmaciones no verificadas.
- Tres ejercicios: localizar comportamiento, ejecutar prueba y diagnosticar error local.
- Revisor, fecha de verificación y causa de próxima actualización.

## Decisiones y evidencia

Guarde decisiones bajo docs/decisions/ con problema, opciones, elección, responsable, fuente y causa de reconsideración.
Guarde evidencia bajo docs/work/ con revisiones, entorno, comando, resultado, artefacto, riesgo y próximo paso.
Conserve artefactos grandes o sensibles en artifacts/, ignorado por Git, con una política de retención aprobada.
