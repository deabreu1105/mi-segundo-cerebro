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

## Applications
- Interactuar con APIs externas o modelos de IA (OpenAI, Claude) sin bloquear el resto de la aplicación mientras se espera la respuesta.
- Servidores web que atienden múltiples peticiones concurrentes sin necesitar un hilo por petición.
- Sincronización eficiente entre microservicios y bases de datos distribuidas.

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

## Related Concepts
[[funciones-de-orden-superior]], [[python-como-lenguaje]]

## Open Questions
- ¿Cómo se combina `asyncio` con paralelismo real de CPU (`multiprocessing`) en aplicaciones con cargas simultáneas I/O-bound y CPU-bound?

---

**Última actualización:** 2026-07-30
**Aparece en:** 1 fuente
