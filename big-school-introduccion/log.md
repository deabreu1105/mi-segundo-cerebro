# 📋 Log de Operaciones — Big school introducción

> Este es un registro cronológico **append-only** de todas las operaciones realizadas en el wiki.  
> Cada entrada comienza con `## [YYYY-MM-DD]` para facilitar el parsing.

---

## [2026-07-22] init | Inicialización del Sistema

**Tipo:** Configuración inicial  
**Agente:** LLM Wiki Agent v3.0  
**Vault:** Big school introducción

### Acciones realizadas:
1. ✅ Creada estructura de carpetas:
   - `raw/` — Para fuentes originales (con subcarpetas: assets, books, journal, web, papers)
   - `wiki/entities/` — Para páginas de entidades
   - `wiki/concepts/` — Para páginas de conceptos
   - `wiki/sources/` — Para summaries de fuentes
   - `wiki/queries/` — Para respuestas archivadas
   - `_templates/` — Para plantillas reutilizables
   - `.agents/agents/` — Para subagentes especializados

2. ✅ Creados archivos del sistema:
   - `init.sh` — Script de inicialización y verificación del vault
   - `AGENTS.md` — Root agent (punto de entrada del LLM, v3.0)
   - `.agents/agents/ingest.md` — Subagente INGEST
   - `.agents/agents/query.md` — Subagente QUERY
   - `.agents/agents/lint.md` — Subagente LINT
   - `.agents/settings.json` — Configuración del sistema de agentes
   - `HOME.md` — Punto de entrada principal
   - `index.md` — Índice inicial vacío
   - `log.md` — Este archivo
   - `_templates/*.md` — Plantillas para entidades, conceptos, fuentes y queries

### Estado inicial:
- **Fuentes procesadas:** 0
- **Páginas wiki:** 0
- **Sistema:** ✅ Operacional y listo

### Próximos pasos:
- Ejecutar `chmod +x init.sh && ./init.sh` para personalizar el vault
- Añadir primera fuente a `raw/`
- Ejecutar workflow INGEST

---

**Tip para parsear el log:**
```bash
# Ver últimas 5 operaciones
grep "^## \[" log.md | tail -5

# Ver solo ingests
grep "^## \[.*\] ingest" log.md

# Ver solo queries archivadas
grep "^## \[.*\] query" log.md

# Ver operaciones de una fecha específica
grep "^## \[2026-07-21\]" log.md
```

---

*El log continúa abajo conforme se realizan más operaciones...*

---

## [2026-07-22] ingest | Batch — 10 Papers de Big School Introducción

**Archivos fuente:** `raw/papers/` (procesados en secuencia)

### Páginas creadas — Sources (10):
- `wiki/sources/2026-07-22-introduccion-y-fundamentos-de-desarrollo.md`
- `wiki/sources/2026-07-22-documentacion-y-gestion-del-conocimiento.md`
- `wiki/sources/2026-07-22-filosofia-del-desarrollador-aumentado.md`
- `wiki/sources/2026-07-22-habitos-de-aprendizaje-sostenibles.md`
- `wiki/sources/2026-07-22-herramientas-especializadas-copilot-warp-cursor.md`
- `wiki/sources/2026-07-22-sintesis-de-documentacion-con-notebooklm.md`
- `wiki/sources/2026-07-22-tecnicas-de-estudio-para-programacion.md`
- `wiki/sources/2026-07-22-tutoria-e-interaccion-inteligente-prompting.md`
- `wiki/sources/2026-07-22-uso-responsable-durante-el-aprendizaje.md`
- `wiki/sources/2026-07-22-uso-responsable-durante-el-desarrollo.md`

### Páginas creadas — Entidades (6):
- `wiki/entities/big-school.md`
- `wiki/entities/github-copilot.md`
- `wiki/entities/warp.md`
- `wiki/entities/cursor.md`
- `wiki/entities/notebooklm.md`
- `wiki/entities/obsidian.md`

### Páginas creadas — Conceptos (6):
- `wiki/concepts/metamodelo-centauro.md`
- `wiki/concepts/active-recall.md`
- `wiki/concepts/ilusion-de-competencia.md`
- `wiki/concepts/fundamentos-inmutables.md`
- `wiki/concepts/second-brain.md`
- `wiki/concepts/formula-rctf.md`

### Páginas actualizadas:
- `index.md` — 10 sources + 6 entidades + 6 conceptos indexados
- `log.md` — este registro

