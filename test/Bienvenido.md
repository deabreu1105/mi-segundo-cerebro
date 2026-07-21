# 🎉 Bienvenido a tu LLM Wiki - Segundo Cerebro

> **Estado:** ✅ Sistema completamente configurado y operacional  
> **Fecha:** 2026-07-21  
> **Primera fuente procesada:** Ya incluida como ejemplo

---

## 🚀 ¿Qué es esto?

Este es tu **segundo cerebro** - una base de conocimiento personal que crece y se enriquece continuamente. A diferencia de sistemas tradicionales donde solo guardas notas, aquí:

- ✅ **El LLM mantiene todo el wiki** - cross-references, actualizaciones, síntesis
- ✅ **El conocimiento se acumula** - cada fuente enriquece lo existente
- ✅ **Las conexiones son explícitas** - wikilinks automáticos entre conceptos
- ✅ **Sin maintenance manual** - el LLM hace todo el bookkeeping tedioso

**Tu trabajo:** Curar fuentes, hacer preguntas, pensar.  
**Trabajo del LLM:** Todo lo demás.

---

## 📂 Estructura Creada

```
obsidian/test/
│
├── AGENTS.md          ⭐ Manual completo del agente (léelo!)
├── index.md           📚 Índice navegable del wiki
├── log.md             📋 Registro cronológico de operaciones
├── Bienvenido.md      👋 Este archivo
│
├── raw/               📥 Tus fuentes originales (INMUTABLES)
│   ├── assets/        🖼️  Imágenes y multimedia
│   └── 2026-07-21-llm-wiki-pattern-karpathy.md (ejemplo)
│
└── wiki/              🧠 Base de conocimiento (mantenida por LLM)
    ├── sources/       📄 Summaries de cada fuente
    ├── entities/      👥 Personas, lugares, organizaciones
    ├── concepts/      💡 Ideas, teorías, metodologías
    └── queries/       🔍 Respuestas valiosas archivadas
```

---

## 🎯 Cómo Empezar

### 1. Explora el ejemplo incluido

Ya procesé el artículo original de LLM Wiki como ejemplo. Revisa:

- [[index|📚 Índice]] - Ve todas las páginas creadas
- [[wiki/sources/2026-07-21-llm-wiki-pattern-karpathy|📄 Source Summary]] - Summary del artículo
- [[wiki/concepts/llm-wiki-pattern|💡 LLM Wiki Pattern]] - Concepto principal
- **Graph View** en Obsidian (Ctrl+G) - Ve las conexiones visuales

### 2. Añade tu primera fuente

**Opción A: Artículo web**
1. Instala "Obsidian Web Clipper" (extensión de navegador)
2. Navega a un artículo interesante
3. Click en el clipper → Guarda en `raw/`
4. Dime: "Procesa [nombre del archivo]"

**Opción B: Documento existente**
1. Copia cualquier documento (PDF, texto, markdown) a `raw/`
2. Dime: "Procesa [nombre del archivo]"

**Opción C: Entrada de diario**
1. Crea un archivo en `raw/journal/2026-07-21.md`
2. Escribe tus pensamientos del día
3. Dime: "Procesa mi entrada de diario"

### 3. Haz preguntas

Una vez que tengas varias fuentes:
- "¿Qué sabemos sobre [tema]?"
- "Compara [concepto A] con [concepto B]"
- "¿Qué contradicciones hay en [tema]?"
- "¿Qué gaps tenemos sobre [área]?"

Las respuestas valiosas se archivan automáticamente en el wiki.

---

## 🔄 Las Tres Operaciones

### 📥 INGEST - Procesar Nueva Fuente

**Tú dices:** "Procesa [archivo en raw/]"

**Yo hago:**
1. Leo la fuente completamente
2. Discuto contigo los puntos clave
3. Creo summary en `wiki/sources/`
4. Actualizo/creo páginas de entidades y conceptos
5. Añado cross-references
6. Actualizo `index.md` y `log.md`

**Resultado:** 10-15 páginas tocadas, conocimiento integrado.

---

### 💬 QUERY - Responder Preguntas

**Tú dices:** "¿[pregunta sobre conocimiento acumulado]?"

**Yo hago:**
1. Consulto `index.md` para páginas relevantes
2. Leo páginas en profundidad
3. Sintetizo respuesta con citas [[wikilinks]]
4. Si la respuesta es valiosa, la archivo en `wiki/queries/`

