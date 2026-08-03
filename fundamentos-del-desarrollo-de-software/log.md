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

---

## [2026-07-30] ingest | Ingesta Masiva Módulo 1 (Ecosistema Moderno)

**Tipo:** Ingesta Masiva de Documentos Fuentes  
**Agente:** Subagente INGEST v3.0  
**Fuentes procesadas:** 4 nuevas fuentes en `raw/papers/`

### Páginas creadas en `wiki/sources/`:
- `wiki/sources/2026-07-30-terminal-y-linea-de-comandos.md`
- `wiki/sources/2026-07-30-control-de-versiones-con-git-y-github.md`
- `wiki/sources/2026-07-30-entornos-de-desarrollo-ide.md`
- `wiki/sources/2026-07-30-ecosistema-del-desarrollo-de-software-moderno-conclusiones.md`

### Páginas de conceptos creadas en `wiki/concepts/`:
- `wiki/concepts/terminal-y-cli.md`
- `wiki/concepts/shell-bash-zsh.md`
- `wiki/concepts/redirecciones-y-pipes.md`
- `wiki/concepts/control-de-versiones-git.md`
- `wiki/concepts/github-y-colaboracion.md`
- `wiki/concepts/entornos-de-desarrollo-ide.md`

### Entidades creadas/actualizadas en `wiki/entities/`:
- `wiki/entities/fernando-herrera.md` (Creada)
- `wiki/entities/brais-moure.md` (Actualizada)
- `wiki/entities/big-school.md` (Actualizada)

### Mantenimiento e Índice:
- `index.md` actualizado con 35 páginas totales y 9 fuentes.

---

## [2026-07-30] lint | Health Check del Wiki (Módulo 1 Completado)

**Tipo:** Mantenimiento y Linting Global  
**Agente:** Subagente LINT v3.0  
**Resultado:** 🟢 Saludable

### Resumen de auditoría de 7 puntos:
1. ✅ **Contradicciones:** 0 encontradas.
2. ✅ **Páginas huérfanas:** 0 encontradas (100% de las 35 páginas conectadas).
3. ✅ **Conceptos desatendidos:** 0 encontrados.
4. ✅ **Resolución de Wikilinks & Cross-references:** Auditadas 100% de las referencias. Se verifica la sintaxis cualificada `[[wiki/sources/...]]`.
5. ℹ️ **Information Gaps:** Identificados vacíos de contenido para futuros módulos (Sintaxis de Lenguajes, TDD y CI/CD).
6. ✅ **`index.md`:** Actualizado con el contador exacto de 35 páginas.
7. ✅ **Frontmatter:** 100% de notas con metadata YAML válida.

### Reporte archivado:
- `wiki/queries/lint-2026-07-30.md`

---

## [2026-07-30] config | Arquitectura multi-agente (Antigravity + Claude Code)

**Tipo:** Endurecimiento del ecosistema agéntico
**Agente:** Claude Code

### Acciones realizadas:
1. ✅ Creado `CLAUDE.md` — puente de una línea (`@AGENTS.md`) para que Claude Code cargue el mismo
   root agent que Antigravity, sin duplicar contenido.
2. ✅ Creado `.agents/skills/grill-me.md` — el comando `/grill-me` mencionado en README/HOME/PROMPTS
   no existía como archivo ejecutable; ahora sí, y Antigravity lo reconoce nativamente en `.agents/skills/`.
3. ✅ Creados `.claude/agents/{ingest,query,lint}.md` y `.claude/commands/grill-me.md` como **symlinks**
   hacia los archivos canónicos en `.agents/` — Claude Code ahora ejecuta subagentes reales
   (contexto aislado vía Task tool) en vez de que el agente principal solo "lea" esos workflows.
4. ✅ Creado `.claude/settings.json` — enforcement real para Claude Code:
   - `permissions.deny` bloquea `Edit`/`Write` sobre `raw/**` a nivel de herramienta.
   - Hook `SessionStart` corre `./init.sh --check` automáticamente al abrir sesión.
5. ✅ Actualizado `.agents/settings.json` — añadido registro del skill `grill-me` y nota aclarando
   que el enforcement real de Claude Code vive en `.claude/settings.json`.
6. ✅ Actualizados `AGENTS.md` (nueva sección "Multi-agente") y `README.md` (árbol de estructura +
   nota) para documentar la arquitectura de puentes/symlinks. La sección de estudio activo
   personalizada de este vault (Rubber Duck Debugging, Gitflow, bugs de producción) no se tocó.

