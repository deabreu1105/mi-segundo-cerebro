---
type: concept
created: 2026-07-22
updated: 2026-07-22
tags: [ia, prompting, comunicacion, estructura]
---

# Fórmula R-C-T-F

## Definition
Marco estructural para construir prompts efectivos con modelos de lenguaje. Las siglas corresponden a: **Rol** (qué perfil debe asumir el modelo), **Contexto** (información de fondo relevante), **Tarea** (qué debe hacer exactamente) y **Formato** (cómo debe estructurar la respuesta).

## Key Ideas
- Elimina la ambigüedad que produce respuestas "enciclopédicas inútiles"
- El **Rol** activa un modo de respuesta específico (ej: "Eres un tutor socrático...")
- El **Contexto** proporciona los datos que el modelo necesita para no adivinar
- La **Tarea** es la instrucción precisa de acción
- El **Formato** define la estructura esperada (tabla, lista, markdown, código)
- Es la versión sistemática del CDD (Comment-Driven Development) de Copilot

## Applications
```
Rol: "Actúa como un senior developer experto en Python"
Contexto: "Tengo una función que procesa 10k registros y tarda 30 segundos"
Tarea: "Identifica los cuellos de botella y sugiere optimizaciones"
Formato: "Lista numerada con: problema identificado, solución propuesta, ejemplo de código"
```

## Sources
- [[2026-07-22-tutoria-e-interaccion-inteligente-prompting]] — definición y aplicaciones en modo estudio

## Related Concepts
[[tutor-socratico]], [[prompting]], [[comment-driven-development]], [[tecnica-de-la-cebolla]], [[metodo-socratico]]

## Open Questions
- ¿La fórmula R-C-T-F es aplicable de la misma manera a modelos multimodales (texto + imagen)?
- ¿Existen frameworks de prompting más efectivos para casos específicos de debugging?
