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

### Batch — varios de una vez
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

## 📄 Antes de procesar un PDF

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
