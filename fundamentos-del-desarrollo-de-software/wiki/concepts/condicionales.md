---
type: concept
created: 2026-07-30
updated: 2026-07-30
tags: [condicionales, if-else, switch, estructuras-de-control, programacion]
related: [bucles, diseno-de-algoritmos]
---

# Condicionales

## Definition
Las estructuras condicionales permiten que un programa **bifurque su ejecución** dependiendo del resultado de evaluar una condición booleana. Son el mecanismo básico de toma de decisiones del software: "si ocurre esto, haz aquello; si no, haz esto otro".

## Key Ideas
- **IF/ELSE:** ejecuta una rama u otra según una condición booleana.
- **ELSE IF:** encadena evaluaciones secuenciales de múltiples condiciones excluyentes.
- **Anidamiento (*nesting*):** condicionales dentro de otros condicionales — útil pero peligroso si se abusa, oscurece la legibilidad.
- **SWITCH:** optimiza legibilidad y rendimiento cuando se evalúa una única variable contra múltiples casos discretos; `BREAK` es crítico para evitar ejecución en cascada (*fall-through*) de casos posteriores.

## Applications
- Personalización de experiencias de usuario en tiempo real.
- Gestión de niveles de riesgo en transacciones financieras ("si el monto supera X, requerir aprobación adicional").
- Validación de permisos y control de acceso (login, roles).

## Examples
```text
IF (edad_usuario >= 18) {
    MOSTRAR "Acceso permitido"
} ELSE {
    MOSTRAR "Acceso denegado. Eres menor de edad."
}
```
```text
SWITCH (opcion_menu) {
    CASE 1: AbrirPerfil() BREAK
    CASE 2: AbrirConfiguracion() BREAK
    DEFAULT: MOSTRAR "Opción inválida"
}
```

## Comparison
| Aspecto | IF/ELSE/ELSE IF | SWITCH |
|---------|---------------|-------------|
| Mejor caso de uso | Condiciones distintas o rangos | Una sola variable contra casos discretos |
| Riesgo principal | Anidamiento excesivo | Olvidar `BREAK` (fall-through accidental) |

## Sources
- [[wiki/sources/2026-07-30-estructuras-de-control]] — IF/ELSE, ELSE IF, anidamiento y SWITCH.
- [[wiki/sources/2026-07-30-fundamentos-de-la-programacion-conclusiones]] — condicionales como "toma de decisiones" del software.

## Related Concepts
[[bucles]], [[diseno-de-algoritmos]], [[pensamiento-computacional]]

## Open Questions
- ¿Qué límite práctico de niveles de anidamiento se considera aceptable antes de exigir refactorización a funciones?

---

**Última actualización:** 2026-07-30
**Aparece en:** 2 fuentes
