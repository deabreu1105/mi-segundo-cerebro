---
type: concept
created: 2026-07-30
updated: 2026-07-30
tags: [estructuras-de-datos, arrays, pilas, colas, mapas, sets, tuplas, programacion]
related: [diseno-de-algoritmos, funciones-y-parametros, python-como-lenguaje]
---

# Estructuras de Datos

## Definition
Las estructuras de datos son las distintas formas de organizar información en memoria para que un programa pueda almacenarla, acceder a ella y modificarla de manera eficiente. Si las estructuras de control son el motor lógico de un sistema, las estructuras de datos son la arquitectura sobre la que se organiza su información — la elección correcta determina latencia, consumo de memoria y escalabilidad.

## Key Ideas
- **Array (estático):** colección contigua de tamaño fijo, acceso indexado de alta velocidad (O(1)).
- **Lista (dinámica):** tamaño variable en ejecución, acceso por índice o secuencial.
- **Pila (*Stack*, LIFO):** el último elemento en entrar es el primero en salir (`PUSH`/`POP`) — historial de navegación, undo, call stack.
- **Cola (*Queue*, FIFO):** el primer elemento en entrar es el primero en salir (`ENQUEUE`/`DEQUEUE`) — colas de impresión, tareas asíncronas.
- **Mapa/Diccionario (*Hash Table*):** pares clave-valor con claves únicas, acceso casi instantáneo O(1) mediante hashing.
- **Set:** colección no ordenada que garantiza automáticamente la ausencia de duplicados.
- **Tupla:** secuencia ordenada e **inmutable** — una vez creada no puede modificarse (intentarlo provoca un error). Es el ejemplo canónico de estructura de datos inmutable, base de la programación funcional segura en concurrencia.
- **Álgebra de conjuntos sobre Sets (Python):** unión (`|` / `.union()`), intersección (`&` / `.intersection()`), diferencia (`-` / `.difference()`) y diferencia simétrica (`^` / `.symmetric_difference()`) — cada operador tiene un método equivalente explícito.
- **Diccionario (Python):** se itera con `.items()`, que devuelve pares `(clave, valor)` en cada vuelta — el acceso es siempre semántico por clave, nunca por posición numérica.

## Applications
- Elegir Array vs. Lista según si el tamaño de los datos es conocido de antemano.
- Usar Pila para deshacer acciones (*undo*) o evaluar expresiones anidadas.
- Usar Cola para procesar tareas en el orden en que llegaron (colas de trabajos, peticiones de servidor).
- Usar Mapa para búsquedas por identificador (usuarios, configuración) en tiempo casi constante.
- Usar Set para deduplicar datos automáticamente sin lógica adicional.

## Examples
```text
CLAVE (Única)    -->    VALOR
"Nombre"         -->    "Ana"
"Edad"           -->    30
```
```text
Set Inicial: { "Rojo", "Verde", "Azul" }
Añadir "Verde" --> El Set permanece igual (omite el duplicado)
```

## Comparison
| Estructura | Tamaño | Duplicados | Acceso / Búsqueda | Caso de Uso Principal |
| --- | --- | --- | --- | --- |
| **Array** | Fijo | Permitidos | Por Índice (O(1)) | Datos de dimensión conocida. |
| **Lista** | Dinámico | Permitidos | Por Índice / Secuencial | Colecciones variables. |
| **Pila** | Dinámico | Permitidos | Solo en la cima (LIFO) | Deshacer acciones. |
| **Cola** | Dinámico | Permitidos | Solo al frente (FIFO) | Procesamiento por turno. |
| **Mapa** | Dinámico | Claves Únicas | Por Clave (O(1)) | Búsqueda por identificador. |
| **Set** | Dinámico | Prohibidos | Verificación de pertenencia | Garantía de valores únicos. |
| **Tupla** | Fijo | Permitidos | Por Índice (O(1)) | Datos que no deben cambiar tras su creación. |

## Sources
- [[wiki/sources/2026-07-30-estructuras-de-datos]] — taxonomía completa y cuadro comparativo.
- [[wiki/sources/2026-07-30-fundamentos-de-la-programacion-conclusiones]] — estructuras de datos como "archivadores lógicos".
- [[wiki/sources/2026-07-30-bases-de-los-lenguajes-de-programacion]] — la tupla como estructura inmutable nativa de Python.
- [[wiki/sources/2026-08-03-bases-lenguajes-programacion]] — álgebra de conjuntos completa sobre sets e iteración de diccionarios con `.items()`.

## Related Concepts
[[diseno-de-algoritmos]], [[funciones-y-parametros]], [[pensamiento-computacional]], [[python-como-lenguaje]], [[funciones-puras-y-efectos-secundarios]]

## Open Questions
- ¿En qué punto de escala deja de ser preferible una lista/array sobre un mapa cuando la búsqueda por clave es el patrón de acceso dominante?

---

**Última actualización:** 2026-08-03
**Aparece en:** 3 fuentes
