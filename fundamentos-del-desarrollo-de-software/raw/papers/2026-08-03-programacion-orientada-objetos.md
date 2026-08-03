
# Programación Orientada a Objetos

**Autor(es):** BIG School
**Fecha:** 2026
**Tipo:** Documento Técnico / Material de Curso
**Lenguaje:** Python
**Fuente Original:** PDF (Módulo 0: Fundamentos del Desarrollo de Software) - Máster Desarrollo con IA

---

La transición de escribir instrucciones secuenciales a diseñar sistemas basados en entidades representa el salto cualitativo más importante que un profesional puede dar en el desarrollo de soluciones tecnológicas. Mientras que la programación procedural resuelve tareas aisladas de forma eficiente, sufre de una fragilidad inherente cuando la lógica de negocio crece: los datos y las funciones están dispersos, creando una red de dependencias difícil de mantener. La adopción de la **programación orientada a objetos (POO)** no es simplemente una cuestión de sintaxis, sino una estrategia para modelar el mundo real dentro del software. Al encapsular el estado y el comportamiento en unidades autónomas, logramos que el código sea **modular, reutilizable y escalable**. En el contexto de la inteligencia artificial, comprender estos planos estructurales es lo que permite a un líder técnico actuar como el **arquitecto del sistema**, delegando la generación de código base a la IA pero manteniendo el control absoluto sobre la **jerarquía y la integridad** de la solución final.

## De lo Procedural a los Objetos

### Programación Procedural

La programación procedural es una secuencia de instrucciones paso a paso. Aunque funcional para casos simples, cuando la lógica crece se vuelve difícil de mantener porque los datos y las funciones que operan sobre ellos permanecen separados.

```python
# Enfoque Procedural (Simplificado)
libros = [{"titulo": "Libro A", "prestado": False}, {"titulo": "Libro B", "prestado": False}]
usuarios = {"Ana": ["Libro A"]}

def prestar_libro(lista_libros, libro_titulo, usuario_nombre):
    # Lógica compleja para encontrar el libro, verificar disponibilidad,
    # actualizar el estado del libro, actualizar la lista del usuario...
    ...
```

### Programación Orientada a Objetos (POO)

La POO permite modelar el mundo real. En lugar de tener datos y funciones separados, combinamos ambos en entidades llamadas Objetos:

1. **Estado (Datos):** Lo que el objeto *sabe* (Atributos).
2. **Comportamiento (Acciones):** Lo que el objeto *puede hacer* (Métodos).

## La Anatomía del Objeto y la Plantilla de Clase

Para abandonar el enfoque procedural, debemos empezar a pensar en términos de 'planos' y 'ejecuciones'. Una **clase** actúa como el plano maestro; es la definición abstracta que dicta qué propiedades y qué acciones tendrá una entidad. Por otro lado, el **objeto** es la instancia real, la materialización de ese plano con datos específicos.

```python
# Definición de la Clase
class Libro:
    # 'pass' indica que la clase está vacía intencionadamente por ahora
    pass

# Instanciación
libro_1 = Libro()
libro_2 = Libro()

# Son dos objetos Libro distintos en la memoria del ordenador
print(libro_1)
print(libro_2)
```

### Atributos y Métodos: El Estado y la Acción

Un objeto se define por dos componentes críticos. El primero es su **estado (atributos)**, que representa la información que el objeto 'conoce', como el título de un libro o su disponibilidad. El segundo es su **comportamiento (métodos)**, que define lo que el objeto 'puede hacer', como cambiar su estado de 'disponible' a 'prestado'. Esta unión garantiza que el objeto sea el único responsable de gestionar su propia información, eliminando el riesgo de que funciones externas alteren los datos de forma imprevista.

### El Constructor y la Identidad

En lenguajes como Python, el método especial `__init__` o constructor es el encargado de dar vida al objeto. En este bloque se definen los parámetros obligatorios para que una instancia exista. Es aquí donde aparece el concepto de `self`, una referencia autorreferencial que permite al objeto distinguir sus propios datos de los de otras instancias de la misma clase. Sin este mecanismo, sería imposible gestionar múltiples registros de forma independiente bajo una misma estructura lógica.

