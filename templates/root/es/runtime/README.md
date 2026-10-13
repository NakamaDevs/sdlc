# Contrato de integración del entorno

Esta plantilla no inicia AppHost. Implemente el grafo para los lenguajes reales y la versión aprobada de Aspire.
Mantenga la orquestación en esta raíz y vincule recursos con rutas explícitas de repositorios hijos.

## Registro de instancia

Antes de iniciar cada instancia de escritura, registre responsable, tarea, perfil, rutas, ramas y commits.
Asigne espacios únicos para rutas, base, colas, procesos, planificador, caché, archivos, registros y artefactos.
Guarde conexiones locales en configuración ignorada. Verifique identidad desde la aplicación antes de modificar datos.

## Perfiles y tareas

Defina perfiles docs, frontend-mock, backend-contract, integrated-local y release-check según necesidad.
Conserve el perfil predeterminado. Exija selección explícita para un entorno menor.
Implemente tareas con nombre para inicio, estado, registros, reinicio de recurso, pruebas limitadas, integración y parada en mise.
Documente directorio, efectos, disponibilidad y responsable de limpieza. La plantilla todavía no define esas tareas de aplicación.

## Ejercicio de aceptación

Inicie un servicio y dependencia, descubra su destino, ejecute una petición, inspeccione registros, reinicie el recurso y deténgalo.
Después ejecute dos instancias. Use registros sintéticos y trabajos de cola distintos para demostrar separación.
Detenga una y verifique que la otra funciona. Conserve datos al reiniciar. Restablezca datos solo con una tarea explícita separada.
Bloquee correo, pagos, impuestos, escrituras en nube y otros efectos externos reales durante el ejercicio.
Declare plataformas y telemetría no verificadas. Un puerto distinto no demuestra aislamiento.
