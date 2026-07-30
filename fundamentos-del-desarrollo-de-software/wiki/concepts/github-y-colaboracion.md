---
type: concept
created: 2026-07-30
updated: 2026-07-30
tags: [github, colaboracion, pull-requests, ci-cd, ssh]
---

# GitHub y Colaboración de Software

## Definition
**GitHub** es la plataforma en la nube basada en la web para el alojamiento de repositorios Git, facilitando la colaboración multi-desarrollador, la revisión de código (*Code Review*), la automatización CI/CD y el control de accesos.

## Key Ideas
- **Pull Requests (PR):** Mecanismo de revisión e integración de cambios donde los desarrolladores proponen fusionar una rama de trabajo (`feature/`, `hotfix/`) hacia ramas compartidas (`develop`, `main`).
- **Autenticación Multi-cuenta SSH:** Configuración de claves SSH dedicadas en `~/.ssh/config` e integración con `includeIf` en `.gitconfig` para conmutar identidades profesionales y personales automáticamente.
- **Integración Continua (CI/CD):** Automatización de pruebas unitarias, linters y despliegues con GitHub Actions al enviar o fusionar cambios.

## Applications
- Alojamiento centralizado y respaldado de código fuente.
- Auditoría de seguridad y revisión de calidad por pares en Pull Requests.
- Coordinación de equipos globales mediante Issues y Proyectos.

## Sources
- [[wiki/sources/2026-07-30-control-de-versiones-con-git-y-github]] — Guía de Git y GitHub por Fernando Herrera y [[brais-moure]].

## Related Concepts
- [[control-de-versiones-git]]
- [[terminal-y-cli]]
- [[soberania-humana-en-ia]]

## Open Questions
- ¿De qué manera las firmas GPG en commits garantizan la autenticidad de autoría frente a posibles suplantaciones en repositorios públicos?
