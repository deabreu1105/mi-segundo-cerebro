---
type: source
created: 2026-07-30
updated: 2026-07-30
tags: [python, sintaxis, tipos-de-datos, estructuras-de-datos, excepciones]
source: raw/papers/2026-07-30-bases-de-los-lenguajes-de-programacion.md
author: BIG School
---

# Bases de los Lenguajes de Programación en Python

## Metadata
- **Fuente original:** `raw/papers/2026-07-30-bases-de-los-lenguajes-de-programacion.md`
- **Autor:** [[big-school]]
- **Fecha:** 2026
- **Tipo de documento:** Paper / Documento Técnico (Módulo 0: Fundamentos del Desarrollo de Software)

## Summary
Primer aterrizaje concreto de los fundamentos universales (Módulo 2) en [[python-como-lenguaje|Python]] como lenguaje específico: variables con tipado dinámico y `snake_case`, tipos primitivos (`int`, `float`, `str`, `bool`), f-strings para formateo de texto, casting explícito, condicionales por indentación, bucles `while`/`for` con `range()` y `continue`, las cuatro estructuras de datos avanzadas (listas, tuplas, sets, diccionarios) y funciones con parámetros por defecto y manejo de excepciones `try/except`.

## Key Takeaways
1. **Tipado dinámico con inferencia:** Python infiere el tipo al asignar, sin declaración explícita, y permite reasignar libremente.
2. **F-strings** (`f"texto {variable}"`) son la forma moderna recomendada de formatear cadenas, incluyendo evaluación de expresiones dentro de las llaves.
3. **Cuatro estructuras de datos nativas:** listas (mutables, ordenadas), **tuplas (inmutables, ordenadas)**, sets (mutables, sin duplicados, con operadores de conjuntos `|`/`&`/`-`) y diccionarios (clave-valor).
4. **Indentación como sintaxis de bloque:** reemplaza las llaves de otros lenguajes para delimitar `if`/`elif`/`else`, bucles y funciones.
5. **`try/except`** evita el colapso abrupto ante errores previsibles (p. ej. `ValueError` al convertir texto a número).

## Detailed Breakdown

### 1. Visión General
Dominar la sintaxis de Python no es un fin en sí mismo, sino adquirir el lenguaje común para dirigir sistemas de IA de forma eficiente y segura — pasar de espectador a "director de orquesta" que valida, depura y optimiza soluciones generadas por máquinas.

### 2. Variables, Tipos de Datos y Operadores
- Tipado dinámico: el tipo se infiere al asignar (`age = 28` → `int`).
- Convención `snake_case` para nombres de variables.
- Tipos primitivos: `int`, `float`, `str`, `bool`.
- **F-strings:** `f"Mi rol es {role} en {company}."`, incluso con expresiones: `f"El doble de 5 es: {5 * 2}"`.
- **Casting explícito:** `int(age_str)` para convertir texto a entero y evitar errores de tipo incompatible.

### 3. Estructuras de Control de Flujo
- `if`/`elif`/`else` con indentación en vez de llaves.
- Bucle `while` con condición booleana.
- Bucle `for` con `range()`; `continue` para saltar iteraciones (ej. filtrar pares al imprimir impares).

### 4. Estructuras de Datos Avanzadas
- **Listas:** ordenadas y mutables, con índices negativos (`lista[-1]` accede al último elemento).
- **Tuplas:** ordenadas e **inmutables** — intentar modificar un elemento provoca `TypeError`.
- **Sets:** mutables, sin duplicados, con operadores matemáticos de conjuntos: unión (`|`), intersección (`&`), diferencia (`-`).
- **Diccionarios:** pares clave-valor, iterables con `.items()`.

### 5. Modularidad y Robustez con Funciones y Control de Excepciones
- Funciones con `def`, soporte de parámetros con valor por defecto (`rate=0.21`) invocables posicionalmente o por nombre (`rate=0.10`).
- `try/except` captura excepciones específicas (`ValueError`) sin colapsar el programa.

### 6. Conclusión
Dominar variables, f-strings, indentación, colecciones y excepciones en Python permite construir software limpio y auditable, habilitando al desarrollador para instruir y supervisar IA con rigor técnico.

