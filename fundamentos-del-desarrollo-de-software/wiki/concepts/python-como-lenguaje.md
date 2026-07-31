---
type: concept
created: 2026-07-30
updated: 2026-07-30
tags: [python, sintaxis, ecosistema, ia]
related: [variables-y-tipos-de-datos, tipado-estatico-vs-dinamico, estructuras-de-datos]
---

# Python (como Lenguaje)

## Definition
**Python** es el lenguaje concreto elegido por este módulo para aterrizar los fundamentos universales de programación: interpretado, de tipado dinámico, muy alto nivel y multiparadigma (soporta imperativo, POO y funcional). Es, según las fuentes de este wiki, el estándar de facto en Inteligencia Artificial y ciencia de datos.

## Key Ideas
- **Interpretado y de tipado dinámico:** el tipo de una variable se infiere al asignar valor, sin declaración explícita ([[tipado-estatico-vs-dinamico]]).
- **Convención `snake_case`** para variables y funciones; `PascalCase` para clases.
- **F-strings** (`f"texto {variable}"`) son la forma moderna recomendada de formatear cadenas, con soporte de expresiones evaluadas dentro de las llaves.
- **Casting explícito** con funciones builtin (`int()`, `float()`, `str()`) para convertir entre tipos y evitar errores de incompatibilidad.
- **Multiparadigma:** incorpora herramientas funcionales (`map`, `filter`, `lambda`, comprehensions) y orientadas a objetos (clases, herencia, polimorfismo) sin imponer un único estilo.
- **Indentación como sintaxis de bloque**, reemplazando las llaves `{}` de otros lenguajes.

## Applications
- Prototipado rápido y desarrollo de modelos de IA/Machine Learning (ecosistema maduro: NumPy, pandas, PyTorch, etc.).
- Scripting de automatización y herramientas internas gracias a su curva de aprendizaje baja.
- Dirección y validación de código generado por LLMs — el "lenguaje común" para supervisar salidas de IA.

## Examples
```python
role = "Desarrollador"
company = "BIG School"
message = f"Mi rol es {role} en {company}."

age_str = input("¿Cuál es tu edad? ")
age_int = int(age_str)  # Casting explícito
```

## Comparison
| Aspecto | Python | Lenguajes de tipado estático (Java, C++) |
|---------|---------------|-------------|
| Tipado | Dinámico, inferido | Estático, declarado explícitamente |
| Velocidad de prototipado | Alta | Menor, requiere más código explícito |
| Rendimiento bruto | Menor (interpretado) | Mayor (compilado) |
| Ecosistema dominante | IA, Data Science, scripting | Sistemas empresariales, Android (Java) |

## Sources
- [[wiki/sources/2026-07-30-bases-de-los-lenguajes-de-programacion]] — sintaxis básica: variables, f-strings, casting, control de flujo, estructuras de datos, funciones y excepciones.
- [[wiki/sources/2026-07-30-introduccion-a-los-lenguajes-de-programacion]] — Python como ejemplo de lenguaje muy alto nivel e interpretado.
- [[wiki/sources/2026-07-30-introduccion-a-los-lenguajes-de-programacion-conclusiones-generales]] — Python como estándar de facto en IA y ciencia de datos.

## Related Concepts
[[variables-y-tipos-de-datos]], [[tipado-estatico-vs-dinamico]], [[estructuras-de-datos]], [[paradigmas-de-programacion]]

## Open Questions
- ¿Qué mecanismos de tipado gradual (type hints + mypy) mitigan las desventajas del tipado dinámico en proyectos Python de gran escala?

---

**Última actualización:** 2026-07-30
**Aparece en:** 3 fuentes
