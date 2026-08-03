---
type: concept
created: 2026-08-03
updated: 2026-08-03
tags: [testing, unittest, calidad, piramide-de-testing, python]
related: [refactorizacion, deuda-tecnica, funciones-y-parametros, metodologia-de-debugging]
---

# Testing y Pirámide de Pruebas

## Definition
El **testing automatizado** es la práctica de escribir código para verificar código, sustituyendo la validación manual (lenta, sesgada, inescalable) por una red de seguridad ejecutable. La **pirámide de testing** organiza el esfuerzo de validación en tres niveles jerárquicos — Unitarios, Integración y End-to-End (E2E) — según su alcance, velocidad y coste de mantenimiento.

## Key Ideas
- **Test Unitario (base de la pirámide):** valida la unidad mínima de código (función/clase) de forma **aislada**, sin dependencias externas (BD, red). Se ejecuta en milisegundos — permite miles de tests sin penalizar rendimiento. El volumen principal de la estrategia de pruebas.
- **Test de Integración (nivel medio):** verifica que dos o más módulos colaboren correctamente. Más lentos y menos numerosos, pero vitales para errores de comunicación entre componentes que por separado parecen correctos.
- **Test End-to-End / E2E (cúspide):** simula un flujo de usuario real de extremo a extremo (UI, red, base de datos). Reservado a los flujos de negocio más críticos por su fragilidad y coste de mantenimiento.
- **Regla de aislamiento:** si un test "unitario" falla porque el servidor no responde, en realidad es un test de integración mal clasificado.
- **`unittest` (librería estándar de Python):** agrupa tests en una clase que hereda de `unittest.TestCase`; cada test es un método `test_*`; las aserciones (`assertEqual`, `assertIn`) determinan el éxito/fallo.
- **Trade-off de la pirámide:** a medida que se sube (hacia E2E), el coste de mantenimiento aumenta y la velocidad de ejecución disminuye drásticamente — por eso la base debe ser mucho más ancha que la cúspide.
- **El testing es una decisión financiera**, no una fase final: minimiza costes de mantenimiento a largo plazo y reduce el tiempo medio de reparación (MTTR).

## Applications
- Diseñar la estrategia de pruebas de un proyecto nuevo priorizando volumen de tests unitarios sobre E2E.
- Exigir tests como precondición antes de refactorizar código existente (ver [[refactorizacion]]) — son la única garantía de que un cambio estructural no rompe funcionalidad.
- Auditar código generado por IA escribiendo tests que verifiquen los requisitos de negocio explícitos, no solo que el código "corra".

## Examples
```python
import unittest
from calculadora import sumar

class TestCalculadora(unittest.TestCase):
    def test_sumar_numeros_positivos(self):
        self.assertEqual(sumar(5, 10), 15)

# Ejecución: python -m unittest
```

## Comparison
| Nivel | Alcance | Velocidad | Cantidad típica | Fragilidad |
|---------|---------------|-------------|-------------|-------------|
| **Unitario** | Una función/clase aislada | Milisegundos | Miles | Baja |
| **Integración** | Dos o más módulos | Segundos | Decenas/Cientos | Media |
| **E2E** | Flujo de usuario completo | Minutos | Pocos (solo flujos críticos) | Alta |

## Sources
- [[wiki/sources/2026-08-03-testing]] — pirámide de testing, `unittest`, aserciones, caso con bug intencionado.
- [[wiki/sources/2026-08-03-conclusiones-buenas-practicas-desarrollo-software]] — el testing como transformador de la mentalidad organizacional, síntesis final del Módulo 5.

## Related Concepts
[[refactorizacion]], [[deuda-tecnica]], [[funciones-y-parametros]], [[metodologia-de-debugging]]

## Open Questions
- ¿Qué framework moderno (pytest, con fixtures y parametrización) merece cobertura futura como evolución natural de `unittest`?

---

**Última actualización:** 2026-08-03
**Aparece en:** 2 fuentes
