---
type: concept
created: 2026-07-30
updated: 2026-07-30
tags: [tipado, tipos-de-datos, programacion]
related: [variables-y-tipos-de-datos]
---

# Tipado Estático vs. Dinámico

## Definition
Distinción sobre **cuándo** un lenguaje de programación determina y fija el tipo de una variable. El **tipado dinámico** evalúa el tipo en tiempo de ejecución y permite reasignarlo libremente. El **tipado estático** exige declarar el tipo explícitamente al crear la variable, y ese tipo no puede alterarse después.

## Key Ideas
- **Tipado Dinámico** (Python, JavaScript): mayor flexibilidad y velocidad de prototipado; los errores de tipo solo se detectan durante la ejecución.
- **Tipado Estático** (Java, C++, TypeScript): mayor seguridad, rendimiento optimizado en compilación y detección temprana de errores; a cambio, más rigidez sintáctica.
- No hay una opción "correcta" universal — es un trade-off entre velocidad de iteración (dinámico) y seguridad/detección temprana (estático).

## Applications
- Elección de lenguaje según fase del proyecto: prototipado rápido (dinámico) vs. sistemas críticos de producción a gran escala (estático).
- TypeScript como puente: añade tipado estático opcional sobre JavaScript dinámico para ganar seguridad sin perder su ecosistema.

## Examples
```python
# Tipado Dinámico (Python)
mi_variable = 10      # Evaluado como Integer
mi_variable = "Hola"  # Reasignado como String sin error sintáctico
```
```java
// Tipado Estático (Java)
int miVariable;
miVariable = 10;     // Válido
miVariable = "Hola"; // ERROR DE COMPILACIÓN
```

## Comparison
| Aspecto | Tipado Dinámico | Tipado Estático |
|---------|---------------|-------------|
| Cuándo se fija el tipo | En tiempo de ejecución | En tiempo de declaración/compilación |
| Ventaja | Flexibilidad, prototipado rápido | Seguridad, detección temprana de errores |
| Desventaja | Errores de tipo tardíos | Mayor rigidez y código más explícito |
| Ejemplos | Python, JavaScript | Java, C++, TypeScript |

## Sources
- [[wiki/sources/2026-07-30-variables-tipos-de-datos-y-operadores]] — definición y ejemplos comparativos de ambos.

## Related Concepts
[[variables-y-tipos-de-datos]]

## Open Questions
- ¿En qué medida el tipado gradual (TypeScript, Python con type hints) resuelve realmente el trade-off, o solo lo desplaza a tiempo de linting?

---

**Última actualización:** 2026-07-30
**Aparece en:** 1 fuente
