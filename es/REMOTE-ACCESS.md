# REMOTE-ACCESS

El acceso remoto es un perfil opcional. Conserve el contrato de tareas y evidencia al cambiar VPN o terminal.
Use [HERDR.md](HERDR.md) para sesiones persistentes y [COMPOSITION.md](COMPOSITION.md) para elegir adaptadores.

## Modelo de acceso

Separe teléfono o portátil, identidad de red, cuenta remota, sesión de terminal y credenciales de aplicación.
El permiso SSH no concede acceso productivo ni autoridad sobre todos los paneles de agentes.
Use una cuenta de desarrollo sin privilegios administrativos habituales. Excluya credenciales productivas por defecto.
Vincule paneles y controles de desarrollo a la interfaz local. Acceda mediante túnel aprobado o puerta privada autenticada.

## Perfil Tailscale

Registre solo usuarios y dispositivos aprobados. Aplique controles de identidad y aprobación de dispositivos de la organización.
Defina permisos limitados desde identidades o dispositivos permitidos hacia equipos etiquetados y puertos necesarios.
Retire permisos generales incompatibles después de probar el reemplazo. Los permisos se suman; uno limitado no cancela otro amplio.
Use requisitos de estado del dispositivo cuando estén disponibles. Limite propietarios de etiquetas a administradores autorizados.

Seleccione OpenSSH normal por red privada o Tailscale SSH en equipos compatibles.
Para Tailscale SSH, configure alcance de red y autorización SSH. Use reautorización interactiva cuando corresponda.
Limite usuarios del sistema destino. Separe etiquetas de desarrollo y producción.
Revise caducidad, recuperación, revocación por pérdida y efectos de cuentas de servicio o equipos etiquetados.

Pruebe la política antes de extenderla. Use pruebas del proveedor y clientes reales permitidos y denegados.
Conserve una ruta de recuperación verificada antes de cambiar acceso. Este manual no aplica políticas a una cuenta real.

## Matriz de aceptación de acceso

| Origen y acción | Resultado esperado |
| --- | --- |
| Estación aprobada hacia SSH de desarrollo | Permitido para el usuario designado |
| Teléfono aprobado hacia su equipo asignado | Permitido tras autenticación requerida |
| Dispositivo no aprobado hacia desarrollo | Denegado |
| Equipo de desarrollo hacia administración productiva | Denegado salvo autorización separada |
| Cliente público hacia panel local | Denegado |
| Reconexión de dispositivo revocado o caducado | Denegado |
| Usuario autorizado que apunta al panel de otra persona | Requiere autoridad explícita de esa tarea |

La red no distingue un comando seguro de uno destructivo dentro de una shell permitida.
Use usuarios del sistema, permisos de archivos, credenciales limitadas, aislamiento y autorización para separar flujos.
Pruebe salida de red por separado. Una red privada de entrada no aísla el tráfico saliente.

## Flujo móvil y terminal

Moshi es un cliente SSH o Mosh opcional. Otro terminal aprobado puede usar el mismo contrato de equipo y tarea.
Establezca primero la red privada en el teléfono. Verifique la identidad del equipo y conecte con la cuenta aprobada.
Use autenticación por clave o el mecanismo elegido. Conserve la verificación de clave del servidor.

En el equipo remoto, inspeccione sesión, espacio y panel exactos de Herdr antes de enviar entrada.
Confirme que el panel es una shell inactiva antes de ejecutar un comando. No deduzca el destino por su posición.
Use la ayuda instalada y la habilidad aprobada. La plantilla no presupone nombres de sesiones ni rutas de sockets.
Desconecte y reconecte para demostrar continuidad. Registre salida y artefactos en el equipo remoto.

Pruebe SSH primero. Mosh requiere política UDP adicional y soporte del servidor; apruebe solo el rango y equipo necesarios.
Las notificaciones y extensiones móviles pueden usar servicios externos fuera de la VPN. Revise contenido y consentimiento por separado.
Un equipo suspendido detiene el trabajo. Seleccione explícitamente disponibilidad y suspensión.

## Otras redes y equipos

Para VPN empresarial, WireGuard, bastión o servidor físico, aplique las mismas pruebas de identidad y denegación.
Documente plataformas, recuperación, rotación de claves, registros, responsables y limpieza.
Use infraestructura como código o política revisada cuando sea posible. Registre acceso actual y propuesto antes de aplicarlo.
La elección de nube no cambia la evidencia necesaria para desarrollo remoto con permisos mínimos.

## Referencias

- [Permisos Tailscale](https://tailscale.com/docs/reference/syntax/grants)
- [SSH de Tailscale](https://tailscale.com/docs/features/tailscale-ssh)
- [Conexión y autenticación Moshi](https://getmoshi.app/docs/connections)
- [Moshi y Herdr](https://getmoshi.app/docs/herdr)
