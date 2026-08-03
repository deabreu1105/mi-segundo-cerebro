---
type: source
created: 2026-08-03
updated: 2026-08-03
tags: [python, sintaxis, tipado-dinamico, estructuras-de-datos, excepciones]
source: raw/papers/2026-08-03-bases-lenguajes-programacion.md
author: BIG School
---

# Bases de los Lenguajes de Programación (Python — Segunda Pasada)

## Metadata
- **Fuente original:** `raw/papers/2026-08-03-bases-lenguajes-programacion.md`
- **Autor:** [[big-school]]
- **Fecha:** 2026
- **Tipo de documento:** Documento Técnico / Material de Curso (Módulo 0: Fundamentos del Desarrollo de Software — Máster Desarrollo con IA)

## Summary
Recorrido extenso por la sintaxis básica de Python, encuadrado en la idea de que la IA es "un multiplicador de fuerza" que no funciona sin fundamentos técnicos ("no se puede multiplicar por cero"). Cubre tipado dinámico y tipos primitivos, f-strings, casting de `input()`, condicionales con indentación crítica, bucles `while`/`for` con `continue`, las cuatro colecciones nativas (listas, tuplas, sets con operaciones de conjuntos, diccionarios), funciones con parámetros por defecto y docstrings, y manejo de errores con `try/except`. Incluye una sección extensa de "Ejemplos Relacionados" con ejercicios reales resueltos.

## Key Takeaways
1. **Tipado dinámico:** Python infiere el tipo de una variable y permite cambiarlo en tiempo de ejecución sin declaración explícita — mayor agilidad, mayor responsabilidad del programador.
2. **F-strings** permiten incrustar expresiones evaluables (`f"El doble de 5 es: {5 * 2}"`), no solo variables — más legibles y rápidas que la concatenación con `+`.
3. **Casting explícito** (`int()`, `float()`) es obligatorio para operar sobre `input()`, que siempre devuelve `str`; es una fuente común de errores si no se envuelve en `try/except ValueError`.
4. **Indentación no es estética, es sintaxis:** en Python define qué instrucciones pertenecen a qué bloque condicional/bucle/función.
5. **Sets soportan álgebra de conjuntos completa:** unión (`|`), intersección (`&`), diferencia (`-`) y diferencia simétrica (`^`), con sus equivalentes en métodos (`.union()`, `.intersection()`, etc.).
6. **Diccionarios se iteran con `.items()`**, devolviendo pares clave-valor en cada vuelta — acceso semántico por clave, no por índice numérico.
7. **Filosofía de comentarios:** deben explicar el "por qué" de una decisión, no el "qué" — que ya debería ser evidente por la claridad del lenguaje.

## Detailed Breakdown

### 1. Gestión de Datos y Tipado Dinámico
Las variables son etiquetas de memoria. El tipado dinámico de Python permite reasignar tipos distintos a la misma variable sin interrumpir el flujo (ej. una variable pasa de `str` a `int` sin declaración previa). Los tipos primitivos son `int`, `float`, `str` y `bool`. Las f-strings (`f"..."`) son la forma moderna de interpolar texto, superando en legibilidad a la concatenación con `+`, y permiten ejecutar expresiones dentro de las llaves.

### 2. Entrada de Usuario y Casting
`input()` siempre devuelve `str`. Sumar directamente ese resultado con un número produce error; la solución es el casting explícito (`int(edad_str)`), asumiendo que el dato introducido es válido — lo cual conecta directamente con la necesidad de `try/except`.

