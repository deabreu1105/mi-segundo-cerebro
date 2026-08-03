---
type: concept
created: 2026-08-03
updated: 2026-08-03
tags: [refactorizacion, deuda-tecnica, srp, testing, python]
related: [deuda-tecnica, testing-y-piramide-de-pruebas, estilo-de-codigo-y-convenciones, funciones-y-parametros]
---

# Refactorización

## Definition
La **refactorización** es el proceso disciplinado y continuo de mejorar la estructura interna del código sin alterar su comportamiento externo observable. Es la principal herramienta de saneamiento contra la [[deuda-tecnica]] acumulada: no reescribe el sistema desde cero, sino que lo reorganiza mientras sigue funcionando — análogo a organizar una cocina profesional en pleno servicio.

## Key Ideas
- **Refactorizar ≠ Reescribir:** el comportamiento externo del sistema no cambia; solo su estructura interna. Reescribir desde cero suele ser económicamente inviable.
- **"Regla de Oro":** solo se puede refactorizar con confianza si existe una buena suite de tests automatizados (ver [[testing-y-piramide-de-pruebas]]) — los tests son la red de seguridad que garantiza que la limpieza no rompe funcionalidad existente.
- **Patrón central: aplicar SRP a código ya existente** — descomponer una función que mezcla responsabilidades (ej. filtrado + formateo) en funciones especializadas, ganando legibilidad, testabilidad y reutilización.
- **Es un proceso continuo, no un proyecto puntual:** la deuda técnica se genera constantemente; la refactorización debe ser una disciplina diaria, no una iniciativa aislada de "gran limpieza".
- **No busca perfección teórica**, sino un nivel de calidad que permita al negocio reaccionar a tiempo ante las demandas del mercado.

## Applications
- Antes de añadir una nueva funcionalidad sobre código legacy con deuda conocida, refactorizar primero la sección afectada (siempre con tests como red de seguridad).
- Descomponer funciones "monstruo" identificadas en code review en unidades con una sola responsabilidad, reutilizables independientemente.
- Establecer refactorización continua como parte del flujo normal de trabajo (no como un sprint especial "de deuda técnica") para evitar que la deuda se acumule sin control.

## Examples
```python
# Antes: filtrado y formateo mezclados en una sola función
def generar_reporte_usuario(lista_usuarios):
    reporte = "--- Reporte de Usuarios Activos ---\n"
    for u in lista_usuarios:
        if u['activo'] and u['ultimo_login_hace_dias'] < 30:
            reporte += f"Nombre: {u['nombre']}\n"
    return reporte

# Después: responsabilidades separadas, cada una testeable de forma aislada
def filtrar_usuarios_activos_recientes(lista_usuarios):
    return [u for u in lista_usuarios if u['activo'] and u['ultimo_login_hace_dias'] < 30]

def formatear_reporte(usuarios_activos):
    lineas = ["--- Reporte de Usuarios Activos ---"]
    lineas += [f"Nombre: {u['nombre']}" for u in usuarios_activos]
    return "\n".join(lineas)
```

## Comparison
| Aspecto | Reescribir desde Cero | Refactorizar |
|---------|---------------|-------------|
| Coste | Alto, detiene el desarrollo de features | Incremental, compatible con desarrollo continuo |
| Riesgo | Alto (se pierde conocimiento tácito del sistema actual) | Bajo si hay tests que respalden cada cambio |
| Precondición | Ninguna especial | Suite de tests automatizados ("Regla de Oro") |
| Resultado visible al usuario | Ninguno (mismo comportamiento externo) | Ninguno (mismo comportamiento externo) |

## Sources
- [[wiki/sources/2026-08-03-deuda-tecnica-y-refactorizacion]] — definición, "Regla de Oro", ejemplo completo de refactor por SRP.
- [[wiki/sources/2026-08-03-conclusiones-buenas-practicas-desarrollo-software]] — la refactorización como "mecanismo de pago" de la deuda técnica, síntesis final del Módulo 5.

## Related Concepts
[[deuda-tecnica]], [[testing-y-piramide-de-pruebas]], [[estilo-de-codigo-y-convenciones]], [[funciones-y-parametros]]

## Open Questions
- ¿Qué señales objetivas (code smells cuantificables, complejidad ciclomática) deberían disparar automáticamente una alerta de "esto necesita refactorización" en un pipeline de CI?

---

**Última actualización:** 2026-08-03
**Aparece en:** 2 fuentes
