# OWASP

Preguntas y respuestas opcionales y lista de seguridad antes del lanzamiento para personas y agentes.

Esta guía usa OWASP MASVS, el Mobile Application Security Verification Standard. Confirme el estándar aplicable para cada plataforma y perfil de riesgo.

## P: ¿Cuál es la base de seguridad?

Use el modelado de amenazas, OWASP ASVS para aplicaciones y servicios web, OWASP API Security Top 10 para las API y MASVS con MASTG para aplicaciones móviles. Asigne cada control aplicable a un responsable, una implementación, un test, una ruta de evidencia y una excepción.

No declare una certificación desde una lista de verificación. Registre la versión seleccionada, el alcance, las exclusiones, los métodos de test, los hallazgos, el riesgo residual y la aprobación.

## P: ¿Qué nunca debe ser público?

Nunca publique contraseñas, claves privadas, claves de firma, tokens de acceso, refresh tokens, credenciales de bases de datos, credenciales de nube, secretos de CI, certificados privados, códigos de recuperación, exportaciones de producción, datos personales, datos de candidatos o informes de seguridad sin censura.

Revise los archivos fuente, el historial de Git, los branch, los tags, los issue, los pull request, los comentarios, los release, los paquetes, las capas de contenedores, los artefactos de build, los informes de fallos, las capturas de pantalla, las instantáneas de test, los log y los ejemplos de documentación.

Un secreto en un archivo SOPS cifrado puede filtrarse por claves, artefactos descifrados, log, copias de seguridad, salida de CI o una identidad comprometida. El cifrado en reposo no permite publicar un secreto sin revisar la clave y su ciclo de vida.

## P: ¿Dónde deben estar los secretos?

Use un almacén de secretos gestionado o KMS para los servicios desplegados. Use identidad de carga de trabajo, credenciales de corta duración y privilegio mínimo cuando la plataforma los admita. Mantenga los secretos de desarrollo en un almacén local aprobado o un entorno inyectado, no en archivos rastreados.

Use el keychain o keystore del sistema operativo para las credenciales y claves de aplicaciones instaladas. Use almacenamiento cifrado de la aplicación para datos sensibles grandes. Proteja la clave de cifrado con el keystore de la plataforma. Considere las copias de seguridad, las compilaciones de depuración, los dispositivos rooteados, los dispositivos con jailbreak y la memoria de procesos como posibles vías de exposición.

No almacene secretos en `UserDefaults` de iOS, preferencias compartidas de Android, archivos de texto, log, datos del portapapeles, notificaciones, almacenamiento del navegador ni bundles de aplicaciones. `UserDefaults` es para preferencias no sensibles.

Para aplicaciones de navegador, prefiera sesiones gestionadas por el servidor en cookies `HttpOnly`, `Secure` y `SameSite` adecuadas, o un patrón Backend-for-Frontend. No almacene tokens de autenticación, identificadores de sesión, JWT, refresh tokens ni credenciales en `localStorage` o `sessionStorage`.

Ningún secreto incluido en un paquete de navegador, una aplicación móvil, un binario de escritorio o un módulo WASM es secreto. Un cliente es un entorno no confiable. Ponga la autorización y los secretos valiosos en un servidor.

## P: ¿Qué debemos cifrar?

Primero, minimice la recopilación y la retención. Clasifique los datos por confidencialidad, integridad, disponibilidad, privacidad e impacto regulatorio. Cifre los datos en tránsito con TLS validado. Cifre los datos sensibles en reposo si el almacenamiento, la copia de seguridad, el host o el operador pueden exponerlos.

Use cifrado en la aplicación si los operadores de almacenamiento o infraestructura no deben leer los datos, si los datos cruzan límites de confianza o si se requiere separación por campo. Defina la propiedad, rotación, revocación, recuperación, acceso, destrucción y auditoría de claves antes de implementar.

Use bibliotecas criptográficas estándar y revisadas. No invente algoritmos, reutilice valores nonce, fije claves en el código, use contraseñas como claves sin una función de derivación revisada ni ponga claves de cifrado junto al texto cifrado sin un límite de protección separado.

## P: ¿Cómo se debe usar SOPS?

SOPS sirve para cifrar valores de configuración en el control de versiones si el repositorio, los grupos de claves, las identidades y el límite de descifrado están controlados. Mantenga `.sops.yaml` revisado. Use age o la identidad de KMS de nube aprobada. Descifre solo en el límite de ejecución confiable.

Analice antes del commit y después del descifrado. Asegure que el texto plano no entre en los log, el historial del intérprete de comandos, los argumentos de proceso, los artefactos, las cachés ni las capas de contenedores. Rote y revoque las claves después de una exposición. Mantenga separadas las identidades de producción, preproducción, desarrollo y recuperación.

