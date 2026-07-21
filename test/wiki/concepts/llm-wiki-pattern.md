---
type: concept
created: 2026-07-21
tags: [pattern, architecture, llm, knowledge-management, ai-agents]
---

# LLM Wiki Pattern

## Definition
Patrón arquitectónico para construir bases de conocimiento personal donde un LLM mantiene **incrementalmente un wiki persistente** en lugar de simplemente hacer retrieval sobre documentos raw en cada query.

**Creador:** [[andrej-karpathy|Andrej Karpathy]] (2024)

## Core Idea

En lugar del approach tradicional de RAG donde el LLM:
1. Recupera chunks relevantes en query time
2. Sintetiza respuesta
3. ❌ Olvida todo para la próxima query

El LLM Wiki Pattern propone:
1. ✅ Leer e **integrar** nueva información en un wiki persistente
2. ✅ Mantener cross-references, resolver contradicciones
3. ✅ Compilar conocimiento una vez, mantenerlo actualizado
4. ✅ En queries: leer del wiki enriquecido, no de chunks raw

### Analogía
- **RAG:** Como buscar en Google cada vez que necesitas algo
- **LLM Wiki:** Como tener una biblioteca personal organizada que mejora continuamente

## Architecture (3 Layers)

```
┌─────────────────────────────────────┐
│  Schema (AGENTS.md, CLAUDE.md)     │ ← Reglas y workflows
│  - Define cómo funciona el sistema  │
└─────────────────────────────────────┘
           ↓ lee y sigue
┌─────────────────────────────────────┐
│  Wiki (markdown files)              │ ← Mantenido por LLM
│  - Summaries, entities, concepts    │
│  - Cross-referenced, actualizado    │
└─────────────────────────────────────┘
           ↑ lee de ↓ escribe a
┌─────────────────────────────────────┐
│  Raw Sources                        │ ← Inmutables
│  - Articles, papers, images, data   │
└─────────────────────────────────────┘
```

## Core Operations

### 1. INGEST
**Input:** Nueva fuente en `raw/`  
**Proceso:**
- LLM lee fuente completamente
- Discute takeaways con humano
- Crea summary page
- Actualiza entidades mencionadas
- Actualiza conceptos relacionados
- Añade cross-references
- Actualiza index.md
- Registra en log.md

**Output:** 10-15 páginas del wiki tocadas/creadas

### 2. QUERY
**Input:** Pregunta del humano  
**Proceso:**
- Lee index.md para encontrar páginas relevantes
- Lee páginas en profundidad
- Sintetiza respuesta con citas
- **Opcional:** Archivar respuesta como nueva página si es valiosa

**Output:** Respuesta + opcionalmente nueva página wiki

### 3. LINT
**Input:** Comando de health-check  
**Proceso:**
- Buscar contradicciones
- Identificar páginas huérfanas
- Encontrar cross-refs faltantes
- Detectar gaps de información
- Sugerir nuevas fuentes/investigaciones

**Output:** Reporte de salud + sugerencias

## Key Benefits

1. **Knowledge Compounding:** Cada fuente enriquece el wiki, valor crece exponencialmente
2. **Síntesis Persistente:** No re-derivar en cada query
3. **Contradicciones Visibles:** Marcadas explícitamente, no escondidas
4. **Cross-references Automáticos:** El LLM mantiene conexiones
5. **Maintenance gratis:** LLMs no se aburren del bookkeeping

## Comparison: RAG vs LLM Wiki

| Aspecto | RAG Tradicional | LLM Wiki Pattern |
|---------|----------------|------------------|
| **Conocimiento** | Re-derivado cada query | Compilado y mantenido |
| **Contradicciones** | Descubiertas cada vez | Marcadas persistentemente |
| **Cross-refs** | Ad-hoc en query time | Pre-existentes en wiki |
| **Síntesis** | Temporal | Permanente y evolutiva |
| **Valor over time** | Lineal | Compounding |
| **Mantenimiento** | N/A | Automatizado por LLM |

## Use Cases

- 📚 **Personal knowledge:** Goals, salud, psicología, journaling
- 🔬 **Research:** Deep-dive en topic durante semanas/meses
- 📖 **Reading companion:** Wiki para libros con personajes, temas, plot
- 🏢 **Team wiki:** Alimentado por Slack, meetings, docs
- 💼 **Business:** Análisis competitivo, due diligence
- 🎓 **Learning:** Notas de curso, conceptos interconectados

## Inspired By

- [[memex|Memex]] de [[vannevar-bush|Vannevar Bush]] (1945)
- Zettelkasten method
- Personal wikis (pero con LLM como mantenedor)

## Tools & Technologies

**Core:**
- LLM agents (Claude, GPT, etc.)
- Markdown files
- Git for versioning

**Recommended:**
- **Obsidian** - Best "IDE" para el wiki (graph view, search, plugins)
- **qmd** - Search híbrido BM25/vector para wikis grandes
- **Obsidian Web Clipper** - Capturar artículos web
- **Dataview** - Queries sobre frontmatter YAML

## Implementation Notes

### Scaling
- ✅ **Small scale (~100 sources):** `index.md` es suficiente
- ⚠️ **Medium scale (100-1000):** Considerar herramienta de búsqueda
- 📊 **Large scale (1000+):** Necesita jerarquía adicional, búsqueda vectorial

### Best Practices
1. **Procesar fuentes una a una:** Mantener supervisión humana
2. **Ser generoso con links:** Más cross-refs = mejor
3. **Lint periódicamente:** Cada ~10-15 ingests
4. **Archivar queries valiosas:** No perder síntesis buenas
5. **Git commits regulares:** Después de cada ingest significativo

## Why It Works

> "The tedious part of maintaining a knowledge base is not the reading or the thinking — it's the bookkeeping." - Karpathy

**Insight clave:** Humanos abandonan wikis porque el maintenance crece más rápido que el valor. LLMs:
- ✅ No se cansan
- ✅ No olvidan actualizar un cross-ref
- ✅ Pueden tocar 15 archivos en un pass
- ✅ Costo de mantenimiento ~0

El patrón pone al LLM haciendo lo que hace mejor (maintenance tedioso) y al humano haciendo lo que hace mejor (curaduría, análisis, pensamiento crítico).

## Related Concepts

- [[rag|RAG (Retrieval Augmented Generation)]] - Contraste
- [[memex|Memex]] - Inspiración histórica
- [[knowledge-compounding|Knowledge Compounding]]
- [[persistent-synthesis|Persistent Synthesis]]
- [[incremental-formalization|Incremental Formalization]]

## Open Questions

1. ¿Cómo gestionar múltiples humanos + LLM colaborando en un wiki?
2. ¿Límite práctico de escala antes de necesitar sharding/jerarquía?
3. ¿Cómo versioning de síntesis cuando nueva info contradice claims anteriores?
4. ¿Puede extenderse a dominios más allá de texto (code, data, multimedia)?

## Sources

- [[2026-07-21-llm-wiki-pattern-karpathy|LLM Wiki Pattern - Karpathy (2024)]] - Fuente original

---

**Última actualización:** 2026-07-21  
**Aparece en:** 1 fuente  
**Estado:** ⭐ Concepto fundacional de este wiki
