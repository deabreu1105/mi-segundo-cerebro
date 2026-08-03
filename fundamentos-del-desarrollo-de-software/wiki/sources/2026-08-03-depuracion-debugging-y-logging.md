---
type: source
created: 2026-08-03
updated: 2026-08-03
tags: [debugging, logging, pdb, breakpoints, python]
source: raw/papers/2026-08-03-depuracion-debugging-y-logging.md
author: BIG School
---

# Depuración (Debugging y Logging)

## Metadata
- **Fuente original:** `raw/papers/2026-08-03-depuracion-debugging-y-logging.md`
- **Autor:** [[big-school]]
- **Fecha:** 2026-08-03
- **Tipo de documento:** Documento Técnico + Diapositivas + snippet de código (PDF `0.6.2 Depuración (debugging y logging).pdf`, Módulo 0)

## Summary
Segunda fuente del Módulo 5: aporta la **implementación concreta en Python** de conceptos de debugging que el wiki ya tenía en abstracto desde el Módulo 0 (metodología científica, breakpoints, logs). Recorre tres niveles de madurez: inspección con `print()` (rápida pero contaminante), depuración interactiva con `pdb`/VS Code (breakpoint, step over, step into, inspect), y `logging` en producción con niveles jerárquicos (DEBUG/INFO/WARNING/ERROR/CRITICAL). Usa un caso de estudio único (un bug de signo en un cálculo de descuento) demostrado con las tres técnicas.

## Key Takeaways
1. **Los bugs son una certeza estadística, no una posibilidad remota** — la depuración sistemática (método científico) separa el control estratégico de la frustración operativa por ensayo y error.
2. **`print()` es la técnica más básica:** útil para inspección rápida y localizada, pero su uso excesivo contamina el código y es ineficiente en arquitecturas complejas.
3. **El depurador interactivo (`pdb`, VS Code) da control total:** Breakpoint (pausa en una línea), Step Over (avanza sin entrar en funciones), Step Into (entra en la lógica interna), Inspect (examina/modifica variables en memoria).
4. **`logging` es indispensable en producción**, donde no se puede pausar el servicio: registro cronológico categorizado en 5 niveles — Debug, Info, Warning, Error, Critical — que permite diagnóstico post-mortem sin recrear manualmente cada incidencia.
5. **Caso de estudio recurrente:** un bug donde se **suma** un descuento en vez de **restarlo** (`precio_base * (1 + factor_descuento)` en vez de `(1 - factor_descuento)`), resuelto con las tres técnicas progresivamente.

## Detailed Breakdown

### 1. La Anatomía de la Investigación: Estrategias de Debugging
El debugging es un método científico aplicado al software: localizar la "escena del crimen", identificar puntos de fallo, analizar valores de variables en tiempo real — no reaccionar impulsivamente. El enfoque metódico corrige la causa raíz, no solo el síntoma, evitando que el problema se replique en otros módulos.

### 2. Inspección Elemental: Sentencias Print
Actúa como una lupa en puntos estratégicos del código para rastrear la evolución de los datos. Útil para inspecciones rápidas (ej. detectar que un cálculo aritmético no es coherente con sus entradas), pero requiere inserción/eliminación manual de cada sentencia, consumiendo tiempo y arriesgando introducir nuevos errores.

**Caso de estudio:** una función de descuento que **suma** en vez de restar el descuento, produciendo un precio final mayor al original.

### 3. Depuración Interactiva: Control Total de la Ejecución
El depurador interactivo permite pausar el flujo y "interrogar" el estado exacto en un instante preciso:
- **Breakpoint:** marca que detiene el programa al llegar a esa línea.
- **Step Over:** avanza a la siguiente línea sin entrar en funciones llamadas — visión de alto nivel.
- **Step Into:** profundiza en la lógica interna de una función — detecta fallos de modularidad.
- **Inspect:** ve y, en ocasiones, modifica valores en memoria mientras la app está en pausa.

Herramientas en Python: `pdb` (Python Debugger) y los depuradores integrados de IDEs (VS Code), que eliminan la necesidad de "adivinar" qué ocurre internamente.

### 4. Gestión de Errores en Producción mediante Logging
Una vez desplegada la app, la depuración interactiva deja de ser viable — no se puede pausar el servicio para un usuario real. El **logging** registra eventos cronológicamente con niveles jerárquicos:
1. **Debug:** información granular para desarrollo.
2. **Info:** confirmaciones operativas estándar.
3. **Warning:** alertas de anomalías que no detienen el servicio.
4. **Error:** fallos en funcionalidades específicas.
5. **Critical:** errores de infraestructura que pueden colapsar el sistema completo.

Un sistema de logs robusto (fecha, hora, stack trace) permite mantener estabilidad sin recrear manualmente cada incidencia reportada.

