
# Bases de los Lenguajes de Programación

**Autor(es):** BIG School
**Fecha:** 2026
**Tipo:** Documento Técnico / Material de Curso
**Lenguaje:** Python
**Fuente Original:** PDF (Módulo 0: Fundamentos del Desarrollo de Software) - Máster Desarrollo con IA

---

Dominar la sintaxis de un lenguaje no es un fin en sí mismo, sino la adquisición de un lenguaje común para dirigir sistemas de inteligencia artificial de manera **eficiente y segura**. En el paradigma actual, la IA actúa como un multiplicador de fuerza, pero su valor es nulo si se aplica sobre una base de conocimiento inexistente; no se puede multiplicar por cero. Entender los fundamentos de Python permite al profesional pasar de ser un mero espectador a un **director de orquesta** capaz de validar, depurar y optimizar las soluciones que las máquinas proponen. La verdadera ventaja competitiva no reside en dejar que la IA escriba el código, sino en poseer la **comprensión musical** necesaria para supervisar que esa composición técnica sea robusta, escalable y responda fielmente a los objetivos de negocio planteados. Este conocimiento técnico es el que transforma un prompt genérico en una directriz de **ingeniería efectiva**.

## Gestión de Datos y Tipado Dinámico

### Variables y Flexibilidad Operativa

Las variables funcionan como etiquetas de memoria que permiten almacenar y manipular información esencial para el negocio. Una característica distintiva de Python es su **tipado dinámico**, lo que significa que no es necesario declarar explícitamente si una variable contendrá texto o números; el lenguaje lo infiere y permite cambiar el tipo de dato durante la ejecución sin interrumpir el flujo. Esta flexibilidad agiliza el desarrollo inicial, aunque exige una mayor responsabilidad en el control de la lógica para evitar conflictos operativos.

```python
# Asignación de variables
nombre_estudiante = "Ana"
edad = 28
esta_activo = True
```

Usamos la convención "snake_case" (todo en minúsculas con guiones bajos) para nombrar variables en Python. Es una buena práctica que hace el código más legible.

### Tipos Primitivos y Estructuras de Texto

El sistema organiza la información en categorías fundamentales: números enteros (`int`) para conteos precisos, números de coma flotante (`float`) para mediciones decimales, y cadenas de texto (`strings`/`str`).

- **Numéricos:**
  - `int` (Enteros): Números completos, usados para contar (ej. 5, -10).
  - `float` (Coma flotante): Números decimales, usados para medidas (ej. 9.99, 3.1415).
- **Texto:**
  - `str` (Strings/Cadenas): Secuencias de caracteres, rodeadas por comillas dobles o simples.
- **Lógicos:**
  - `bool` (Booleanos): Representan la verdad, solo pueden ser `True` o `False`.

```python
precio = 199.99
print(type(precio))  # Output: <class 'float'>

usuarios = 50
print(type(usuarios))  # Output: <class 'int'>
```

En la manipulación de texto moderna, destaca el uso de las **f-strings**. Esta técnica permite incrustar expresiones y variables directamente dentro de una cadena anteponiendo una 'f' a las comillas, lo que resulta en un código mucho más legible y rápido de procesar que la concatenación tradicional mediante operadores aritméticos.

```python
rol = "Desarrollador"
empresa = "BIG school"

# Forma antigua (funciona, pero es verbosa)
mensaje_antiguo = "Mi rol es " + rol + " en " + empresa + "."

# Forma moderna (F-Strings) - ¡Recomendado!
mensaje_moderno = f"Mi rol es {rol} en {empresa}."
print(mensaje_moderno)

# Podemos incluso ejecutar código dentro de las llaves
print(f"El doble de 5 es: {5 * 2}")
```

### Entrada de Usuario y Casting

```python
# Ejemplo de error común
edad_str = input("¿Cuál es tu edad? ")
print(f"El próximo año tendrás {edad_str + 1} años.")

# Si intentamos sumar: edad_str + 1 -> Error! No se puede sumar str + int

# Solución: Casting (asumiendo que el usuario introduce un número válido)
edad_int = int(edad_str)
print(f"El próximo año tendrás {edad_int + 1} años.")
```

## Lógica de Control y Estructuras de Decisión

### Condicionales e Indentación Crítica

La toma de decisiones en el software se articula mediante bloques condicionales (`if`, `elif`, `else`). A diferencia de otros lenguajes que utilizan llaves, Python se basa exclusivamente en la **indentación** (espacios en blanco o tabulaciones) para definir la jerarquía del código. Un error en el espaciado no es solo un problema estético, sino un fallo funcional que determina qué instrucciones se ejecutan bajo qué premisas. Esta rigurosidad visual garantiza que el código sea inherentemente ordenado y fácil de auditar por otros miembros del equipo.

