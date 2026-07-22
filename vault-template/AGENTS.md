# AGENTS.md — Segundo Cerebro: Mapa del Agente

> Este archivo es tu **punto de entrada y protocolo de arranque**. Es un mapa, no una biblia.
> Lee solo lo que necesites cuando lo necesites.
> Todo el detalle operativo está en `.agents/agents/`.

---

## 1. Antes de empezar (obligatorio)

1. **Verifica el vault:** ejecuta `./init.sh --check` y confirma que termina sin errores.
   - Si hay placeholders sin reemplazar → ejecuta `./init.sh` (te pedirá nombre y tema).
   - Si falla cualquier otra verificación → para y resuelve antes de avanzar.

2. **Oriéntate:** lee `index.md` para saber qué hay en el wiki.

3. **Contexto reciente:** lee el último entry de `log.md` para ver en qué quedó la sesión anterior.

---

## 2. Las Tres Operaciones

| El humano dice... | Qué haces |
|-------------------|-----------|
| `"Procesa [archivo en raw/]"` | Lees `.agents/agents/ingest.md` y ejecutas ese workflow |
| `"¿Qué sabemos sobre X?"` o cualquier pregunta | Lees `.agents/agents/query.md` y ejecutas ese workflow |
| `"Lint el wiki"` o `"Health check"` | Lees `.agents/agents/lint.md` y ejecutas ese workflow |

---

## 3. Mapa del repositorio

| Archivo / carpeta | Propósito | Cuándo leerlo |
|-------------------|-----------|---------------|
| `init.sh` | Setup y verificación del vault | Al arrancar (via `--check`) |
| `index.md` | Catálogo navegable de todo el wiki | Al inicio de cada sesión |
| `log.md` | Registro cronológico append-only | Para ver el estado previo |
| `HOME.md` | Punto de entrada para el humano | Si necesitas contexto general |
| `raw/` | Fuentes originales **inmutables** | Para leer fuentes (INGEST) |
| `raw/assets/` | Imágenes y multimedia | Contexto visual de fuentes |
| `raw/books/` | Capítulos de libros convertidos | INGEST de libros |
| `raw/journal/` | Entradas de diario (YYYY-MM-DD.md) | INGEST de diario |
| `raw/papers/` | Papers académicos en Markdown | INGEST de papers/PDFs |
| `raw/web/` | Artículos web clipeados | INGEST de artículos web |
| `wiki/sources/` | Summaries de cada fuente procesada | QUERY / LINT |
| `wiki/entities/` | Personas, lugares, organizaciones | QUERY / LINT |
| `wiki/concepts/` | Ideas, teorías, metodologías | QUERY / LINT |
| `wiki/queries/` | Respuestas valiosas archivadas | QUERY |
| `_templates/` | Plantillas para nuevas páginas | Referencia al crear páginas |
| `.agents/agents/ingest.md` | Workflow completo de INGEST | Antes de procesar una fuente |
| `.agents/agents/query.md` | Workflow completo de QUERY | Antes de responder preguntas |
| `.agents/agents/lint.md` | Workflow completo de LINT | Antes de hacer health-check |
| `.agents/settings.json` | Configuración del sistema de agentes | Referencia técnica |

---

## 4. Reglas no negociables

- **NUNCA modifiques archivos en `raw/`** — son fuentes originales inmutables. Tu fuente de verdad.
- **Siempre registra en `log.md`** — toda operación (ingest, query archivada, lint) deja traza.
- **Siempre actualiza `index.md`** después de un INGEST — el índice debe reflejar el estado real.
- **Marca contradicciones explícitamente** con `⚠️ CONTRADICCIÓN:` — nunca las ignores.
- **Si no sabes cómo categorizar algo, pregunta** — no asumas, no inventes categorías nuevas.

---

## 5. Cuándo parar y pedir al humano

Para y pide input cuando:
- Hay ambigüedad sobre cómo categorizar una fuente o concepto
- Encuentras contradicciones que requieren juicio de valor
- Hay múltiples formas válidas de estructurar información importante
- Un ingest reveló algo que cambia significativamente el entendimiento previo

---

## 6. Versionado y respaldo

```bash
# Commit tras cada ingest significativo
git add -A && git commit -m "ingest: [título de la fuente]"

# Commit tras lint
git add -A && git commit -m "lint: health check $(date +%Y-%m-%d)"

# Ver historial de operaciones
grep "^## \[" log.md | tail -10
grep "^## \[.*\] ingest" log.md
```

---

> *"The tedious part of maintaining a knowledge base is not the reading or the thinking — it's the bookkeeping."*
> — Andrej Karpathy

**Versión:** 3.0 · **Arquitectura:** Root Agent + Subagentes especializados
