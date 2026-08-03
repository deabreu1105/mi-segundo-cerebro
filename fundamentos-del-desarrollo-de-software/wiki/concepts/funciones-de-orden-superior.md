---
type: concept
created: 2026-07-30
updated: 2026-07-30
tags: [funciones-de-orden-superior, lambda, map-filter, programacion-funcional]
related: [funciones-puras-y-efectos-secundarios, funciones-y-parametros, paradigmas-de-programacion]
---

# Funciones de Orden Superior

## Definition
Una **función de primera clase** es aquella que un lenguaje trata como cualquier otro valor: puede asignarse a variables, pasarse como argumento o devolverse desde otra función. Una **función de orden superior** es, específicamente, una función que recibe una o más funciones como parámetros y/o devuelve una función como resultado.

## Key Ideas
- En Python, las funciones son objetos de primera clase — no hay distinción especial de sintaxis para tratarlas como datos.
- **`map(función, iterable)`** aplica una función a cada elemento de una colección y devuelve un iterador con los resultados.
- **`filter(función_booleana, iterable)`** conserva solo los elementos para los que la función devuelve `True`.
- **`lambda`** define funciones anónimas de una sola línea (`lambda parametros: expresion`), útiles como argumento rápido de `map`/`filter`/`sorted`.
- Python favorece las **List/Dict Comprehensions** sobre encadenar múltiples `map()`/`filter()` por legibilidad superior ("estilo pythónico").
- **`reduce(función, iterable)`** (de `functools`) combina todos los elementos de una secuencia en un único valor acumulado — cierra la tríada clásica `map`/`filter`/`reduce`.

## Applications
- Transformación y filtrado declarativo de colecciones sin bucles explícitos.
- Callbacks y estrategias intercambiables (pasar una función distinta según el contexto, ej. distintos criterios de ordenación con `sorted(key=...)`).
- Pipelines de procesamiento de datos legibles y testeables en proyectos de IA/Big Data.

## Examples
```python
def aplicar_operacion(func, x, y):
    return func(x, y)

resultado = aplicar_operacion(lambda a, b: a + b, 10, 20)  # 30

numeros = [1, 2, 3, 4, 5, 6]
pares_al_cuadrado = [x ** 2 for x in numeros if x % 2 == 0]  # Preferido sobre map+filter
```

## Comparison
| Enfoque | Legibilidad | Caso de uso típico |
|---------|---------------|-------------|
| `map()` + `filter()` encadenados | Media (requiere `list()` para materializar) | Transformaciones funcionales explícitas |
| **List Comprehension** | Alta (estilo recomendado en Python) | La mayoría de transformaciones/filtrados |
| `lambda` | Alta para expresiones simples de una línea | Argumento rápido de `sorted`, `map`, `filter` |

## Sources
- [[wiki/sources/2026-07-30-programacion-funcional]] — funciones de primera clase, orden superior, lambda, map/filter/comprehensions.
- [[wiki/sources/2026-07-30-asincronia-en-python]] — corrutinas como funciones de primera clase pasadas a `asyncio.gather`.
- [[wiki/sources/2026-08-03-programacion-funcional]] — añade `reduce()` y composición de funciones puras encadenadas en list comprehensions.
- [[wiki/sources/2026-08-03-conclusiones-lenguajes-programacion]] — la programación funcional como salto de calidad hacia transformaciones predecibles, síntesis final del bloque.

## Related Concepts
[[funciones-puras-y-efectos-secundarios]], [[funciones-y-parametros]], [[paradigmas-de-programacion]]

## Open Questions
- ¿En qué punto de complejidad una cadena de comprehensions anidadas deja de ser legible y conviene volver a un bucle explícito o una función nombrada?

---

**Última actualización:** 2026-08-03
**Aparece en:** 4 fuentes