```python
temperatura = 30

if temperatura > 25:
    # Este bloque indentado solo se ejecuta si la condición es True
    print("Hace calor.")
    print("Encendiendo el aire acondicionado.")

print("Fin del chequeo.")  # Esta línea siempre se ejecuta
```

```python
# Sistema de calificación
nota = 75

if nota >= 90:
    print("A (Sobresaliente)")
elif nota >= 70:
    # Se evalúa solo si la anterior fue False
    print("B (Notable)")
elif nota >= 50:
    print("C (Aprobado)")
else:
    # Se ejecuta si ninguna fue True
    print("D (Suspenso)")
```

### Iteración y Eficiencia con Bucles

Para evitar la redundancia, se emplean bucles `while` y `for`. El bucle `while` es ideal cuando la repetición depende de una condición lógica que debe validarse constantemente, mientras que el `for` destaca al iterar sobre rangos o colecciones de datos definidas. El uso correcto de estas estructuras permite procesar grandes volúmenes de información con apenas unas líneas de comando, aplicando el principio **DRY** (Don't Repeat Yourself) para mantener la arquitectura de software limpia y mantenible.

```python
# Bucle WHILE
contador = 0

while contador < 3:
    print(f"Iteración número {contador}")
    contador += 1  # Equivalente a: contador = contador + 1
```

```python
# Bucle FOR con range
# range(3) genera una secuencia: 0, 1, 2
print("Inicio del bucle FOR:")
for i in range(3):
    print(f"Paso {i}")

# Ejemplo de continue (imprimir solo impares)
for numero in range(1, 6):
    if numero % 2 == 0:  # Si el número es par (el resto al dividir por 2 es 0)
        continue  # Saltar a la siguiente iteración
    print(f"Impar: {numero}")
```

## Arquitectura de Datos y Modularidad

### Colecciones: Listas, Tuplas, Sets y Diccionarios

La organización de información compleja requiere estructuras más avanzadas. Las **listas** son colecciones mutables y ordenadas, mientras que las **tuplas** ofrecen inmutabilidad, garantizando que los datos no se alteren accidentalmente tras su creación. Por otro lado, los **sets** son óptimos para gestionar elementos únicos y realizar operaciones matemáticas de conjuntos como uniones o intersecciones. Finalmente, los **diccionarios** representan entidades del mundo real mediante pares de clave-valor, permitiendo un acceso semántico a la información.

```python
# Listas - Colección ordenada y mutable, se definen con [ ]
lenguajes = ["Python", "Java", "C#", "JavaScript"]

print(lenguajes[0])   # Output: Python
print(lenguajes[2])   # Output: C#
print(lenguajes[-1])  # Índices negativos acceden desde el final -> JavaScript

lenguajes.append("Go")     # Agrega el elemento al final de la lista
lenguajes.remove("Java")   # Elimina el elemento de la lista

# Recorrer lista
print("\nLenguajes a aprender:")
for lenguaje in lenguajes:
    print(f"- {lenguaje}")
```

```python
# Tuplas - Secuencias inmutables, se definen con ( )
coordenadas = (10.5, 20.1)
# Intentar modificar daría error: coordenadas[0] = 11.0 -> TypeError
```

```python
# Sets - Colección no ordenada, mutable, sin duplicados, se definen con { }
s = {1, 2, 3}
s.add(4)        # Agregar un elemento
s.remove(2)     # Eliminar (error si no existe)
s.discard(10)   # Eliminar sin error si no existe
s.pop()         # Elimina un elemento aleatorio
s.clear()       # Vacía el set

# Operaciones de conjuntos
A = {1, 2, 3}
B = {3, 4, 5}

print(A | B)  # Unión -> {1, 2, 3, 4, 5}
print(A.union(B))

print(A & B)  # Intersección -> {3}
print(A.intersection(B))

print(A - B)  # Diferencia -> {1, 2}
print(A.difference(B))

print(A ^ B)  # Diferencia simétrica -> {1, 2, 4, 5}
print(A.symmetric_difference(B))
```

```python
# Diccionarios - Pares clave: valor, se definen con { }
estudiante = {
    "nombre": "Carlos",
    "edad": 28,
    "curso": "Máster en IA",
    "esta_activo": True
}

# Se accede a los valores usando su clave, no un índice numérico
print(f"El estudiante {estudiante['nombre']} tiene {estudiante['edad']} años.")

# Para iterar sobre un diccionario, usamos el método .items(),
# que nos devuelve la clave y el valor en cada iteración.
print("\nDetalles del estudiante:")
for clave, valor in estudiante.items():
    # .capitalize() pone la primera letra en mayúscula
    print(f"{clave.capitalize()}: {valor}")
```

### Funciones y Control de Excepciones

La modularidad se alcanza mediante el empaquetado de lógica en funciones, las cuales pueden recibir parámetros y retornar resultados, facilitando la reutilización del código en diferentes partes de un sistema.

```python
# Definición de la función
def saludar(nombre):
    """Esta función saluda a una persona."""  # Esto es un docstring, explica la función
    mensaje = f"Hola, {nombre}. ¡Bienvenido al curso!"
    return mensaje

# Llamada a la función
saludo_para_ana = saludar("Ana")
print(saludo_para_ana)
```

```python
# Parámetros con valores por defecto
def calcular_impuesto(precio_base, tasa=0.21):
    impuesto = precio_base * tasa
    return impuesto

# Usando el valor por defecto (21%)
print(calcular_impuesto(1000))

# Usando un valor específico (10%)
print(calcular_impuesto(1000, tasa=0.10))
```

No obstante, la robustez de una aplicación no solo depende de su lógica positiva, sino de su capacidad para gestionar errores. El uso de bloques `try-except` permite capturar fallos potenciales (como la introducción de datos erróneos por un usuario) y ofrecer una respuesta controlada en lugar de permitir que el sistema colapse de forma abrupta.

```python
# Manejo de Errores (Try / Except)
edad_str = input("Introduce tu edad: ")

try:
    edad_int = int(edad_str)
    print(f"Tu edad es {edad_int}.")
except ValueError:
    # Se ejecuta si int() falla (ej. si el usuario introdujo texto)
    print("Error: Por favor, introduce un número válido.")

print("El programa continúa ejecutándose...")
```

## Observaciones Clave

- La IA puede generar código erróneo o inseguro; la supervisión humana basada en fundamentos técnicos es el único filtro de calidad fiable.
- La indentación en Python es un requisito sintáctico, no opcional; define el alcance de las funciones, bucles y condicionales.
- El casting (conversión de tipos) es una fuente común de errores; siempre debe envolverse en estructuras de control de excepciones.
- Las f-strings no solo sirven para mostrar variables, sino que permiten ejecutar pequeñas porciones de código y operaciones dentro de la propia cadena de texto.
- Los comentarios deben utilizarse para explicar el 'por qué' de una decisión estratégica de código, no para describir el 'qué', que ya debería ser evidente por la claridad del lenguaje.

## Conclusión

Entender la mecánica interna de Python proporciona el criterio necesario para liderar proyectos tecnológicos donde la inteligencia artificial es una herramienta de apoyo, no el único motor. Al dominar las variables, el control de flujo y la gestión de excepciones, el profesional adquiere la capacidad de auditar la lógica generada automáticamente, asegurando que la integración tecnológica en la empresa sea solvente. La formación técnica básica es, en última instancia, lo que permite dictar instrucciones precisas a la IA y corregir el rumbo cuando la automatización se desvía de los requisitos del negocio.

## Ejemplos Relacionados

Ejercicios prácticos reales realizados sobre este módulo:

**Variables (reasignación dinámica):**

```python
nombre = "Brais"
print(nombre)

nombre = "Moure"
print(nombre)

nombre = 38
print(nombre)
```

**Tipos de datos:**

```python
alumnos = 50
media = 25.676

print(type(alumnos))
print(type(media))

asignatura = "Fundamentos"
print(type(asignatura))

vacaciones = True
print(type(vacaciones))
```

**F-strings vs concatenación:**

```python
rol = "Desarrollador"
empresa = "BIG school"

mensaje = "Mi rol es " + rol + " en " + empresa
print(mensaje)

mensaje_moderno = f"Mi rol es {rol} en {empresa}"
print(mensaje_moderno)
```

**Entrada de usuario:**

```python
edad = input("¿Cuál es tu edad? ")
print(edad)
```

**Condicionales:**

```python
temperatura = 25

if temperatura > 25:
    print("Hace calor")
    print("Encendiendo el aire acondicionado")

print("Fin")
```

**Bucle while:**

```python
contador = 0

while contador < 3:
    print(f"Iteración número {contador}")
    contador += 1
```

**Listas:**

```python
lenguajes = ["Python", "JavaScript", "Java"]

print(lenguajes[-1])

lenguajes.append("C#")

for lenguaje in lenguajes:
    print(lenguaje)
```

**Funciones:**

```python
def saludar(nombre):
    mensaje = f"Hola, {nombre}. ¡Bienvenido al curso!"
    return mensaje

saludo = saludar("Brais")
print(saludo)
```

**Try/Except:**

```python
edad_str = input("Introduce tu edad: ")

try:
    edad_int = int(edad_str)
    print(f"Tu edad es {edad_int}.")
except ValueError:
    print("Error: Por favor, introduce un número válido.")

print("El programa continúa ejecutándose...")
```