### 5. Observaciones Clave
- La depuración sistemática separa a los desarrolladores experimentales de los ingenieros sólidos.
- `print()` es aceptable en desarrollo local, pero mala práctica si se mantiene en el código final (contamina el flujo).
- Dominar breakpoint + step over/into es esencial para lógicas de negocio complejas sin ejecutar el programa repetidamente.
- El logging es el único historial confiable para sistemas que no se pueden manipular directamente en vivo.
- La jerarquía de niveles permite filtrar ruido y priorizar atención sobre incidentes críticos que afectan el ROI.

### 6. Conclusión
La integración de debugging y logging es un pilar de madurez tecnológica: no se trata solo de corregir errores, sino de establecer un marco que potencie confiabilidad y agilidad, dando a los profesionales la confianza para escalar soluciones y delegar creación asistida por IA con criterio técnico de validación.

## Code & Pseudocode Examples

### El bug de referencia (signo invertido)
```python
def calcular_precio_con_descuento(precio_base, descuento_porc):
    factor_descuento = descuento_porc / 100
    precio_final = precio_base * (1 + factor_descuento)  # BUG: debería ser (1 - factor_descuento)
    return precio_final

precio_producto = 100
descuento = 20
print(f"El precio final es: {calcular_precio_con_descuento(precio_producto, descuento)}")
# Salida incorrecta: El precio final es: 120.0
```

### Nivel 1 — Depuración con print()
```python
def calcular_precio_con_descuento(precio_base, descuento_porc):
    print(f"--- Dentro de la función ---")
    print(f"Valor de precio_base: {precio_base}")
    print(f"Valor de descuento_porc: {descuento_porc}")
    factor_descuento = descuento_porc / 100
    print(f"Valor de factor_descuento: {factor_descuento}")  # ¡Pista!
    precio_final = precio_base * (1 + factor_descuento)
    print(f"Valor de precio_final calculado: {precio_final}")  # ¡Pista!
    return precio_final
```

### Nivel 2 — Depuración interactiva (demostración conceptual)
```text
1. Ponemos un breakpoint en la línea `precio_final = ...`.
2. Ejecutamos el programa en modo depuración.
3. El programa se detiene justo antes de ejecutar esa línea.
4. Inspeccionamos: precio_base = 100, factor_descuento = 0.2.
5. Step Over: la línea se ejecuta.
6. Inspeccionamos precio_final: 120.0 — el error está exactamente en esa línea.
```

### Nivel 3 — Corrección con logging (producción)
```python
import logging

logging.basicConfig(level=logging.DEBUG, format='%(asctime)s - %(levelname)s - %(message)s')

def calcular_precio_con_descuento(precio_base, descuento_porc):
    factor_descuento = descuento_porc / 100
    logging.debug(f"factor_descuento calculado: {factor_descuento}")
    precio_final = precio_base * (1 - factor_descuento)  # Corrección del bug
    logging.debug(f"precio_final calculado: {precio_final}")
    return precio_final
```

### Logging en un flujo con manejo de excepciones
```python
import logging

logging.basicConfig(filename='app.log', level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

def mi_funcion_importante(data):
    logging.info(f"Función iniciada con los datos: {data}")
    try:
        resultado = data / 2
        logging.info(f"Cálculo exitoso. Resultado: {resultado}")
        return resultado
    except TypeError:
        logging.error("¡Error! Los datos de entrada no eran un número.", exc_info=True)
        return None

mi_funcion_importante("texto")
```

## Entities Mentioned
- [[big-school]]

## Concepts Discussed
- [[metodologia-de-debugging]]
- [[breakpoints]]
- [[analisis-de-logs]]

## Notable Quotes
> "La depuración, entendida como un proceso analítico, es el seguro de vida de cualquier proyecto de software escalable."

## Connections & Reflections
- Esta fuente aporta la **implementación concreta en Python** de tres conceptos que el wiki ya tenía en abstracto desde el Módulo 0: [[metodologia-de-debugging]] (ciclo científico de 5 pasos), [[breakpoints]] (inspección pausada), [[analisis-de-logs]] (niveles de severidad). No se crea ningún concepto nuevo — se extienden los tres con las herramientas Python reales (`pdb`, VS Code, módulo `logging`).
- [[analisis-de-logs]] ya cubría `INFO`/`WARNING`/`ERROR`/`CRITICAL`; esta fuente añade el nivel `DEBUG` que faltaba, completando los cinco niveles estándar.
- La sentencia `print()` como técnica "informal" de depuración no estaba explícita en [[metodologia-de-debugging]] — se añade como el primer escalón (más básico e informal) antes de breakpoints/logs.

## Open Questions
- ¿Qué herramientas de logging estructurado (JSON logs, correlation IDs) conectan esta técnica local con la observabilidad distribuida ya señalada como pregunta abierta en [[analisis-de-logs]]?

## Related Sources
- [[wiki/sources/2026-07-29-metodologias-de-resolucion-de-problemas]] — origen del método científico de debugging y la tríada logs/stack-trace/breakpoints en el wiki.
- [[wiki/sources/2026-08-03-testing]] — el bug de este caso de estudio es exactamente el tipo de error lógico que un test unitario habría detectado antes de llegar a producción.

---

**Estado:** ✅ Completamente procesado e integrado en el wiki
