# 📚 Índice del Wiki — Fundamentos del desarrollo de software

> **Última actualización:** 2026-07-29  
> **Total de páginas:** 23  
> **Total de fuentes procesadas:** 5

---

## 🎯 Navegación Rápida

- [[HOME|🏠 Inicio]] — Punto de entrada del vault
- [[AGENTS|🗺️ Root Agent]] — Protocolo del agente LLM
- [[log|📋 Log Cronológico]] — Historia de todas las operaciones
- **Graph View** (Ctrl+G en Obsidian) — Ver conexiones visuales

---

## 📑 Fuentes Procesadas (`wiki/sources/`)

- [[wiki/sources/2026-07-21-llm-wiki-pattern-karpathy|2026-07-21-llm-wiki-pattern-karpathy]] — Arquitectura de base de conocimiento acumulativa en Markdown por Andrej Karpathy
- [[wiki/sources/2026-07-29-fundamentos-del-pensamiento-computacional|2026-07-29-fundamentos-del-pensamiento-computacional]] — Los 4 pilares del pensamiento computacional, diagramas de flujo y pseudocódigo por Brais Moure / BIG School
- [[wiki/sources/2026-07-29-metodologias-de-resolucion-de-problemas|2026-07-29-metodologias-de-resolucion-de-problemas]] — Método científico aplicado al debugging, logs, stack traces y breakpoints por Brais Moure / BIG School
- [[wiki/sources/2026-07-29-ejercicios-practicos-pensamiento-computacional|2026-07-29-ejercicios-practicos-pensamiento-computacional]] — Ejercicios de descomposición atómica, diagramas de flujo y edge cases por Brais Moure / BIG School
- [[wiki/sources/2026-07-29-conclusiones-pensamiento-computacional-y-resolucion-de-problemas|2026-07-29-conclusiones-pensamiento-computacional-y-resolucion-de-problemas]] — Transmutación del rol profesional a arquitecto y soberanía en IA por Brais Moure / BIG School

---

## 👥 Entidades (`wiki/entities/`)

### Personas
- [[andrej-karpathy]] — Investigador de IA y creador del patrón LLM Wiki
- [[vannevar-bush]] — Creador conceptual del Memex (1945)
- [[brais-moure]] — Divulgador, ingeniero de software y fundador de MoureDev / BIG School

### Organizaciones / Proyectos
- [[big-school]] — Academia tecnológica responsable del Máster Desarrollo con IA

---

## 💡 Conceptos (`wiki/concepts/`)

### Conceptos Principales
- [[pensamiento-computacional]] — Proceso mental de estructurar problemas para que sean procesados eficientemente por máquinas
- [[llm-wiki-pattern]] — Arquitectura de base de conocimiento acumulativa mantenida por agentes de IA
- [[soberania-humana-en-ia]] — Principio de gobernanza e independencia técnica del desarrollador frente a automatismos de IA

### Metodologías / Patrones
- [[descomposicion]] — Pilar de divide y vencerás para fragmentar problemas en unidades atómicas
- [[reconocimiento-de-patrones]] — Identificación de tendencias y estructuras comunes para reutilizar soluciones
- [[abstraccion]] — Filtrado de detalles irrelevantes y ruido para enfocarse en la esencia del modelo
- [[diseno-de-algoritmos]] — Creación de secuencias lógicas finitas, precisas y ordenadas
- [[metodologia-de-debugging]] — Método científico de 5 pasos para investigar y resolver fallos de software
- [[rubber-duck-debugging]] — Técnica de depuración verbalizando el código en lenguaje natural

### Herramientas de Inspección & Diagnóstico
- [[analisis-de-logs]] — Inspección cronológica y severidades de eventos de sistema
- [[breakpoints]] — Pausa intencional del código para inspeccionar variables y flujo en memoria
- [[stack-trace]] — Rastreo jerárquico en cascada de llamadas para hallar la causa raíz

### Teorías / Frameworks
- [[mentalidad-de-arquitecto]] — Enfoque del profesional que prioriza el diseño sistémico y la sostenibilidad sobre la sintaxis

---

## 🔍 Queries Archivadas (`wiki/queries/`)

- [[lint-2026-07-29]] — Reporte de salud (linting) global del wiki tras la ingesta de las 5 fuentes iniciales

---

## 📊 Estadísticas

| Métrica | Valor |
|---------|-------|
| Fuentes totales | 5 |
| Entidades (personas) | 3 |
| Entidades (orgs/lugares) | 1 |
| Conceptos | 13 |
| Queries archivadas | 1 |
| Páginas huérfanas | 0 |
| Última operación | Enriquecimiento con Detailed Breakdown y nuevos conceptos |

---

## 🏷️ Tags Más Usados

`#pensamiento-computacional` `#debugging` `#ia` `#arquitectura` `#descomposicion` `#algoritmos` `#karpathy` `#metodo-cientifico`

---

## 🔗 Hubs de Conocimiento

- [[pensamiento-computacional]] — Hub central de los 4 pilares y diseño algorítmico
- [[llm-wiki-pattern]] — Hub de arquitectura de conocimiento y gestión con agentes LLM
- [[metodologia-de-debugging]] — Hub de técnicas forenses y diagnósticos científicos de código

---

## ⚙️ Instrucciones de Uso

### Para el Agente LLM:
1. **Al arrancar:** Ejecuta `./init.sh --check` y confirma que todo está OK
2. **Antes de cada operación:** Lee este índice para identificar páginas relevantes
3. **Después de cada ingest:** Actualiza las secciones correspondientes
4. **Workflow detallado:** Lee el subagente correspondiente en `.agents/agents/`
5. **Mantener orden:** Cronológico inverso (más reciente primero) para fuentes, alfabético para entidades/conceptos

### Para el Humano:
- Usa este índice como punto de entrada al wiki
- `Ctrl+O` en Obsidian para búsqueda rápida por nombre
- Graph View (Ctrl+G) para exploración visual de conexiones

---

**🚀 Estado:** Ingesta de todas las fuentes de `raw/` completada exitosamente.
