---
type: source
created: 2026-08-03
updated: 2026-08-03
tags: [poo, clases, herencia, polimorfismo, encapsulacion, python]
source: raw/papers/2026-08-03-programacion-orientada-objetos.md
author: BIG School
---

# Programación Orientada a Objetos (Python — Segunda Pasada)

## Metadata
- **Fuente original:** `raw/papers/2026-08-03-programacion-orientada-objetos.md`
- **Autor:** [[big-school]]
- **Fecha:** 2026
- **Tipo de documento:** Documento Técnico / Material de Curso (Módulo 0: Fundamentos del Desarrollo de Software — Máster Desarrollo con IA)

## Summary
Segunda pasada sobre POO en Python, con un ejemplo de dominio distinto (sistema de biblioteca: `Libro`, `Revista`, `DVD`) al usado en el Módulo 3. Recorre la transición de lo procedural a los objetos, la anatomía clase/objeto/constructor/`self`, y los cuatro pilares (encapsulación, abstracción, herencia, polimorfismo) con ejemplos progresivos y una demostración explícita de polimorfismo mediante `override` + `super()` en una lista heterogénea de objetos.

## Key Takeaways
1. **Procedural vs. POO:** la programación procedural dispersa datos y funciones (frágil al crecer); la POO los encapsula juntos en Objetos con estado (atributos) y comportamiento (métodos).
2. **Clase = plano, Objeto = instancia:** `class Libro: pass` seguido de `Libro()` produce dos objetos distintos en memoria aunque compartan el mismo plano.
3. **`self`** es la referencia autorreferencial que el constructor (`__init__`) usa para inicializar atributos de instancia — no se pasa manualmente, es gestión interna del lenguaje.
4. **Encapsulación en Python es convención, no restricción técnica:** el guion bajo (`self._saldo`) marca un atributo "protegido" que el lenguaje permite romper, pero la disciplina del equipo no debería hacerlo.
5. **Herencia** (`class Libro(ItemBiblioteca)` + `super().__init__(...)`) evita duplicar lógica común entre clases hijas que comparten un padre.
6. **Polimorfismo por `override`:** una clase hija sobrescribe un método del padre (ej. `DVD.prestar()` verifica rayones antes de llamar a `super().prestar()`), permitiendo que un mismo bucle `for item in items: item.prestar()` invoque implementaciones distintas según el tipo real de cada objeto.
7. **Convención de nombres:** `PascalCase` para clases, diferenciándolas de funciones/variables en `snake_case`.

## Detailed Breakdown

### 1. De lo Procedural a los Objetos
El enfoque procedural (listas de diccionarios + funciones sueltas como `prestar_libro(lista_libros, ...)`) es viable para casos simples, pero la lógica de negocio se dispersa y las dependencias se vuelven difíciles de rastrear a medida que el sistema crece. La POO resuelve esto combinando **Estado** (atributos — lo que el objeto *sabe*) y **Comportamiento** (métodos — lo que el objeto *puede hacer*) en una sola entidad.

### 2. La Anatomía del Objeto y la Plantilla de Clase
Una **clase** es el plano maestro (definición abstracta de propiedades y acciones); un **objeto** es su instancia real en memoria, con datos propios. `Libro()` invocado dos veces produce dos objetos distintos, aunque partan del mismo plano vacío (`pass`).

### 3. El Constructor y la Identidad
El método especial `__init__` inicializa el estado del objeto en el momento de su creación. `self` permite que el objeto distinga sus propios datos de los de otras instancias de la misma clase — sin este mecanismo sería imposible gestionar múltiples registros independientes bajo la misma estructura lógica.

### 4. Los Cuatro Pilares del Diseño Robusto

**Encapsulación y Abstracción:** protege la integridad de los datos internos. En Python se maneja por convención (`_atributo`), no por restricción del lenguaje — la abstracción permite interactuar con una interfaz pública simplificada (ej. `obtener_saldo()`) sin conocer la implementación interna.

**Herencia y Reutilización:** establece una jerarquía "es un". Una clase base (`ItemBiblioteca`) provee comportamiento común (`prestar`, `devolver`); las clases hijas (`Libro`, `Revista`) heredan ese comportamiento vía `super().__init__(...)` y añaden atributos propios sin duplicar código.

**Polimorfismo — Flexibilidad Operativa:** distintos tipos de objetos responden al mismo mensaje (`prestar()`) con implementaciones propias. El sistema no necesita conocer el tipo exacto del objeto para invocar la operación correcta — esto permite añadir nuevos tipos sin romper la lógica existente. El `override` de `DVD.prestar()` ejecuta una verificación adicional (rayones) y luego delega en `super().prestar()` para no perder la lógica del padre.

