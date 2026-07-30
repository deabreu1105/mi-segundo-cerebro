---
type: concept
created: 2026-07-30
updated: 2026-07-30
tags: [funciones-puras, efectos-secundarios, testing, programacion]
related: [funciones-y-parametros, paso-por-valor-vs-referencia]
---

# Funciones Puras y Efectos Secundarios

## Definition
Una **función pura** produce siempre el mismo resultado para los mismos argumentos y no modifica ningún estado externo — es totalmente determinista. Un **efecto secundario** (*side effect*) es cualquier modificación de estado fuera del ámbito local de la función: alterar variables globales, escribir en disco, hacer una petición de red.

## Key Ideas
- Las funciones puras son fáciles de probar en pruebas unitarias porque su resultado depende exclusivamente de sus entradas.
- Los efectos secundarios pueden generar comportamientos imprevistos si no se gestionan con cuidado — especialmente al combinarse con [[paso-por-valor-vs-referencia|paso por referencia]].
- Preferir funciones puras siempre que sea posible mejora la mantenibilidad y la previsibilidad del sistema.
- No toda función puede ser pura: imprimir en pantalla, escribir logs o consultar una base de datos son efectos secundarios necesarios — la disciplina consiste en aislarlos, no eliminarlos.

## Applications
- Diseño de lógica de negocio central como funciones puras, dejando I/O (red, disco, UI) en una capa separada y explícita.
- Facilitar el testing: una función pura no necesita mocks para sus dependencias porque no tiene ninguna.
- Depuración: cuando un bug es difícil de reproducir, sospechar primero de funciones con efectos secundarios ocultos.

## Examples
```python
# Función pura: mismo resultado para los mismos argumentos, sin tocar nada externo
def sumar(a, b):
    return a + b

# Función con efecto secundario: modifica el estado externo (la lista recibida)
def agregar_item(lista):
    lista.append("Nuevo Elemento")
```

## Comparison
| Aspecto | Función Pura | Efecto Secundario |
|---------|---------------|-------------|
| Determinismo | Total — mismos argumentos, mismo resultado | Puede variar según estado externo |
| Facilidad de testing | Alta, sin mocks necesarios | Baja, requiere simular el entorno externo |
| Ejemplo | Cálculo matemático, transformación de datos | Escribir en log, llamar a una API, mutar un argumento |

## Sources
- [[wiki/sources/2026-07-30-funciones-y-parametros]] — distinción entre funciones puramente computacionales y funciones con efectos secundarios.

## Related Concepts
[[funciones-y-parametros]], [[paso-por-valor-vs-referencia]]

## Open Questions
- ¿Qué proporción de funciones puras vs. con efectos secundarios es razonable exigir como estándar de calidad en un code review?

---

**Última actualización:** 2026-07-30
**Aparece en:** 1 fuente
