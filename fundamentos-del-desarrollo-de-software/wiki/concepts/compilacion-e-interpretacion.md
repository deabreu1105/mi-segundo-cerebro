---
type: concept
created: 2026-07-30
updated: 2026-07-30
tags: [compilacion, interpretacion, hibrido, jit, fundamentos, programacion]
related: [sintaxis-y-semantica, niveles-de-abstraccion]
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
- **Modelo Híbrido/JIT** (Java, C#/.NET): el código fuente se compila a un código intermedio agnóstico (*Bytecode* o CIL) y una Máquina Virtual (JVM/CLR) lo traduce en tiempo de ejecución mediante un compilador *Just-In-Time* — no es puramente compilado ni puramente interpretado.

## Applications
- Elegir stack tecnológico: lenguajes compilados (C++, Go, Rust) para sistemas de alto rendimiento; interpretados (Python, JavaScript) para iteración rápida y prototipado.
- Diseño de pipelines CI/CD: los pasos de build/compilación son un punto de fricción que los lenguajes interpretados evitan.

## Examples
```text
01001000 01101111 01101100 01100001
```
Representación en código máquina (binario) del texto `"Hola"` tras la traducción — el destino final de ambos procesos, compilado o interpretado.

## Comparison
| Aspecto | Compilación | Interpretación | Híbrido/JIT |
| --- | --- | --- | --- |
| **Mecanismo** | Traduce todo el código una vez a binario. | Traduce línea por línea en cada ejecución. | Compila a bytecode intermedio; una VM lo traduce en ejecución. |
| **Ventaja** | Alta velocidad de ejecución. | Alta flexibilidad y depuración rápida. | Balance entre portabilidad y rendimiento. |
| **Desventaja** | Requiere recompilar tras cada cambio. | Mayor consumo computacional, menor velocidad. | Overhead de la máquina virtual. |
| **Ejemplos** | C, C++, Go, Rust | Python, Ruby, PHP | Java, C#/.NET |

## Sources
- [[wiki/sources/2026-07-30-fundamentos-de-la-programacion-introduccion-y-sintaxis]] — la dualidad código fuente / código máquina.
- [[wiki/sources/2026-07-30-introduccion-a-los-lenguajes-de-programacion]] — extensión con el tercer modelo híbrido/JIT y clasificación por lenguaje.

## Related Concepts
[[sintaxis-y-semantica]], [[niveles-de-abstraccion]]

## Open Questions
- ¿Cómo encajan los lenguajes híbridos (Java con bytecode + JIT, o JavaScript con motores V8 que compilan just-in-time) en esta dicotomía binaria?

---

**Última actualización:** 2026-07-30
**Aparece en:** 1 fuente
