---
type: query
created: 2026-07-22
tags: [lint, health-check]
---

# Reporte de Lint — 2026-07-22

## Resumen Ejecutivo

| Categoría | Issues encontrados | Resueltos en esta sesión |
|-----------|-------------------|--------------------------|
| Contradicciones | 1 | 1 ✅ |
| Huérfanas (links sin página) | 1 | 1 ✅ |
| Cross-refs faltantes | 3 | 3 ✅ |
| Gaps de información | ~20 conceptos sin página | 0 (pendiente) |
| Index desactualizado | 0 | — |
| Frontmatter incompleto | 0 | — |

**Estado general del wiki:** 🟡 **Atención requerida** — Saludable para su edad (recién creado), pero con ~20 conceptos mencionados que no tienen página propia.

---

## Issues Encontrados y Acciones Tomadas

### ✅ Contradicciones

- **[[2026-07-22-uso-responsable-durante-el-aprendizaje]]** vs **[[2026-07-22-tutoria-e-interaccion-inteligente-prompting]]**: El primer paper prohíbe usar IA durante el aprendizaje inicial de fundamentos; el segundo propone usar IA como tutor socrático.
  → **Resolución marcada en ambas páginas con `⚠️ CONTRADICCIÓN:`**: la distinción clave es IA para *guiar el pensamiento* (permitido con tutor socrático) vs IA para *sustituir el pensamiento* (prohibido — generar código o soluciones directas).

### ✅ Páginas Huérfanas (links sin destino)

- **`[[notion]]`** — linkada desde 4 páginas (`documentacion-y-gestion-del-conocimiento`, `second-brain` ×3, `obsidian`) pero sin entidad propia.
  → **Creada** `wiki/entities/notion.md`

### ✅ Cross-References Faltantes

- **`[[metamodelo-centauro]]`** no referenciaba a `[[warp]]` en su sección Applications, a pesar de que Warp es un ejemplo directo del modelo centauro (IA asume CLI táctica).
  → **Añadido** el link en `Applications`

- **`[[second-brain]]`** no referenciaba a `[[notebooklm]]` a pesar de ser su herramienta de síntesis complementaria.
  → **Añadido** el link en `Applications`

- **`[[metamodelo-centauro]]`** ya tenía `[[github-copilot]]` ✅ y ahora tiene `[[warp]]` ✅

### ⚠️ Gaps de Información — Pendiente de expansión

Los siguientes ~20 conceptos están linkados en múltiples páginas pero sin página propia. Son candidatos para el próximo ciclo de ingests o creación manual:

**Alta prioridad** (3+ menciones):
- `[[tutorial-hell]]` — 3 menciones en sources
- `[[deep-work]]` — 2 menciones en sources + 1 en conceptos
- `[[lucha-productiva]]` — 2 menciones en sources + 1 en conceptos
- `[[rag-retrieval-augmented-generation]]` — 2 menciones en sources + entidad

**Media prioridad** (2 menciones):
- `[[valle-de-la-desesperacion]]`, `[[tutor-socratico]]`, `[[metodo-del-sandwich]]`
- `[[data-leakage]]`, `[[flow-state]]`, `[[project-awareness]]`
- `[[bug-journal]]`, `[[adr-registros-decision-arquitectura]]`, `[[codigo-plausible-incorrecto]]`
- `[[habit-stacking]]`, `[[no-cero-dias]]`, `[[tecnica-feynman]]`

---

## Métricas del Wiki

| Métrica | Valor |
|---------|-------|
| Total páginas en wiki/ | 23 |
| Sources procesadas | 10 |
| Entidades | 7 (+ 1 creada en lint) |
| Conceptos con página | 6 |
| Conceptos sin página | ~20 |
| Queries archivadas | 1 (este reporte) |
| Contradicciones marcadas | 1 |
| Promedio inbound links (entidades) | ~2.5 |

---

## Próximas Fuentes Recomendadas

Basado en los gaps encontrados, estos tipos de material cubrirían los conceptos faltantes:

1. **Deep Work (Cal Newport)** — cubriría `[[deep-work]]`, `[[timeboxing]]`, `[[cambio-de-contexto]]`
2. **Atomic Habits (James Clear)** — cubriría `[[habit-stacking]]`, `[[no-cero-dias]]`, `[[bucle-del-habito]]`
3. **Getting Things Done (David Allen)** — cubriría `[[gtd-getting-things-done]]`, `[[timeboxing]]`
4. **Material sobre arquitecturas RAG** — cubriría `[[rag-retrieval-augmented-generation]]`, `[[grounding]]`
5. **Feynman Technique** — artículo específico para `[[tecnica-feynman]]`
