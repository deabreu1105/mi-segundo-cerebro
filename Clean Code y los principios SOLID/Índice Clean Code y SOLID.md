# 🧠 Índice Principal: Clean Code y Principios SOLID

| 📌 **Metadatos del Conocimiento** | |
| :--- | :--- |
| **Curso Origen** | Principios S.O.L.I.D y Clean Code [1] |
| **Profesor(a)** | Fernando Herrera [1] |
| **Plataforma** | Udemy [1] |
| **Ecosistema Principal**| JavaScript, TypeScript, Node.js [1-3] |

---

## 🗂️ Map of Content (MOC)

Este es el punto central de tu Segundo Cerebro para este tema. Haz clic en cualquiera de los enlaces internos `[[ ]]` para navegar a los apuntes detallados estructurados bajo el **Método Cornell**:


### 1. 🧹 [[Clean Code y Variables]]
*   **Conceptos Clave:** Deuda Técnica (qué es y cómo se paga con refactorización) [9]. Nombres descriptivos para booleanos, arrays y números [10-12]. Reglas para funciones pequeñas (<20 líneas) y con pocos parámetros [13, 14].
*   **Propósito:** Escribir código que se lea como prosa, entendible para los humanos y aplicando el principio DRY (Don't Repeat Yourself) [15, 16].

### 2. 🦨 [[Code Smells y STUPID]]
*   **Conceptos Clave:** Antipatrones de diseño y el acrónimo STUPID (Singleton, Tight Coupling, Untestability, Premature Optimization, Indescriptive Naming, Duplication) [17, 18]. Olores de código como *Feature Envy* y *Middle Man* [19, 20].
*   **Propósito:** Detectar síntomas de mala calidad en el código. Entender por qué nuestro objetivo arquitectónico siempre debe ser lograr un **Bajo Acoplamiento y una Alta Cohesión** [21, 22].

### 3. 🏛️ [[Principios SOLID]]
*   **Conceptos Clave:** Las 5 reglas fundamentales para arquitecturas escalables y orientadas a objetos [2, 23]:
    *   **[S] Single Responsibility:** Una sola razón para cambiar [24].
    *   **[O] Open/Closed:** Abierto a extensión, cerrado a modificación [25].
    *   **[L] Liskov Substitution:** Las subclases no deben romper la lógica base [26].
    *   **[I] Interface Segregation:** No obligar a depender de métodos que no se usan [27].
    *   **[D] Dependency Inversion:** Depender de abstracciones (inyección) y no de concreciones [28].
*   **Propósito:** Transformar el código "STUPID" en sistemas tolerantes al cambio, fáciles de probar (Unit Testing) y altamente mantenibles [29, 30].

---
> 💡 **Nota de Navegación Obsidian:** 
> Abre la vista de Grafo Local (*Local Graph*) desde este archivo. Verás cómo este índice actúa como el "Sol" de tu sistema solar de notas, con los 3 módulos principales orbitando y conectándose entre sí.
