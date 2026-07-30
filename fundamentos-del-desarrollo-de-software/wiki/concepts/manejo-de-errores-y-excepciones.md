---
type: concept
created: 2026-07-30
updated: 2026-07-30
tags: [manejo-de-errores, excepciones, try-catch, resiliencia, programacion]
related: [metodologia-de-debugging, stack-trace]
---

# Manejo de Errores y Excepciones

## Definition
Disciplina que permite diseñar software resiliente, capaz de responder a fallos imprevistos (red, archivos, datos inválidos, agotamiento de recursos) de forma controlada en vez de colapsar (*graceful degradation*). Se apoya en tres piezas: la taxonomía de errores, el bloque `TRY/CATCH/FINALLY`, y el lanzamiento/propagación explícita de excepciones.

## Key Ideas
- **Tres tipos de error:** sintáctico (compilación), lógico (silencioso, resultado incorrecto) y excepción en tiempo de ejecución (evento anómalo imprevisto).
- **`TRY`** envuelve código sospechoso; **`CATCH`/`EXCEPT`** intercepta la excepción (encadenable por tipo); **`FINALLY`** se ejecuta siempre, se use para liberar recursos (archivos, conexiones, sockets).
- **`THROW`/`RAISE`:** una función lanza intencionadamente una excepción cuando sus precondiciones no se cumplen.
- **Propagación (*call stack bubbling*):** una excepción no capturada localmente sube por la pila de llamadas hasta encontrar un `CATCH`, o termina el programa si llega a la raíz sin capturarse.
- **Excepciones personalizadas:** heredar de las clases base del lenguaje mejora la claridad y trazabilidad de negocio.
- Regla dura: **nunca silenciar** una excepción con un `catch {}` vacío — oculta errores críticos y dificulta el diagnóstico.

## Applications
- Diseñar APIs y servicios que degradan con elegancia ante fallos de red o dependencias externas caídas.
- Definir excepciones de negocio propias (`SaldoInsuficienteException`) para trazabilidad clara en logs.
- Logging centralizado de stack traces para auditoría posterior — conecta directamente con [[stack-trace]] y [[metodologia-de-debugging]].

## Examples
```text
TRY {
    AbrirArchivo("datos.csv")
    LeerContenido()
} CATCH (ExcepcionArchivoNoEncontrado e) {
    MOSTRAR "El archivo solicitado no existe en el sistema."
} FINALLY {
    CerrarArchivo()
}
```
```python
class SaldoInsuficienteException(Exception):
    pass

def realizar_retiro(cuenta, monto):
    if monto > cuenta.saldo:
        raise SaldoInsuficienteException("No posee saldo suficiente.")
    cuenta.saldo -= monto
```

## Comparison
| Tipo de Error | Momento de Detección | Ejemplo |
| --- | --- | --- |
| **Sintáctico** | Compilación/Interpretación | Paréntesis olvidado |
| **Lógico** | Ejecución (silencioso) | Sumar el impuesto en vez de multiplicarlo |
| **Excepción en Tiempo de Ejecución** | Ejecución | División por cero, archivo no encontrado |

## Sources
- [[wiki/sources/2026-07-30-manejo-de-errores-y-excepciones]] — taxonomía, TRY/CATCH/FINALLY, throw/propagación, excepciones personalizadas.
- [[wiki/sources/2026-07-30-fundamentos-de-la-programacion-conclusiones]] — manejo de errores como "red de seguridad" del desarrollo profesional.

## Related Concepts
[[metodologia-de-debugging]], [[stack-trace]]

## Open Questions
- ¿Cómo se equilibra la granularidad de excepciones personalizadas (muchas clases específicas) contra la simplicidad de mantenimiento del árbol de excepciones?

---

**Última actualización:** 2026-07-30
**Aparece en:** 2 fuentes