```python
class Libro:
    # El Constructor
    def __init__(self, titulo_param, autor_param):
        # Usamos self para crear atributos de instancia
        print(f"Creando libro: {titulo_param}")
        self.titulo = titulo_param
        self.autor = autor_param
        self.esta_prestado = False  # Atributo con valor inicial por defecto

# Creando instancias (ahora debemos pasar los argumentos)
libro_1 = Libro("Cien Años de Soledad", "Gabriel García Márquez")
libro_2 = Libro("El Quijote", "Cervantes")

print(f"{libro_1.titulo} por {libro_1.autor}. ¿Prestado? {libro_1.esta_prestado}")
```

### Métodos

```python
class Libro:
    def __init__(self, titulo, autor):
        self.titulo = titulo
        self.autor = autor
        self.esta_prestado = False

    # Método para prestar
    def prestar(self):
        if self.esta_prestado:
            print(f"Error: '{self.titulo}' ya está prestado.")
        else:
            self.esta_prestado = True
            print(f"'{self.titulo}' ha sido prestado.")

    # Método para devolver
    def devolver(self):
        if not self.esta_prestado:
            print("Error: El libro no estaba prestado.")
        else:
            self.esta_prestado = False
            print(f"'{self.titulo}' ha sido devuelto.")

# Uso
mi_libro = Libro("Fahrenheit 451", "Ray Bradbury")
mi_libro.prestar()
mi_libro.prestar()  # Intentando prestarlo de nuevo
mi_libro.devolver()
```

## Los Cuatro Pilares del Diseño Robusto

La potencia de la POO reside en cuatro principios que transforman el código en una arquitectura profesional de alto nivel.

### Encapsulación y Abstracción

La encapsulación busca proteger la integridad de los datos internos. Aunque en algunos entornos es restrictiva, en otros (como Python) se maneja mediante convenciones (como el uso de guiones bajos) para indicar que ciertos atributos no deben ser manipulados directamente desde el exterior. La abstracción, por su parte, permite al usuario interactuar con una interfaz simplificada (un método público) sin necesidad de comprender la complejidad algorítmica que ocurre 'bajo el capó'.

```python
class CuentaBancaria:
    def __init__(self, titular):
        self.titular = titular
        self._saldo = 0.0  # Atributo "protegido" (convención)

    def depositar(self, cantidad):
        if cantidad > 0:
            self._saldo += cantidad
            print("Depósito realizado.")

    # Método público (Getter) para acceder al saldo de forma segura
    def obtener_saldo(self):
        return self._saldo

cuenta = CuentaBancaria("Juan")
# Mal (rompe la encapsulación, aunque Python lo permite): cuenta._saldo = 1000000
# Bien (usando la interfaz pública):
cuenta.depositar(100)
print(cuenta.obtener_saldo())
```

### Herencia y Reutilización

La herencia establece una jerarquía de 'es un'. Si tenemos una clase base como 'Ítem de Biblioteca', podemos derivar clases hijas como 'Libro' o 'Revista'. Estas hijas heredan automáticamente las funciones de préstamo y devolución del padre, pero pueden especializarse añadiendo sus propios atributos únicos (como el autor en un libro o el número de edición en una revista), evitando la duplicidad de código.

```python
# Clase Base (Padre)
class ItemBiblioteca:
    def __init__(self, titulo):
        self.titulo = titulo
        self.esta_prestado = False

    def prestar(self):
        self.esta_prestado = True
        print(f"Item '{self.titulo}' prestado.")

    def devolver(self):
        self.esta_prestado = False
        # ... (lógica de devolución)

# Clase Hija (Hereda de ItemBiblioteca)
class Libro(ItemBiblioteca):
    # Libro tiene todo lo de ItemBiblioteca, más lo específico
    def __init__(self, titulo, autor):
        # Llamamos al constructor del padre usando super()
        super().__init__(titulo)
        self.autor = autor  # Atributo específico de Libro

class Revista(ItemBiblioteca):
    def __init__(self, titulo, numero_edicion):
        super().__init__(titulo)
        self.numero_edicion = numero_edicion

# Uso
libro = Libro("Dune", "Frank Herbert")
revista = Revista("Wired", 305)

libro.prestar()    # Método heredado de ItemBiblioteca
revista.prestar()  # Método heredado de ItemBiblioteca
```

