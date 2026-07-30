---
type: concept
created: 2026-07-30
updated: 2026-07-30
tags: [shell, bash, zsh, scripting, unix]
---

# Shell (Bash / Zsh)

## Definition
Una **Shell** es un programa intérprete de órdenes de línea de comandos en sistemas Unix/Linux que actúa como intermediario entre el usuario y el kernel del sistema operativo. **Bash** (*Bourne-Again Shell*) y **Zsh** (*Z Shell*) son las implementaciones estándar más utilizadas en la industria.

## Key Ideas
- **Intérprete vs Terminal:** La terminal es el programa gráfico/pantalla que muestra el texto; la shell es el intérprete que procesa los comandos escritos.
- **Portabilidad y Scripting:** Los archivos de script (`.sh`) encabezados por el shebang `#!/bin/bash` automatizan tareas complejas, variables de entorno, estructuras condicionales y bucles.
- **Zsh y Oh My Zsh:** Zsh es la shell estándar en macOS moderna, caracterizada por autocompletado inteligente y plugins personalizables mediante Oh My Zsh.

## Applications
- Creación de scripts de administración de sistemas e infraestructura.
- Automatización de backups, monitoreo de procesos y tareas programadas (`cron`).
- Personalización del entorno de trabajo de la terminal.

## Sources
- [[wiki/sources/2026-07-30-terminal-y-linea-de-comandos]] — Guía de Bash/Shell por [[brais-moure]].

## Related Concepts
- [[terminal-y-cli]]
- [[redirecciones-y-pipes]]

## Open Questions
- ¿Qué diferencias de compatibilidad crítica deben considerarse al migrar scripts complejos de Bash a Zsh en servidores mixtos?
