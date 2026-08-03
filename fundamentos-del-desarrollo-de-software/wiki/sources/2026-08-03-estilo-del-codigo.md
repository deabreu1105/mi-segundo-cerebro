---
type: source
created: 2026-08-03
updated: 2026-08-03
tags: [estilo, pep8, nomenclatura, srp, linters, python]
source: raw/papers/2026-08-03-estilo-del-codigo.md
author: BIG School
---

# Estilo del Código

## Metadata
- **Fuente original:** `raw/papers/2026-08-03-estilo-del-codigo.md`
- **Autor:** [[big-school]]
- **Fecha:** 2026-08-03
- **Tipo de documento:** Documento Técnico + Diapositivas (PDF `0.6.1 Estilo del código.pdf`, Módulo 0)

## Summary
Primera fuente del nuevo **Módulo 5: Buenas Prácticas del Desarrollo de Software**. Argumenta que escribir código es un ejercicio de "redacción técnica" dirigido a humanos, no a la máquina, y desarrolla cuatro reglas de nomenclatura concretas en Python (descriptividad, PEP 8/snake_case, sustantivos vs. verbos, eliminación de números mágicos), el Principio de Responsabilidad Única aplicado a funciones con un ejemplo de refactor completo, la distinción comentarios ("por qué") vs. docstrings (documentación estructurada de argumentos/retorno), y el rol de linters/formatters automáticos (Flake8, Pylint, Black, autopep8).

## Key Takeaways
1. **El código se escribe para humanos, no para la máquina** — la legibilidad y mantenibilidad son los pilares que separan un activo digital de deuda técnica insostenible.
2. **Cuatro reglas de nomenclatura:** (1) sé descriptivo y específico, (2) sigue PEP 8/`snake_case`, (3) sustantivos para variables y verbos para funciones, (4) evita "números mágicos" — encapsúlalos en constantes con nombres claros (`SECONDS_PER_HOUR`).
3. **Principio de Responsabilidad Única (SRP) en funciones:** una "función monstruo" que mezcla acceso a datos, lógica de negocio y presentación debe descomponerse en funciones pequeñas y enfocadas.
4. **Comentarios explican el "por qué"** (decisiones de diseño no evidentes); el **"qué"** debe ser evidente por la estructura del propio código.
5. **Docstrings son el estándar profesional de documentación** en Python — describen argumentos (`Args:`) y valor de retorno (`Returns:`) directamente en el bloque de la función.
6. **Linters (Flake8, Pylint) y Formatters (Black, autopep8)** automatizan la consistencia de estilo, liberando al profesional para enfocarse en lógica y arquitectura — especialmente crítico al supervisar código generado por IA.

## Detailed Breakdown

### 1. Introducción: Código como Redacción Técnica
El valor del software no reside solo en ejecutar una tarea, sino en comunicar su intención a quienes lo mantendrán — incluyendo al propio desarrollador en el futuro. En la era de la IA, el rol profesional evoluciona de generador de sintaxis a arquitecto/supervisor responsable de que cada bloque de lógica sea interpretable y evolutivo.

### 2. La Semántica como Cimiento del Desarrollo
La nomenclatura es el factor que más incide en la calidad de un proyecto. Un nombre mal elegido es una barrera cognitiva; una buena nomenclatura revela la intención de forma inmediata.

**Regla 1 — Sé descriptivo y específico:** evitar variables de una letra (`l`, `n`) salvo en ámbitos extremadamente restringidos (contadores de bucles breves).
**Regla 2 — Sigue las convenciones del lenguaje (PEP 8):** `snake_case` para variables y funciones en Python, no `camelCase` ni `PascalCase`.
**Regla 3 — Sustantivos para variables, verbos para funciones:** las variables representan entidades/estados (`active_users`); las funciones ejecutan acciones (`calculate_final_price`) — permite que el flujo se lea como una narrativa.
**Regla 4 — Evita los "números mágicos":** cifras sin explicación en el código deben encapsularse en constantes (`SECONDS_PER_MINUTE = 60`), aportando contexto semántico y permitiendo cambios globales con un solo ajuste.

### 3. Funciones y el Principio de Responsabilidad Única
Las "funciones monstruo" que resuelven múltiples problemas simultáneamente (acceso a BD, lógica de negocio, formato de reporte) son peligrosas, difíciles de testear y propensas a errores en cascada. El **SRP** exige que cada función tenga una única responsabilidad — como una herramienta de precisión diseñada para un propósito específico. Refactorizar estas estructuras en micro-funciones especializadas mejora legibilidad, fomenta reutilización y permite pruebas unitarias aisladas por componente.

### 4. Documentación Estratégica y Herramientas de Automatización
Distinción fundamental entre "qué" y "por qué": el código limpio explica el "qué" por su propia estructura; los comentarios se reservan para el "por qué" (decisiones de diseño, restricciones técnicas, requisitos de negocio no evidentes). Los **docstrings** son el estándar profesional en Python: documentan argumentos y valor de retorno directamente tras la definición de la función.

**Linters** (Flake8, Pylint) analizan el código y avisan de errores de estilo/bugs potenciales; **Formatters** (Black, autopep8) reformatean automáticamente al guardar. Su integración es crítica al trabajar con código generado por IA, garantizando un resultado impecable sin debates manuales sobre estilo.

