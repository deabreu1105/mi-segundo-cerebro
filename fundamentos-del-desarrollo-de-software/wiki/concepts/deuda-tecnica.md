---
type: concept
created: 2026-07-30
updated: 2026-07-30
tags: [deuda-tecnica, mantenibilidad, arquitectura, programacion]
related: [mentalidad-de-arquitecto, variables-y-tipos-de-datos]
---

# Deuda Técnica

## Definition
La **deuda técnica** es el coste futuro acumulado de decisiones de diseño o implementación tomadas por rapidez o descuido en el presente — nomenclatura pobre, ensayo-y-error sin método, atajos de arquitectura — que se paga más tarde en forma de mayor esfuerzo de mantenimiento, mayor riesgo de bugs y menor velocidad de desarrollo.

## Key Ideas
- Se origina tanto en decisiones **explícitas** (atajos conscientes para cumplir un plazo) como en descuidos **implícitos** (nomenclatura de variables poco clara, falta de convenciones).
- El enfoque de "ensayo y error" en debugging, en vez de un método científico estructurado, genera deuda técnica oculta que resurge más tarde como bugs difíciles de rastrear.
- La adopción de una [[mentalidad-de-arquitecto]] es lo que evita su acumulación descontrolada y la obsolescencia del sistema ante la automatización generativa.
- No es inherentemente negativa — como la deuda financiera, puede ser una herramienta consciente (lanzar rápido, refactorizar después), pero se vuelve peligrosa cuando es involuntaria o no se salda nunca.

## Applications
- Priorización de refactors en un backlog: cuantificar qué deuda técnica bloquea más velocidad futura.
- Revisión de código: nomenclatura clara y consistente es la forma más barata de prevenir deuda técnica.
- Justificación de tiempo de mantenimiento frente a stakeholders de negocio que solo ven features nuevas.

## Examples
```python
# Nomenclatura pobre → deuda técnica invisible pero real
def f(x, y):
    return x * y * 1.21

# Nomenclatura clara → misma lógica, deuda técnica evitada
def calcular_precio_con_iva(precio_base, cantidad):
    return precio_base * cantidad * 1.21
```

## Comparison
| Aspecto | Deuda Técnica Consciente | Deuda Técnica Involuntaria |
|---------|---------------|-------------|
| Origen | Decisión explícita para ganar velocidad | Descuido, falta de convenciones, prisa |
| Visibilidad | Documentada, con plan de repago | Oculta, se descubre por accidente |
| Riesgo | Controlado si se salda a tiempo | Alto — se acumula sin límite |

## Sources
- [[wiki/sources/2026-07-29-metodologias-de-resolucion-de-problemas]] — el ensayo-y-error como generador de deuda técnica oculta.
- [[wiki/sources/2026-07-29-conclusiones-pensamiento-computacional-y-resolucion-de-problemas]] — la mentalidad de arquitecto como antídoto a su acumulación.
- [[wiki/sources/2026-07-30-variables-tipos-de-datos-y-operadores]] — nomenclatura de variables como herramienta directa de mantenimiento.
- [[wiki/sources/2026-07-30-modularidad-en-python]] — código monolítico sin modularidad como fuente directa de deuda técnica.
- [[wiki/sources/2026-07-30-introduccion-a-los-lenguajes-de-programacion-conclusiones-generales]] — la arquitectura modular como freno al crecimiento exponencial de la deuda técnica.

## Related Concepts
[[mentalidad-de-arquitecto]], [[variables-y-tipos-de-datos]], [[metodologia-de-debugging]], [[modularidad-modulos-y-paquetes]], [[entornos-virtuales-y-dependencias]]

## Open Questions
- ¿Qué métrica objetiva permite cuantificar deuda técnica más allá de la intuición o revisión manual de código?

---

**Última actualización:** 2026-07-30
**Aparece en:** 3 fuentes
