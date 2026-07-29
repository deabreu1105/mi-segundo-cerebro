# 📋 Log de Operaciones — Fundamentos del desarrollo de software

> Este es un registro cronológico **append-only** de todas las operaciones realizadas en el wiki.  
> Cada entrada comienza con `## [YYYY-MM-DD]` para facilitar el parsing.

---

## [2026-07-29] init | Inicialización del Sistema

**Tipo:** Configuración inicial  
**Agente:** LLM Wiki Agent v3.0  
**Vault:** Fundamentos del desarrollo de software

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

---

## [2026-07-29] init | Vault inicializado por Daniel

**Tema:** Fundamentos del desarrollo de software
**Script:** init.sh
**Acción:** Placeholders reemplazados en AGENTS.md, HOME.md, index.md, log.md

---

## [2026-07-29] ingest | Ingesta Global — Patron LLM Wiki (Karpathy)

**Archivo fuente:** `raw/2026-07-21-llm-wiki-pattern-karpathy.md`

### Páginas creadas:
- `wiki/sources/2026-07-21-llm-wiki-pattern-karpathy.md`
- `wiki/entities/andrej-karpathy.md`
- `wiki/entities/vannevar-bush.md`
- `wiki/concepts/llm-wiki-pattern.md`

### Páginas actualizadas:
- `index.md`

### Insights destacados:
El LLM como mantenedor (*bookkeeper*) de un wiki persistente e incremental resuelve la falta de acumulación del RAG tradicional.

---

## [2026-07-29] ingest | Fundamentos del Pensamiento Computacional

**Archivo fuente:** `raw/papers/2026-07-29-fundamentos-del-pensamiento-computacional.md`

### Páginas creadas:
- `wiki/sources/2026-07-29-fundamentos-del-pensamiento-computacional.md`
- `wiki/entities/brais-moure.md`
- `wiki/entities/big-school.md`
- `wiki/concepts/pensamiento-computacional.md`
- `wiki/concepts/descomposicion.md`
- `wiki/concepts/reconocimiento-de-patrones.md`
- `wiki/concepts/abstraccion.md`
- `wiki/concepts/diseno-de-algoritmos.md`

### Páginas actualizadas:
- `index.md`

### Insights destacados:
La sintaxis de código es un commodity con IA; el valor diferencial del ingeniero reside en la descomposición, abstracción y diseño algorítmico previo.

---

## [2026-07-29] ingest | Metodologías de Resolución de Problemas y Debugging

**Archivo fuente:** `raw/papers/2026-07-29-metodologias-de-resolucion-de-problemas.md`

### Páginas creadas:
- `wiki/sources/2026-07-29-metodologias-de-resolucion-de-problemas.md`
- `wiki/concepts/metodologia-de-debugging.md`

### Páginas actualizadas:
- `wiki/entities/brais-moure.md`
- `wiki/entities/big-school.md`
- `index.md`

### Insights destacados:
El ensayo y error introduce deuda técnica oculta; el debugging exige un método científico estricto de 5 pasos aislando una variable a la vez.

---

## [2026-07-29] ingest | Ejercicios Prácticos de Pensamiento Computacional

**Archivo fuente:** `raw/papers/2026-07-29-ejercicios-practicos-pensamiento-computacional.md`

### Páginas creadas:
- `wiki/sources/2026-07-29-ejercicios-practicos-pensamiento-computacional.md`

### Páginas actualizadas:
- `wiki/concepts/descomposicion.md`
- `wiki/concepts/diseno-de-algoritmos.md`
- `index.md`

### Insights destacados:
La diferenciación entre Happy Path y Edge Cases (casos borde) es crítica para el diseño de soluciones robustas en entornos reales.

---

## [2026-07-29] ingest | Conclusiones: Pensamiento Computacional y Resolución de Problemas

**Archivo fuente:** `raw/papers/2026-07-29-conclusiones-pensamiento-computacional-y-resolucion-de-problemas.md`

### Páginas creadas:
- `wiki/sources/2026-07-29-conclusiones-pensamiento-computacional-y-resolucion-de-problemas.md`
- `wiki/concepts/mentalidad-de-arquitecto.md`
- `wiki/concepts/soberania-humana-en-ia.md`

### Páginas actualizadas:
- `wiki/entities/brais-moure.md`
- `wiki/entities/big-school.md`
- `index.md`

### Insights destacados:
El programador que no evoluciona hacia la mentalidad de arquitecto corre el riesgo de ser automatizado; el juicio humano mantiene la soberanía sobre la IA.

---

---

## [2026-07-29] lint | Health Check & Estandarización de Rutas Wikilinks

**Tipo:** Mantenimiento, Linting y Estandarización de Rutas  
**Agente:** Subagente LINT v3.0  
**Resultado:** 🟢 Saludable

### Resumen de auditoría de 7 puntos:
1. ✅ **Contradicciones:** 0 encontradas.
2. ✅ **Páginas huérfanas:** 0 encontradas (100% de las 19 páginas conectadas).
3. ✅ **Conceptos desatendidos:** 0 encontrados (todos los conceptos tienen nota dedicada).
4. ✅ **Resolución de Wikilinks & Cross-references:** Auditadas 100% de las referencias. Se estandarizó el uso de enlaces cualificados `[[wiki/sources/...]]` en `index.md`, conceptos y entidades para eliminar la ambigüedad con archivos en `raw/`.
5. ℹ️ **Information Gaps:** Identificados vacíos de contenido para futuros módulos (Sintaxis de Lenguajes, TDD y CI/CD).
6. ✅ **`index.md`:** Actualizado con el contador exacto de 19 páginas y enlaces cualificados.
7. ✅ **Frontmatter:** 100% de notas con metadata completa.

### Reporte archivado:
- `wiki/queries/lint-2026-07-29.md`

---

## [2026-07-29] update | Enriquecimiento con Detailed Breakdown y Nuevos Conceptos

**Tipo:** Mejora de Metodología e Integración de Conocimiento  
**Agente:** LLM Wiki Agent v3.0  

### Acciones realizadas:
1. ✅ **Actualizado Protocolo Agéntico:**
   - Incorporada la sección `## Detailed Breakdown` como obligatoria en `AGENTS.md`, `.agents/agents/ingest.md` y `.templates/source.md`.
2. ✅ **Enriquecidas las 5 Fuentes de `wiki/sources/`:**
   - Añadido el desglose detallado de secciones, desgloses jerárquicos de Stack Trace (Nivel 1 al 4), análisis de logs, breakpoints, patito de goma, mapa mental de suscripciones y soberanía técnica.
3. ✅ **Creadas 4 Nuevas Páginas de Concepto (`wiki/concepts/`):**
   - `wiki/concepts/stack-trace.md`
   - `wiki/concepts/analisis-de-logs.md`
   - `wiki/concepts/breakpoints.md`
   - `wiki/concepts/rubber-duck-debugging.md`
4. ✅ **Actualizado `index.md`:**
   - Métricas globales actualizadas a 23 páginas y 13 conceptos.





