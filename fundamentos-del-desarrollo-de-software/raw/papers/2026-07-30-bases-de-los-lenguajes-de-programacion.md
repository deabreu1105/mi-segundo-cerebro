# Bases de los Lenguajes de Programación en Python

**Autor(es):** BIG School  
**Fecha:** 2026  
**Tipo:** Paper / Documento Técnico  
**Fuente Original:** PDF / Módulo 0: Fundamentos del Desarrollo de Software  

---

## 1. Visión General

Dominar la sintaxis de un lenguaje no es un fin en sí mismo, sino la adquisición de un lenguaje común para dirigir sistemas de inteligencia artificial de manera eficiente y segura. Entender los fundamentos de Python permite pasar de ser un espectador a un director de orquesta capaz de validar, depurar y optimizar las soluciones propuestas por las máquinas.

---

## 2. Variables, Tipos de Datos y Operadores

### Tipado Dinámico y Variables

En Python, el tipado es dinámico: el lenguaje infiere el tipo de dato automáticamente al asignar un valor, permitiendo reasignar tipos durante la ejecución. Por convención, se utiliza `snake_case` para el nombramiento de variables.

```python
# Asignación de variables
student_name = "Ana"
age = 28
is_active = True
```

### Tipos Primitivos Universales

| Tipo | Nombre | Descripción | Ejemplo |
| --- | --- | --- | --- |
| `int` | Entero | Números completos sin decimales. | `5`, `-10` |
| `float` | Coma Flotante | Números decimales de precisión. | `9.99`, `3.1415` |
| `str` | Cadena (*String*) | Secuencias de texto delimitadas por comillas. | `"Hola"`, `'Python'` |
| `bool` | Booleano | Lógica binaria representada por `True` o `False`. | `True`, `False` |

```python
price = 199.99
print(type(price))  # Output: <class 'float'>

users = 50
print(type(users))  # Output: <class 'int'>
```

### F-Strings y Formateo de Texto

La técnica moderna recomendada para formatear cadenas en Python es el uso de **f-strings** (anteponiendo una `f` a las comillas).

```python
role = "Desarrollador"
company = "BIG School"

# Forma recomendada (F-Strings)
message = f"Mi rol es {role} en {company}."
print(message)

# Ejecución de código dentro de expresiones
print(f"El doble de 5 es: {5 * 2}")
```

### Conversión de Tipos (*Casting*)

Conversión explícita de variables para evitar errores de incompatibilidad (p. ej., sumar un `str` con un `int`).

```python
age_str = input("¿Cuál es tu edad? ")
age_int = int(age_str)  # Casting explícito a Entero
print(f"El próximo año tendrás {age_int + 1} años.")
```

---

## 3. Estructuras de Control de Flujo

### Lógica Condicional (`if`, `elif`, `else`)

Python utiliza la indentación (espacios en blanco) para definir la jerarquía y bloques de código, reemplazando el uso de llaves de otros lenguajes.

```python
score = 75

if score >= 90:
    print("A (Sobresaliente)")
elif score >= 70:
    print("B (Notable)")
elif score >= 50:
    print("C (Aprobado)")
else:
    print("D (Suspenso)")
```

### Bucles e Iteración (`while` y `for`)

#### Bucle `while`
Ejecuta un bloque mientras una condición lógica sea verdadera.

```python
counter = 0
while counter < 3:
    print(f"Iteración número {counter}")
    counter += 1
```

#### Bucle `for`, `range()` y `continue`
Ideal para iterar sobre secuencias o rangos definidos.

```python
# Imprimir números impares usando continue
for number in range(1, 6):
    if number % 2 == 0:
        continue  # Salta los números pares
    print(f"Impar: {number}")
```

---

## 4. Estructuras de Datos Avanzadas

### Listas (Colecciones Ordenadas y Mutables)

Permiten almacenar secuencias modificables de elementos. Soporta acceso por índice negativo (desde el final hacia atrás).

```python
languages = ["Python", "Java", "C#", "JavaScript"]

languages.append("Go")      # Agrega al final
languages.remove("Java")    # Elimina un elemento
print(languages[-1])        # Accede al último elemento ("Go")
```

### Tuplas (Secuencias Inmutables)

Colecciones ordenadas que no pueden modificarse tras su creación.

```python
coordinates = (10.5, 20.1)
# coordinates[0] = 11.0  # Provoca TypeError
```

### Sets (Conjuntos Únicos y No Ordenados)

Colecciones mutables sin elementos duplicados. Ideales para operaciones matemáticas de conjuntos.

```python
A = {1, 2, 3}
B = {3, 4, 5}

print(A | B)  # Unión: {1, 2, 3, 4, 5}
print(A & B)  # Intersección: {3}
print(A - B)  # Diferencia: {1, 2}
```

### Diccionarios (Estructura Clave-Valor)

Almacenan pares `clave: valor` para representar entidades del mundo real.

```python
student = {
    "name": "Carlos",
    "age": 28,
    "course": "Máster en IA"
}

# Iteración mediante .items()
for key, value in student.items():
    print(f"{key.capitalize()}: {value}")
```

---

## 5. Modularidad y Robustez con Funciones y Control de Excepciones

### Funciones

Modularización mediante la palabra reservada `def`, con soporte para parámetros predeterminados y retornos mediante `return`.

```python
def calculate_tax(base_price, rate=0.21):
    """Calcula el impuesto aplicado a un precio base."""
    return base_price * rate

print(calculate_tax(1000))             # Usa 21% por defecto (210.0)
print(calculate_tax(1000, rate=0.10))  # Usa 10% (100.0)
```

### Manejo de Excepciones (`try / except`)

Evita el colapso abrupto del sistema ante errores previsibles en tiempo de ejecución.

```python
age_str = input("Introduce tu edad: ")
try:
    age_int = int(age_str)
    print(f"Tu edad es {age_int}.")
except ValueError:
    print("Error: Por favor, introduce un número válido.")
```

---

## 6. Conclusión

Dominar las variables, las f-strings, la indentación, las colecciones de datos y las excepciones en Python permite construir software limpio y fácil de auditar. Este conocimiento es el que habilita al desarrollador para dar instrucciones precisas a la IA y supervisar sus salidas con total rigor técnico.
