---
type: concept
created: 2026-07-29
updated: 2026-07-30
tags: [debugging, metodo-cientifico, logs, stack-trace, breakpoints]
---

# Metodología de Debugging

## Definition
La **Metodología de Debugging** es el conjunto estructurado de principios, pasos y herramientas científicas mediante los cuales se investigan, reproducen, aíslan y corrigen fallos o comportamientos inesperados en sistemas de software.

## Key Ideas
- **Rechazo del Ensayo y Error:** Modificar código de forma reactiva sin hipótesis ni diagnóstico previo suele introducir parches de baja calidad y aumentar la [[deuda-tecnica]].
- **Ciclo Científico de 5 Pasos:**
  1. *Reproducir el Error:* Regla de oro indispensable.
  2. *Observar y Entender:* Definir el desvío exacto respecto a la expectativa.
  3. *Formular una Hipótesis:* Plantear una causa raíz plausible.
  4. *Probar la Hipótesis:* Aislar una sola variable a la vez.
  5. *Resolver y Verificar:* Corregir la causa raíz y validar con pruebas de regresión.
- **Tríada de Inspección:**
  - *Logs:* Arqueología cronológica de eventos.
  - *Stack Trace:* Cascada jerárquica de llamadas y causalidad.
  - *Breakpoints:* Inspección pausada del estado en tiempo real.
- **Métodos Auxiliares:** Rubber Duck Debugging (patito de goma) y asistencia de IA para análisis masivo de trazas.

## Applications
- Diagnóstico forense de caídas y errores en servidores o aplicaciones.
- Mantenimiento predictivo y corrección de bugs en entornos distribuidos.
- Optimización y refactorización segura de código legacy.

## Sources
- [[wiki/sources/2026-07-29-metodologias-de-resolucion-de-problemas]] — Guía completa del método científico de debugging por [[brais-moure]] / [[big-school]].
- [[wiki/sources/2026-07-29-conclusiones-pensamiento-computacional-y-resolucion-de-problemas]] — La ciencia del diagnóstico sistemático.
- [[wiki/sources/2026-07-30-manejo-de-errores-y-excepciones]] — Prevención estructural (try/catch) que complementa la investigación posterior del debugging.

## Related Concepts
- [[pensamiento-computacional]]
- [[mentalidad-de-arquitecto]]
- [[soberania-humana-en-ia]]
- [[manejo-de-errores-y-excepciones]]
- [[deuda-tecnica]]

## Open Questions
- ¿Cómo automatizar la creación de test cases de regresión inmediatamente después de reproducir un error en producción?
