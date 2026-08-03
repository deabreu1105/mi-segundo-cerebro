---
type: concept
created: 2026-07-30
updated: 2026-07-30
tags: [funciones, parametros, modularizacion, dry, programacion]
related: [paso-por-valor-vs-referencia, scope-y-lifetime, funciones-puras-y-efectos-secundarios, descomposicion]
---

# Funciones y Parámetros

## Definition
Una **función** (método, rutina, subprograma) es un bloque de código reutilizable diseñado para realizar una tarea específica, empaquetado bajo un nombre descriptivo. Un **parámetro** es la variable definida en la firma de la función que actúa como contenedor de entrada; un **argumento** es el valor real que se pasa a la función durante su invocación.

## Key Ideas
- Las funciones aplican el principio **DRY** (*Don't Repeat Yourself*) y el enfoque *divide y vencerás* — dividen problemas complejos en subproblemas más simples.
- **Parámetro ≠ Argumento:** el parámetro es la variable de la firma (`precioBase`); el argumento es el valor real pasado (`100`).
- Los argumentos pueden pasarse [[paso-por-valor-vs-referencia|por valor o por referencia]], con consecuencias distintas sobre si la función puede o no modificar el dato original.
- `RETURN` finaliza la función y devuelve un resultado; las funciones **VOID** ejecutan acciones sin devolver valor explícito.
- **Principio de Responsabilidad Única (SRP):** cada función debe hacer una sola tarea bien definida; si crece demasiado, debe refactorizarse.
- **"Función monstruo":** patología común donde una sola función mezcla acceso a datos, lógica de negocio y presentación — difícil de testear y propensa a errores en cascada; se corrige descomponiéndola en funciones pequeñas y enfocadas (ver [[estilo-de-codigo-y-convenciones]] y [[refactorizacion]]).

## Applications
- Encapsular lógica de negocio reutilizable (`CalcularPrecioTotal`, `ValidarUsuario`).
- Diseño de APIs internas: la firma de una función es un contrato entre quien la escribe y quien la invoca.
- Testing unitario: funciones bien diseñadas (con SRP claro) son más fáciles de probar de forma aislada.

## Examples
```text
FUNCION CalcularPrecioTotal(precioBase, impuesto) {
    VARIABLE total = precioBase + (precioBase * impuesto)
    RETORNAR total
FIN FUNCION

VARIABLE factura = CalcularPrecioTotal(100, 0.19)
```

## Comparison
| Aspecto | Parámetro | Argumento |
|---------|---------------|-------------|
| Qué es | Variable en la firma de la función | Valor real pasado en la invocación |
| Dónde vive | Declaración de la función | Punto de llamada |
| Ejemplo | `precioBase` | `100` |

## Sources
- [[wiki/sources/2026-07-30-funciones-y-parametros]] — anatomía, parámetros vs. argumentos, scope y shadowing.
- [[wiki/sources/2026-07-30-fundamentos-de-la-programacion-conclusiones]] — funciones como "transición a la artesanía técnica".
- [[wiki/sources/2026-07-30-bases-de-los-lenguajes-de-programacion]] — parámetros con valor por defecto en Python (`rate=0.21`).
- [[wiki/sources/2026-07-30-programacion-orientada-a-objetos]] — `self` como caso particular de parámetro implícito en métodos de instancia.
- [[wiki/sources/2026-08-03-bases-lenguajes-programacion]] — refuerzo de parámetros por defecto y docstrings como documentación embebida.
- [[wiki/sources/2026-08-03-estilo-del-codigo]] — ejemplo completo de refactor de "función monstruo" (`process_user_data`) a funciones enfocadas por SRP.

## Related Concepts
[[paso-por-valor-vs-referencia]], [[scope-y-lifetime]], [[funciones-puras-y-efectos-secundarios]], [[descomposicion]], [[programacion-orientada-a-objetos]], [[estilo-de-codigo-y-convenciones]], [[refactorizacion]]

## Open Questions
- ¿Cuántos parámetros posicionales son razonables antes de que una función deba refactorizarse para recibir un objeto de configuración?

---

**Última actualización:** 2026-08-03
**Aparece en:** 4 fuentes
