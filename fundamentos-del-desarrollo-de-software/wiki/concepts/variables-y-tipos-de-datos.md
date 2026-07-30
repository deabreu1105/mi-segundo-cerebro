---
type: concept
created: 2026-07-30
updated: 2026-07-30
tags: [variables, tipos-de-datos, operadores, fundamentos, programacion]
related: [tipado-estatico-vs-dinamico, paso-por-valor-vs-referencia, scope-y-lifetime]
---

# Variables y Tipos de Datos

## Definition
Una **variable** es un contenedor etiquetado que almacena un valor en memoria, con un ciclo de vida de tres fases: declaración (notificar su existencia), inicialización (asignar el valor inicial) y asignación/mutación (modificar el estado almacenado). El **tipo de dato** define qué clase de valor puede contener y qué operaciones son válidas sobre él (enteros, decimales, booleanos, caracteres, strings).

## Key Ideas
- Ciclo de vida: declaración → inicialización → asignación/mutación.
- Convenciones de nomenclatura: `camelCase` (JS/Java/TS), `snake_case` (Python/Rust/Ruby), `PascalCase` (clases/tipos/interfaces en la mayoría de lenguajes).
- La coerción de tipos es automática e implícita (`"5" + 2 = "52"`); el casting es explícito y consciente (`(int) 3.99 = 3`).
- Los operadores (aritméticos, de asignación, comparación, lógicos) son los mecanismos para transformar y comparar esos valores.
- Una nomenclatura pobre no es un problema estético: es una fuente directa de [[deuda-tecnica]].

## Applications
- Diseño de esquemas de datos y validación de entradas de usuario.
- Convenciones de estilo de equipo (linters, guías de nomenclatura) para reducir deuda técnica.
- Elección de operadores lógicos como base de algoritmos de decisión ([[condicionales]]).

## Examples
```javascript
resultado = "5" + 2;  // Coerción implícita → "52" (String)
```
```c
int entero = (int) 3.99;  // Casting explícito → 3
```

## Comparison
| Aspecto | Coerción (implícita) | Casting (explícito) |
|---------|---------------|-------------|
| Quién la ejecuta | El propio lenguaje, automáticamente | El desarrollador, a propósito |
| Previsibilidad | Puede sorprender (concatenación vs. suma) | Predecible, es una decisión consciente |

## Sources
- [[wiki/sources/2026-07-30-variables-tipos-de-datos-y-operadores]] — ciclo de vida, tipado, coerción/casting y operadores.
- [[wiki/sources/2026-07-30-fundamentos-de-la-programacion-conclusiones]] — variables como "materia prima" de todo programa.

## Related Concepts
[[tipado-estatico-vs-dinamico]], [[paso-por-valor-vs-referencia]], [[scope-y-lifetime]], [[deuda-tecnica]]

## Open Questions
- ¿Qué convenciones de linting detectan de forma más fiable la confusión entre `=` (asignación) y `==` (comparación) antes de producción?

---

**Última actualización:** 2026-07-30
**Aparece en:** 2 fuentes
