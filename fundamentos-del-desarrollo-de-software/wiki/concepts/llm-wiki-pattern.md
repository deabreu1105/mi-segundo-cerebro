---
type: concept
created: 2026-07-29
updated: 2026-07-29
tags: [arquitectura, llm, wiki, karpathy, pkm]
---

# LLM Wiki Pattern

## Definition
El **LLM Wiki Pattern** es un patrón de diseño arquitectónico para sistemas de gestión del conocimiento personal (PKM) acuñado por [[andrej-karpathy]]. Propone sustituir la recuperación RAG efímera por una base de conocimiento acumulativa en Markdown mantenida e interconectada activamente por un agente de IA.

## Key Ideas
- **Persistencia vs Efimeridad:** En lugar de re-evaluar documentos fuente con cada pregunta, el agente sintetiza e integra información de forma incremental.
- **División de Responsabilidades:** El humano curar las fuentes originales inmutables (`raw/`) y define las reglas del esquema (`AGENTS.md`), mientras el agente es dueño absoluto de la capa acumulativa (`wiki/`).
- **Delegación de Bookkeeping:** El mantenimiento de hipervínculos bidireccionales, resúmenes, índices (`index.md`) y registros (`log.md`) recae en el LLM.
- **Ciclo de Mantenimiento:** Apoyado en tres operaciones primarias: Ingest, Query y Lint.

## Applications
- Repositorios personales de conocimiento en Obsidian u otras herramientas en texto plano.
- Bases de conocimiento técnicas que requieren control de versión (Git) y síntesis continua.

## Sources
- [[wiki/sources/2026-07-21-llm-wiki-pattern-karpathy]] — Presentación original del patrón por [[andrej-karpathy]].

## Related Concepts
- [[soberania-humana-en-ia]]
- [[mentalidad-de-arquitecto]]

## Open Questions
- ¿Cómo gestionar eficientemente la migración o refactorización masiva de conceptos en wikis con miles de notas sin degradar la coherencia lógica?