### Por qué:
Este vault se usa tanto con Antigravity (lee `AGENTS.md` y `.agents/` nativamente) como con Claude
Code (requiere `CLAUDE.md` y `.claude/agents/`). Con symlinks hay un solo archivo real por
workflow/skill — misma arquitectura ya aplicada en `vault-template/`.

---

## [2026-07-30] lint | Health Check (segunda pasada, post arquitectura multi-agente)

**Tipo:** Mantenimiento y Linting Global
**Agente:** Subagente LINT v3.0
**Resultado:** 🟢 Saludable

### Resumen de auditoría de 7 puntos:
1. ✅ **Contradicciones:** 0 encontradas.
2. ✅ **Páginas huérfanas:** 0 de 35.
3. ⚠️ **Concepto sin página propia:** `[[deuda-tecnica]]` cruza el umbral de 3+ menciones — sugerido crear `wiki/concepts/deuda-tecnica.md` (no creado automáticamente, requiere confirmación).
4. ✅ **Cross-references faltantes:** 0.
5. ℹ️ **Gaps de información:** los mismos 2 de la pasada anterior siguen vigentes (Sintaxis de Lenguajes, TDD y CI/CD).
6. ✅ **`index.md`:** contadores correctos; corregida la sección "Tags Más Usados" (estaba desactualizada, no reflejaba la frecuencia real de frontmatter).
7. ✅ **Frontmatter:** 100% de notas con metadata YAML válida.

### Reporte archivado:
- Añadido como segunda sección en `wiki/queries/lint-2026-07-30.md` (mismo día que la ingesta del Módulo 1, no se creó archivo nuevo para evitar duplicar el nombre).

---

## [2026-07-30] ingest | Ingesta Masiva Módulo 2 (Fundamentos de la Programación)

**Tipo:** Ingesta Masiva de Documentos Fuentes
**Agente:** Subagente INGEST v3.0
**Fuentes procesadas:** 7 nuevas fuentes en `raw/papers/`

### Páginas creadas en `wiki/sources/`:
- `wiki/sources/2026-07-30-fundamentos-de-la-programacion-introduccion-y-sintaxis.md`
- `wiki/sources/2026-07-30-variables-tipos-de-datos-y-operadores.md`
- `wiki/sources/2026-07-30-estructuras-de-control.md`
- `wiki/sources/2026-07-30-estructuras-de-datos.md`
- `wiki/sources/2026-07-30-funciones-y-parametros.md`
- `wiki/sources/2026-07-30-manejo-de-errores-y-excepciones.md`
- `wiki/sources/2026-07-30-fundamentos-de-la-programacion-conclusiones.md`

### Páginas de conceptos creadas en `wiki/concepts/`:
- `wiki/concepts/sintaxis-y-semantica.md`
- `wiki/concepts/compilacion-e-interpretacion.md`
- `wiki/concepts/variables-y-tipos-de-datos.md`
- `wiki/concepts/tipado-estatico-vs-dinamico.md`
- `wiki/concepts/paso-por-valor-vs-referencia.md`
- `wiki/concepts/scope-y-lifetime.md`
- `wiki/concepts/condicionales.md`
- `wiki/concepts/bucles.md`
- `wiki/concepts/estructuras-de-datos.md`
- `wiki/concepts/funciones-y-parametros.md`
- `wiki/concepts/funciones-puras-y-efectos-secundarios.md`
- `wiki/concepts/manejo-de-errores-y-excepciones.md`
- `wiki/concepts/deuda-tecnica.md` (resuelve la sugerencia pendiente del lint anterior: cruzó el umbral de 3+ menciones sin página propia)

### Entidades actualizadas en `wiki/entities/`:
- `wiki/entities/big-school.md` (7 nuevas fuentes añadidas a "Mentions & Connections")

### Conceptos existentes actualizados (cross-refs bidireccionales):
- `wiki/concepts/soberania-humana-en-ia.md`, `wiki/concepts/diseno-de-algoritmos.md`, `wiki/concepts/descomposicion.md`, `wiki/concepts/metodologia-de-debugging.md`, `wiki/concepts/stack-trace.md`, `wiki/concepts/mentalidad-de-arquitecto.md`

### Mantenimiento e Índice:
- `index.md` actualizado: 55 páginas totales, 16 fuentes, 32 conceptos. Nueva sección "Módulo 2: Fundamentos de la Programación" en fuentes y conceptos. Dos hubs nuevos (`funciones-y-parametros`, `variables-y-tipos-de-datos`).

