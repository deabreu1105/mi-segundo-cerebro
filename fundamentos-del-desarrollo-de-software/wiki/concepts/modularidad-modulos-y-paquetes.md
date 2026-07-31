---
type: concept
created: 2026-07-30
updated: 2026-07-30
tags: [modularidad, modulos, paquetes, python, mantenibilidad]
related: [descomposicion, deuda-tecnica, entornos-virtuales-y-dependencias]
---

# Modularidad: Módulos y Paquetes

## Definition
La **modularidad** es la estrategia de ingeniería que fragmenta la complejidad de una aplicación en componentes independientes. En Python, un **módulo** es cualquier archivo `.py`; un **paquete** es una carpeta que agrupa módulos junto con un archivo especial `__init__.py` que la marca como importable.

## Key Ideas
- Código monolítico en un único archivo se vuelve inasimilable, ineficiente y propenso a fallos sistémicos — la modularidad es la respuesta estructural a ese problema.
- **Módulo:** el nombre del archivo `.py` se convierte en su identificador de importación (`import text_utils`).
- **Paquete:** carpeta con módulos + `__init__.py`, que notifica al intérprete que debe tratarse como paquete ejecutable.
- Cuatro sintaxis de importación, de más explícita a más abreviada: `import paquete.modulo`, `from paquete import modulo`, `from paquete.modulo import funcion`, `import paquete.modulo as alias`.
- Beneficios: organización por responsabilidad, reusabilidad sin duplicar lógica, mantenibilidad (un fix se propaga a todo el sistema) y colaboración sin conflictos de Git entre desarrolladores trabajando en módulos independientes.

## Applications
- Separar responsabilidades lógicas de un proyecto en archivos/carpetas independientes en vez de un único script gigante.
- Evitar colisiones de nombres con librerías estándar o de terceros al nombrar módulos propios (nunca `math.py` o `json.py`).
- Facilitar la colaboración en equipo: cada desarrollador puede trabajar en su propio módulo sin pisar el trabajo de otros.

## Examples
```text
mi_analizador/
│
├── main.py
└── analizador/
    ├── __init__.py
    ├── texto.py
    └── matematicas.py
```
```python
# main.py
from analizador import texto, matematicas
palabras = matematicas.contar_palabras(mi_frase)
```

## Comparison
| Sintaxis de importación | Descripción | Ejemplo |
| --- | --- | --- |
| `import paquete.modulo` | Explícita, namespace completo | `paquete.modulo.funcion()` |
| `from paquete import modulo` | Acorta el prefijo | `modulo.funcion()` |
| `from paquete.modulo import funcion` | Importa solo lo necesario | `funcion()` |
| `import paquete.modulo as alias` | Alias personalizado | `alias.funcion()` |

## Sources
- [[wiki/sources/2026-07-30-modularidad-en-python]] — módulos, paquetes, `__init__.py` y sintaxis de importación.

## Related Concepts
[[descomposicion]], [[deuda-tecnica]], [[entornos-virtuales-y-dependencias]], [[python-como-lenguaje]]

## Open Questions
- ¿En qué punto de crecimiento de un paquete conviene subdividirlo en subpaquetes anidados en vez de añadir más módulos planos?

---

**Última actualización:** 2026-07-30
**Aparece en:** 1 fuente
