---
type: source
created: 2026-08-03
updated: 2026-08-03
tags: [etica, sesgos-algoritmicos, privacidad, gdpr, licencias-open-source]
source: raw/papers/2026-08-03-etica-en-el-desarrollo.md
author: BIG School
---

# Ética en el Desarrollo

## Metadata
- **Fuente original:** `raw/papers/2026-08-03-etica-en-el-desarrollo.md`
- **Autor:** [[big-school]]
- **Fecha:** 2026-08-03
- **Tipo de documento:** Documento Técnico + Diapositivas (PDF `0.6.5 Ética en el desarrollo.pdf`, Módulo 0)

## Summary
Quinta fuente del Módulo 5: eleva el desarrollo de software a "responsabilidad civil de primer orden", cubriendo cuatro dimensiones — responsabilidad civil del código (analogía con la ingeniería estructural), sesgos algorítmicos y equidad (Bias in AI), privacidad por diseño (Privacy by Design, GDPR/RGPD), y gobernanza del Open Source (licencias permisivas vs. copyleft). Cierra con una pregunta reformulada: no "¿podemos hacerlo?" sino "¿debemos hacerlo?".

## Key Takeaways
1. **El código es responsabilidad civil, no solo técnica:** el software orquesta salud, finanzas y procesos democráticos — cada línea, manual o generada por IA, es una decisión con impacto real.
2. **Errores históricos como advertencia:** sistemas mal testeados en dispositivos críticos (radioterapia, años 80) han costado vidas — el testing riguroso es un imperativo ético, no una tarea secundaria.
3. **Sesgos algorítmicos (Bias in AI):** los algoritmos no son neutrales — aprenden y amplifican los sesgos de sus datos de entrenamiento (ej. discriminación de género en selección de personal). El profesional es la "última línea de defensa": auditar datos, cuestionar procedencia, diseñar para equidad.
4. **Privacidad por Diseño (Privacy by Design):** la protección de datos no es un parche final, sino un pilar desde el primer día — recolectar solo lo estrictamente necesario y proteger activamente contra actores maliciosos. El GDPR/RGPD codifica estos principios en ley.
5. **Licencias de Software:** documento legal que define qué se puede/no hacer con un código. **Permisivas** (MIT, Apache, BSD) fomentan adopción con uso casi irrestricto; **Copyleft** (GPL, AGPL) obligan a compartir cualquier derivación bajo los mismos términos de apertura.
6. **La pregunta fundamental no es "¿podemos hacerlo?" sino "¿debemos hacerlo?"** — la excelencia profesional en la era de la IA exige código responsable, no solo código limpio o eficiente.

## Detailed Breakdown

### 1. La Responsabilidad Civil del Código Fuente
Cada línea de código —manual o generada por IA— es una decisión con impacto real. Errores históricos en sistemas críticos (dispositivos de radioterapia en los 80) demuestran que un sistema mal testeado o excesivamente complejo puede costar vidas. La gestión de errores y el testing riguroso son imperativos éticos, no tareas secundarias — "un bug no es solo una molestia técnica".

### 2. Sesgos Algorítmicos y Equidad
Los algoritmos aprenden de los datos que se les dan; si los datos reflejan sesgos sociales, el algoritmo los amplifica (ej. un sistema de selección de personal alimentado con datos históricos discriminatorios automatiza esa exclusión). El profesional debe auditar datos, cuestionar su procedencia y diseñar sistemas que promuevan equidad en vez de perpetuar desigualdades estructurales — el "Bias in AI" es el desafío ético central de la era de la IA.

### 3. Privacidad y Seguridad como Principios de Diseño
La confianza del usuario es el activo más valioso de una solución tecnológica. **Privacidad por Diseño:** la protección de datos se construye desde el primer día, no se aplica como parche al final — recolectar solo los datos estrictamente necesarios (minimización de datos) y protegerlos activamente con estándares de seguridad robustos. Conocer regulaciones vigentes (GDPR/RGPD) no es opcional — son la codificación legal de estos principios éticos.

### 4. Gobernanza del Open Source y Licencias de Software
La mayoría del software se construye sobre cimientos Open Source — pero "gratis" no significa "sin reglas". Una **Licencia de Software** es un documento legal que define qué se puede y no se puede hacer con un código:
- **Licencias permisivas** (MIT, Apache, BSD): uso casi irrestricto, fomentan adopción.
- **Licencias copyleft** (GPL, AGPL): preservan la libertad del conocimiento, obligando a compartir cualquier mejora/derivación bajo los mismos términos.

Antes de integrar cualquier librería externa, el profesional debe verificar su compatibilidad con los objetivos comerciales y éticos de la organización.

### 5. Observaciones Clave
- La complejidad excesiva y la falta de gestión de errores son fallos éticos en entornos de misión crítica.
- La IA no es responsable de sus sesgos; el responsable es el profesional que audita y diseña el proceso de entrenamiento.
- El principio de minimización de datos exige recolectar solo lo necesario para la funcionalidad.
- El uso de software libre exige cumplimiento estricto de licencias para evitar riesgos legales.
- La pregunta fundamental antes de desarrollar no es solo "¿podemos hacerlo?", sino "¿debemos hacerlo?".

### 6. Conclusión
Integrar una brújula ética no es un ejercicio teórico, sino una ventaja competitiva que define la madurez organizacional. La calidad de una infraestructura digital se mide no solo por rendimiento técnico, sino por su capacidad de operar con integridad en un mundo físico donde las decisiones automatizadas tienen peso real.

## Entities Mentioned
- [[big-school]]

## Concepts Discussed
- [[etica-y-responsabilidad-en-el-desarrollo]]
- [[soberania-humana-en-ia]]

## Notable Quotes
> "La pregunta fundamental antes de iniciar un desarrollo no debe ser solo '¿podemos hacerlo?', sino principalmente '¿debemos hacerlo?'."

> "Un bug no es solo una molestia técnica."

## Connections & Reflections
- Se crea el concepto nuevo [[etica-y-responsabilidad-en-el-desarrollo]] — cubre sesgos algorítmicos, privacidad por diseño y licenciamiento Open Source, ninguno de los cuales tenía representación previa en el wiki.
- Conecta directamente con [[soberania-humana-en-ia]] (Módulo 0): "el profesional como última línea de defensa" contra sesgos algorítmicos es la misma idea de auditoría humana indelegable, ahora aplicada específicamente al eje de equidad/discriminación en vez de solo corrección técnica.
- El testing riguroso como "imperativo ético" (no solo técnico) conecta esta fuente con [[testing-y-piramide-de-pruebas]] y [[wiki/sources/2026-08-03-testing]] — el mismo pilar de calidad, visto ahora desde una lente de responsabilidad civil.
- Sin contradicciones con conocimiento previo del wiki.

## Open Questions
- ¿Qué marco práctico de auditoría de sesgos (más allá de "cuestionar la procedencia de los datos") puede aplicar un equipo sin especialistas dedicados en ética de IA?

## Related Sources
- [[wiki/sources/2026-08-03-testing]] — el testing riguroso como imperativo ético, no solo técnico.
- [[wiki/sources/2026-07-29-conclusiones-pensamiento-computacional-y-resolucion-de-problemas]] — origen de [[soberania-humana-en-ia]] en el wiki.

---

**Estado:** ✅ Completamente procesado e integrado en el wiki
