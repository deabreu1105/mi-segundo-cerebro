# Patron LLM Wiki (LLM Wiki Pattern) — Andrej Karpathy

**Fuente:** https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f  
**Autor:** Andrej Karpathy  
**Fecha:** 2024  
**Tipo:** Artículo técnico / Documentación de patrón

---

## Contenido Traducido

Un patrón para construir bases de conocimiento personales utilizando modelos de lenguaje (LLMs).

Este es un archivo de ideas diseñado para copiarse y pegarse en tu propio agente LLM (por ejemplo, OpenAI Codex, Claude Code, OpenCode / Pi, etc.). Su objetivo es comunicar la idea de alto nivel, pero tu agente desarrollará los detalles específicos en colaboración contigo.

### La idea central

La experiencia de la mayoría de las personas con los LLM y los documentos se parece a RAG (Generación Aumentada por Recuperación): subes una colección de archivos, el LLM recupera fragmentos relevantes al realizar una consulta y genera una respuesta. Esto funciona, pero el LLM está redescubriendo el conocimiento desde cero en cada pregunta. No hay acumulación. Haz una pregunta sutil que requiera sintetizar cinco documentos y el LLM tendrá que buscar y armar los fragmentos relevantes cada vez. Nada se construye ni se acumula. NotebookLM, la carga de archivos en ChatGPT y la mayoría de los sistemas RAG funcionan de esta manera.

La idea aquí es diferente. En lugar de limitarse a recuperar información de documentos sin procesar (raw) al hacer una consulta, el LLM **construye y mantiene de forma incremental un wiki persistente**: una colección estructurada e interconectada de archivos Markdown que se ubica entre tú y las fuentes originales sin procesar. Cuando añades una nueva fuente, el LLM no solo la indexa para una recuperación posterior. La lee, extrae la información clave y la integra en el wiki existente: actualizando páginas de entidades, revisando resúmenes de temas, señalando dónde los nuevos datos contradicen afirmaciones anteriores, y reforzando o desafiando la síntesis en evolución. El conocimiento se compila una vez y luego *se mantiene actualizado*, en lugar de volver a derivarse en cada consulta.

Esta es la diferencia clave: **el wiki es un artefacto persistente y acumulativo.** Las referencias cruzadas ya están ahí. Las contradicciones ya han sido señaladas. La síntesis ya refleja todo lo que has leído. El wiki se vuelve cada vez más rico con cada fuente que añades y cada pregunta que haces.

### Arquitectura

Consta de tres capas:

**Fuentes originales (Raw sources):** Tu colección curada de documentos fuente. Artículos, papers, imágenes, archivos de datos. Son inmutables: el LLM lee de ellas pero nunca las modifica. Esta es tu fuente de verdad.

**El wiki:** Un directorio de archivos Markdown generados por el LLM. Resúmenes, páginas de entidades, páginas de conceptos, comparaciones, una visión general, una síntesis. El LLM es dueño absoluto de esta capa. Crea páginas, las actualiza cuando llegan nuevas fuentes, mantiene las referencias cruzadas y conserva todo consistente. Tú lo lees; el LLM lo escribe.

**El esquema (Schema):** Un documento (por ejemplo, `CLAUDE.md` para Claude Code o `AGENTS.md` para Codex) que le indica al LLM cómo está estructurado el wiki, cuáles son las convenciones y qué flujos de trabajo seguir al ingerir fuentes, responder preguntas o mantener el wiki.

### Operaciones

**Ingest (Ingerir):** Colocas una nueva fuente en la colección sin procesar (raw) y le pides al LLM que la procese. Un flujo de ejemplo: el LLM lee la fuente, discute los puntos clave contigo, escribe una página de resumen en el wiki, actualiza el índice, actualiza las páginas de entidades y conceptos relevantes en todo el wiki y añade una entrada al registro (log).

**Query (Consultar):** Haces preguntas al wiki. El LLM busca páginas relevantes, las lee y sintetiza una respuesta con citas. Las respuestas pueden tomar diferentes formas: una página Markdown, una tabla comparativa, una presentación de diapositivas (Marp), un gráfico (matplotlib) o un canvas. Un punto clave: **las buenas respuestas pueden archivarse de nuevo en el wiki como nuevas páginas.**

**Lint (Salud/Mantenimiento):** Periódicamente, le pides al LLM que realice un chequeo de salud del wiki. Busca: contradicciones, afirmaciones desactualizadas, páginas huérfanas, referencias cruzadas faltantes y lagunas de información.

### Indexación y Registro

**index.md** está orientado al contenido. Es un catálogo de todo lo que hay en el wiki: cada página listada con un enlace, un resumen de una línea y opcionalmente metadatos.

**log.md** es cronológico. Es un registro de solo anexar (append-only) de lo que sucedió y cuándo: ingestas, consultas y chequeos de salud (lint).

### Por qué funciona

La parte tediosa de mantener una base de conocimiento no es leer ni pensar, es la contabilidad y mantenimiento (*bookkeeping*). Actualizar referencias cruzadas, mantener resúmenes al día, anotar contradicciones. Los humanos abandonan los wikis porque la carga de mantenimiento crece más rápido que el valor que aportan. Los LLMs no se aburren, no olvidan actualizar una referencia cruzada y pueden tocar 15 archivos en una sola pasada.

La idea está relacionada en espíritu con el Memex de Vannevar Bush (1945): un almacén de conocimiento personal y curado con rastros asociativos entre documentos.

---

**Fin del documento**
