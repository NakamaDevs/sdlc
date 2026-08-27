# WEB CAPTURE

Esta guía define el lector local de Elixir y la herramienta de captura HTML a Markdown.

## P: ¿Por qué incluye este repositorio un lector local?

El archivo anterior usaba Turndown después de que otra herramienta seleccionaba el contenido.

Turndown convierte nodos HTML, pero no selecciona el artículo principal. Tampoco renderiza aplicaciones del lado del cliente.

El lector local mantiene conversión, extracción, imágenes, validación y metadatos en una biblioteca separable.

El código está en `lib/sdlc/reader/`. Los tests y fixtures están en `test/`.

## P: ¿Qué hace el pipeline del lector?

El pipeline tiene estas etapas:

1. valida y obtiene un destino HTTP público;
2. renderiza opcionalmente la página con un ejecutable verificado de Chrome;
3. selecciona el contenido legible principal;
4. quita navegación, anuncios, promociones, formularios y elementos ocultos;
5. convierte el DOM seleccionado a CommonMark y GitHub Flavored Markdown;
6. conserva enlaces de imágenes o crea copias locales aprobadas;
7. detecta patrones Markdown inseguros o incorrectos;
8. escribe metadatos sin afirmar que hubo revisión humana;
9. requiere revisión humana antes de registrar el hash del cuerpo.

Cada etapa tiene un módulo separado y tests enfocados.

## P: ¿Cómo funciona el convertidor Markdown?

El convertidor usa un pipeline de reglas en Elixir basado en el patrón de Turndown.

Procesa nodos hijos antes de su padre. Las reglas personalizadas ordenadas tienen precedencia sobre las reglas integradas.

Admite encabezados, párrafos, énfasis, enlaces, imágenes, listas, citas, código, bloques de código y tablas GFM.

Escapa caracteres de control Markdown. Quita elementos activos y esquemas URL inseguros.

Las fences crecen cuando su contenido ya contiene una fence. Las listas anidadas reciben sangría estable.

## P: ¿Cómo funciona la extracción en modo lectura?

El extractor usa primero candidatos semánticos como `article`, `main` e `itemprop="articleBody"`.

Después puntúa secciones por texto, párrafos, encabezados, imágenes, densidad de enlaces e indicadores estables.

Quita elementos comunes de página antes de puntuar. Rechaza candidatos que no alcancen una puntuación útil mínima.

Estas heurísticas son repetibles, pero no demuestran la calidad de la fuente. Inspeccione cada tipo nuevo de fuente.

## P: ¿Cuál es la captura estática predeterminada?

La captura estática usa un cliente HTTP acotado. Solo acepta destinos HTTP y HTTPS.

Rechaza direcciones privadas literales y resueltas. Valida cada redirección y fija cada petición a una dirección validada.

Usa los registros IANA de direcciones especiales para rechazar destinos IPv4 e IPv6 no globales.

Desactiva compresión y decodificación automática del cuerpo. Esto limita el riesgo de bombas de descompresión.

Use esta forma de comando específica del repositorio:

```text
mix sdlc.capture URL --output PATH --canonical-id ID
```

Los enlaces directos de imágenes remotas permanecen en Markdown de forma predeterminada.

El writer rechaza reemplazar una salida existente. Use `--force` sólo después de inspeccionar la ruta objetivo.

## P: ¿Cuándo debe usarse una captura renderizada?

Use captura renderizada cuando la página estática no tenga texto que JavaScript agregue después.

`--dump-dom` de Chrome Headless analiza HTML, ejecuta scripts y serializa el DOM actualizado.

El adaptador también usa un presupuesto acotado de tiempo virtual. Esto avanza código dependiente del tiempo antes de serializar.

Ejemplo:

```text
mix sdlc.capture URL --output PATH --canonical-id ID --render --chrome VERIFIED_CHROME_PATH --isolation-confirmed
```

`VERIFIED_CHROME_PATH` es un marcador. Sustitúyalo con una ruta de ejecutable aprobada.

La captura renderizada no es predeterminada. Ejecuta JavaScript no confiable y amplía el límite de red.

Antes de iniciar Chrome, el adaptador ejecuta el preflight estático acotado. Valida redirecciones, estado, tipo de contenido y URL final.