### 5. Observaciones Clave
- La programación procedural es válida para scripts lineales; la POO es obligatoria para sistemas que requieran mantenibilidad a largo plazo.
- `PascalCase` es el estándar esencial para nombrar clases, diferenciándolas de funciones y variables.
- `self` no es un parámetro que el usuario pase manualmente — es gestión interna del lenguaje.
- La encapsulación en Python es una convención de diseño, no una restricción infranqueable — exige disciplina del desarrollador.

### 6. Conclusión
En la era de la IA, el valor diferencial del profesional no es escribir un bucle sino diseñar la arquitectura que conecta las piezas del negocio: entender la relación entre objetos, dónde aplicar herencia y cómo proteger datos mediante encapsulación permite dirigir modelos de lenguaje para construir sistemas fiables, escalables y orientados al ROI.

## Code & Pseudocode Examples

### Enfoque procedural (para contraste)
```python
libros = [{"titulo": "Libro A", "prestado": False}, {"titulo": "Libro B", "prestado": False}]
usuarios = {"Ana": ["Libro A"]}

def prestar_libro(lista_libros, libro_titulo, usuario_nombre):
    ...
```

### Clase, constructor y self
```python
class Libro:
    def __init__(self, titulo_param, autor_param):
        self.titulo = titulo_param
        self.autor = autor_param
        self.esta_prestado = False

libro_1 = Libro("Cien Años de Soledad", "Gabriel García Márquez")
```

### Encapsulación
```python
class CuentaBancaria:
    def __init__(self, titular):
        self.titular = titular
        self._saldo = 0.0  # Atributo "protegido" (convención)

    def depositar(self, cantidad):
        if cantidad > 0:
            self._saldo += cantidad

    def obtener_saldo(self):
        return self._saldo
```

### Herencia
```python
class ItemBiblioteca:
    def __init__(self, titulo):
        self.titulo = titulo
        self.esta_prestado = False

    def prestar(self):
        self.esta_prestado = True

class Libro(ItemBiblioteca):
    def __init__(self, titulo, autor):
        super().__init__(titulo)
        self.autor = autor

class Revista(ItemBiblioteca):
    def __init__(self, titulo, numero_edicion):
        super().__init__(titulo)
        self.numero_edicion = numero_edicion
```

### Polimorfismo por override
```python
class DVD(ItemBiblioteca):
    def __init__(self, titulo, director):
        super().__init__(titulo)
        self.director = director

    def prestar(self):
        print(f"Verificando si el DVD '{self.titulo}' tiene rayones...")
        super().prestar()

items = [Libro("Libro A", "Autor A"), DVD("Pelicula B", "Director B")]
for item in items:
    item.prestar()
```

## Entities Mentioned
- [[big-school]]

## Concepts Discussed
- [[programacion-orientada-a-objetos]]
- [[paradigmas-de-programacion]]
- [[funciones-y-parametros]]

## Notable Quotes
> "El ingeniero moderno no es quien pica código, sino quien proyecta estructuras lógicas que la IA puede ejecutar con precisión."

## Connections & Reflections
- Segunda pasada sobre [[wiki/sources/2026-07-30-programacion-orientada-a-objetos]] con un dominio de ejemplo distinto (biblioteca `Libro`/`Revista`/`DVD` vs. el ejemplo previo de `LibraryItem`/`DVD`) — coherente y sin contradicción; ambos ejemplos son prácticamente isomorfos, lo que **confirma** en vez de matizar el modelo ya presente en [[programacion-orientada-a-objetos]].
- El ejemplo de `CuentaBancaria` con `_saldo` protegido es una implementación nueva y más rica de la encapsulación que la fuente original no detallaba con tanto código.

## Open Questions
- ¿Cuándo la composición de objetos es preferible a la herencia para evitar jerarquías de clases frágiles (*fragile base class problem*)? (Pregunta ya abierta en [[programacion-orientada-a-objetos]], reafirmada por esta fuente).

## Related Sources
- [[wiki/sources/2026-07-30-programacion-orientada-a-objetos]] — primera pasada sobre POO en Python, mismo marco conceptual.
- [[wiki/sources/2026-07-30-introduccion-a-los-lenguajes-de-programacion]] — POO como uno de los cuatro paradigmas principales.

---

**Estado:** ✅ Completamente procesado e integrado en el wiki
