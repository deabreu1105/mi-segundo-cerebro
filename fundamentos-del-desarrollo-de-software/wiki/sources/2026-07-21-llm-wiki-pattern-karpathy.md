---
type: source
created: 2026-07-29
updated: 2026-07-29
tags: [llm, wiki, karpathy, rag, arquitectura]
source: raw/2026-07-21-llm-wiki-pattern-karpathy.md
author: Andrej Karpathy
---

# Patron LLM Wiki (LLM Wiki Pattern) — Andrej Karpathy

## Metadata
- **Fuente original:** `raw/2026-07-21-llm-wiki-pattern-karpathy.md`
- **Autor:** [[andrej-karpathy]]
- **Fecha de publicación original:** 2024
- **Tipo de documento:** Artículo Técnico / Documentación de Patrón

## Summary
Andrej Karpathy propone una alternativa al patrón RAG (Generación Aumentada por Recuperación) tradicional para la gestión personal del conocimiento mediante LLMs. En lugar de re-descubrir fragmentos de información desde cero con cada consulta (lo que genera redundancia y falta de acumulación), el LLM actúa como mantenedor (*bookkeeper*) de un wiki persistente e incremental estructurado en Markdown.

La arquitectura se divide en tres capas fundamentales: Fuentes originales inmutables (`raw/`), el Wiki compilado y mantenido por el LLM (`wiki/`), y el Esquema o mapa de reglas (`AGENTS.md` / `.agents/`). Las operaciones principales son Ingest (procesar fuentes), Query (consultar y sintetizar) y Lint (health check y mantenimiento). El valor principal radica en que el LLM asume la pesada tarea de contabilidad y mantenimiento de hipervínculos, referencias cruzadas y contradicciones.

## Key Takeaways
1. **Compilar una vez, acumular siempre:** A diferencia del RAG efímero, el wiki es un artefacto acumulativo donde las referencias cruzadas y contradicciones ya están resueltas.
2. **Tres capas independientes:** `raw/` (verdad inmutable humana), `wiki/` (conocimiento mantenido 100% por el LLM), y `Esquema` (instrucciones y directrices del agente).
3. **El LLM como mantenedor (*Bookkeeping*):** Los humanos abandonan los wikis por la alta carga de mantenimiento; los LLM destacan en mantener enlaces, índices y consistencia global.
4. **Respuestas archivables:** Las consultas valiosas sintetizadas por el agente pueden archivarse de nuevo dentro del wiki como nuevos documentos.
5. **Inspiración histórica:** El concepto evoca el Memex de [[vannevar-bush]] (1945), creando rastros asociativos entre conocimiento personal.

## Detailed Breakdown

### 1. La Idea Central: RAG vs. LLM Wiki Pattern
- **Limitación del RAG Tradicional:** NotebookLM y RAG recuperan fragmentos efímeros en cada pregunta sin acumulación de síntesis. Cada consulta redescubre el contexto desde cero.
- **La Solución LLM Wiki:** Un directorio de archivos Markdown persistentes e interconectados situados entre el usuario y las fuentes sin procesar. La información se compila de forma incremental una vez y se mantiene al día con cada nueva fuente.

### 2. Arquitectura en Tres Capas
- **Capa 1: Fuentes Originales (`raw/`):** Documentos, papers, imágenes e hipertextos inmutables. Es la fuente de verdad leída por el agente pero nunca alterada.
- **Capa 2: El Wiki (`wiki/`):** Archivos Markdown generados y mantenidos al 100% por el LLM (resúmenes, conceptos, entidades, comparaciones e índices).
- **Capa 3: El Esquema (`AGENTS.md` / `.agents/`):** Instrucciones, convenciones y protocolos que guían la ejecución del agente en Ingest, Query y Lint.

### 3. Las Tres Operaciones Principales
- **Ingest (Ingerir):** Procesamiento de una nueva fuente en `raw/`, discusión con el usuario, generación de resumen, actualización de índices, entidades, conceptos y registro en `log.md`.
- **Query (Consultar):** Consultas al wiki sintetizando respuestas con citas, con la capacidad de archivar respuestas valiosas en `wiki/queries/`.
- **Lint (Health Check / Mantenimiento):** Auditoría periódica buscando contradicciones, afirmaciones obsoletas, páginas huérfanas, referencias cruzadas faltantes y lagunas de información.

### 4. Indexación, Registro y Justificación (*Bookkeeping*)
- **`index.md`:** Catálogo navegable orientado al contenido.
- **`log.md`:** Registro cronológico append-only de operaciones.
- **Por qué funciona:** Delega en el LLM la tediosa tarea de contabilidad (*bookkeeping*), eliminando el aburrimiento humano y la pérdida de coherencia en wikis grandes.

## Entities Mentioned
- [[andrej-karpathy]]
- [[vannevar-bush]]

## Concepts Discussed
- [[llm-wiki-pattern]]
- [[soberania-humana-en-ia]]
- [[mentalidad-de-arquitecto]]

## Notable Quotes
> *"El conocimiento se compila una vez y luego se mantiene actualizado, en lugar de volver a derivarse en cada consulta."*

> *"La parte tediosa de mantener una base de conocimiento no es leer ni pensar, es la contabilidad y mantenimiento (bookkeeping)."*

## Connections & Reflections
- Esta fuente constituye la piedra angular de la arquitectura de este mismo vault ("Segundo Cerebro"), demostrando cómo un agente de IA puede estructurar y auto-mantener una base de conocimiento sin intervención humana continua en las tareas de contabilidad.

## Open Questions
- ¿Hasta qué punto de volumen de archivos en `wiki/` se mantiene eficiente la navegación y el linting global por un LLM?
