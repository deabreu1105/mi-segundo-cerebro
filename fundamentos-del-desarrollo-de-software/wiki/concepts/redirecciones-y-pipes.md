---
type: concept
created: 2026-07-30
updated: 2026-07-30
tags: [pipes, redirecciones, unix, flujos, stdin-stdout]
---

# Redirecciones y Pipes (Tuberías)

## Definition
Las **Redirecciones y Pipes (Tuberías)** son mecanismos fundamentales del sistema Unix que permiten manipular los flujos de entrada estándar (*stdin*), salida estándar (*stdout*) y error estándar (*stderr*) de los comandos en la terminal.

## Key Ideas
- **Operadores de Redirección:**
  - `>` : Redirige la salida a un archivo, sobrescribiendo su contenido.
  - `>>` : Redirige la salida al final de un archivo en modo *append* (concatenación).
  - `<` : Pasa el contenido de un archivo como entrada a un comando.
- **Pipe / Tubería (`|`):** Conecta la salida estándar de un comando directamente con la entrada del comando siguiente (filosofía Unix de componentes modulares conectados).

## Applications
- Filtrado masivo de logs y extracción de datos en tiempo real (ej. `cat access.log | grep "500" | wc -l`).
- Redirección de registros de errores en tareas programadas (ej. `>> cron.log 2>&1`).
- Generación de reportes de salida a archivos de texto plano.

## Sources
- [[wiki/sources/2026-07-30-terminal-y-linea-de-comandos]] — Tuberías y redirecciones por [[brais-moure]].

## Related Concepts
- [[terminal-y-cli]]
- [[shell-bash-zsh]]
- [[analisis-de-logs]]

## Open Questions
- ¿Cómo gestionar eficientemente el buffer de memoria cuando se transmiten peticiones gigantescas mediante múltiples pipes encadenados?
