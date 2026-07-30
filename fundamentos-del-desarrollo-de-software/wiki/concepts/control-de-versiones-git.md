---
type: concept
created: 2026-07-30
updated: 2026-07-30
tags: [git, control-de-versiones, dag, semver, gitflow]
---

# Control de Versiones con Git

## Definition
**Git** es un sistema de control de versiones distribuido de código abierto que registra de forma inmutable la evolución del código fuente a lo largo del tiempo, almacenando el historial mediante un Grafo Acíclico Dirigido (DAG) de objetos y referencias.

## Key Ideas
- **Arquitectura de Tres Estados Locales:**
  1. *Working Directory:* Archivos físicos en el disco local.
  2. *Staging Area (Index):* Zona de preparación de cambios (`git add`).
  3. *Repository (HEAD):* Historial guardado de commits (`git commit`).
- **Estrategias de Ramificación (Gitflow):** Organiza el desarrollo en ramas permanentes (`main` y `develop`) y efímeras (`feature/`, `bugfix/`, `release/`, `hotfix/`).
- **Conventional Commits:** Estándar de mensajes (`feat`, `fix`, `docs`, `refactor`, `chore`) para trazabilidad y versionado semántico (SemVer).

## Applications
- Seguimiento inmutable del código fuente y recuperación ante errores.
- Trabajo paralelo en funcionalidades sin poner en peligro el código en producción.
- Automatización de versiones semánticas y notas de release.

## Sources
- [[wiki/sources/2026-07-30-control-de-versiones-con-git-y-github]] — Guía Maestra de Git por Fernando Herrera y [[brais-moure]].
- [[wiki/sources/2026-07-30-ecosistema-del-desarrollo-de-software-moderno-conclusiones]] — Gestión de riesgos por [[brais-moure]].

## Related Concepts
- [[github-y-colaboracion]]
- [[terminal-y-cli]]
- [[entornos-de-desarrollo-ide]]

## Open Questions
- ¿Cuándo es preferible utilizar la estrategia de *Trunk-Based Development* frente a *Gitflow* en equipos de despliegue continuo (CD)?
