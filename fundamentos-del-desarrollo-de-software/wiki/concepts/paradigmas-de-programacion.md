---
type: concept
created: 2026-07-30
updated: 2026-07-30
tags: [paradigmas, poo, programacion-funcional, declarativo, imperativo]
related: [niveles-de-abstraccion, programacion-orientada-a-objetos, funciones-de-orden-superior]
---

# Paradigmas de Programación

## Definition
Un **paradigma de programación** es un enfoque o filosofía fundamental que gobierna la estructura y organización del código: cómo se modela el problema, el estado y el flujo de control. La mayoría de lenguajes modernos son **multiparadigma**, permitiendo combinar distintos enfoques según el problema a resolver.

## Key Ideas
- **Imperativo/Procedural:** describe *cómo* calcular mediante una secuencia paso a paso de instrucciones y cambios de estado (C, Pascal, Bash).
- **Orientado a Objetos (POO):** modela datos y comportamientos en Objetos — clases, encapsulamiento, herencia, polimorfismo (Java, C++, C#, Python).
- **Funcional (FP):** modela el cómputo como evaluación de funciones matemáticas puras, evitando estados mutables (Haskell, Elixir, Scala, Clojure).
- **Declarativo:** describe *qué* resultado se desea sin especificar la secuencia detallada de pasos (SQL, Prolog, HTML).
- Ningún paradigma es universalmente superior — la elección depende del problema, y los lenguajes modernos (Python, JavaScript) permiten mezclarlos libremente.

## Applications
- Elegir el paradigma dominante de un módulo según su naturaleza: lógica de negocio con estado complejo → POO; transformaciones de datos → funcional; consultas → declarativo.
- Diseño de pipelines de datos combinando funciones puras (funcional) con clases de dominio (POO) en el mismo proyecto Python.

## Examples
```python
# Mismo problema, cuatro paradigmas distintos (simplificado)

# Imperativo
total = 0
for n in numeros:
    if n % 2 == 0:
        total += n

# Funcional
total = sum(filter(lambda n: n % 2 == 0, numeros))

# Orientado a Objetos
class Sumador:
    def sumar_pares(self, numeros):
        return sum(n for n in numeros if n % 2 == 0)

# Declarativo (SQL, conceptual)
# SELECT SUM(n) FROM numeros WHERE n % 2 = 0
```

## Comparison
| Paradigma | Enfoque Principal | Conceptos Clave | Lenguajes Representativos |
| --- | --- | --- | --- |
| **Imperativo** | *Cómo* calcular, paso a paso | Algoritmos secuenciales, estado mutable | C, Pascal, Bash |
| **Orientado a Objetos** | Datos + comportamiento en Objetos | Clases, Encapsulamiento, Herencia, Polimorfismo | Java, C++, C#, Python |
| **Funcional** | Evaluación de funciones puras | Inmutabilidad, higher-order functions | Haskell, Elixir, Scala, Clojure |
| **Declarativo** | *Qué* resultado se desea | Consultas, reglas lógicas | SQL, Prolog, HTML |

## Sources
- [[wiki/sources/2026-07-30-introduccion-a-los-lenguajes-de-programacion]] — taxonomía de los cuatro paradigmas principales.
- [[wiki/sources/2026-07-30-programacion-orientada-a-objetos]] — desarrollo completo del paradigma POO.
- [[wiki/sources/2026-07-30-programacion-funcional]] — desarrollo completo del paradigma funcional.

## Related Concepts
[[niveles-de-abstraccion]], [[programacion-orientada-a-objetos]], [[funciones-de-orden-superior]], [[python-como-lenguaje]]

## Open Questions
- ¿Qué criterios objetivos ayudan a decidir cuándo mezclar paradigmas en un mismo módulo empieza a dañar la legibilidad en vez de mejorarla?

---

**Última actualización:** 2026-07-30
**Aparece en:** 3 fuentes
