---
type: concept
created: 2026-07-30
updated: 2026-07-30
tags: [scope, lifetime, ambito, memoria, programacion]
related: [variables-y-tipos-de-datos, funciones-y-parametros]
---

# Scope (Ámbito) y Lifetime (Tiempo de Vida)

## Definition
El **scope** (ámbito) determina desde qué partes del código es visible y accesible una variable. El **lifetime** (tiempo de vida) determina durante cuánto tiempo esa variable permanece asignada en memoria física. Ambos ejes son independientes: una variable puede tener scope global pero un lifetime limitado, o viceversa.

## Key Ideas
- **Scope Global:** accesible desde cualquier punto de la aplicación — se recomienda minimizar su uso para prevenir colisiones de nombres y efectos secundarios.
- **Scope Local/Bloque:** la variable existe solo dentro del bloque, función o módulo donde fue declarada.
- **Lifetime:** intervalo en que la variable permanece en memoria — una variable local se libera típicamente al finalizar la ejecución de su bloque.
- **Shadowing (sombreado):** ocurre cuando una variable local se declara con el mismo nombre que una global, ocultando temporalmente el acceso a la global dentro de ese bloque.

## Applications
- Diseño de funciones con scope local estricto para minimizar acoplamiento y efectos secundarios.
- Debugging de bugs "fantasma" causados por *shadowing* accidental (una variable local tapa sin querer a una global del mismo nombre).
- Gestión de memoria: entender el lifetime ayuda a razonar sobre cuándo se libera un recurso.

## Examples
```python
variable_global = "Acceso Global"

def mi_funcion():
    variable_local = "Solo dentro de la función"
    print(variable_global) # Válido

mi_funcion()
# print(variable_local) # ERROR: variable_local no existe en el scope global
```

## Comparison
| Aspecto | Scope Global | Scope Local/Bloque |
|---------|---------------|-------------|
| Visibilidad | Desde cualquier punto de la app | Solo dentro de su bloque/función |
| Riesgo principal | Colisiones de nombres, efectos secundarios | Ninguno relevante — es el default recomendado |
| Lifetime típico | Toda la ejecución del programa | Se libera al finalizar el bloque |

## Sources
- [[wiki/sources/2026-07-30-variables-tipos-de-datos-y-operadores]] — definición general de scope/lifetime.
- [[wiki/sources/2026-07-30-funciones-y-parametros]] — scope local de una función y el fenómeno de shadowing.

## Related Concepts
[[variables-y-tipos-de-datos]], [[funciones-y-parametros]]

## Open Questions
- ¿Qué reglas de linting detectan de forma fiable el *shadowing* no intencional antes de que cause un bug silencioso?

---

**Última actualización:** 2026-07-30
**Aparece en:** 2 fuentes
