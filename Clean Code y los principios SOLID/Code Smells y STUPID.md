


# Code Smells y STUPID

| 1. Palabras Clave / Preguntas | 2. Notas detalladas y ejemplos de código |
| :--- | :--- |
| **(S) Singleton & (U) Untestability**<br>¿Por qué evitar contexto global? | Vive globalmente, cualquiera lo modifica, difícil de testear [16, 17].<br><br>`// ❌ MAL (Olor a Singleton):`<br>`class Database {`<br>&nbsp;&nbsp;`static instance;`<br>&nbsp;&nbsp;`// Lógica global no rastreable`<br>`}` |
| **(T) Tight Coupling**<br>Alto Acoplamiento vs Cohesión | Un cambio en Módulo A rompe Módulo B (Efecto dominó) [18, 19].<br><br>`// ❌ ALTO ACOPLAMIENTO (Malo):`<br>`class UserService extends MySQLDatabase {`<br>&nbsp;&nbsp;`// Muy atado a MySQL. Si cambia la BD, se rompe.`<br>`}`<br><br>`// ✅ BAJO ACOPLAMIENTO (Ideal):`<br>`// Depender de abstracciones (ver DIP en SOLID).` |
| **(I) Indescriptive Naming**<br>¿Cómo detectar malos nombres? | Nombres genéricos o que explican la implementación [20].<br><br>`// ❌ MAL (Implementación en el nombre):`<br>`function checkIfExistsAndReturnTrue() {}`<br><br>`// ✅ BIEN (Verbo + Sustantivo conciso):`<br>`function isValidUser() {}` |

> **3. Resumen (Síntesis)**
> STUPID describe antipatrones que generan Deuda Técnica. El principal enemigo es el **Alto Acoplamiento (Tight Coupling)**, donde las clases dependen fuertemente unas de otras [18, 21]. Debemos apuntar a un **Bajo Acoplamiento y Alta Cohesión** (clases independientes enfocadas en una sola tarea) [19, 21].
> **Conexiones:** [[Principios SOLID]], [[Clean Code]]
