---
type: concept
created: 2026-07-29
updated: 2026-07-29
tags: [debugging, breakpoints, inspeccion, tiempo-real]
---

# Breakpoints (Puntos de Interrupción)

## Definition
Los **Breakpoints** (puntos de interrupción) son marcadores intencionales colocados por el desarrollador en líneas específicas del código fuente que instruyen al entorno de depuración (IDE o debugger) a pausar la ejecución del software en tiempo real.

## Key Ideas
- **Inspección de Estado:** Al pausar la ejecución, el desarrollador puede examinar el valor exacto de las variables en memoria, la pila de llamadas y el estado del entorno sin modificar el código.
- **Verificación de Flujo:** Permiten avanzar paso a paso (*step over*, *step into*, *step out*) para comprobar si los condicionales y reglas de negocio se evalúan en el orden esperado.
- **Breakpoints Condicionales:** Puntos de pausa que solo se activan cuando una condición lógica específica se cumple (útil en bucles masivos).

## Applications
- Depuración interactiva en IDEs (VS Code, IntelliJ, WebStorm).
- Inspección de variables en memoria durante ejecuciones complejas.
- Validación de algoritmos en entornos de desarrollo local.

## Sources
- [[wiki/sources/2026-07-29-metodologias-de-resolucion-de-problemas]] — Breakpoints como herramienta del kit del detective digital por [[brais-moure]] / [[big-school]].

## Related Concepts
- [[metodologia-de-debugging]]
- [[stack-trace]]
- [[analisis-de-logs]]

## Open Questions
- ¿Cómo depurar eficientemente en entornos remotos o contenedores donde los breakpoints locales no pueden pausar hilos en tiempo real directamente?
