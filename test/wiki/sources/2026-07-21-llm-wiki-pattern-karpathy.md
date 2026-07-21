---
type: source
created: 2026-07-21
updated: 2026-07-21
tags: [llm, knowledge-management, personal-wiki, ai-agents, patterns]
source: raw/2026-07-21-llm-wiki-pattern-karpathy.md
author: Andrej Karpathy
---

# LLM Wiki Pattern - Andrej Karpathy

## Metadata
- **Tipo:** Artículo técnico / Pattern documentation
- **Autor:** [[andrej-karpathy|Andrej Karpathy]]
- **Fecha:** 2024
- **URL:** https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f
- **Procesado:** 2026-07-21

## Summary

Este documento presenta un patrón arquitectónico para construir bases de conocimiento personal usando LLMs de forma fundamentalmente diferente a [[rag|RAG]] tradicional. En lugar de recuperar chunks de documentos en cada query, el LLM construye y mantiene **incrementalmente un wiki persistente** — una colección estructurada e interconectada de archivos markdown que se enriquece con cada fuente añadida.

La diferencia clave: el conocimiento se compila una vez y se mantiene actualizado, no se re-deriva en cada pregunta. El wiki es un **artefacto persistente y acumulativo** donde las cross-referencias ya existen, las contradicciones están marcadas, y la síntesis refleja todo lo leído.

## Key Takeaways

1. **RAG vs Wiki Persistente:** RAG re-descubre conocimiento en cada query; un wiki persistente acumula y compila conocimiento una vez, manteniéndolo actualizado.

2. **Arquitectura de 3 capas:**
   - Raw sources (inmutables) - tu fuente de verdad
   - Wiki (mantenido por LLM) - síntesis estructurada
   - Schema (co-evolucionado) - reglas y workflows

3. **Tres operaciones principales:**
   - **INGEST:** Procesar nueva fuente → actualizar 10-15 páginas del wiki
   - **QUERY:** Responder contra el wiki → opcionalmente archivar respuestas valiosas
   - **LINT:** Health-check periódico del wiki (contradicciones, orphans, gaps)

4. **El LLM es el mantenedor:** Hace todo el bookkeeping tedioso que humanos abandonan (cross-refs, actualizaciones, consistencia).

5. **Compounding knowledge:** Cada fuente y cada query enriquece el wiki. El valor crece exponencialmente.

## Conceptos Discutidos

- [[rag|RAG (Retrieval Augmented Generation)]] - Comparación y contraste
- [[llm-wiki-pattern|LLM Wiki Pattern]] - El patrón principal
- [[memex|Memex (Vannevar Bush)]] - Inspiración histórica
- [[knowledge-compounding|Knowledge Compounding]] - Valor acumulativo
- [[persistent-synthesis|Persistent Synthesis]] - vs re-derivación en cada query

## Entidades Mencionadas

- [[andrej-karpathy|Andrej Karpathy]] - Autor del patrón
- [[vannevar-bush|Vannevar Bush]] - Creador del concepto Memex (1945)

## Herramientas y Tecnologías

- **Obsidian** - Mencionado como el "IDE" para el wiki
- **qmd** - Herramienta de búsqueda híbrida BM25/vector
- **Obsidian Web Clipper** - Para capturar fuentes web
- **Marp** - Para generar slide decks desde markdown
- **Dataview** - Plugin de Obsidian para queries sobre frontmatter

## Use Cases Sugeridos

1. **Personal:** Goals, salud, psicología, auto-mejora
2. **Research:** Deep-dive en un tema durante semanas/meses
3. **Lectura de libros:** Wiki companion con personajes, temas, plot threads
4. **Business/Team:** Wiki interno alimentado por Slack, transcripciones, docs
5. **Otros:** Análisis competitivo, due diligence, viajes, notas de curso

## Notable Quotes

> "The tedious part of maintaining a knowledge base is not the reading or the thinking — it's the bookkeeping."

> "The wiki is a persistent, compounding artifact. The cross-references are already there. The contradictions have already been flagged."

> "Humans abandon wikis because the maintenance burden grows faster than the value. LLMs don't get bored."

## Conexiones y Reflexiones

- **Implementación actual:** Este mismo sistema está construido siguiendo este patrón
- **Meta-insight:** Estamos usando LLM Wiki Pattern para documentar LLM Wiki Pattern
- **Contraste con NotebookLM:** NotebookLM usa RAG puro, no construye síntesis persistente
- **Inspiración Memex:** La idea de [[vannevar-bush|Vannevar Bush]] en 1945 era exactamente esto, pero faltaba quién hiciera el mantenimiento → ahora los LLMs pueden

## Open Questions

- ¿Cómo escala más allá de 1000 fuentes? ¿Se necesita jerarquía adicional?
- ¿Cuál es el punto donde la búsqueda simple (index.md) no es suficiente y se necesita búsqueda vectorial?
- ¿Cómo colaborar múltiples humanos + LLM en un mismo wiki?

## Related Sources

*Esta es la primera fuente del wiki, futuras fuentes que discutan temas similares aparecerán aquí.*

---

**Estado:** ✅ Completamente procesado e integrado en el wiki
