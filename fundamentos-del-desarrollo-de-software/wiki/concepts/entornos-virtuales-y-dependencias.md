---
type: concept
created: 2026-07-30
updated: 2026-07-30
tags: [entornos-virtuales, venv, pip, dependencias, python]
related: [modularidad-modulos-y-paquetes, deuda-tecnica]
---

# Entornos Virtuales y Gestión de Dependencias

## Definition
Un **entorno virtual** es una copia autocontenida y aislada de una instalación de Python, con su propio intérprete y espacio de paquetes independiente del sistema global. Junto con un gestor de paquetes (`pip`) y un archivo de contrato de dependencias (`requirements.txt`), forman la "infraestructura invisible" que garantiza que un proyecto se comporte igual en cualquier máquina.

## Key Ideas
- **`venv`** es la herramienta estándar de la librería nativa de Python para crear entornos aislados (`python -m venv venv`).
- Cada entorno tiene su propia copia del intérprete y un espacio vacío para instalar librerías — dos proyectos pueden usar versiones distintas e incompatibles de la misma dependencia sin conflicto.
- **`pip`** instala, actualiza y elimina paquetes dentro del entorno virtual activo.
- **`requirements.txt`** es el contrato de dependencias: `pip freeze` lo genera desde el entorno actual; `pip install -r` lo reproduce en otra máquina.
- **Version pinning** (fijar versiones exactas) previene fallos por actualizaciones incompatibles de terceros — crítico en proyectos de IA y producción.
- La carpeta del entorno virtual (`venv/`, `.venv/`) **nunca** se sube al control de versiones — va en `.gitignore`; solo se comparte `requirements.txt`.

## Applications
- Aislar dependencias de cada proyecto para evitar el "funciona en mi máquina" al desplegar en otro entorno.
- Reproducir exactamente un entorno de desarrollo en CI/CD o en la máquina de otro miembro del equipo.
- Prevenir incompatibilidades de versiones en proyectos de Machine Learning donde librerías como PyTorch o NumPy son sensibles a versiones específicas.

## Examples
```bash
python -m venv venv
source venv/bin/activate     # macOS/Linux
pip install requests
pip freeze > requirements.txt
deactivate
```
En otra máquina:
```bash
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

## Comparison
| Escenario | Sin entorno virtual | Con entorno virtual |
|---------|---------------|-------------|
| Dos proyectos, mismas dependencias distintas versiones | Conflicto en el Python global | Cada uno aislado, sin conflicto |
| Reproducir el proyecto en otra máquina | Instalación manual propensa a errores | `pip install -r requirements.txt` |
| Versionado en Git | Riesgo de subir binarios pesados/locales | `.gitignore` excluye `venv/`, solo se versiona `requirements.txt` |

## Sources
- [[wiki/sources/2026-07-30-gestion-de-entornos-y-dependencias]] — venv, pip y requirements.txt en detalle.
- [[wiki/sources/2026-08-03-gestion-entornos-dependencias]] — diagrama de flujo del ciclo de vida completo y ejemplo real de `requirements.txt` con version pinning.
- [[wiki/sources/2026-08-03-conclusiones-lenguajes-programacion]] — entornos virtuales como "única vía" para reproducibilidad, síntesis final del bloque.

## Related Concepts
[[modularidad-modulos-y-paquetes]], [[deuda-tecnica]], [[python-como-lenguaje]]

## Open Questions
- ¿Qué ventajas concretas ofrecen gestores más recientes (Poetry, uv, pipenv) sobre el par `venv` + `pip` + `requirements.txt` en proyectos de mediana escala?

---

**Última actualización:** 2026-08-03
**Aparece en:** 3 fuentes