### Insights destacados:
El eje **paso por valor vs. por referencia** y **scope/lifetime** aparece primero en variables y reaparece idéntico en funciones — quedó modelado como concepto propio compartido entre ambas fuentes en vez de duplicarse. El manejo de errores conecta directamente con la metodología de debugging y el stack trace del Módulo 0 (prevención estructural vs. investigación posterior del mismo fenómeno).

---

## [2026-07-30] ingest | Ingesta Masiva Módulo 3 (Lenguajes de Programación / Python)

**Tipo:** Ingesta Masiva de Documentos Fuentes
**Agente:** Subagente INGEST v3.0
**Fuentes procesadas:** 8 nuevas fuentes en `raw/papers/`

### Páginas creadas en `wiki/sources/`:
- `wiki/sources/2026-07-30-introduccion-a-los-lenguajes-de-programacion.md`
- `wiki/sources/2026-07-30-bases-de-los-lenguajes-de-programacion.md`
- `wiki/sources/2026-07-30-programacion-orientada-a-objetos.md`
- `wiki/sources/2026-07-30-programacion-funcional.md`
- `wiki/sources/2026-07-30-modularidad-en-python.md`
- `wiki/sources/2026-07-30-gestion-de-entornos-y-dependencias.md`
- `wiki/sources/2026-07-30-asincronia-en-python.md`
- `wiki/sources/2026-07-30-introduccion-a-los-lenguajes-de-programacion-conclusiones-generales.md`

### Páginas de conceptos creadas en `wiki/concepts/`:
- `wiki/concepts/niveles-de-abstraccion.md`
- `wiki/concepts/paradigmas-de-programacion.md`
- `wiki/concepts/python-como-lenguaje.md`
- `wiki/concepts/programacion-orientada-a-objetos.md`
- `wiki/concepts/funciones-de-orden-superior.md`
- `wiki/concepts/modularidad-modulos-y-paquetes.md`
- `wiki/concepts/entornos-virtuales-y-dependencias.md`
- `wiki/concepts/programacion-asincrona.md`

### Entidades actualizadas en `wiki/entities/`:
- `wiki/entities/big-school.md` (8 nuevas fuentes añadidas a "Mentions & Connections")