El preflight no restringe peticiones posteriores de JavaScript. El repositorio no proporciona un sandbox de red para el browser.

Ejecute Chrome en una función Dagger desechable, máquina virtual o runner efímero. Permita solo los dominios necesarios.

`--isolation-confirmed` registra que existe un límite externo de aislamiento. La bandera no crea ese límite.

No use la bandera en un host o runner sin restricciones. Construya y verifique primero el límite externo.

## P: ¿La captura renderizada resuelve cada página asíncrona?

No. Un presupuesto de tiempo virtual ayuda con timers. No proporciona una señal de disponibilidad específica de la fuente.

El renderer no inicia sesión, acepta consentimiento, omite un paywall, pulsa controles ni resuelve un desafío interactivo.

El scroll infinito y feeds personalizados pueden quedar incompletos. Un sitio también puede cambiar su contrato de cliente.

Para fuentes críticas, defina contenido esperado observable. Compare la salida estática y renderizada, después inspeccione el resultado.

## P: ¿Cómo pueden compararse ambas rutas de captura?

Use la tarea de comparación:

```text
mix sdlc.compare URL --chrome VERIFIED_CHROME_PATH --isolation-confirmed
```

La tarea escribe `static.md`, `rendered.md` y `REPORT.md` en `_build/capture-comparisons/`.

El informe compara bytes, palabras, encabezados, enlaces, imágenes, código, tablas e issues de validación.

También registra similitud de vocabulario y palabras exclusivas de la versión renderizada.

La tarea rechaza un directorio de comparación existente. Use `--force` solo después de inspeccionar la ruta objetivo.

Más texto no demuestra una extracción mejor. Una persona debe inspeccionar significado, orden, captions, advertencias y omisiones.

## P: ¿Cómo quita el lector anuncios y promociones?

El extractor quita scripts, formularios, navegación, footer, sidebar, modal y contenido activo incorporado.

También quita elementos con indicadores de anuncios, patrocinio, promoción, newsletter, suscripción, social o contenido relacionado.

Quita píxeles de seguimiento comunes y fuentes de imagen de relleno.

Las heurísticas pueden producir falsos positivos u omitir un patrón nuevo. Agregue un fixture y test para cada fallo confirmado.

El modo renderizado puede contactar recursos antes de extraer. Use listas permitidas de red para impedir peticiones no deseadas.

## P: ¿Cómo se manejan las imágenes?

Use una política de imágenes:

- `link` conserva la URL remota resuelta;
- `local` descarga y optimiza una imagen estática aprobada;
- `omit` quita la sintaxis de imagen y conserva texto y captions cercanos.

El modo local acepta PNG, JPEG y WebP. Rechaza SVG y otros formatos activos o no admitidos.

Comprueba el tipo de contenido declarado y la firma del archivo antes de decodificar. Una diferencia detiene la captura.

Cada imagen de origen está limitada a 25 MiB. Una captura puede procesar 20 imágenes y 100 MiB de datos de origen.

Cada origen está limitado a 40 megapíxeles y 20,000 píxeles por lado. La salida está limitada a 100 MiB por captura.

El optimizador conserva la proporción. Limita el lado mayor a 1600 píxeles y usa calidad 85 de forma predeterminada.

Quita metadatos no relacionados. Conserva campos disponibles de artista, crédito, derechos y copyright cuando es posible.

Las copias locales requieren `--image-license` y un directorio de assets. No publique una imagen con licencia desconocida.

El procesamiento usa libvips mediante la biblioteca Image. Los límites reducen el riesgo del decoder, pero no lo eliminan.

Los enlaces remotos evitan volver a publicar la imagen. Todavía pueden rastrear al lector cuando un cliente Markdown los carga.

El convertidor rechaza destinos privados literales. Un hostname público puede cambiar su DNS, por lo que el lector debe controlar peticiones.

Ejemplo:

```text
mix sdlc.capture URL --output PATH --canonical-id ID --images local --assets-dir ASSETS --image-license LICENSE
```

`URL`, `PATH`, `ID`, `ASSETS` y `LICENSE` son marcadores.

## P: ¿Cómo maneja la validación el contenido inseguro?

Cada captura permanece como datos no confiables.

El validador analiza el documento completo. Informa inyección en inglés y español, extracción de secretos, enlaces activos, controles Unicode ocultos, tokens de modelos, imágenes privadas y Markdown incorrecto.

