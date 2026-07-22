# raw/papers/

Esta carpeta contiene **papers académicos y documentos PDF convertidos a Markdown**.

## Reglas

- ⚠️ **NUNCA modificar archivos aquí** — son fuentes originales inmutables
- Los archivos deben estar en formato `.md` (convertidos desde PDF)
- Nombre de archivo: `YYYY-MM-DD-titulo-del-paper.md`

## Cómo añadir un PDF

```bash
# Opción A — pandoc (preserva estructura del documento)
pandoc mi-paper.pdf -o raw/papers/2026-01-15-titulo-paper.md

# Opción B — pdftotext (más simple, texto plano)
pdftotext mi-paper.pdf - > raw/papers/2026-01-15-titulo-paper.md
```

Después de depositarlo, dile al agente:
> "Procesa raw/papers/2026-01-15-titulo-paper.md"
