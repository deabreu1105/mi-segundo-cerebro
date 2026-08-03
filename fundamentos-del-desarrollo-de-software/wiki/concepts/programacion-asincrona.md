---
type: concept
created: 2026-07-30
updated: 2026-07-30
tags: [asincronia, asyncio, concurrencia, io-bound]
related: [funciones-de-orden-superior, python-como-lenguaje]
---

# Programación Asíncrona

## Definition
La **programación asíncrona** permite que una aplicación inicie una tarea de larga duración (típicamente de red o I/O) y continúe ejecutando otras tareas mientras espera su finalización, en vez de bloquear el hilo principal hasta que termine (como hace el modelo síncrono convencional). En Python se implementa con la librería `asyncio` y las palabras clave `async`/`await`.

## Key Ideas
- **`async def`** define una corrutina; **`await`** pausa su ejecución cediendo el control al *event loop* mientras espera una operación de I/O, sin bloquear la aplicación.
- **No acelera cómputo (CPU-bound):** su valor está en optimizar tiempos de espera (**I/O-bound**) — peticiones de red, consultas a bases de datos, lectura/escritura de archivos.
- **`asyncio.gather()`** ejecuta múltiples corrutinas de forma concurrente: dos tareas de 5 segundos cada una completan en ~5s totales, no 10s.
- Analogía del maestro de ajedrez: no piensa más rápido, simplemente elimina los tiempos muertos entre movimientos.
- Regla dura: nunca mezclar funciones bloqueantes síncronas (`time.sleep()`) dentro de una corrutina — usar siempre su equivalente asíncrono (`asyncio.sleep()`).
- **Analogía del maestro de ajedrez:** no piensa más rápido, elimina el tiempo de inactividad moviéndose entre "mesas" (tareas) mientras cada rival (operación I/O) responde.
- **Es concurrencia, no paralelismo:** `asyncio` ejecuta en un solo hilo mediante *Time-Slicing* cooperativo — cede el control durante la espera de I/O, pero no usa múltiples núcleos físicos simultáneamente. Ver [[fundamentos-de-computacion]] para la distinción formal concurrencia/paralelismo.

## Applications
- Interactuar con APIs externas o modelos de IA (OpenAI, Claude) sin bloquear el resto de la aplicación mientras se espera la respuesta.
- Servidores web que atienden múltiples peticiones concurrentes sin necesitar un hilo por petición.
- Sincronización eficiente entre microservicios y bases de datos distribuidas.
- Consultar simultáneamente varios modelos de IA (ej. un LLM de texto + un motor de análisis de imagen) para generar un informe consolidado.

## Examples
```python
import asyncio

async def order_coffee():
    print("Pidiendo un café...")
    await asyncio.sleep(3)
    print("¡Café listo!")

asyncio.run(order_coffee())
```
```python
async def main():
    await asyncio.gather(order_pizza_async(), order_pizza_async())
    # ~5s totales en vez de 10s secuenciales
```

## Comparison
| Aspecto | Síncrono | Asíncrono |
|---------|---------------|-------------|
| Al esperar una respuesta de red | Bloquea el hilo principal | Cede el control, ejecuta otras tareas |
| Mejor para | Cómputo intensivo de CPU | Operaciones I/O-bound |
| Mecanismo Python | Ejecución secuencial normal | `async`/`await` + `asyncio` |

## Sources
- [[wiki/sources/2026-07-30-asincronia-en-python]] — asyncio, async/await, event loop, I/O-bound vs. CPU-bound.
- [[wiki/sources/2026-08-03-asincronia]] — analogía del maestro de ajedrez, diagrama de secuencia de `asyncio.gather` y aplicabilidad en negocios/IA.
- [[wiki/sources/2026-08-03-conclusiones-lenguajes-programacion]] — la asincronía como "técnica maestra" de agilidad y rendimiento, síntesis final del bloque.
- [[wiki/sources/2026-08-03-fundamentos-computacion]] — encuadra `asyncio` formalmente como concurrencia cooperativa de un solo hilo, no paralelismo.

## Related Concepts
[[funciones-de-orden-superior]], [[python-como-lenguaje]], [[fundamentos-de-computacion]]

## Open Questions
- ¿Cómo se combina `asyncio` con paralelismo real de CPU (`multiprocessing`) en aplicaciones con cargas simultáneas I/O-bound y CPU-bound?

---

**Última actualización:** 2026-08-03
**Aparece en:** 4 fuentes