## Diagrams & Visualizations
*(Esta fuente no incluye diagramas Mermaid — es una guía práctica de sintaxis con ejemplos de código directos.)*

## Code & Pseudocode Examples

### Variables y f-strings
```python
student_name = "Ana"
age = 28
is_active = True

role = "Desarrollador"
company = "BIG School"
message = f"Mi rol es {role} en {company}."
print(f"El doble de 5 es: {5 * 2}")
```

### Casting explícito
```python
age_str = input("¿Cuál es tu edad? ")
age_int = int(age_str)
print(f"El próximo año tendrás {age_int + 1} años.")
```

### Condicionales e indentación
```python
score = 75
if score >= 90:
    print("A (Sobresaliente)")
elif score >= 70:
    print("B (Notable)")
else:
    print("D (Suspenso)")
```

### Bucles con range() y continue
```python
for number in range(1, 6):
    if number % 2 == 0:
        continue  # Salta los números pares
    print(f"Impar: {number}")
```

### Listas, tuplas, sets y diccionarios
```python
languages = ["Python", "Java", "C#", "JavaScript"]
languages.append("Go")
languages.remove("Java")
print(languages[-1])  # "Go"

coordinates = (10.5, 20.1)
# coordinates[0] = 11.0  # Provoca TypeError

A = {1, 2, 3}
B = {3, 4, 5}
print(A | B)  # Unión: {1, 2, 3, 4, 5}
print(A & B)  # Intersección: {3}
print(A - B)  # Diferencia: {1, 2}

student = {"name": "Carlos", "age": 28, "course": "Máster en IA"}
for key, value in student.items():
    print(f"{key.capitalize()}: {value}")
```

### Funciones con parámetros por defecto
```python
def calculate_tax(base_price, rate=0.21):
    """Calcula el impuesto aplicado a un precio base."""
    return base_price * rate

print(calculate_tax(1000))             # 210.0
print(calculate_tax(1000, rate=0.10))  # 100.0
```

### Manejo de excepciones
```python
age_str = input("Introduce tu edad: ")
try:
    age_int = int(age_str)
    print(f"Tu edad es {age_int}.")
except ValueError:
    print("Error: Por favor, introduce un número válido.")
```

## Entities Mentioned
- [[big-school]]

## Concepts Discussed
- [[python-como-lenguaje]]
- [[variables-y-tipos-de-datos]]
- [[condicionales]]
- [[bucles]]
- [[estructuras-de-datos]]
- [[funciones-y-parametros]]
- [[manejo-de-errores-y-excepciones]]

## Notable Quotes
> "Entender los fundamentos de Python permite pasar de ser un espectador a un director de orquesta capaz de validar, depurar y optimizar las soluciones propuestas por las máquinas."

## Connections & Reflections
- Es la aplicación concreta en Python de prácticamente todo el Módulo 2: [[variables-y-tipos-de-datos]], [[condicionales]], [[bucles]], [[estructuras-de-datos]] y [[funciones-y-parametros]] reaparecen aquí con sintaxis real, no pseudocódigo.
- Introduce la **Tupla** como estructura de dato inmutable — no estaba en el catálogo original de [[estructuras-de-datos]] (que cubría array/lista/pila/cola/mapa/set); se añade ahí en esta ingesta.
- Confirma (no contradice) que Python es tipado dinámico, tal como ya indicaba [[tipado-estatico-vs-dinamico]] del Módulo 2.

## Open Questions
- ¿En qué punto la preferencia por f-strings sobre `.format()` o `%` dejó de ser estilística para convertirse en el estándar de facto recomendado por la comunidad?

## Related Sources
- [[wiki/sources/2026-07-30-introduccion-a-los-lenguajes-de-programacion]] — Python como lenguaje muy alto nivel/interpretado.
- [[wiki/sources/2026-07-30-variables-tipos-de-datos-y-operadores]] — versión agnóstica de lenguaje de este mismo contenido.
- [[wiki/sources/2026-07-30-estructuras-de-datos]] — catálogo original de estructuras que aquí se extiende con la tupla.

---

**Estado:** ✅ Completamente procesado e integrado en el wiki
