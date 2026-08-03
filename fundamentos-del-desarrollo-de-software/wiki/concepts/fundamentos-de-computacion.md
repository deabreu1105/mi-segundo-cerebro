---
type: concept
created: 2026-08-03
updated: 2026-08-03
tags: [hardware, cpu, memoria, sistema-operativo, concurrencia, paralelismo]
related: [programacion-asincrona, niveles-de-abstraccion, mentalidad-de-arquitecto]
---

# Fundamentos de la Computación (Hardware y Sistema Operativo)

## Definition
Conjunto de principios físicos y de sistema que explican cómo el software se traduce en trabajo real sobre una máquina: el sistema binario y los transistores, la arquitectura **Von Neumann** (CPU + RAM + almacenamiento), la jerarquía de memoria, y el rol del sistema operativo como árbitro de procesos, hilos y recursos. Es la capa de abstracción más baja que un desarrollador de alto nivel necesita entender para razonar sobre rendimiento, escalabilidad y coste.

## Key Ideas
- **Binario y puertas lógicas:** un transistor tiene dos estados (1/0); miles de millones combinados forman puertas lógicas (AND, NOT, OR) que sustentan toda operación de cómputo.
- **Arquitectura Von Neumann:** unifica datos e instrucciones en la RAM, haciendo al ordenador reprogramable. La CPU ejecuta el ciclo **Fetch → Decode → Execute**.
- **Jerarquía de memoria:** Registros → Caché (L1/L2/L3) → RAM → Almacenamiento persistente — a mayor distancia de la CPU, mayor latencia (de nanosegundos a milisegundos).
- **Sistema Operativo como árbitro:** abstrae el hardware y gestiona recursos entre **Kernel Space** (acceso total) y **User Space** (privilegios restringidos).
- **Proceso vs. Hilo (Thread):** un proceso es una instancia aislada con memoria propia; los hilos comparten memoria dentro de un proceso — más eficientes, pero con riesgo de **condiciones de carrera** (race conditions).
- **Concurrencia ≠ Paralelismo:** concurrencia es alternar rápidamente entre tareas mediante *Time-Slicing* (sensación de simultaneidad, posible en un solo núcleo); paralelismo requiere múltiples núcleos físicos ejecutando exactamente al mismo tiempo.
- **Memoria virtual y swapping:** cuando la RAM no basta, el SO mueve datos al disco (Swap) — mucho más lento, degradando el rendimiento si el sistema depende de ello de forma crónica.

## Applications
- Diagnosticar por qué un programa es lento: ¿es un problema de algoritmo, o está sufriendo cache misses / swapping?
- Decidir entre hilos (I/O-bound, memoria compartida) y procesos (CPU-bound, aislamiento) al paralelizar una carga de trabajo.
- Auditar código generado por IA que introduce threads sin proteger el acceso a memoria compartida (condiciones de carrera).
- Dimensionar infraestructura (RAM, cores) para cargas de IA que manejan grandes volúmenes de datos en memoria.

## Examples
```text
Ciclo de instrucción de la CPU:
FETCH   → la CPU busca la siguiente instrucción en RAM
DECODE  → la CPU interpreta qué operación representa
EXECUTE → la CPU realiza la operación
```
```text
Concurrencia (1 núcleo):  Tarea A -- Tarea B -- Tarea A -- Tarea B  (alternancia rápida)
Paralelismo (2 núcleos):  Núcleo 1: Tarea A ----------------
                          Núcleo 2: Tarea B ----------------  (simultáneo real)
```

## Comparison
| Aspecto | Concurrencia | Paralelismo |
|---------|---------------|-------------|
| Requisito de hardware | Un solo núcleo basta | Requiere múltiples núcleos físicos |
| Mecanismo | Time-Slicing (Scheduler) | Ejecución simultánea real |
| Analogía | Un camarero atendiendo varias mesas | Varios camareros, cada uno con su mesa |
| Ejemplo en Python | `asyncio` (un solo hilo, cede el control en I/O) | `multiprocessing` (múltiples procesos/núcleos) |

## Sources
- [[wiki/sources/2026-08-03-fundamentos-computacion]] — binario, Von Neumann, jerarquía de memoria, SO, procesos/hilos, concurrencia vs. paralelismo, swapping.
- [[wiki/sources/2026-08-03-conclusiones-fundamentos-sistemas-redes]] — el hardware como base de toda la "pila tecnológica", síntesis final del Módulo 4.

## Related Concepts
[[programacion-asincrona]], [[niveles-de-abstraccion]], [[mentalidad-de-arquitecto]], [[redes-y-protocolos-tcp-ip]]

## Open Questions
- ¿Cómo se combina `asyncio` (concurrencia cooperativa en un solo hilo) con `multiprocessing` (paralelismo real) en aplicaciones con cargas mixtas I/O-bound y CPU-bound?

---

**Última actualización:** 2026-08-03
**Aparece en:** 2 fuentes