## P: ¿Cuándo debemos usar atestación?

Use atestación cuando el servidor necesite evidencia adicional sobre una aplicación, dispositivo, clave o autenticador de navegador antes de una acción de alto riesgo. Úsela como una entrada para el análisis de riesgos. No la use en lugar de autenticación, autorización, transporte seguro, límites de tasa o controles contra fraude.

En plataformas Apple, App Attest usa una clave generada por el dispositivo, un desafío del servidor, un objeto de atestación y aserciones posteriores. El servidor debe verificar la atestación, vincular la clave pública con la aplicación prevista, impedir la repetición, rastrear los contadores de aserciones y separar los entornos de desarrollo y producción.

Para Android, evalúe Play Integrity y Android Key Attestation según el modelo de amenazas y el canal de distribución. Verifique los tokens en el servidor. Defina la vinculación de nonce, la protección contra repetición, el manejo de veredictos, la privacidad, el modo alternativo de disponibilidad y la respuesta ante dispositivos no compatibles.

Para navegadores, use WebAuthn o claves de acceso si se requieren autenticación de usuarios y resistencia al phishing. Valide en el servidor el desafío, el origen, la parte confiable, la firma, el estado de las credenciales y la política de verificación de usuario.

No bloquee a cada usuario si un servicio de atestación no está disponible. Seleccione el comportamiento de permitir o bloquear según el riesgo de la acción. Registre la decisión y pruebe la operación degradada.

## P: ¿Cuál es la lista de verificación previa al lanzamiento?

### Alcance y modelo de amenazas

- Defina los activos, actores, límites de confianza, casos de abuso, flujos de datos y acciones de alto impacto.
- Identifique los puntos de conexión públicos, rutas de administración, servicios internos, proveedores externos y comportamiento sin conexión.
- Registre las suposiciones, los elementos fuera de alcance y los responsables del riesgo residual.

### Código fuente, dependencias y cadena de suministro

- Analice el árbol de trabajo, el historial, los artefactos y las imágenes de contenedores para buscar secretos.
- Fije las dependencias, compiladores, actions, imágenes, escáneres y conjuntos de reglas.
- Revise las licencias, la procedencia, las firmas o checksums, los scripts de instalación y las dependencias transitivas.
- Ejecute verificaciones de SAST, SCA, imágenes, IaC y workflow con informes recuperables.

### Identidad y autorización

- Pruebe la autenticación, el ciclo de vida de sesión, el cierre de sesión, la rotación de tokens, el vencimiento, la repetición y la recuperación.
- Pruebe la autorización para cada objeto, tenant, rol, acción y ruta administrativa.
- Pruebe los límites de tasa, el comportamiento de bloqueo, los controles de abuso y los eventos de auditoría.

### Entrada, API y navegador

- Valide la entrada en cada límite de confianza.
- Pruebe la inyección, deserialización, recorrido de rutas, SSRF, contrabando de solicitudes, CORS, CSRF y redirecciones inseguras.
- Pruebe las cabeceras de seguridad, los atributos de cookies, la política de seguridad de contenido, el comportamiento de caché y la exposición de errores.
- Pruebe la autorización de objetos de API y la exposición de datos sensibles.

### Aplicaciones móviles e instaladas

- Aplique los controles MASVS aplicables de almacenamiento, criptografía, autenticación, red, plataforma, código, resiliencia y privacidad.
- Revise los log, las copias de seguridad, las capturas de pantalla, las notificaciones, el portapapeles, WebViews, enlaces profundos, IPC, los componentes exportados, las marcas de depuración y los símbolos de release.
- Revise el acceso a Keychain o Keystore, la invalidación de claves, el comportamiento del bloqueo del dispositivo y los controles biométricos reforzados.
- Pruebe la atestación y el comportamiento degradado del servicio en dispositivos compatibles y no compatibles.

### Operaciones y release

- Verifique TLS, la validación de certificados, la inyección de secretos, la política de red, el privilegio mínimo, las copias de seguridad y la eliminación.
- Verifique la censura en los log, las trazas, las métricas, las capturas de pantalla y las exportaciones de soporte.
- Verifique las alertas, los contactos de incidentes, la rotación de claves, la revocación, el rollback y la recuperación.
- Ejecute una prueba de humo similar a producción sin datos personales de producción.

## P: ¿Qué herramientas locales deben ejecutar los agentes?

Use las herramientas y versiones aprobadas por el repositorio. Un carril local práctico puede incluir Gitleaks para secretos, Semgrep para SAST, Trivy para dependencias, imágenes, configuraciones incorrectas, secretos y SBOM, zizmor para GitHub Actions, OWASP Dependency-Check para SCA adicional y OWASP ZAP para objetivos DAST aprobados.

