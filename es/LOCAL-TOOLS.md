# LOCAL-TOOLS

Ofrezca documentación, revisión, inspección de ejecución y evidencia del navegador como capacidades separadas.
Use Python para comandos y evidencia de referencia. Las aplicaciones pueden usar cualquier lenguaje compatible.

## Documentación y revisión

El espacio Bunko inspeccionado usa Zensical para Docs y Pierre Diffs para mostrar código en Review.
Pierre Diffs es la biblioteca de diffs.com. No es un gestor de tareas ni el flujo completo de revisión.
Separe selección de código, anotaciones, evidencia y decisiones de la biblioteca visual.
La plantilla genérica no redistribuye Bunko ni requiere acceso a su versión privada.

Use una versión fijada y aprobada cuando esté disponible. En otro caso, use Markdown y Git diff como base.
Documente versión, licencia, fuente, privacidad y responsable del visor elegido.
Conserve avisos originales al distribuir componentes abiertos. Mantenga anotaciones privadas fuera de documentación publicada.
Mostrar cambios no equivale a revisar su corrección. El revisor evalúa comportamiento, contratos, pruebas y riesgos.

## Inspección independiente del backend

| Capacidad | Límite portátil | Extensión específica |
| --- | --- | --- |
| Procesos | Comando, directorio, tiempo máximo y resultado | Adaptador Aspire u otro supervisor |
| Registros | Salida limitada con identidad de origen | Registros estructurados y ocultación de datos |
| Telemetría | Servicio, tiempo e identificadores de traza y segmento | SDK OpenTelemetry y colector local |
| Disponibilidad | Petición explícita y resultado esperado | Destino de salud del framework |
| Navegador | URL local aprobada y escenario reproducible | Inspección DOM, consola, red y accesibilidad |
| Evidencia | Captura, video, traza, revisiones y retención | Adaptador de automatización del navegador |
| Diagnóstico | Interfaces de aplicación de solo lectura | Introspección opcional con permisos explícitos |

Una tarea C++ puede usar el mismo contrato de comandos y evidencia que un servicio Python.
Inspeccionar objetos y evaluar código requiere adaptadores de lenguaje. No prometa estas capacidades para todos los backends.
El soporte OpenTelemetry varía por lenguaje y señal. Verifique SDK y exportador antes de afirmar que existen trazas o métricas.
Recopile localmente por defecto. Registre colector, retención, ocultación y límites reales de exportación.

## Herramientas Python de referencia

La plantilla incluye un ejecutor en primer plano y un informe HTML estático. No expone un servidor de control remoto.
Declare argumentos y directorios en la configuración local de tareas y ejecute explícitamente una tarea con nombre.
El ejecutor conserva salida combinada limitada, resultado, estado de espera agotada y directorio de artefactos.
El navegador solo muestra resultados. La instalación de dependencias y selección del entorno requieren acciones separadas.

```sh
python3 scripts/local_tools.py run demo --timeout 10
python3 scripts/local_tools.py report
```

La demostración emite salida sintética. Sustituya o añada tareas solo después de revisar sus efectos.
Las declaraciones son código ejecutable. Revise argumentos, directorio, entorno, red y salidas antes de ejecutar.
El ejecutor no es un aislamiento de seguridad. Use aislamiento del sistema o contenedor para tareas no confiables.
Ejecute aplicaciones persistentes en un supervisor aprobado y mantenga visible al responsable.

## Adaptadores de navegador y telemetría

El adaptador Python opcional usa Playwright. Instale por separado una versión revisada y su navegador en un entorno aislado.
El modo local permite peticiones HTTP solo al origen local seleccionado. Graba captura, video y observaciones de consola.
Use un contexto desechable y datos sintéticos. Las peticiones locales pueden cambiar estado, por lo que debe revisar la URL.
La captura básica observa una página. Añada pruebas revisadas de interacción para recorridos completos.

```sh
python3 scripts/capture_local.py http://127.0.0.1:8000 --seconds 3
```

Configure un colector OpenTelemetry local o el panel elegido para trazas y métricas.
Relacione su salida con el directorio de artefactos y la revisión de aplicación.
El ejecutor no implementa colector OTLP, depurador, editor DOM en vivo ni visor de trazas distribuidas.
Trátelos como adaptadores intercambiables con aceptación independiente, no como funciones implícitas.

## Aceptación y mantenimiento

Verifique comandos correctos y fallidos, espera máxima, cancelación, límites de salida y escape HTML del informe.
Al añadir navegador, verifique captura, video finalizado, petición externa bloqueada, evento de consola e interacción reproducible.
Al añadir telemetría, verifique una petición correlacionada con su traza. Declare instrumentación ausente.
Mantenga privados los artefactos hasta revisarlos y ocultar datos. Elimínelos según la política del equipo.
Registre plataformas no compatibles. La limpieza de procesos Python está dirigida actualmente a sistemas POSIX.

## Referencias

- [Documentación Zensical](https://zensical.org/docs/)
- [Documentación Pierre Diffs](https://diffs.com/docs)
- [Lenguajes OpenTelemetry](https://opentelemetry.io/docs/languages/)
- [Videos en Playwright Python](https://playwright.dev/python/docs/videos)