### 3. Lógica de Control y Estructuras de Decisión
Los bloques `if`/`elif`/`else` se delimitan exclusivamente por indentación (espacios o tabs), no por llaves — un error de espaciado es un fallo funcional, no solo estético. El bucle `while` es ideal cuando la repetición depende de una condición que debe revalidarse constantemente; el `for` destaca al iterar sobre rangos o colecciones. El principio **DRY** (Don't Repeat Yourself) es el motivo de fondo para usar bucles.

### 4. Arquitectura de Datos y Modularidad — Colecciones
- **Listas:** mutables y ordenadas (`[ ]`), soportan índices negativos, `.append()`, `.remove()`.
- **Tuplas:** inmutables (`( )`) — intentar modificarlas lanza `TypeError`.
- **Sets:** no ordenados, sin duplicados (`{ }`), con operaciones de conjuntos completas: unión, intersección, diferencia y diferencia simétrica (operador y método equivalente para cada una).
- **Diccionarios:** pares clave-valor (`{ }`), acceso semántico por clave, iteración con `.items()`.

Las funciones empaquetan lógica reutilizable, con soporte de parámetros por defecto (`tasa=0.21`) y docstrings (`"""..."""`) como documentación embebida. El manejo robusto de errores usa `try/except` (ej. `except ValueError`) para capturar fallos de casting sin que el programa colapse.

### 5. Observaciones Clave
- La IA puede generar código erróneo o inseguro; la supervisión humana basada en fundamentos técnicos es el único filtro de calidad fiable.
- La indentación es un requisito sintáctico, no opcional.
- El casting es fuente común de errores; debe envolverse siempre en control de excepciones.
- Las f-strings permiten ejecutar pequeñas porciones de código dentro de la cadena, no solo mostrar variables.
- Los comentarios deben explicar el "por qué" de una decisión estratégica, no el "qué", que ya debería ser evidente por la claridad del lenguaje.

### 6. Conclusión
Entender la mecánica interna de Python (variables, control de flujo, gestión de excepciones) da el criterio para auditar la lógica generada automáticamente por IA, asegurando que la integración tecnológica en la empresa sea solvente.

## Code & Pseudocode Examples

### Tipado dinámico y f-strings
```python
nombre_estudiante = "Ana"
edad = 28
esta_activo = True

rol = "Desarrollador"
empresa = "BIG school"
mensaje_moderno = f"Mi rol es {rol} en {empresa}."
print(f"El doble de 5 es: {5 * 2}")
```

### Casting de input()
```python
edad_str = input("¿Cuál es tu edad? ")
edad_int = int(edad_str)
print(f"El próximo año tendrás {edad_int + 1} años.")
```

### Sets — álgebra de conjuntos
```python
A = {1, 2, 3}
B = {3, 4, 5}

print(A | B)  # Unión -> {1, 2, 3, 4, 5}
print(A & B)  # Intersección -> {3}
print(A - B)  # Diferencia -> {1, 2}
print(A ^ B)  # Diferencia simétrica -> {1, 2, 4, 5}
```

### Diccionarios — iteración con .items()
```python
estudiante = {"nombre": "Carlos", "edad": 28, "curso": "Máster en IA", "esta_activo": True}
for clave, valor in estudiante.items():
    print(f"{clave.capitalize()}: {valor}")
```

### Funciones con parámetro por defecto
```python
def calcular_impuesto(precio_base, tasa=0.21):
    return precio_base * tasa

print(calcular_impuesto(1000))              # 21% por defecto
print(calcular_impuesto(1000, tasa=0.10))   # 10% explícito
```

### Try/Except sobre casting
```python
edad_str = input("Introduce tu edad: ")
try:
    edad_int = int(edad_str)
    print(f"Tu edad es {edad_int}.")
except ValueError:
    print("Error: Por favor, introduce un número válido.")
print("El programa continúa ejecutándose...")
```

## Entities Mentioned
- [[big-school]]

## Concepts Discussed
- [[python-como-lenguaje]]
- [[estructuras-de-datos]]
- [[manejo-de-errores-y-excepciones]]
- [[funciones-y-parametros]]

## Notable Quotes
> "No se puede multiplicar por cero" — sobre la IA como multiplicador de fuerza que requiere una base de conocimiento técnico real para generar valor.

> "Los comentarios deben utilizarse para explicar el 'por qué' de una decisión estratégica de código, no para describir el 'qué', que ya debería ser evidente por la claridad del lenguaje."

## Connections & Reflections
- Es la segunda pasada sobre el mismo terreno que [[wiki/sources/2026-07-30-bases-de-los-lenguajes-de-programacion]] (ya integrado en [[python-como-lenguaje]]) — no contradice nada, pero **añade el álgebra de conjuntos completa sobre sets** (unión/intersección/diferencia/diferencia simétrica) que la fuente original no detallaba, extendiendo [[estructuras-de-datos]].
- Refuerza con un ejemplo concreto la distinción `try/except ValueError` ya cubierta por [[manejo-de-errores-y-excepciones]] desde el Módulo 2.
- La filosofía de comentarios ("por qué", no "qué") es una observación nueva que no estaba en ninguna fuente previa del wiki — buena práctica transversal a cualquier lenguaje.

## Open Questions
- ¿Qué convención de documentación (docstrings, type hints) debería exigirse como mínimo en un equipo que combina desarrolladores humanos y código generado por IA?

## Related Sources
- [[wiki/sources/2026-07-30-bases-de-los-lenguajes-de-programacion]] — primera pasada sobre la misma sintaxis básica de Python.
- [[wiki/sources/2026-07-30-estructuras-de-datos]] — taxonomía agnóstica de lenguaje de arrays, pilas, colas, mapas y sets.
- [[wiki/sources/2026-07-30-manejo-de-errores-y-excepciones]] — taxonomía de errores y TRY/CATCH/FINALLY en términos generales.

---

**Estado:** ✅ Completamente procesado e integrado en el wiki
