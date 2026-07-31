---
type: concept
created: 2026-07-29
updated: 2026-07-30
tags: [pilar, descomposicion, divide-y-venceras, arquitectura]
---

# Descomposición

## Definition
La **Descomposición** (bajo el principio de *divide y vencerás*) es el pilar del pensamiento computacional mediante el cual un sistema o problema complejo y abrumador se divide en subproblemas o componentes atómicos más pequeños y manejables, los cuales se pueden analizar, diseñar o resolver de manera independiente.

## Key Ideas
- **Reducción de Carga Cognitiva:** Permite abordar problemas que de otro modo serían inasumibles de una sola vez.
- **Granularidad y Nivel Atómico:** La profundidad de la descomposición varía según el contexto; al instruir agentes sin contexto implícito (ej. robots o IA), la descomposición debe ser atómica (descomposición fina).
- **Prevención de Deuda Técnica:** Fragmentar correctamente evita dependencias acopladas y facilita el mantenimiento modular del código — una descomposición pobre es una de las fuentes directas de [[deuda-tecnica]].

## Applications
- Diseño modular de microservicios y componentes de software.
- Elaboración de pseudocódigo y especificaciones funcionales.
- División de tareas en metodologías ágiles de proyectos.
- Diseño de [[funciones-y-parametros|funciones]] con responsabilidad única — una función es la materialización de la descomposición en código.

## Sources
- [[wiki/sources/2026-07-29-fundamentos-del-pensamiento-computacional]] — Definición como primer pilar del pensamiento computacional.
- [[wiki/sources/2026-07-29-ejercicios-practicos-pensamiento-computacional]] — Ejemplo atómico del Robot y el Sándwich.
- [[wiki/sources/2026-07-30-funciones-y-parametros]] — DRY y responsabilidad única como descomposición aplicada a funciones.
- [[wiki/sources/2026-07-30-modularidad-en-python]] — descomposición aplicada a la organización física del código en módulos y paquetes.

## Related Concepts
- [[pensamiento-computacional]]
- [[abstraccion]]
- [[diseno-de-algoritmos]]
- [[funciones-y-parametros]]
- [[deuda-tecnica]]
- [[modularidad-modulos-y-paquetes]]

## Open Questions
- ¿Cuándo una descomposición excesivamente detallada añade sobrecoste de integración (*overhead*) sin aportar claridad?
