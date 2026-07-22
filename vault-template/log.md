# 📋 Log de Operaciones — {{TEMA_VAULT}}

> Este es un registro cronológico **append-only** de todas las operaciones realizadas en el wiki.  
> Cada entrada comienza con `## [YYYY-MM-DD]` para facilitar el parsing.

---

## [{{FECHA_CREACION}}] init | Inicialización del Sistema

**Tipo:** Configuración inicial  
**Agente:** LLM Wiki Agent v2.0  
**Vault:** {{TEMA_VAULT}}

### Acciones realizadas:
1. ✅ Creada estructura de carpetas:
   - `raw/` — Para fuentes originales (con subcarpetas: assets, books, journal, web, **papers**)
   - `wiki/entities/` — Para páginas de entidades
   - `wiki/concepts/` — Para páginas de conceptos
   - `wiki/sources/` — Para summaries de fuentes
   - `wiki/queries/` — Para respuestas archivadas
   - `_templates/` — Para plantillas reutilizables

2. ✅ Creados archivos del sistema:
   - `AGENTS.md` — Schema completo del agente (v2.0)
   - `HOME.md` — Punto de entrada principal
   - `index.md` — Índice inicial vacío
   - `log.md` — Este archivo
   - `_templates/*.md` — Plantillas para entidades, conceptos, fuentes y queries

### Estado inicial:
- **Fuentes procesadas:** 0
- **Páginas wiki:** 0
- **Sistema:** ✅ Operacional y listo

### Próximos pasos:
- Editar placeholders `{{NOMBRE_USUARIO}}`, `{{TEMA_VAULT}}`, `{{FECHA_CREACION}}` en AGENTS.md y HOME.md
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