### Insights destacados:
- ⚠️ **Tensión identificada entre papers**: `uso-responsable-durante-el-aprendizaje` dice "nunca usar IA en fundamentos"; `tutoria-e-interaccion-inteligente-prompting` propone usar IA como tutor socrático desde el inicio. Resolución: el tutor socrático es válido si NO revela soluciones directas.
- Los 10 papers forman un marco cohesivo: **mentalidad → herramientas → técnicas → filosofía de uso**.
- El concepto de [[metamodelo-centauro]] actúa como hub filosófico que unifica todos los demás.
- ~20 conceptos mencionados en múltiples fuentes sin página propia — candidatos para próximo lint/expansión.

---

## [2026-07-22] lint | Health Check #1

### Issues encontrados y resueltos:
1. ✅ **Contradicción marcada** — `uso-responsable-durante-el-aprendizaje` vs `tutoria-e-interaccion-inteligente-prompting`: marcada con `⚠️ CONTRADICCIÓN:` en ambas fuentes con resolución propuesta
2. ✅ **Huérfana resuelta** — `[[notion]]` linkada desde 4 páginas sin entidad propia → creada `wiki/entities/notion.md`
3. ✅ **Cross-refs añadidas** — `metamodelo-centauro` ← `[[warp]]`; `second-brain` ← `[[notebooklm]]`

### Gaps identificados (pendiente):
- ~20 conceptos sin página propia: `tutorial-hell`, `deep-work`, `lucha-productiva`, `rag`, `tutor-socratico`, `data-leakage`, `flow-state`, `habit-stacking`, `tecnica-feynman`, etc.

### Estado: 🟡 Atención requerida — saludable para 1er día, pendiente expansión de conceptos.

---

## [2026-07-22] query | NotebookLM vs Obsidian

**Pregunta:** Compara NotebookLM con Obsidian

### Páginas consultadas:
- `wiki/entities/notebooklm.md`
- `wiki/entities/obsidian.md`
- `wiki/concepts/second-brain.md`
- `wiki/sources/2026-07-22-sintesis-de-documentacion-con-notebooklm.md`
- `wiki/sources/2026-07-22-documentacion-y-gestion-del-conocimiento.md`

### Archivada en:
- `wiki/queries/2026-07-22-notebooklm-vs-obsidian.md`

### Insight clave:
Son complementarias, no competidoras. NotebookLM **extrae** conocimiento de documentos existentes vía RAG; Obsidian **integra** ese conocimiento en una red personal acumulativa. El flujo ideal: docs brutos → NotebookLM → insights → Obsidian.


## [2026-07-22] config | Añadida carpeta raw/papers/ y soporte para PDFs

**Tipo:** Modificación de arquitectura  
**Agente:** LLM Wiki Agent v2.0  

### Acciones realizadas:
1. ✅ Creada carpeta `raw/papers/` — Para papers académicos y PDFs convertidos a Markdown
2. ✅ Actualizado `AGENTS.md`:
   - `raw/papers/` añadida a la lista de subcarpetas (Capa 1)
   - Nota sobre limitación de LLMs con binarios PDF
   - Nuevo flujo de trabajo **"Procesamiento de PDFs"** con comandos `pandoc` y `pdftotext`
   - Sección "Research Académico" actualizada para referenciar `raw/papers/`
3. ✅ Actualizado `HOME.md` — Árbol de carpetas incluye `raw/papers/`
4. ✅ Actualizado `README.md` — Estructura del template incluye `raw/papers/`
5. ✅ Actualizado `log.md` — Init entry refleja la subcarpeta papers

### Convención para papers:
- Convertir PDF → `.md` con `pandoc` o `pdftotext` antes de depositar
- Nombre: `YYYY-MM-DD-titulo-del-paper.md`
- PDF original opcional en `raw/assets/` como referencia

---

## [2026-07-22] config | Arquitectura multi-agente v3.0

**Tipo:** Rediseño de arquitectura  
**Agente:** LLM Wiki Agent v3.0  

### Acciones realizadas:
1. ✅ Creado `init.sh` — Script interactivo de inicialización (setup + check modes)
2. ✅ `AGENTS.md` convertido en root agent ligero (~80 líneas) — era monolítico de 450 líneas
3. ✅ Creados subagentes especializados en `.agents/agents/`:
   - `ingest.md` — Workflow completo INGEST con templates de páginas
   - `query.md` — Workflow de consulta y decisión de archivado
   - `lint.md` — Health-check de 7 puntos con plantilla de reporte
4. ✅ Creado `.agents/settings.json` — Registro de subagentes y permisos
5. ✅ Actualizados `HOME.md`, `README.md`, `log.md` — arquitectura v3.0

### Beneficios:
- El agente LLM solo lee lo que necesita (divulgación progresiva)
- Setup del vault automatizado con un solo comando: `./init.sh`
- Workflows detallados aislados por operación

---

## [2026-07-22] init | Vault inicializado por Daniel

**Tema:** Big school introducción
**Script:** init.sh
**Acción:** Placeholders reemplazados en AGENTS.md, HOME.md, index.md, log.md
