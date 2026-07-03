

# Clean Code: Nombres y Funciones

| 1. Palabras Clave / Preguntas | 2. Notas detalladas y ejemplos de código |
| :--- | :--- |
| **Nombres según tipo de dato**<br>¿Cómo nombrar booleanos y arrays? | Ausencia de información técnica. Arrays en plural, Booleanos con prefijos afirmativos (`is`, `has`, `can`) [4, 10, 11].<br><br>`// ❌ MAL:`<br>`const fruit = ['manzana'];`<br>`const active = true;`<br><br>`// ✅ BIEN:`<br>`const fruitNames = ['manzana'];`<br>`const isActive = true;` |
| **Parámetros en Funciones**<br>¿Cuántos argumentos enviar? | Máximo 3 posicionales. Si son más, enviar un objeto/interfaz con propiedades alfabéticas [12].<br><br>`// ❌ MAL:`<br>`function sendEmail(to, from, body, subject, key) {}`<br><br>`// ✅ BIEN:`<br>`interface EmailOptions {`<br>&nbsp;&nbsp;`apikey: string;`<br>&nbsp;&nbsp;`body: string;`<br>&nbsp;&nbsp;`from: string;`<br>&nbsp;&nbsp;`subject: string;`<br>&nbsp;&nbsp;`toWhom: string;`<br>`}`<br>`function sendEmail(options: EmailOptions) {}` |
| **Principio DRY**<br>(Don't Repeat Yourself) | Evitar duplicidad de código para simplificar pruebas y centralizar procesos [13].<br><br>`// ❌ MAL: tener createProduct y updateUser`<br>`// repitiendo la misma lógica de conexión a BD.`<br>`// ✅ BIEN: Centralizar la conexión en un módulo.` |

> **3. Resumen (Síntesis)**
> "Programar es decirle a otro humano lo que la computadora debe hacer" [14]. El Clean Code exige nombres descriptivos y pronunciables [10]. Las funciones deben tener pocas líneas (<20) [15], usar un máximo de 3 parámetros (o un objeto si son más) [12] y jamás repetir código lógico (DRY) [13].
> **Conexiones:** [[Deuda Técnica]], [[Code Smells y STUPID]]
