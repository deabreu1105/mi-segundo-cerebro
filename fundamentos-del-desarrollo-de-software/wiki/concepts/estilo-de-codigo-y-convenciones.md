---
type: concept
created: 2026-08-03
updated: 2026-08-03
tags: [estilo, pep8, nomenclatura, docstrings, linters, python]
related: [funciones-y-parametros, python-como-lenguaje, deuda-tecnica, refactorizacion]
---

# Estilo de Código y Convenciones (PEP 8)

## Definition
Conjunto de convenciones de escritura de código orientadas a la legibilidad humana, no a la ejecución de la máquina. En Python se formaliza en la guía **PEP 8**, cuya convención central es `snake_case` para variables/funciones. Incluye reglas de nomenclatura, la eliminación de "números mágicos", la distinción entre comentarios y docstrings, y el uso de herramientas de automatización (linters, formatters) para garantizar consistencia sin depender de la memoria del desarrollador.

## Key Ideas
- **El código se escribe para humanos:** la máquina solo procesa binario; el código es un ejercicio de redacción técnica dirigido a otros desarrolladores y al propio "yo" futuro.
- **Cuatro reglas de nomenclatura:** (1) ser descriptivo y específico (evitar `l`, `n` salvo contadores triviales), (2) seguir PEP 8/`snake_case`, (3) sustantivos para variables (`active_users`) y verbos para funciones (`calculate_final_price`), (4) eliminar "números mágicos" encapsulándolos en constantes con nombre (`SECONDS_PER_HOUR`).
- **Comentarios vs. Docstrings:** los comentarios explican el "por qué" (decisiones no evidentes); los docstrings documentan formalmente `Args:` y `Returns:` de una función — el estándar profesional en Python.
- **Linters** (Flake8, Pylint) detectan errores de estilo y bugs potenciales por análisis estático; **Formatters** (Black, autopep8) reformatean automáticamente el código al guardar.
- Especialmente crítico al supervisar código generado por IA: los linters/formatters garantizan consistencia sin debate manual, liberando al profesional para enfocarse en lógica y arquitectura.

## Applications
- Establecer un linter + formatter (ej. Pylint + Black) como parte del pipeline de CI/CD o pre-commit hook de cualquier proyecto Python.
- Revisar nomenclatura en code review: ¿el nombre de la variable/función revela su intención sin necesitar leer su implementación?
- Auditar código generado por IA verificando que no introduzca números mágicos ni nombres genéricos (`data`, `temp`, `x`).

## Examples
```python
# Números mágicos vs. constantes con nombre
SECONDS_PER_MINUTE = 60
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
seconds_in_a_day = HOURS_PER_DAY * MINUTES_PER_HOUR * SECONDS_PER_MINUTE

def calculate_final_price(base_price, tax_rate, discount=0):
    """Calcula el precio final aplicando impuestos y un descuento opcional.
    Args:
        base_price (float): El precio base del producto.
        tax_rate (float): La tasa de impuesto (ej. 0.21 para 21%).
        discount (float, optional): El descuento a aplicar. Defaults to 0.
    Returns:
        float: El precio final calculado.
    """
```

## Comparison
| Herramienta | Tipo | Qué hace | Ejemplos Python |
|---------|---------------|-------------|-------------|
| **Linter** | Análisis estático | Avisa de errores de estilo y bugs potenciales, sin modificar el código | Flake8, Pylint |
| **Formatter** | Reescritura automática | Reformatea el código para cumplir reglas de estilo al guardar | Black, autopep8 |

## Sources
- [[wiki/sources/2026-08-03-estilo-del-codigo]] — PEP 8, reglas de nomenclatura, números mágicos, docstrings, linters/formatters.
- [[wiki/sources/2026-08-03-conclusiones-buenas-practicas-desarrollo-software]] — la legibilidad como "empatía operativa", síntesis final del Módulo 5.

## Related Concepts
[[funciones-y-parametros]], [[python-como-lenguaje]], [[deuda-tecnica]], [[refactorizacion]]

## Open Questions
- ¿Qué reglas adicionales de PEP 8 (longitud máxima de línea, orden de imports, espaciado) merecen documentación específica más allá de nomenclatura y SRP?

---

**Última actualización:** 2026-08-03
**Aparece en:** 2 fuentes
