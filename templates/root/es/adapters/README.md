# Registro de adaptadores

Seleccione herramientas después del descubrimiento. Registre fuente, versión, licencia, responsable y validación por capacidad.

La plantilla implementa inventario, comandos Python en primer plano, informes estáticos y captura opcional del navegador.
No configura gestor, nube, VPN, agentes nativos, versión Bunko, AppHost ni colector de telemetría.

## Registro requerido

Registre propósito, entradas, salidas, directorio, rutas permitidas, nombres de entorno, acceso de red y efectos.
Defina comprobaciones de éxito, error, cancelación, acceso denegado y limpieza. Registre plataforma y revisión probadas.
Mantenga credenciales y destinos específicos en configuración local ignorada.

## Herramientas Python

Ejecute la demostración con `python3 scripts/local_tools.py run demo --timeout 10`.
Genere su informe privado con `python3 scripts/local_tools.py report`.
Los comandos reciben solo ruta, idioma, directorio temporal y salida sin búfer.
Las tareas con otra configuración requieren un adaptador revisado. No incluya secretos en argumentos.

La captura requiere Playwright revisado y Chromium instalados por separado. El ejemplo bloquea todo tráfico WebSocket.
Ejecute `python3 scripts/capture_local.py http://127.0.0.1:8000 --seconds 3` para una página sintética revisada.
Esto observa la página; no graba recorridos completos ni aísla la red como control de seguridad.

Mantenga Python como primera implementación. Los adaptadores futuros deben pasar comprobaciones equivalentes.

Preparación opcional después de revisar dependencias fijadas:

```sh
python3 -m venv .venv-browser
.venv-browser/bin/python -m pip install -r runtime/browser-requirements.txt
.venv-browser/bin/python -m playwright install chromium
.venv-browser/bin/python scripts/capture_local.py http://127.0.0.1:8000 --seconds 3
```