**Resultado:** Respuesta fundamentada + opcional nueva página wiki.

---

### 🔍 LINT - Mantener Salud

**Tú dices:** "Lint el wiki" o "Health-check"

**Yo hago:**
1. Busco contradicciones entre páginas
2. Identifico páginas huérfanas
3. Encuentro cross-refs faltantes
4. Detecto gaps de información
5. Sugiero próximas fuentes a investigar

**Resultado:** Reporte de salud + sugerencias.

**Frecuencia recomendada:** Cada 10-15 ingests.

---

## 🛠️ Configuración Recomendada de Obsidian

### Plugins Core (ya vienen con Obsidian)
- ✅ **Graph view** - Visualizar conexiones
- ✅ **Backlinks** - Ver referencias inversas
- ✅ **Quick switcher** - Ctrl+O para buscar rápido
- ✅ **File explorer** - Navegación de carpetas

### Plugins Community (opcional)
- **Dataview** - Queries sobre frontmatter YAML
- **Obsidian Web Clipper** - Capturar artículos web

### Hotkeys Útiles
- `Ctrl+O` - Quick switcher (buscar archivo)
- `Ctrl+G` - Graph view
- `Ctrl+Click` en [[wikilink]] - Abrir en nueva pestaña
- `Ctrl+Shift+D` - Descargar imágenes localmente (configurar)

### Configuración de Imágenes
1. Settings → Files and links → "Attachment folder path" → `raw/assets/`
2. Settings → Hotkeys → "Download attachments for current file" → `Ctrl+Shift+D`

---

## 📊 Estado Actual del Wiki

**Páginas totales:** 6  
**Fuentes procesadas:** 1  
**Entidades:** 2 (Andrej Karpathy, Vannevar Bush)  
**Conceptos:** 3 (LLM Wiki Pattern, RAG, Memex)  

Ve [[index|el índice completo]] para detalles.

---

## 💡 Casos de Uso Sugeridos

### 📚 Lectura de Libros
Cada capítulo → fuente en `raw/books/titulo/capitulo-N.md`  
El wiki mantiene: personajes, temas, plot threads, análisis

### 🔬 Investigación de Tema
Múltiples papers/artículos sobre mismo tema  
El wiki sintetiza: consensos, contradicciones, evolución del campo

### 📝 Diario Personal
Entradas diarias en `raw/journal/YYYY-MM-DD.md`  
El wiki extrae: patrones, tracking de goals, insights recurrentes

### 💼 Aprendizaje Profesional
Artículos técnicos, documentación, tutoriales  
El wiki mantiene: conceptos interconectados, best practices, ejemplos

---

## 🎓 Siguientes Pasos

1. **Lee [[AGENTS|AGENTS.md]]** - Entender completamente cómo funciona
2. **Explora el ejemplo** - Ve las 6 páginas creadas y sus conexiones
3. **Añade tu primera fuente** - Algo que te interese
4. **Hazme preguntas** - Una vez que tengas varias fuentes

---

## 🤝 Cómo Interactuar Conmigo

### ✅ Buenos comandos:
- "Procesa [archivo]"
- "¿Qué sabemos sobre [tema]?"
- "Compara X con Y"
- "Lint el wiki"
- "¿Qué debería leer después sobre [tema]?"
- "Muéstrame las contradicciones en [tema]"

### ℹ️ Recuerda:
- Puedo procesar texto, markdown, imágenes (si están locales)
- Siempre pregunto si algo no está claro
- Registro TODO en `log.md` para trazabilidad
- Mantengo `index.md` actualizado automáticamente

---

## 📖 Recursos

- [[AGENTS|Manual del Agente]] - Especificación completa del sistema
- [[index|Índice del Wiki]] - Navegación de contenido
- [[log|Log de Operaciones]] - Historia cronológica
- **Documento original:** [LLM Wiki Pattern - Karpathy](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)

---

## 🌟 Filosofía

> "The tedious part of maintaining a knowledge base is not the reading or the thinking — it's the bookkeeping."  
> — Andrej Karpathy

Este sistema te libera del bookkeeping para que te enfoques en lo importante: curar, explorar, pensar.

**Tu segundo cerebro está listo. ¿Qué quieres aprender primero?** 🚀