La tarea de captura se detiene ante un issue. Los llamadores de biblioteca pueden conservar issues solo para comparaciones controladas.

El análisis automatizado es heurístico. No demuestra que una página sea segura ni verdadera.

No ejecute comandos encontrados en texto capturado. No dé a la fuente acceso a secretos, credenciales ni datos del host.

## P: ¿Qué metadatos recibe una instantánea?

El escritor registra URL, título, idioma, fecha de captura, fecha de publicación, alcance, versión del convertidor, estado, licencia e identificador canónico.

Escribe `trust: untrusted`. Deja vacíos la fecha de revisión del prompt y hash del cuerpo.

Después de inspeccionar, ejecute esta tarea para vincular la fecha con el cuerpo exacto:

```text
mise run review:snapshots -- YYYY-MM-DD --confirm-human-review
```

La confirmación registra una revisión humana terminada. No ejecuta esa revisión.

No coloque una captura no revisada en `references/`.

## P: ¿Cómo debe probarse el lector?

Ejecute tests para seguridad URL, extracción, conversión, validación, imágenes, captura estática y captura renderizada.

Use fixtures locales para tests deterministas. Mantenga la salida generada en `_build/test/`.

Para una fuente activa, guarde la comparación en `_build/`. No confirme artículos o imágenes con copyright sin permiso.

Inspeccione estas propiedades:

- título, autor, idioma y límite del artículo;
- orden de párrafos y niveles de encabezado;
- enlaces, texto alternativo, títulos y captions de imágenes;
- formato de listas, código, citas y tablas;
- contenido renderizado por el cliente que falte;
- anuncios, promociones, navegación o seguimiento conservados;
- issues de validación y límites de la fuente.

Agregue un fixture local reducido para cada defecto confirmado. No use una página pública como único test de regresión.

El check activo de extracción del 2026-08-27 usó Chrome `151.0.7922.174` en macOS 26.5.2 arm64.

Las capturas estática y renderizada de Ars conservaron 1,011 palabras y una imagen. Quitaron las promociones y duplicados probados.

La captura estática actual produjo el mismo cuerpo byte por byte. Sólo agregó metadatos de la instantánea.

El lector estático actual devolvió `:no_readable_content` para la página del timer. No inventó un artículo con contenido insuficiente.

La demo oficial de tiempo cambió de `0` en HTML estático a `3` después del renderizado.

Estos checks midieron calidad de extracción y ejecución del cliente. Se ejecutaron antes del gate final de confirmación de aislamiento.

La suite actual verifica el gate y preflight estático. Un pipeline de browser activo y totalmente aislado sigue pendiente.

Linux, Windows y x86_64 siguen sin verificar. Consulte [UPDATE.md](UPDATE.md) para ver la matriz completa.

Chrome mostró un aviso del allocator en el Mac probado. Produjo un DOM completo y terminó correctamente.

## P: ¿Cómo puede separarse esta biblioteca después?

La biblioteca tiene un proyecto Mix y una superficie pública pequeña.

Mueva `lib/sdlc/reader/`, sus tareas Mix, dependencias, tests y fixtures a un repositorio dedicado.

Mantenga estables el contrato de metadatos y nombres de tareas `mise` durante la extracción.

## Referencias

- [Repositorio de Turndown](https://github.com/mixmark-io/turndown)
- [Mozilla Readability](https://github.com/mozilla/readability)
- [Referencia de Chrome Headless](https://developer.chrome.com/docs/automation-and-testing/headless-cli)
- [Registro IANA de direcciones IPv4 para uso especial](https://www.iana.org/assignments/iana-ipv4-special-registry/iana-ipv4-special-registry.xhtml)
- [Registro IANA de direcciones IPv6 para uso especial](https://www.iana.org/assignments/iana-ipv6-special-registry/iana-ipv6-special-registry.xhtml)
- [Floki](https://hexdocs.pm/floki/Floki.html)
- [Image](https://hexdocs.pm/image/Image.html)
- [Req](https://hexdocs.pm/req/Req.html)
- [MARKDOWN.md](MARKDOWN.md)
- [SECURITY.md](SECURITY.md)
- [DAGGER.md](DAGGER.md)