### 5. Observaciones Clave
- El código se lee mucho más de lo que se escribe; priorizar la comodidad del lector sobre la brevedad del autor.
- Nombres de una sola letra son aceptables solo en ámbitos extremadamente restringidos.
- La programación en inglés es el estándar de facto de la industria global.
- Las funciones con múltiples responsabilidades complican testing y mantenimiento.
- La IA puede generar código sucio; supervisar y refactorizar para cumplir estándares organizacionales es responsabilidad del profesional.

### 6. Conclusión
La transición de aficionado a profesional se manifiesta en el respeto por el estilo. La capacidad de producir código fácil de depurar, extender y compartir es una ventaja operativa directa que asegura la viabilidad económica de los proyectos a largo plazo.

## Code & Pseudocode Examples

### Regla 1 — Descriptividad
```python
# Mal ❌:
l = ['Juan', 'Ana', 'Pedro']
for n in l:
    ...

# Bien ✅:
active_users = ['Juan', 'Ana', 'Pedro']
for user_name in active_users:
    ...
```

### Regla 2 — PEP 8 / snake_case
```python
# Mal ❌:
miVariablePrincipal = "valor"
def MiFuncion():
    pass

# Bien ✅:
main_variable = "valor"
def my_function():
    pass
```

### Regla 3 — Sustantivos vs. verbos
```python
# Mal ❌:
def calculo(precio):
    ...

# Bien ✅:
def calculate_final_price(base_price):
    ...
```

### Regla 4 — Sin números mágicos
```python
# Mal ❌:
seconds = minutes * 60
seconds_in_a_day = 24 * 3600

# Bien ✅:
SECONDS_PER_MINUTE = 60
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24

seconds = minutes * SECONDS_PER_MINUTE
seconds_in_a_day = HOURS_PER_DAY * MINUTES_PER_HOUR * SECONDS_PER_MINUTE
```

### SRP — de función monstruo a funciones enfocadas
```python
# Mal ❌: (3 responsabilidades: acceso a datos, lógica de negocio, presentación)
def process_user_data(user_id):
    db_connection = connect_to_db()
    user_data = db_connection.get(f"SELECT * FROM users WHERE id={user_id}")
    full_name = user_data['first_name'] + " " + user_data['last_name']
    age = (datetime.now() - user_data['birth_date']).days / 365
    report = f"REPORTE DE USUARIO:\nNombre: {full_name}\nEdad: {age:.0f} años"
    print(report)
    db_connection.close()
```
```python
# Bien ✅: (funciones pequeñas y enfocadas)
def get_user_from_db(user_id):
    """Obtiene los datos de un usuario de la base de datos."""
    return user_data

def create_user_report(user_data):
    """Crea un string de reporte a partir de los datos del usuario."""
    return report

user_info = get_user_from_db(101)
user_report = create_user_report(user_info)
print(user_report)
```

### Comentarios ("por qué") vs. docstrings
```python
# Mal ❌ (comentario inútil):
# Suma 1 a x
x = x + 1

# Bien ✅ (explica el "por qué"):
# Usamos una aproximación de π para cumplir con el requisito de
# la librería heredada, que no soporta más de 4 decimales.
pi_approx = 3.1416
```
```python
def calculate_final_price(base_price, tax_rate, discount=0):
    """Calcula el precio final aplicando impuestos y un descuento opcional.
    Args:
        base_price (float): El precio base del producto.
        tax_rate (float): La tasa de impuesto (ej. 0.21 para 21%).
        discount (float, optional): El descuento a aplicar. Defaults to 0.
    Returns:
        float: El precio final calculado.
    """
```

## Entities Mentioned
- [[big-school]]

## Concepts Discussed
- [[estilo-de-codigo-y-convenciones]]
- [[funciones-y-parametros]]

## Notable Quotes
> "Escribimos código, ante todo, para otros seres humanos y, muy a menudo, para nuestro 'yo' del futuro."

## Connections & Reflections
- Primera fuente del nuevo Módulo 5. Se crea el concepto [[estilo-de-codigo-y-convenciones]] porque cubre terreno nuevo (PEP 8, reglas de nomenclatura, números mágicos, linters/formatters) que ningún concepto previo abordaba con este nivel de detalle práctico.
- El **SRP aplicado a funciones** ya era un Key Idea de [[funciones-y-parametros]] (Módulo 2) — esta fuente lo extiende con un ejemplo de refactor Python completo y ejecutable, sin contradicción.
- Conecta con [[mentalidad-de-arquitecto]] y [[deuda-tecnica]]: código mal nombrado o con funciones monstruo es exactamente el tipo de "descuido implícito" que ya se identificaba como generador de deuda técnica.

## Open Questions
- ¿Qué convenciones adicionales de PEP 8 (longitud de línea, imports ordenados) merecen su propia cobertura además de `snake_case` y SRP?

## Related Sources
- [[wiki/sources/2026-08-03-deuda-tecnica-y-refactorizacion]] — la refactorización aplica exactamente el mismo patrón SRP a código ya existente y con deuda acumulada.
- [[wiki/sources/2026-07-30-funciones-y-parametros]] — origen del Principio de Responsabilidad Única en el wiki.

---

**Estado:** ✅ Completamente procesado e integrado en el wiki
