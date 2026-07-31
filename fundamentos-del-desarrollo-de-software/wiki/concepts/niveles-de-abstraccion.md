---
type: concept
created: 2026-07-30
updated: 2026-07-30
tags: [abstraccion, lenguajes-de-programacion, arquitectura]
related: [paradigmas-de-programacion, compilacion-e-interpretacion]
---

# Niveles de Abstracción (Lenguajes de Programación)

## Definition
Clasificación de los lenguajes de programación según su proximidad al hardware físico o a la lógica del pensamiento humano. Va desde el **bajo nivel** (binario, ensamblador — control total del hardware) hasta el **muy alto nivel/DSL** (Python, SQL — expresividad extrema, cercanía al lenguaje natural).

## Key Ideas
- **Bajo Nivel** (binario, Assembly): control absoluto del hardware y máxima velocidad, a costa de dificultad extrema y nula portabilidad.
- **Nivel Medio/Alto** (C, C++, Rust): alto rendimiento con sintaxis estructurada, pero gestión compleja de memoria.
- **Alto Nivel** (Java, C#, Go): seguridad de memoria y Garbage Collection, independencia de plataforma, con menor control directo del hardware.
- **Muy Alto Nivel/DSL** (Python, SQL, HTML/CSS): expresividad extrema y prototipado ultra rápido, a costa de menor velocidad bruta de ejecución.
- A mayor abstracción, menor control directo del hardware — es un trade-off, no una jerarquía de "mejor a peor".

## Applications
- Elegir el nivel de abstracción adecuado según requisitos no funcionales: sistemas embebidos/tiempo real (bajo/medio nivel) vs. prototipado de producto o IA (muy alto nivel).
- Justificar decisiones de arquitectura ante stakeholders de negocio en términos de velocidad de desarrollo vs. rendimiento.

## Examples
```text
Bajo Nivel:        01001000 01101111 01101100 01100001
Alto Nivel (Python): print("Hola")
```
Ambos ejemplos producen el mismo resultado observable, con niveles de abstracción radicalmente distintos sobre cómo se logra.

## Comparison
| Nivel | Ejemplos | Ventaja Principal | Desventaja Principal |
| --- | --- | --- | --- |
| **Bajo Nivel** | Binario, Assembly | Control absoluto, máxima velocidad | Dificultad extrema, sin portabilidad |
| **Medio/Alto** | C, C++, Rust | Rendimiento con estructura | Gestión compleja de memoria |
| **Alto Nivel** | Java, C#, Go | Seguridad de memoria, portabilidad | Menor control del hardware |
| **Muy Alto Nivel/DSL** | Python, SQL | Expresividad, prototipado rápido | Menor velocidad bruta |

## Sources
- [[wiki/sources/2026-07-30-introduccion-a-los-lenguajes-de-programacion]] — taxonomía completa de niveles de abstracción.

## Related Concepts
[[paradigmas-de-programacion]], [[compilacion-e-interpretacion]], [[python-como-lenguaje]]

## Open Questions
- ¿Qué métricas objetivas más allá de "velocidad de ejecución" deberían pesar al comparar dos lenguajes de niveles de abstracción distintos para un mismo proyecto?

---

**Última actualización:** 2026-07-30
**Aparece en:** 1 fuente
