---
type: concept
created: 2026-07-30
updated: 2026-07-30
tags: [poo, clases, herencia, polimorfismo, encapsulacion]
related: [paradigmas-de-programacion, python-como-lenguaje, funciones-y-parametros]
---

# Programación Orientada a Objetos (POO)

## Definition
Paradigma que modela el software combinando datos (**estado**) y comportamiento (**métodos**) en unidades autónomas llamadas **Objetos**, instancias concretas de una **Clase** (el plano/modelo abstracto). Se apoya en tres pilares operativos: Encapsulación, Herencia y Polimorfismo.

## Key Ideas
- **Clase vs. Objeto:** la clase es el plano abstracto (`PascalCase`); el objeto es su materialización en memoria con datos específicos.
- **Constructor (`__init__`)** inicializa el estado del objeto al instanciarlo; **`self`** es la referencia autorreferencial a sus propios atributos/métodos.
- **Encapsulación/Abstracción:** protege datos internos de alteración arbitraria externa, exponiendo solo una interfaz pública simplificada.
- **Herencia:** una clase hija reutiliza atributos/métodos de una clase padre (`super()`), evitando duplicar lógica común.
- **Polimorfismo:** distintas clases hijas responden al mismo método con su propia implementación (sobrescritura/*override*) — facilita extender el sistema sin alterar la lógica existente.

## Applications
- Modelar entidades de negocio con estado y comportamiento propio (usuarios, pedidos, productos) en vez de funciones y datos dispersos.
- Diseñar jerarquías extensibles (ej. tipos de ítems de una biblioteca: libros, DVDs) que comparten comportamiento base pero difieren en detalles.
- Encapsular reglas de negocio críticas (ej. saldo de una cuenta bancaria) detrás de una interfaz controlada.

## Examples
```python
class LibraryItem:
    def __init__(self, title):
        self.title = title
        self.is_borrowed = False

    def borrow(self):
        self.is_borrowed = True

class DVD(LibraryItem):
    def borrow(self):  # Polimorfismo por sobrescritura
        print(f"Verificando si el DVD '{self.title}' tiene rayones...")
        super().borrow()
```

## Comparison
| Pilar | Qué resuelve | Mecanismo en Python |
|---------|---------------|-------------|
| **Encapsulación** | Proteger datos internos | Convención `_atributo` |
| **Herencia** | Reutilizar lógica común | `class Hija(Padre)` + `super()` |
| **Polimorfismo** | Comportamiento específico por tipo | Sobrescritura de métodos (*override*) |

## Sources
- [[wiki/sources/2026-07-30-programacion-orientada-a-objetos]] — anatomía del objeto y los tres pilares con ejemplos progresivos.
- [[wiki/sources/2026-07-30-introduccion-a-los-lenguajes-de-programacion]] — POO como uno de los paradigmas principales.

## Related Concepts
[[paradigmas-de-programacion]], [[python-como-lenguaje]], [[funciones-y-parametros]]

## Open Questions
- ¿Cuándo la composición de objetos es preferible a la herencia para evitar jerarquías de clases frágiles (*fragile base class problem*)?

---

**Última actualización:** 2026-07-30
**Aparece en:** 2 fuentes
