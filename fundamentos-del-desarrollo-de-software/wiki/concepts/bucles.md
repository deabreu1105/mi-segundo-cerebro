---
type: concept
created: 2026-07-30
updated: 2026-07-30
tags: [bucles, while, for, foreach, estructuras-de-control, programacion]
related: [condicionales, diseno-de-algoritmos]
---

# Bucles (Estructuras de Repetición)

## Definition
Los bucles son estructuras que **repiten un bloque de código** mientras se cumpla (o hasta que se cumpla) una condición, o para cada elemento de una colección. Otorgan a la tecnología su ventaja competitiva sobre el trabajo manual: procesar miles de registros en milisegundos.

## Key Ideas
- **WHILE (pre-condición):** evalúa la condición antes de cada iteración; si es falsa desde el inicio, el bloque no se ejecuta ninguna vez.
- **DO-WHILE (post-condición):** evalúa la condición después de ejecutar el bloque — garantiza al menos una ejecución. Ideal para validación de entradas.
- **FOR (iteración determinada):** agrupa inicialización, condición de parada y actualización de la variable de control en una sola línea.
- **FOREACH (iteración sobre colecciones):** abstrae la gestión de contadores para recorrer elementos de una colección directamente.
- **Control avanzado:** `BREAK` (salida inmediata), `CONTINUE` (salto de iteración), `RETURN` (retorno de función) modifican el flujo normal de un bucle.
- Olvidar actualizar la variable de control en un `WHILE` provoca **bucles infinitos** que pueden colapsar servicios.

## Applications
- Procesamiento batch de registros (miles de filas de una base de datos).
- Validación de entradas de usuario con reintentos (`DO-WHILE`).
- Recorrido de colecciones (listas, arrays, mapas) con `FOREACH` sin gestionar índices manualmente.

## Examples
```text
VARIABLE contador = 1
WHILE (contador <= 5) {
    MOSTRAR "Iteración: " + contador
    contador = contador + 1
}
```
```text
LISTA frutas = ["Manzana", "Banana", "Naranja"]
FOREACH (fruta EN frutas) {
    MOSTRAR "Me gusta comer: " + fruta
}
```

## Comparison
| Bucle | Evalúa condición | Ejecuciones mínimas | Caso de uso típico |
|---------|---------------|-------------|-------------|
| **WHILE** | Antes | 0 | Condición desconocida de antemano |
| **DO-WHILE** | Después | 1 | Validación de entrada de usuario |
| **FOR** | Antes, con contador explícito | 0 | Número de iteraciones conocido |
| **FOREACH** | Implícita (fin de colección) | 0 | Recorrer una colección completa |

## Sources
- [[wiki/sources/2026-07-30-estructuras-de-control]] — WHILE, DO-WHILE, FOR, FOREACH y control avanzado de flujo.
- [[wiki/sources/2026-07-30-fundamentos-de-la-programacion-conclusiones]] — bucles como fuente de "eficiencia y escalabilidad".

## Related Concepts
[[condicionales]], [[diseno-de-algoritmos]], [[pensamiento-computacional]]

## Open Questions
- ¿Qué patrones de linting detectan de forma temprana bucles `WHILE` con riesgo de no terminar (variable de control sin actualización garantizada)?

---

**Última actualización:** 2026-07-30
**Aparece en:** 2 fuentes
