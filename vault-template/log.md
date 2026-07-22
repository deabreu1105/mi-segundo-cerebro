# 📋 Log de Operaciones — {{TEMA_VAULT}}

> Este es un registro cronológico **append-only** de todas las operaciones realizadas en el wiki.  
> Cada entrada comienza con `## [YYYY-MM-DD]` para facilitar el parsing.

---

## [{{FECHA_CREACION}}] init | Inicialización del Sistema

**Tipo:** Configuración inicial  
**Agente:** LLM Wiki Agent v3.0  
**Vault:** {{TEMA_VAULT}}

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
