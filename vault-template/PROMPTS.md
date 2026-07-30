# 🎯 PROMPTS — Referencia Rápida de Comandos

> Cheatsheet de todos los prompts que puedes usar con el agente LLM de este vault.  
> Copia el prompt, pégalo en tu sesión con el agente y él hará el resto.

---

## 📥 INGEST — Procesar fuentes nuevas

### Caso más común
```
Procesa raw/papers/nombre-del-archivo.md
```

### Por tipo de fuente
```
Procesa raw/web/articulo-sobre-x.md
Procesa raw/books/mi-libro/capitulo-1.md
Procesa raw/journal/{{FECHA_CREACION}}.md
Procesa raw/papers/{{FECHA_CREACION}}-titulo-del-paper.md
```

### 🌐 Ingesta Global — Procesar TODO raw/ (Todas las subcarpetas)
```
Escanea todo el directorio raw/ (incluyendo todas sus subcarpetas: books, journal, papers, web, etc.) e identifica todos los archivos que aún no han sido procesados en wiki/sources/. Procesa absolutamente todas las fuentes pendientes una por una, integrando conceptos, entidades, cross-references y actualizando index.md y log.md. Al finalizar, dame un reporte global de todo lo procesado.
```
```
Procesa absolutamente todo lo pendiente en raw/ (todas sus subcarpetas). Al terminar la ingesta de todas las fuentes, ejecuta automáticamente "Lint el wiki" y entrégame el reporte final de salud del vault.
```

### Batch — varios de una vez (carpeta específica)
```
Procesa todos los archivos en raw/papers/ uno por uno
```
```
Procesa en secuencia todos los archivos de raw/papers/ sin pausar entre ellos.
Al final dame un resumen de todo lo que se creó.
```
```
Lista los archivos que hay en raw/papers/ y dime cuántos hay.
Luego procésalos en orden, comenzando por el primero.
```

### Con énfasis específico
```
Procesa raw/papers/nombre.md — enfatiza especialmente los conceptos sobre [tema X]
```
```
Procesa raw/papers/nombre.md — es el tercer paper sobre [tema], cruza referencias con lo que ya sabemos
```

### Antes de procesar (opcional)
```
Lista los archivos pendientes de procesar en raw/ que aún no tienen entrada en wiki/sources/
```

---

## 💬 QUERY — Hacer preguntas al wiki

### Preguntas directas
```
¿Qué sabemos sobre [tema]?
```
```
¿Qué dice el wiki sobre [concepto o entidad]?
```
```
Resume todo lo que sabemos sobre [entidad o concepto]
```

### Comparaciones
```
Compara [A] con [B]
```
```
¿Cuáles son las diferencias entre [X] y [Y]?
```
```
¿Qué tienen en común [A], [B] y [C]?
```

### Síntesis y análisis
```
¿Cómo se relacionan [A] y [B]?
```
```
¿Cuáles son las contradicciones en el wiki sobre [tema]?
```
```
¿Qué preguntas importantes sobre [tema] no puede responder el wiki todavía?
```

### Recomendaciones
```
¿Qué debería leer a continuación sobre [tema]?
```
```
¿Qué fuentes del wiki son más relevantes para entender [concepto]?
```

### Exploración del grafo
```
¿Cuáles son los conceptos más conectados del wiki?
```
```
¿Hay páginas huérfanas que debería revisar?
```

---

## 🎓 ESTUDIO Y AUTOEVALUACIÓN — Flujo de Aprendizaje Activo

### Examen Interactivo (Slash Command)
```
/grill-me
```
```
/grill-me sobre [tema o concepto del vault]
```

### Simulacro socrático de preguntas
```
Tómame un examen interactivo de 5 preguntas sobre [tema] basándote en el wiki. Hazme una pregunta a la vez y evalúa mi respuesta antes de pasar a la siguiente.
```

### Casos de Estudio y Análisis de Escenarios
```
Simula un caso de estudio o problema hipotético sobre [tema] para que yo aplique el método de análisis y solución.
```

### Práctica de Conceptos Complejos
```
Plantéame un problema complejo sobre [tema] y guíame paso a paso para desglosarlo y resolverlo.
```

---

## 🔍 LINT — Health check del wiki

### Estándar
```
Lint el wiki
```
```
Health check
```

