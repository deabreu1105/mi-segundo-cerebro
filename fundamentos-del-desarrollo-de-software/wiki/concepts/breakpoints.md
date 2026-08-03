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
- **Step Over vs. Step Into (implementación concreta en Python):** *Step Over* avanza a la siguiente línea sin entrar en las funciones llamadas (visión de alto nivel); *Step Into* profundiza en la lógica interna de una función llamada — clave para detectar fallos de modularidad.
- **Herramientas en Python:** `pdb` (Python Debugger, línea de comandos) y los depuradores integrados de IDEs (VS Code), que eliminan la necesidad de "adivinar" el estado interno del programa.

## Applications
- Depuración interactiva en IDEs (VS Code, IntelliJ, WebStorm) o con `pdb` desde terminal.
- Inspección de variables en memoria durante ejecuciones complejas.
- Validación de algoritmos en entornos de desarrollo local.

## Sources
- [[wiki/sources/2026-07-29-metodologias-de-resolucion-de-problemas]] — Breakpoints como herramienta del kit del detective digital por [[brais-moure]] / [[big-school]].
- [[wiki/sources/2026-08-03-depuracion-debugging-y-logging]] — implementación concreta en Python (`pdb`, VS Code) con demostración paso a paso de Step Over e Inspect sobre un bug real.

## Related Concepts
- [[metodologia-de-debugging]]
- [[stack-trace]]
- [[analisis-de-logs]]

## Open Questions
- ¿Cómo depurar eficientemente en entornos remotos o contenedores donde los breakpoints locales no pueden pausar hilos en tiempo real directamente?

---

**Última actualización:** 2026-08-03
**Aparece en:** 2 fuentes
