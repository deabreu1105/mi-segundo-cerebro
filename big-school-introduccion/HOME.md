# 🧠 Big school introducción — Segundo Cerebro

> **Usuario:** Daniel  
> **Tema:** Big school introducción  
> **Iniciado:** 2026-07-22  
> **Estado:** 🚀 Listo para recibir la primera fuente

---

## 🗺️ Navegación Rápida

| Sección                        | Descripción              |
| ------------------------------ | ------------------------ |
| [[index\|📚 Índice completo]]  | Catálogo de todo el wiki |
| [[log\|📋 Log de operaciones]] | Historia cronológica     |
| [[AGENTS\|🗺️ Root Agent]]     | Protocolo del agente LLM |
| [[PROMPTS\|🎯 Cheatsheet de prompts]] | Referencia rápida de todos los comandos |

---

## 📂 Estructura del Vault

```
vault/
│
├── init.sh            ⚙️  Inicialización y verificación del vault
├── HOME.md            👋 Estás aquí
├── AGENTS.md          🗺️  Root Agent — punto de entrada del LLM
├── index.md           📚 Índice navegable del wiki
├── log.md             📋 Registro cronológico
│
├── .agents/           🤖 Subagentes especializados
│   ├── agents/
│   │   ├── ingest.md  📥 Workflow de INGEST
│   │   ├── query.md   💬 Workflow de QUERY
│   │   └── lint.md    🔍 Workflow de LINT
│   └── settings.json
│
├── raw/               📥 Tus fuentes originales (INMUTABLES)
│   ├── assets/        🖼️  Imágenes y multimedia
│   ├── books/         📖 Capítulos de libros
│   ├── journal/       📝 Entradas de diario
│   ├── papers/        📄 Papers y PDFs convertidos a Markdown
│   └── web/           🌐 Artículos web clipeados
│
├── wiki/              🧠 Base de conocimiento (LLM la mantiene)
│   ├── sources/       📄 Summaries de cada fuente
│   ├── entities/      👥 Personas, lugares, organizaciones
│   ├── concepts/      💡 Ideas, teorías, metodologías
│   └── queries/       🔍 Respuestas valiosas archivadas
│
└── _templates/        📋 Plantillas para nuevas páginas
    ├── concept.md
    ├── entity.md
    ├── source.md
    └── query.md
```

---

## 🎯 Las Tres Operaciones

### 📥 INGEST — Procesar nueva fuente
**Tú dices:** `"Procesa [archivo en raw/]"`

El agente: lee la fuente → discute contigo → crea summary → actualiza conceptos y entidades → cross-references → actualiza index y log.

**Resultado:** 10-15 páginas tocadas, conocimiento integrado.

---

### 💬 QUERY — Hacer preguntas
**Tú dices:** `"¿Qué sabemos sobre [tema]?"` o `"Compara X con Y"`

El agente: busca en index → lee páginas relevantes → sintetiza respuesta con `[[wikilinks]]` → archiva si es valiosa.

---

### 🔍 LINT — Mantener salud
**Tú dices:** `"Lint el wiki"` o `"Health-check"`

El agente: busca contradicciones → páginas huérfanas → cross-refs faltantes → gaps de información → sugiere próximas fuentes.

**Frecuencia recomendada:** cada 10-15 ingests.

---

## 📊 Estado Actual

| Métrica | Valor |
|---------|-------|
| Fuentes procesadas | 0 |
| Entidades | 0 |
| Conceptos | 0 |
| Queries archivadas | 0 |
| Última operación | — |

*Actualizado automáticamente en cada ingest.*

---

## 💡 Comandos Útiles

```
"Procesa [archivo]"
"¿Qué sabemos sobre [tema]?"
"Compara [A] con [B]"
"Lint el wiki"
"¿Qué debería leer sobre [tema]?"
"Muéstrame las contradicciones en [tema]"
"¿Cuáles son las páginas más conectadas?"
"Resume todo lo que sabemos sobre [entidad]"
```

---

## 🛠️ Configuración Recomendada de Obsidian

### Plugins Core (ya activos)
- ✅ **Graph view** — Ctrl+G para visualizar conexiones
- ✅ **Backlinks** — Ver referencias inversas
- ✅ **Quick switcher** — Ctrl+O para buscar rápido
- ✅ **Properties** — Vista de frontmatter YAML
- ✅ **Templates** — Para usar las plantillas en `_templates/`

### Plugins Community (recomendados)
- **Dataview** — Queries sobre frontmatter YAML
- **Obsidian Web Clipper** — Capturar artículos web directamente a `raw/web/`

### Hotkeys Sugeridos
- `Ctrl+O` — Quick switcher
- `Ctrl+G` — Graph view
- `Ctrl+Click` en `[[wikilink]]` — Abrir en nueva pestaña

---

> *"The tedious part of maintaining a knowledge base is not the reading or the thinking — it's the bookkeeping."*  
> — Andrej Karpathy

**Tu segundo cerebro está listo. ¿Qué quieres aprender primero?** 🚀