### Polimorfismo: Flexibilidad Operativa

Este principio permite que diferentes tipos de objetos respondan al mismo comando de formas distintas. Un sistema puede ordenar 'prestar' tanto a un DVD como a un libro; el sistema no necesita saber de qué objeto se trata exactamente, ya que cada uno tiene su propia implementación interna de esa orden. Esto otorga una flexibilidad total para añadir nuevos tipos de datos al sistema sin romper la lógica existente. El polimorfismo mediante `override` permite sobrescribir métodos del padre para añadir verificaciones extra sin perder la conexión con la clase base.

```python
# Clase Hija que Sobrescribe un método
class DVD(ItemBiblioteca):
    def __init__(self, titulo, director):
        super().__init__(titulo)
        self.director = director

    # Sobrescritura (Overriding) del método prestar
    def prestar(self):
        print(f"Verificando si el DVD '{self.titulo}' tiene rayones...")
        # Llamamos al método original del padre después de nuestra lógica
        super().prestar()

# Uso Polimórfico
items = [
    Libro("Libro A", "Autor A"),
    DVD("Pelicula B", "Director B")
]

# Iteramos y llamamos al mismo método 'prestar' en todos
for item in items:
    item.prestar()
    print("-" * 10)
```

## Observaciones Clave

- La programación procedural es adecuada para scripts lineales, pero la POO es obligatoria para sistemas que requieran mantenibilidad a largo plazo.
- El uso de la nomenclatura Pascal Case (IniciaConMayuscula) es el estándar esencial para definir clases, diferenciándolas claramente de funciones y variables.
- La referencia `self` no es un parámetro que el usuario deba pasar manualmente; es una gestión interna del lenguaje para identificar la instancia específica.
- La encapsulación en Python es una convención de diseño (protección visual) más que una restricción técnica infranqueable, lo que exige disciplina por parte del desarrollador.
- El polimorfismo mediante `override` permite sobrescribir métodos del padre para añadir verificaciones extra (como el estado físico de un DVD) sin perder la conexión con la clase base.

## Conclusión

Dominar la programación orientada a objetos altera la forma en que interactuamos con la tecnología. En la era de la IA, donde la generación de código es casi instantánea, el valor diferencial del profesional no reside en saber escribir un bucle, sino en **diseñar la arquitectura** que conecta las piezas del negocio. Entender cómo se relacionan los objetos, dónde aplicar la herencia y cómo proteger los datos mediante la encapsulación, permite dirigir modelos de lenguaje para construir sistemas **fiables, escalables y orientados al ROI**. El ingeniero moderno no es quien pica código, sino quien proyecta estructuras lógicas que la IA puede ejecutar con precisión.


## Ejemplos Relacionados

Ejercicio práctico real con la clase `Libro` (préstamo/devolución):

```python
class Libro:

    def __init__(self, titulo, autor):
        self.titulo = titulo
        self.autor = autor
        self.prestado = False

    def prestar(self):
        if self.prestado:
            print(f"Error: '{self.titulo}' ya está prestado")
        else:
            self.prestado = True
            print(f"'{self.titulo}' ha sido prestado")

    def devolver(self):
        if not self.prestado:
            print(f"Error: '{self.titulo}' no estaba prestado")
        else:
            self.prestado = False
            print(f"'{self.titulo}' ha sido devuelto")

libro_1 = Libro("Cien Años de Soledad", "Gabriel García Márquez")
libro_2 = Libro("El Quijote", "Cervantes")

print(libro_1.titulo)
print(libro_1.autor)

libro_1.prestar()

print(libro_2.titulo)
print(libro_2.autor)

libro_1.devolver()
```