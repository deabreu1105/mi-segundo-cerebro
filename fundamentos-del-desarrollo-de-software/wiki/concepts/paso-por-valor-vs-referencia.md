---
type: concept
created: 2026-07-30
updated: 2026-07-30
tags: [paso-por-valor, paso-por-referencia, memoria, programacion]
related: [variables-y-tipos-de-datos, funciones-y-parametros]
---

# Paso por Valor vs. Paso por Referencia

## Definition
Describe cómo se comporta una variable al ser copiada o pasada como argumento a una función. **Por valor**, se duplica el dato en un espacio de memoria independiente (típico de tipos primitivos). **Por referencia**, se copia únicamente el puntero a la dirección de memoria original (típico de objetos, listas y estructuras complejas), por lo que ambas variables terminan apuntando al mismo dato real.

## Key Ideas
- **Por Valor (primitivos):** copiar una variable en otra duplica el valor — mutar la copia no afecta al original.
- **Por Referencia (objetos/listas):** copiar una variable en otra copia el puntero — mutar la copia sí afecta al original, porque ambas apuntan a la misma dirección de memoria.
- El mismo principio aplica dos veces en este wiki: al **asignar** una variable a otra, y al **pasar argumentos** a una función — es el mecanismo idéntico visto desde dos ángulos distintos.
- Los efectos secundarios no deseados entre módulos suelen originarse en mutaciones por referencia mal controladas.

## Applications
- Depuración de bugs donde "una función modifica algo que no debería" — casi siempre es una estructura pasada por referencia mutada sin que el llamador lo esperase.
- Diseño de funciones puras ([[funciones-puras-y-efectos-secundarios]]): evitar mutar argumentos por referencia es un requisito para la pureza.
- Decisiones de inmutabilidad (usar `const`/`final`, o clonar una estructura antes de mutarla) para prevenir efectos secundarios.

## Examples
```python
# Por Valor
a = 5
b = a    # 'b' almacena su propia copia del valor 5
b = 10   # 'a' se mantiene intacto en 5

# Por Referencia
lista_a = [1, 2, 3]
lista_b = lista_a
lista_b.append(4)
# lista_a también refleja [1, 2, 3, 4] porque ambas apuntan a la misma dirección
```
```python
# El mismo mecanismo, ahora como argumentos de función
def duplicar_numero(n):      # por valor
    n = n * 2
    return n

def agregar_item(lista):     # por referencia
    lista.append("Nuevo Elemento")
```

## Comparison
| Aspecto | Por Valor | Por Referencia |
|---------|---------------|-------------|
| Qué se copia | El dato en sí | El puntero/dirección de memoria |
| Tipos típicos | Primitivos (int, bool, char) | Objetos, listas, estructuras complejas |
| Mutar la copia afecta al original | No | Sí |

## Sources
- [[wiki/sources/2026-07-30-variables-tipos-de-datos-y-operadores]] — introducción del concepto al copiar variables.
- [[wiki/sources/2026-07-30-funciones-y-parametros]] — el mismo mecanismo aplicado al pasar argumentos a una función.

## Related Concepts
[[variables-y-tipos-de-datos]], [[funciones-y-parametros]], [[funciones-puras-y-efectos-secundarios]]

## Open Questions
- ¿Qué patrones (copia defensiva, estructuras inmutables) minimizan el riesgo de efectos secundarios por referencia sin sacrificar rendimiento?

---

**Última actualización:** 2026-07-30
**Aparece en:** 2 fuentes
