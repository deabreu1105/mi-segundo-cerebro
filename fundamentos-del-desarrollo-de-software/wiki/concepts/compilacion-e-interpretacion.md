---
type: concept
created: 2026-07-30
updated: 2026-07-30
tags: [compilacion, interpretacion, fundamentos, programacion]
related: [sintaxis-y-semantica]
---

# Compilación e Interpretación

## Definition
Son las dos modalidades principales para traducir **Código Fuente** (escrito por el desarrollador) a **Código Máquina** (el único lenguaje que el procesador ejecuta directamente). La **compilación** traduce todo el programa de una vez a un binario ejecutable optimizado; la **interpretación** traduce y ejecuta línea por línea, en tiempo real, cada vez que el programa corre.

## Key Ideas
- **Compilación:** genera un binario ejecutable optimizado de una sola vez, antes de la ejecución (análogo a una traducción editorial previa).
- **Interpretación:** lee y traduce el código línea por línea en tiempo de ejecución (análogo a una traducción simultánea en vivo).
- Compilar da alta velocidad de ejecución pero exige recompilar antes de probar cualquier cambio.
- Interpretar da alta flexibilidad de desarrollo/depuración pero consume más recursos y ejecuta más lento.
- Saber cuándo priorizar inmediatez (intérprete) sobre robustez/velocidad (compilador) define la viabilidad de una arquitectura escalable.

## Applications
- Elegir stack tecnológico: lenguajes compilados (C++, Go, Rust) para sistemas de alto rendimiento; interpretados (Python, JavaScript) para iteración rápida y prototipado.
- Diseño de pipelines CI/CD: los pasos de build/compilación son un punto de fricción que los lenguajes interpretados evitan.

## Examples
```text
01001000 01101111 01101100 01100001
```
Representación en código máquina (binario) del texto `"Hola"` tras la traducción — el destino final de ambos procesos, compilado o interpretado.

## Comparison
| Aspecto | Compilación | Interpretación |
| --- | --- | --- |
| **Mecanismo** | Traduce todo el código una vez a binario. | Traduce línea por línea en cada ejecución. |
| **Ventaja** | Alta velocidad de ejecución. | Alta flexibilidad y depuración rápida. |
| **Desventaja** | Requiere recompilar tras cada cambio. | Mayor consumo computacional, menor velocidad. |

## Sources
- [[wiki/sources/2026-07-30-fundamentos-de-la-programacion-introduccion-y-sintaxis]] — la dualidad código fuente / código máquina.

## Related Concepts
[[sintaxis-y-semantica]]

## Open Questions
- ¿Cómo encajan los lenguajes híbridos (Java con bytecode + JIT, o JavaScript con motores V8 que compilan just-in-time) en esta dicotomía binaria?

---

**Última actualización:** 2026-07-30
**Aparece en:** 1 fuente
