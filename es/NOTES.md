# NOTES

Esta guía define un contrato multiplataforma para grabaciones, transcripciones y notas de ingeniería.

## P: ¿Qué debe proporcionar un sistema de grabación y notas?

- Aprobación explícita antes de iniciar la grabación.
- Un estado visible de grabación durante la captura.
- Captura local primero de forma predeterminada.
- Audio sin procesar, transcripción, resumen, decisiones y acciones separados.
- Metadatos de persona y hora cuando estén disponibles.
- Notas que permitan buscar, exportar y versionar.
- Redacción antes de compartir o procesar con un modelo.
- Controles de retención y eliminación.
- Operación sin conexión con reintento seguro al volver la sincronización.
- Un propietario claro y una política de acceso.

## P: ¿Cuándo puede grabar un sistema?

Grabe sólo después de que cada persona grabada dé su aprobación explícita. El sistema debe indicar el alcance de captura antes de iniciar la grabación. El alcance incluye audio de micrófono, audio del sistema, audio de reuniones, contenido del editor y mensajes privados.

El sistema debe mostrar un indicador persistente de grabación. Debe proporcionar un control claro para detenerla. Debe registrar la aprobación, las personas, el alcance, la hora y la política de retención con la grabación.

Obtenga una nueva aprobación cuando cambie el alcance, las personas, el destino o la finalidad del procesamiento. No grabe cuando falte, se retire o no sea clara una aprobación necesaria.

## P: ¿Cuál es el ejemplo de macOS?

[Quill](https://github.com/digimata/quill) es un ejemplo mínimo de grabación y transcripción para macOS. Úselo como referencia de captura local. No lo trate como un contrato universal de plataforma.

Antes de adoptarlo, verifique su build, permisos, ruta de transcripción y comportamiento de almacenamiento de datos.

## P: ¿Qué deben hacer las implementaciones de Windows y Linux?

Implemente el mismo contrato de comportamiento con API de captura nativas o un grabador confiable. Use mensajes de permiso del sistema operativo, un indicador de estado visible, almacenamiento local cifrado y un motor de transcripción local o aprobado.

Windows puede usar captura de audio de Windows y un servicio de transcripción local. Linux puede usar PipeWire o PulseAudio mediante una aplicación revisada. Estas son opciones de implementación. El contrato debe ser independiente de ellas.

No capture sin aviso audio de micrófono, audio del sistema, reuniones, contenido del editor ni mensajes privados. No cargue grabaciones a un modelo alojado sin aprobación explícita y una decisión documentada sobre procesamiento de datos.

## P: ¿Cómo deben entrar las notas en el SDLC?

Convierta una grabación en un registro de decisión revisado, un elemento de trabajo, un cambio de especificación o un registro de investigación. Mantenga las grabaciones sin procesar fuera del repositorio, salvo que el proyecto las requiera explícitamente. Guarde sólo la evidencia necesaria para reproducir la decisión.

## Referencias

- [Quill](https://github.com/digimata/quill)
- [NIST Privacy Framework](https://www.nist.gov/privacy-framework)
- [W3C WebRTC](https://www.w3.org/TR/webrtc/)