### Conceptos existentes extendidos (sin duplicar, cross-refs bidireccionales):
- `wiki/concepts/compilacion-e-interpretacion.md` — añadido el tercer modelo híbrido/JIT (Java, C#).
- `wiki/concepts/estructuras-de-datos.md` — añadida la **Tupla** (inmutable) al catálogo, que no estaba cubierta en el Módulo 2.
- `wiki/concepts/manejo-de-errores-y-excepciones.md` — añadido `try/except` de Python como implementación concreta.
- `wiki/concepts/funciones-y-parametros.md` — añadidos parámetros por defecto en Python y `self` como caso particular.
- `wiki/concepts/funciones-puras-y-efectos-secundarios.md` — añadida inmutabilidad como complemento de la pureza.
- `wiki/concepts/descomposicion.md`, `wiki/concepts/deuda-tecnica.md`, `wiki/concepts/mentalidad-de-arquitecto.md`, `wiki/concepts/variables-y-tipos-de-datos.md`, `wiki/concepts/tipado-estatico-vs-dinamico.md` — cross-refs a las nuevas fuentes.

### Mantenimiento e Índice:
- `index.md` actualizado: 71 páginas totales, 24 fuentes, 40 conceptos. Nueva sección "Módulo 3: Lenguajes de Programación (Python)" en fuentes y conceptos. Dos hubs nuevos (`python-como-lenguaje`, `paradigmas-de-programacion`).

### Insights destacados:
La Tupla de Python llenó un hueco real en `estructuras-de-datos` (el Módulo 2 nunca cubrió estructuras inmutables). La inmutabilidad conecta tres conceptos que antes vivían separados: `estructuras-de-datos` (tupla), `funciones-puras-y-efectos-secundarios` (determinismo) y `paso-por-valor-vs-referencia` (mutación por referencia) — los tres describen la misma propiedad desde ángulos distintos.

---

## [2026-08-03] ingest | Ingesta Masiva Módulo 3 — Segunda Pasada (PDFs Alternativos de Lenguajes de Programación / Python)

**Tipo:** Ingesta Masiva de Documentos Fuentes
**Agente:** Subagente INGEST v3.0
**Fuentes procesadas:** 9 nuevas fuentes en `raw/papers/` (prefijo `2026-08-03-`)

### Contexto y decisión de scope:
Las 9 fuentes cubren el mismo terreno temático que el Módulo 3 ya ingerido el 2026-07-30 (introducción a lenguajes, bases de Python, POO, funcional, modularidad, entornos/dependencias, asincronía, conclusiones), pero provienen de PDFs distintos ("Máster Desarrollo con IA") con redacción, analogías y ejemplos propios. Se verificó contenido real de cada archivo antes de procesar: **no son duplicados** — aportan matices, ejemplos de código adicionales y en algunos casos una dimensión estratégica/de negocio ausente en la primera pasada (perfil en T, ROI de la modularidad, aplicabilidad de la asincronía en IA). Se optó por crear 9 páginas de fuente nuevas y **extender los conceptos existentes en vez de duplicarlos**, siguiendo el patrón ya usado en la ingesta del Módulo 3 original.

### Páginas creadas en `wiki/sources/`:
- `wiki/sources/2026-08-03-introduccion-lenguajes-programacion-python.md`
- `wiki/sources/2026-08-03-bases-lenguajes-programacion.md`
- `wiki/sources/2026-08-03-programacion-orientada-objetos.md`
- `wiki/sources/2026-08-03-programacion-funcional.md`
- `wiki/sources/2026-08-03-modularidad-python-modulos-paquetes.md`
- `wiki/sources/2026-08-03-modularidad-arquitectura-software.md`
- `wiki/sources/2026-08-03-gestion-entornos-dependencias.md`
- `wiki/sources/2026-08-03-asincronia.md`
- `wiki/sources/2026-08-03-conclusiones-lenguajes-programacion.md`

### Páginas de conceptos creadas en `wiki/concepts/`:
Ninguna — no se identificó ningún concepto genuinamente nuevo; todo el contenido se integró extendiendo conceptos ya existentes del Módulo 3.

### Entidades actualizadas en `wiki/entities/`:
- `wiki/entities/big-school.md` — 9 nuevas fuentes añadidas a "Mentions & Connections"; nota añadida sobre la naturaleza de segunda pasada de este lote.

### Conceptos existentes extendidos (sin duplicar, cross-refs bidireccionales):
- `wiki/concepts/python-como-lenguaje.md` — añadidos los tres pilares de elección estratégica, convenciones `snake_case`/inglés, requisito de versión ≥3.10 (6 fuentes en total).
- `wiki/concepts/mentalidad-de-arquitecto.md` — añadido el marco del **perfil en T** (amplitud vs. profundidad); promovido a hub del índice.
- `wiki/concepts/compilacion-e-interpretacion.md` — refuerzo de Python como interpretado (2 fuentes).
- `wiki/concepts/estructuras-de-datos.md` — añadida el álgebra de conjuntos completa sobre sets (unión/intersección/diferencia/diferencia simétrica) y la iteración de diccionarios con `.items()`.
- `wiki/concepts/manejo-de-errores-y-excepciones.md`, `wiki/concepts/funciones-y-parametros.md` — refuerzo del patrón `try/except ValueError` y parámetros por defecto.
- `wiki/concepts/programacion-orientada-a-objetos.md` — segundo ejemplo de dominio (biblioteca) que confirma el mismo modelo de los cuatro pilares.
- `wiki/concepts/funciones-de-orden-superior.md` — añadido `reduce()` (ausente en la primera pasada) y composición de funciones puras encadenadas.
- `wiki/concepts/funciones-puras-y-efectos-secundarios.md` — añadida la analogía de la "cadena de montaje".
- `wiki/concepts/modularidad-modulos-y-paquetes.md` — añadido el impacto en ROI (tiempo de rampa, auditoría aislada) y el riesgo de colisión de nombres.
- `wiki/concepts/deuda-tecnica.md` — nueva fuente sobre el software monolítico como generador directo de deuda técnica.
- `wiki/concepts/entornos-virtuales-y-dependencias.md` — diagrama de flujo del ciclo de vida y ejemplo real de `requirements.txt` con version pinning.
- `wiki/concepts/programacion-asincrona.md` — analogía del maestro de ajedrez y aplicabilidad en negocios/IA.

### Mantenimiento e Índice:
- `index.md` actualizado: 80 páginas totales, 33 fuentes, 40 conceptos (sin conceptos nuevos). Nueva sección "Módulo 3 (Segunda Pasada): Lenguajes de Programación (Python) — PDFs Alternativos" en fuentes. Un hub nuevo (`mentalidad-de-arquitecto`).

### Insights destacados:
Esta ingesta confirma que el wiki puede absorber **contenido temáticamente redundante sin duplicar conocimiento**: de 9 fuentes nuevas, cero requirieron una página de concepto nueva — toda la información se integró como extensión de 12 conceptos ya existentes. El caso más claro de valor añadido real es el **perfil en T**, que conecta la elección de un lenguaje troncal (Python) con la mentalidad de arquitecto ya presente desde el Módulo 0, cerrando el círculo entre estrategia profesional y elección técnica concreta.

---

## [2026-08-03] ingest | Módulo 4 — Fundamentos de Sistemas, Redes y Datos

**Tipo:** Ingesta Masiva de Documentos Fuentes (territorio nuevo)
**Agente:** Subagente INGEST v3.0
**Fuentes procesadas:** 5 nuevas fuentes en `raw/papers/` (prefijo `2026-08-03-`, PDFs `0_5_1` a `0_5_4` + Conclusiones)

### Contexto y decisión de scope:
A diferencia de la ingesta anterior (segunda pasada del Módulo 3), estas 5 fuentes cubren **territorio genuinamente nuevo** que no existía en el wiki: hardware/arquitectura de computadores, redes/protocolos, APIs/REST y bases de datos SQL/NoSQL. Se verificó contra `index.md` que ningún concepto previo cubría estos temas antes de proceder. Por eso, a diferencia del lote anterior, esta ingesta **sí crea páginas de concepto nuevas** (5 en total).

### Páginas creadas en `wiki/sources/`:
- `wiki/sources/2026-08-03-fundamentos-computacion.md`
- `wiki/sources/2026-08-03-redes.md`
- `wiki/sources/2026-08-03-apis-comunicacion.md`
- `wiki/sources/2026-08-03-gestion-datos.md`
- `wiki/sources/2026-08-03-conclusiones-fundamentos-sistemas-redes.md`

### Páginas de conceptos creadas en `wiki/concepts/`:
- `wiki/concepts/fundamentos-de-computacion.md` — binario, Von Neumann, jerarquía de memoria, SO, procesos/hilos, concurrencia vs. paralelismo, swapping.
- `wiki/concepts/redes-y-protocolos-tcp-ip.md` — modelo cliente-servidor, IP, DNS, TCP/UDP, puertos.
- `wiki/concepts/protocolo-http.md` — métodos HTTP, anatomía de petición/respuesta, códigos de estado, cookies/sesiones, JWT.
- `wiki/concepts/apis-rest.md` — API como contrato, principios REST, JSON, AuthN/AuthZ, CORS.
- `wiki/concepts/modelado-de-datos-y-bases-de-datos.md` — modelo ER, cardinalidad, modelo relacional, PK/FK, normalización, SQL CRUD/JOIN, ACID, NoSQL.

### Entidades actualizadas en `wiki/entities/`:
- `wiki/entities/big-school.md` — 5 nuevas fuentes añadidas a "Mentions & Connections"; nota sobre el nuevo Módulo 4.

### Conceptos existentes extendidos (cross-refs bidireccionales):
- `wiki/concepts/programacion-asincrona.md` — precisado formalmente como concurrencia cooperativa de un solo hilo (no paralelismo), vía `fundamentos-de-computacion`.
- `wiki/concepts/niveles-de-abstraccion.md` — cross-ref a `fundamentos-de-computacion` como la capa de abstracción más baja.
- `wiki/concepts/python-como-lenguaje.md` — añadido el consumo de APIs REST con la librería `requests`.
- `wiki/concepts/estructuras-de-datos.md` — cross-ref a la tabla relacional como analogía persistente del diccionario en memoria.

### Mantenimiento e Índice:
- `index.md` actualizado: 90 páginas totales, 38 fuentes, 45 conceptos (+5 nuevos). Nueva sección "Módulo 4: Fundamentos de Sistemas, Redes y Datos" en fuentes y conceptos. Dos hubs nuevos (`fundamentos-de-computacion`, `apis-rest`).

### Insights destacados:
La distinción **concurrencia vs. paralelismo** (nueva en este módulo) llenó un hueco conceptual que `programacion-asincrona` había dejado implícito desde el Módulo 3: `asyncio` es concurrencia cooperativa de un solo hilo, no paralelismo real — una precisión que solo pudo hacerse explícita al bajar hasta el nivel de hardware/SO. El Módulo 4 cierra además el círculo completo de la "pila tecnológica" del curso: hardware → redes → APIs → datos, con cada capa dependiendo de la anterior.