Ejecute las herramientas localmente o en un runner autohospedado controlado si el código fuente o los log son sensibles. Revise el acceso a red y el comportamiento de actualización. Mantenga privados los hallazgos y la evidencia sin procesar. No cargue código fuente ni secretos en un escáner externo sin aprobación.

## P: ¿Qué evidencia debe conservarse?

Conserve el estándar y la versión seleccionados, el modelo de amenazas, la matriz de controles, las versiones de herramientas, las versiones de reglas o bases de datos, el commit objetivo, el entorno, las exclusiones, los hallazgos, las correcciones, los riesgos aceptados, los resultados de nuevas pruebas y el registro de aprobación.

Un resultado limpio de un escáner no prueba que el sistema sea seguro. La seguridad es una decisión de riesgo respaldada por varios test y revisión humana.

## Lecturas adicionales

- [OWASP MASVS](https://mas.owasp.org/MASVS/)
- [OWASP MASTG](https://mas.owasp.org/MASTG/)
- [OWASP ASVS](https://owasp.org/www-project-application-security-verification-standard/)
- [OWASP API Security Top 10](https://owasp.org/API-Security/)
- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [Hoja de referencia de gestión de secretos de OWASP](https://cheatsheetseries.owasp.org/cheatsheets/Secrets_Management_Cheat_Sheet.html)
- [Hoja de referencia de gestión de claves de OWASP](https://cheatsheetseries.owasp.org/cheatsheets/Key_Management_Cheat_Sheet.html)
- [Hoja de referencia de modelado de amenazas de OWASP](https://cheatsheetseries.owasp.org/cheatsheets/Threat_Modeling_Cheat_Sheet.html)
- [Hoja de referencia de gestión de sesiones de OWASP](https://cheatsheetseries.owasp.org/cheatsheets/Session_Management_Cheat_Sheet.html)
- [Validación de Apple App Attest](https://developer.apple.com/documentation/devicecheck/validating-apps-that-connect-to-your-server)
- [API Android Play Integrity](https://developer.android.com/google/play/integrity)
- [WebAuthn API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Authentication_API)
- [OWASP ZAP](https://www.zaproxy.org/)
- [Adopción de OWASP MASTG](https://mas.owasp.org/MASTG/0x02b-MASVS-MASTG-Adoption/)
## P: ¿Qué estándar se aplica a cada superficie?

Use el conjunto más pequeño de estándares que cubra la superficie del producto. Registre los estándares seleccionados y el motivo de cada exclusión.

- Aplicaciones y servicios web: use [OWASP ASVS](https://owasp.org/www-project-application-security-verification-standard/) para requisitos y [Guía de pruebas de seguridad web de OWASP](https://owasp.org/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/00-Introduction_and_Objectives/) para test de seguridad repetibles.
- API: use [OWASP API Security Top 10](https://owasp.org/API-Security/) con controles ASVS. Pruebe la autorización por objeto, autenticación, autorización por propiedad, uso de recursos sin restricciones, SSRF, inventario y consumo inseguro de API externas.
- Móvil: use [MASVS](https://mas.owasp.org/MASVS/) para requisitos y [MASTG](https://mas.owasp.org/MASTG/) para test. Use la guía [Adopción de MASTG](https://mas.owasp.org/MASTG/0x02b-MASVS-MASTG-Adoption/) para seleccionar un subconjunto basado en riesgos.
- Sistemas embebidos e IoT: use [Estándar de verificación de seguridad IoT de OWASP](https://owasp.org/IoT-Security-Verification-Standard-ISVS/) para requisitos y [Guía de pruebas de seguridad IoT de OWASP](https://owasp.org/owasp-istg/) para test. Use la guía [Seguridad de aplicaciones embebidas de OWASP](https://owasp.org/www-project-embedded-application-security/) y Metodología de pruebas de seguridad de firmware para riesgos específicos de firmware.
- Escritorio nativo y WASM: aplique controles ASVS y API si la aplicación expone superficies web o de red. Añada verificaciones de firma de plataforma, actualización segura, sandbox, seguridad de memoria, FFI, capacidad y build reproducible. Use un estándar específico de plataforma cuando exista.
- Cadena de suministro de software: use [OWASP SCVS](https://owasp.org/www-project-software-component-verification-standard/), un formato SBOM como [CycloneDX](https://cyclonedx.org/), [NIST SSDF](https://csrc.nist.gov/projects/ssdf), [SLSA](https://slsa.dev/spec/v1.2/) y [OpenSSF Scorecard](https://openssf.org/scorecard/) según corresponda.
- Proceso de desarrollo y entrega: use [Estándar de verificación de DevSecOps de OWASP](https://owasp.org/www-project-devsecops-verification-standard/) para una revisión de madurez y brechas.

## P: ¿Cuál es la lista de verificación de seguridad web y API?

- Defina límites de confianza, clasificaciones de datos, usuarios, roles, tenants y objetivos de seguridad.
- Asigne los requisitos de seguridad a identificadores ASVS y recursos de API.
- Pruebe la autenticación, el manejo de sesiones, la autorización, el aislamiento de tenants, la propiedad de objetos y los cambios de privilegios.
- Pruebe la validación de entrada, codificación de salida, inyección, manejo de archivos, SSRF, deserialización, redirecciones y respuestas de error.
- Pruebe los controles del navegador: CSP, verificaciones de origen, protección CSRF, CORS, flags de cookies, protección contra clickjacking y almacenamiento seguro.
- Pruebe los controles de API: autorización por método y objeto, paginación y límites, límites de tasa, validación de esquema, tipos de contenido, inventario de versiones y endpoints obsoletos.
- Ejecute test unitarios y de integración para invariantes de seguridad. Ejecute DAST autenticado y no autenticado contra un entorno desechable.
- Registre la URL objetivo, el identificador de build, los roles de cuentas de test, las versiones de herramientas, el alcance, los hallazgos y la evidencia de corrección.

## P: ¿Cuál es la lista de verificación de seguridad para sistemas embebidos e IoT?

- Modele el dispositivo, los servicios del ecosistema, la ruta de actualización, las interfaces físicas, las interfaces inalámbricas y los roles de operadores.
- Seleccione requisitos ISVS y casos de test ISTG desde el modelo real de atacante. No declare cobertura total si el acceso al hardware está fuera de alcance.
- Revise el arranque seguro, el firmware firmado, la rotación de claves, la protección contra reversión, el modo de recuperación, el transporte de actualización y el comportamiento ante fallos de actualización.
- Busque credenciales fijadas en código, cuentas de depuración, secretos en imágenes de firmware, log inseguros, valores predeterminados inseguros y servicios innecesarios como Telnet.
- Pruebe UART, JTAG, SWD, SPI, I2C, USB, Bluetooth, Wi-Fi, celular e interfaces de gestión expuestas cuando existan.
- Revise la seguridad de memoria, la inyección de comandos, los límites del analizador, la separación de privilegios, el aislamiento en sandbox y la eliminación segura.
- Produzca un SBOM para el firmware y los servicios del host. Rastree las versiones de componentes, licencias, vulnerabilidades conocidas y fechas de fin de soporte.
- Pruebe escenarios de fabricación, aprovisionamiento, transferencia de propiedad, retirada, restablecimiento de fábrica y captura física.
- Conserve los hashes de firmware, el equipo de test, el nivel de acceso, los casos de test, los hallazgos y la evidencia de release firmado.

## P: ¿Cómo debe conectarse la evidencia de cadena de suministro con un release?

- Mantenga un inventario bloqueado de dependencias y un SBOM para cada artefacto de release.
- Registre la revisión del código fuente, las entradas de build, las versiones de la cadena de herramientas, la identidad del creador, los resúmenes de artefactos y la identidad de firma.
- Genere y verifique la procedencia. [La procedencia de SLSA](https://slsa.dev/spec/v1.2/provenance) describe dónde, cuándo y cómo se creó un artefacto.
- Aplique controles SCVS de forma gradual al inventario, SBOM, entorno de build, gestión de paquetes, análisis de componentes y pedigrí o procedencia.
- Use Scorecard o una verificación equivalente para dependencias públicas. Fije las actions, imágenes, paquetes y versiones de herramientas.
- Bloquee el release si falla un control obligatorio. Registre un responsable, una fecha de vencimiento y un control compensatorio para cada excepción aceptada.

## Referencias

- [Guía de pruebas de seguridad web de OWASP](https://owasp.org/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/00-Introduction_and_Objectives/)
- [Estándar de verificación de seguridad IoT de OWASP](https://owasp.org/IoT-Security-Verification-Standard-ISVS/)
- [Guía de pruebas de seguridad IoT de OWASP](https://owasp.org/owasp-istg/)
- [Seguridad de aplicaciones embebidas de OWASP](https://owasp.org/www-project-embedded-application-security/)
- Metodología de pruebas de seguridad de firmware
- [Estándar de verificación de componentes de software de OWASP](https://scvs.owasp.org/)
- [Estándar de verificación de DevSecOps de OWASP](https://owasp.org/www-project-devsecops-verification-standard/)
- [Marco de desarrollo seguro de software de NIST](https://csrc.nist.gov/projects/ssdf)
- [Especificación de SLSA](https://slsa.dev/spec/v1.2/)
- [OpenSSF Scorecard](https://openssf.org/scorecard/)
