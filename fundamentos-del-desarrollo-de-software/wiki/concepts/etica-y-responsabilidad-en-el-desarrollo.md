---
type: concept
created: 2026-08-03
updated: 2026-08-03
tags: [etica, sesgos-algoritmicos, privacidad, gdpr, licencias, open-source]
related: [soberania-humana-en-ia, testing-y-piramide-de-pruebas, mentalidad-de-arquitecto]
---

# Ética y Responsabilidad en el Desarrollo

## Definition
Conjunto de principios que tratan el código como una **responsabilidad civil**, no solo técnica: el software orquesta salud, finanzas y procesos democráticos, otorgando a quienes lo construyen un poder de influencia equiparable al de un ingeniero civil. Abarca tres dimensiones concretas: **sesgos algorítmicos** (equidad de los sistemas de IA), **privacidad por diseño** (protección de datos desde el origen, GDPR/RGPD) y **licenciamiento Open Source** (marco legal de reutilización de código de terceros).

## Key Ideas
- **Responsabilidad civil del código:** cada línea —manual o generada por IA— es una decisión con impacto real; errores históricos en sistemas críticos (ej. dispositivos de radioterapia) demuestran que un sistema mal testeado puede costar vidas.
- **Sesgos Algorítmicos (Bias in AI):** los algoritmos no son neutrales — aprenden y amplifican los sesgos presentes en sus datos de entrenamiento. El profesional es la "última línea de defensa": auditar datos, cuestionar su procedencia, diseñar para equidad.
- **Privacidad por Diseño (Privacy by Design):** la protección de datos se construye desde el primer día de arquitectura, no como parche final. Principio de **minimización de datos**: recolectar solo lo estrictamente necesario.
- **GDPR/RGPD** codifica estos principios éticos en marco legal de cumplimiento obligatorio — conocerlo es parte del trabajo profesional, no una opción.
- **Licencias permisivas** (MIT, Apache, BSD): uso casi irrestricto, fomentan adopción amplia.
- **Licencias copyleft** (GPL, AGPL): obligan a compartir cualquier mejora/derivación bajo los mismos términos de apertura — preservan la libertad del conocimiento.
- **La pregunta fundamental:** no "¿podemos hacerlo?" (capacidad técnica) sino "¿debemos hacerlo?" (juicio ético).

## Applications
- Auditar datos de entrenamiento de un modelo de IA antes de desplegarlo en decisiones que afectan a personas (contratación, crédito, justicia).
- Diseñar el esquema de datos de una aplicación nueva aplicando minimización desde el primer sprint, no como ajuste de cumplimiento posterior.
- Verificar la licencia de cada librería de terceros antes de integrarla, especialmente en software comercial cerrado (evitar conflictos con copyleft tipo GPL).

## Examples
```text
Pregunta técnica:  "¿Podemos automatizar la preselección de candidatos con este modelo?"
Pregunta ética:    "¿Debemos hacerlo, dado que los datos históricos reflejan sesgos de género?"
```

## Comparison
| Tipo de Licencia | Ejemplos | Obligación al derivar/mejorar el código |
|---------|---------------|-------------|
| **Permisiva** | MIT, Apache, BSD | Ninguna — se puede usar, modificar y cerrar el código derivado |
| **Copyleft** | GPL, AGPL | Debe compartirse bajo los mismos términos de apertura |

## Sources
- [[wiki/sources/2026-08-03-etica-en-el-desarrollo]] — responsabilidad civil, sesgos algorítmicos, privacidad por diseño, licencias Open Source.
- [[wiki/sources/2026-08-03-conclusiones-buenas-practicas-desarrollo-software]] — la ética como marco indisociable de la excelencia técnica, síntesis final del Módulo 5.

## Related Concepts
[[soberania-humana-en-ia]], [[testing-y-piramide-de-pruebas]], [[mentalidad-de-arquitecto]]

## Open Questions
- ¿Qué marco práctico de auditoría de sesgos puede aplicar un equipo sin especialistas dedicados en ética de IA?

---

**Última actualización:** 2026-08-03
**Aparece en:** 2 fuentes
