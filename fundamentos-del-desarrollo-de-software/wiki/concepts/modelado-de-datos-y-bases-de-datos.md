---
type: concept
created: 2026-08-03
updated: 2026-08-03
tags: [bases-de-datos, sql, nosql, modelado-er, acid, normalizacion]
related: [estructuras-de-datos, apis-rest, deuda-tecnica]
---

# Modelado de Datos y Bases de Datos (SQL / NoSQL)

## Definition
Disciplina que estructura cómo se almacena y relaciona la información de un sistema, desde el diseño conceptual (**Modelo Entidad-Relación**) hasta su implementación en un **DBMS** (Database Management System). Se divide en dos grandes familias: **SQL** (esquema estricto, relaciones fuertes, propiedades **ACID**) y **NoSQL** (flexible, escalable horizontalmente, para datos no estructurados).

## Key Ideas
- **Modelo Entidad-Relación (ER):** Entidades (sustantivos: libros, usuarios), Atributos (características: ISBN, nombre), Relaciones (verbos: "escribe").
- **Cardinalidad:** Uno a Uno (1:1), Uno a Muchos (1:N), Muchos a Muchos (N:M — requiere una **Tabla de Unión**).
- **Modelo relacional:** Entidad → Tabla, Atributo → Columna, Instancia → Fila. **Clave Primaria (PK)** identifica unívocamente cada registro; **Clave Foránea (FK)** implementa la relación referenciando la PK de otra tabla.
- **Normalización:** proceso de organizar tablas para minimizar redundancia y maximizar integridad.
- **SQL es declarativo:** describe *qué* se quiere (CRUD: `INSERT`/`SELECT`/`UPDATE`/`DELETE`), no *cómo* obtenerlo. `JOIN` consolida datos de tablas relacionadas; `GROUP BY` + funciones de agregación (`COUNT`, `SUM`, `AVG`) permiten estadísticas.
- **ACID** (Atomicidad, Consistencia, Aislamiento, Durabilidad): garantiza que una transacción se complete íntegramente o no ocurra — el pilar de seguridad transaccional de las bases SQL.
- **NoSQL** sacrifica algo de consistencia por escalabilidad horizontal y flexibilidad de esquema: Documentales (MongoDB), Clave-Valor (Redis), Columnares (Cassandra), Grafos (Neo4j).
- Regla dura: omitir `WHERE` en `UPDATE`/`DELETE` afecta a **toda la tabla** — un error catastrófico y frecuente.

## Applications
- Diseñar el esquema de una aplicación antes de escribir código, empezando por el modelo ER y su cardinalidad.
- Elegir SQL cuando la integridad transaccional y las relaciones estructuradas son críticas (ej. sistema financiero); elegir NoSQL cuando prima la escala horizontal o el dato es semi/no estructurado (ej. logs, catálogos de contenido variable).
- Auditar consultas generadas por IA verificando que todo `UPDATE`/`DELETE` incluya una cláusula `WHERE` explícita y acotada.

## Examples
```sql
-- Relación 1:N — un autor escribe muchos libros
SELECT L.Titulo, A.Nombre AS NombreAutor
FROM Libros L
INNER JOIN Autores A ON L.AutorID = A.AutorID;

-- Agregación: libros por autor, incluyendo autores sin libros
SELECT A.Nombre, COUNT(L.LibroID) AS TotalLibros
FROM Autores A
LEFT JOIN Libros L ON A.AutorID = L.AutorID
GROUP BY A.Nombre;
```

## Comparison
| Aspecto | SQL (Relacional) | NoSQL |
|---------|---------------|-------------|
| Esquema | Estricto, definido de antemano | Flexible, dinámico |
| Consistencia | Fuerte (ACID) | Eventual (prioriza disponibilidad/velocidad) |
| Escalabilidad | Principalmente vertical | Horizontal masiva |
| Ejemplos | PostgreSQL, MySQL, Oracle | MongoDB, Redis, Cassandra, Neo4j |
| Caso de uso ideal | Transacciones financieras, datos altamente relacionales | Big Data, catálogos no estructurados, alta concurrencia de lectura/escritura |

## Sources
- [[wiki/sources/2026-08-03-gestion-datos]] — modelo ER, cardinalidad, modelo relacional, PK/FK, normalización, SQL CRUD/JOIN/agregación, ACID, NoSQL.
- [[wiki/sources/2026-08-03-conclusiones-fundamentos-sistemas-redes]] — el modelado de datos como "gestión del activo" crítico de la organización, síntesis final del Módulo 4.

## Related Concepts
[[estructuras-de-datos]], [[apis-rest]], [[deuda-tecnica]]

## Open Questions
- ¿Qué nivel de normalización (1FN, 2FN, 3FN) es razonable exigir en un proyecto real antes de que el coste de los JOINs adicionales supere el beneficio de la integridad?

---

**Última actualización:** 2026-08-03
**Aparece en:** 2 fuentes
