# PRIVACY

Esta guía define controles de privacidad para registros de entrega de software. No sustituye requisitos legales, contractuales, laborales ni clínicos.

## P: ¿Qué datos deben quedar fuera de los registros de entrega?

La información de identificación personal (PII) identifica a una persona o permite vincular datos con ella. La información de salud protegida (PHI) es información de salud identificable cubierta por una norma aplicable.

Trate los datos inciertos como restringidos hasta que el responsable de privacidad los clasifique.

No coloque PII ni PHI reales en:

- prompts, contexto de agentes, skills o entradas de evaluación de modelos;
- nombres de branch, mensajes de commit, tags, issues, pull requests o reviews;
- ejemplos, fixtures, snapshots, demos o documentación generada;
- logs, trazas, métricas, informes de fallos, capturas, grabaciones o terminales;
- changelogs, notas de release, paquetes, artefactos, Gists públicos o cachés.

Esta regla incluye nombres, emails personales, teléfonos, domicilios, identificadores oficiales, identificadores de cuenta, fechas personales exactas, imágenes, voz, biometría, condiciones de salud, atención, pagos, expedientes médicos, citas y recetas.

La disponibilidad pública no hace que la reutilización sea segura o autorizada. Mantenga los secretos bajo los controles separados de [SECURITY.md](SECURITY.md).

## P: ¿Qué datos pueden usar los ejemplos y tests?

Use datos sintéticos generados que no procedan de una persona real. Use dominios reservados como `example.com` y `example.test`. Use roles como `Person A` y registros opacos como `record-001`.

No copie datos de producción, soporte, candidatos, empleados, clientes, pacientes o pagos al entorno de desarrollo.

Sustituir un nombre no demuestra desidentificación. Fechas, ubicaciones, imágenes, voz, identificadores, texto libre y datasets vinculados pueden identificar a una persona en conjunto.

Un proceso de privacidad autorizado debe aprobar la desidentificación. Los datos de salud sujetos a HIPAA usan un método aplicable de HHS, como Expert Determination o Safe Harbor. No afirme cumplimiento por un análisis local.

## P: ¿Cuál es el workflow de datos mínimos?

Antes de procesar datos restringidos, registre:

- el propósito aprobado y los campos mínimos;
- el propietario de los datos y el responsable de privacidad;
- la base legal, contractual o de consentimiento;
- los sistemas, proveedores, regiones y destinatarios aprobados;
- los controles de acceso, cifrado, retención, eliminación y auditoría;
- el contacto del incidente y la condición de parada.

Dé a un agente sólo el contexto censurado mínimo que complete la tarea aprobada.

No envíe datos restringidos a un modelo, herramienta, conector o servicio externo sin aprobación explícita para ese proveedor y clase de datos.

## P: ¿Qué debe comprobar la automatización?

Analice fuentes mantenidas, cambios preparados, resultados generados, exportaciones públicas, logs y artefactos.

El check del repositorio analiza cada blob preparado en Git y cada versión
distinta del árbol de trabajo de un archivo de texto UTF-8 registrado. Omite
contenido binario. Revise imágenes, audio, video, archivos comprimidos y otros
binarios con un proceso aprobado. Use enlaces de Gist sin propietario cuando el
nombre de una cuenta pública no aporte contexto necesario.

Un check repetible puede encontrar identificadores estructurados y valores prohibidos conocidos. Debe informar sólo archivo, línea y categoría. No debe repetir el valor encontrado.

Mantenga las listas permitidas acotadas, explicadas, probadas y revisadas. Use
entradas exactas para las direcciones públicas de roles de una organización. No
permita un dominio completo para este fin. Una persona también debe revisar
texto libre, imágenes, audio y combinaciones de campos.

Un análisis correcto es evidencia de apoyo. No demuestra que el contenido no tenga PII ni PHI.

## P: ¿Qué debe ocurrir después de una exposición?

1. Detenga la publicación y el procesamiento posterior.
2. Restrinja el acceso al registro afectado y sus copias.
3. Avise a los responsables de privacidad y seguridad.
4. Conserve un registro censurado del incidente y la referencia afectada.
5. Evalúe destinatarios, cachés, forks, backups y obligaciones legales.
6. Quite el contenido actual y rote las credenciales relacionadas.
7. Reescriba el historial publicado sólo con autorización explícita.
8. Verifique cada ref objetivo y registre los límites restantes.

Eliminar la última revisión no demuestra la eliminación del historial, clones, cachés, mirrors, logs o backups.

Para un Gist público, verifique todas las revisiones después de reescribir el historial. Elimínelo y créelo de nuevo sólo si el propietario acepta el cambio de URL y el riesgo restante de caché.

## P: ¿Qué evidencia debe conservar el proyecto?

Conserve clasificación, propósito, propietario, entorno aprobado, proveedor, región, destinatarios, fecha de retención, resultado de eliminación, revisión de acceso, resultado de censura y referencia del incidente.

No repita PII ni PHI sin censura en la evidencia. Use un identificador censurado estable o digest cuando necesite correlación.

Revise los controles antes del release y cuando cambien los campos, procesadores, proveedores de modelos, telemetría, retención o rutas de acceso.

## Referencias

- [Marco de Privacidad de NIST](https://www.nist.gov/privacy-framework)
- [Guía de uso del Marco de Privacidad de NIST](https://www.nist.gov/privacy-framework/using-privacy-framework-11)
- [Guía de HHS para desidentificar información de salud protegida](https://www.hhs.gov/hipaa/for-professionals/special-topics/de-identification/index.html)
- [Guía Start with Security de FTC](https://www.ftc.gov/business-guidance/resources/start-security-guide-business)
- [SECURITY.md](SECURITY.md)
- [OWASP.md](OWASP.md)
- [NOTES.md](NOTES.md)