### Con énfasis
```
Lint el wiki — enfócate especialmente en contradicciones
```
```
Lint el wiki — necesito saber qué conceptos faltan por cubrir
```
```
¿Qué páginas huérfanas hay en el wiki?
```
```
¿Está index.md desactualizado?
```

---

## ⚙️ UTILIDADES — Operaciones de mantenimiento

### Ver estado general
```
¿Cuál es el estado actual del wiki? Dame métricas.
```
```
¿Qué fue lo último que se procesó? Revisa log.md
```

### Correcciones manuales
```
Actualiza index.md con las páginas que falten
```
```
Añade cross-references faltantes entre [página A] y [página B]
```
```
Crea una página de concepto para [[nombre-concepto]] basándote en lo que ya se menciona en el wiki
```

### Git
```bash
# Después de cada ingest
git add -A && git commit -m "ingest: [título de la fuente]"

# Después de lint
git add -A && git commit -m "lint: health check $(date +%Y-%m-%d)"

# Ver historial de operaciones
grep "^## \[" log.md | tail -10
grep "^## \[.*\] ingest" log.md
```

---

## 💎 Gemini Gem — Conversor de PDF a Markdown para `raw/papers/`

Crea una **Gema en Gemini** (por ejemplo: `PDF to Markdown Transcriber`) y colócale las siguientes instrucciones en el campo de **Instrucciones / Instructions**:

```text
Eres un especialista en conversión y estructuración de documentos académicos (PDFs, papers, artículos) a formato Markdown limpio para repositorios de conocimiento personal (Obsidian Vaults).

Tu objetivo principal es recibir documentos en PDF (o texto extraído de PDFs) y entregar un archivo Markdown perfecto, estructurado y sin ruido, listo para guardarse en `raw/papers/`.

## REGLAS DE ESTRUCTURA Y FORMATO

1. ENCABEZADO DE NOMBRE DE ARCHIVO:
   Al inicio de tu respuesta, proporciona SIEMPRE la sugerencia del nombre de archivo en este formato exacto:
   `Nombre de archivo sugerido: raw/papers/YYYY-MM-DD-titulo-del-paper.md`
   (Usa la fecha de publicación del documento si la encuentras; de lo contrario, usa la fecha de hoy).

2. ENCABEZADO METADATA:
   Justo después del nombre de archivo sugerido, incluye un bloque de metadata:
   # [Título Principal del Paper]
   **Autor(es):** [Nombre del autor o autores]
   **Fecha:** [Año/Fecha de publicación]
   **Tipo:** Paper / Documento Técnico
   **Fuente Original:** [PDF / DOI / URL si aplica]

3. LIMPIEZA DE RUIDO:
   - Elimina encabezados y pies de página repetitivos (números de página, títulos de encabezado de página, marcas de agua).
   - Corrige saltos de línea huérfanos producidos por la paginación del PDF para que los párrafos fluyan de manera continua.

4. JERARQUÍA Y ESTILO MARKDOWN:
   - Usa `#` para el título principal, `##` para secciones principales y `###` para subsecciones.
   - Conserva viñetas, listas numeradas, tablas Markdown (`| col1 | col2 |`) y bloques de código.
   - Expresiones matemáticas en formato LaTeX: `$inline$` o `$$display$$`.

5. FIDELIDAD:
   - Mantén el texto original fiel. No resumas ni omitas secciones a menos que el usuario lo pida explícitamente.
   - Entrega la salida limpia dentro de un bloque Markdown para fácil copia.
```

---

## 📄 Antes de procesar un PDF (Comandos locales alternativos)

```bash
# Convertir PDF a Markdown (opción A — pandoc, preserva estructura)
pandoc mi-paper.pdf -o raw/papers/YYYY-MM-DD-titulo.md

# Convertir PDF a Markdown (opción B — pdftotext, más simple)
pdftotext mi-paper.pdf - > raw/papers/YYYY-MM-DD-titulo.md
```

Luego:
```
Procesa raw/papers/YYYY-MM-DD-titulo.md
```

---

> **Convención de nombres para raw/papers/:** `YYYY-MM-DD-titulo-del-paper.md`

[[HOME|← Volver al inicio]] · [[AGENTS|Root Agent]] · [[index|Índice del wiki]]
