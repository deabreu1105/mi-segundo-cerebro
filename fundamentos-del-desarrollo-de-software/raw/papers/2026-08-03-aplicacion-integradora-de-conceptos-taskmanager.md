Nombre de archivo sugerido: paper/raw/2026-08-03-aplicacion-integradora-de-conceptos-taskmanager.md

# Aplicación Integradora de Conceptos

Autor(es): BIG School — Máster Desarrollo con IA (documento) / MoureDev (proyecto de código TaskManager)
Fecha: 2026-08-03 (fecha de conversión; no se indica fecha de publicación en el original)
Tipo: Documento Técnico + Proyecto de Código (estudio de caso integrador)
Lenguaje: Python
Fuente Original: PDF — "01. Aplicación Integradora de conceptos.pdf" + proyecto de código "TaskManager" (main.py, task_manager.py, ai_service.py, test_task_manager.py, tasks.json, requirements.txt, .env, .gitignore, README.md)

## Introducción

La transición de la teoría a la ejecución práctica en el desarrollo de software requiere una mentalidad fundamentada en el pensamiento computacional para descomponer problemas complejos en soluciones técnicas escalables. No basta con escribir código; la excelencia operativa nace de la capacidad de orquestar un entorno profesional que integre control de versiones, entornos virtuales aislados y una arquitectura modular que permita el crecimiento orgánico del producto. Un Producto Mínimo Viable (MVP) debe ser, ante todo, una solución tangible que resuelva una necesidad central mientras establece los cimientos para funcionalidades avanzadas, como la integración de servicios de terceros mediante APIs. En el ecosistema empresarial moderno, la **soberanía técnica** se alcanza cuando el desarrollador no solo utiliza herramientas de inteligencia artificial, sino que comprende la lógica subyacente para validarlas y corregirlas. Este enfoque garantiza que la automatización no degrade la calidad del software, sino que actúe como un multiplicador de productividad en la generación de pruebas unitarias, documentación técnica y lógica de negocio. La madurez de un proyecto se mide por su capacidad de persistir datos de forma estructurada y por la rigurosidad de su documentación, permitiendo que la solución sea sostenible, transferible y profesional. Dominar este ciclo completo permite a cualquier perfil de negocio transformar conceptos abstractos en activos tecnológicos de alto valor estratégico.

El caso de estudio que ilustra este documento es **TaskManager**: un gestor de tareas inteligente en Python que aplica, en un único proyecto real, la arquitectura modular, la persistencia en JSON, la integración con una API externa de IA y una suite de pruebas unitarias.

## Arquitectura y Pensamiento Computacional

### Descomposición del Problema

Antes de la implementación, es imperativo aplicar el pensamiento computacional para dividir el proyecto en módulos lógicos. Un gestor de tareas se desglosa en cuatro pilares fundamentales: la gestión de la colección de datos, la interacción con el usuario mediante interfaz de comandos (CLI), el sistema de persistencia para evitar la pérdida de información y la comunicación con servicios externos (IA).

En el proyecto TaskManager, el pilar de "interacción con el usuario mediante CLI" se resuelve en `main.py`, que expone un menú interactivo y delega toda la lógica de negocio a los módulos especializados (`TaskManager` y `create_simple_tasks`), sin mezclar presentación con lógica:

```python
from task_manager import TaskManager
from ai_service import create_simple_tasks

def print_menu():
    print("\n--- Gestor de Tareas Inteligente ---")
    print("1. Añadir tarea")
    print("2. Añadir tarea compleja (con IA)")
    print("3. Listar tareas")
    print("4. Completar tarea")
    print("5. Eliminar tarea")
    print("6. Salir")

def main():

    manager = TaskManager()

    while True:

        print_menu()

        try:

            choice = int(input("Elige una opción: "))

            match choice:
                case 1:
                    description = input("Descripción de la tarea: ")
                    manager.add_task(description)             

                case 2:
                    description = input("Descripción de la tarea compleja: ")
                    subtasks = create_simple_tasks(description)
                    for subtask in subtasks:
                        if not subtask.startswith("Error:"):
                            manager.add_task(subtask)
                        else:
                            print(subtask)
                            break

                case 3:
                    manager.list_tasks()

                case 4:
                    id = int(input("ID de la tarea a completar: "))
                    manager.complete_task(id)

                case 5:
                    id = int(input("ID de la tarea a eliminar: "))
                    manager.delete_task(id)

                case 6:
                    print("Saliendo...")
                    break
                case _:
                    print("Opción no válida. Selecciona otra.")

        except ValueError:
            print("Opción no válida. Selecciona otra.")

if __name__ == "__main__":
    main()
```

Nótese cómo se cumple la observación clave de "Tipado y Validaciones" del artículo: la entrada de usuario siempre llega como texto (`input()`), por lo que cada opción numérica y cada ID se convierten explícitamente con `int()` dentro de un bloque `try/except ValueError`, evitando que el programa se detenga por errores de formato.

### Modelado de Datos y Lógica Modular

La creación de entidades debe seguir principios de responsabilidad única. Una clase dedicada exclusivamente a definir qué es una tarea (ID, descripción, estado) se separa de la clase gestora que administra la lógica de añadir, listar, completar y eliminar. Esta **arquitectura modular** facilita el mantenimiento y permite que el código sea testeable de forma independiente.

Esta separación se materializa en `task_manager.py` mediante dos clases: `Task` (la entidad de datos) y `TaskManager` (la lógica de gestión, persistencia y ciclo de vida de las tareas):

```python
import json

class Task:

    def __init__(self, id, description, completed=False):
        self.id = id
        self.description = description
        self.completed = completed

    def __str__(self):
        status = "✓" if self.completed else " "
        return f"[{status}] #{self.id}: {self.description}"
    
class TaskManager:

    FILENAME = "tasks.json"

    def __init__(self):
        self._tasks = []
        self._next_id = 1
        self.load_tasks()

    def add_task(self, description):
        task = Task(self._next_id, description)
        self._tasks.append(task)
        self._next_id += 1
        print(f"Tarea añadida: {description}")
        self.save_tasks()

    def list_tasks(self):
        if not self._tasks:
            print("No hay tareas pendientes")
        else:
            for task in self._tasks:
                print(task)

    def complete_task(self, id):
        for task in self._tasks:
            if task.id == id:
                task.completed = True
                print(f"Tarea completada: {task}")
                self.save_tasks()
                return
        print(f"Tarea no encontrada: #{id}")

    def delete_task(self, id):
        for task in self._tasks:
            if task.id == id:
                self._tasks.remove(task)
                print(f"Tarea eliminada: #{id}")
                self.save_tasks()
                return
        print(f"Tarea no encontrada: #{id}")

    def load_tasks(self):
        try:
            with open(self.FILENAME, "r") as file:
                data = json.load(file)
                self._tasks = [Task(item["id"], item["description"], item["completed"]) for item in data]
                if self._tasks:
                    self._next_id = self._tasks[-1].id + 1
                else:
                    self._next_id = 1

        except FileNotFoundError:
            self._tasks = []


    def save_tasks(self):
        with open(self.FILENAME, "w") as file:
            json.dump([{"id": task.id, "description": task.description, "completed": task.completed} for task in self._tasks], file, indent=4)
```

## Ecosistema de Desarrollo Profesional

### Control de Versiones y Entornos Aislados

El uso de Git y plataformas como GitHub no es opcional; es el estándar para el rastreo de cambios y la colaboración. Paralelamente, la implementación de entornos virtuales garantiza que las dependencias del proyecto no colisionen con otras aplicaciones del sistema, asegurando la reproducibilidad del software en cualquier máquina mediante el uso de ficheros de requerimientos.

En TaskManager, la reproducibilidad del entorno se fija en `requirements.txt` (dependencias exactas, incluyendo el cliente `openai` y `python-dotenv`):

```text
annotated-types==0.7.0
anyio==4.10.0
certifi==2025.8.3
charset-normalizer==3.4.3
distro==1.9.0
dotenv==0.9.9
h11==0.16.0
httpcore==1.0.9
httpx==0.28.1
idna==3.10
jiter==0.10.0
openai==1.102.0
pydantic==2.11.7
pydantic_core==2.33.2
python-dotenv==1.1.1
requests==2.32.5
sniffio==1.3.1
tqdm==4.67.1
typing-inspection==0.4.1
typing_extensions==4.15.0
urllib3==2.5.0
```

Y el control de versiones excluye explícitamente el entorno virtual, la caché de Python, los datos persistidos y las credenciales mediante `.gitignore`:

```text
.venv/
__pycache__/
tasks.json
.env
```

### Persistencia de Datos mediante JSON

Para que una aplicación sea funcional en el mundo real, los datos deben sobrevivir al cierre del programa. El uso del formato **JSON** (JavaScript Object Notation) es una elección estratégica, ya que es un estándar de intercambio de datos compatible con bases de datos modernas y APIs, permitiendo transformar objetos de Python en estructuras legibles y viceversa de manera eficiente.

Así se ve `tasks.json`, el archivo de persistencia real generado por `TaskManager.save_tasks()` y leído por `TaskManager.load_tasks()`:

```json
[
    {
        "id": 1,
        "description": "Subir mi código",
        "completed": false
    },
    {
        "id": 2,
        "description": "Crear un repositorio en GitHub (nombre, descripción, público/privado) y copiar la URL del repositorio",
        "completed": false
    },
    {
        "id": 3,
        "description": "Inicializar Git en tu proyecto local, crear .gitignore si aplica, y hacer el primer commit (git init, git add ., git commit -m \"Initial commit\")",
        "completed": false
    },
    {
        "id": 4,
        "description": "Conectar el repositorio local con el remoto (git remote add origin <URL-copiada>)",
        "completed": false
    },
    {
        "id": 5,
        "description": "Subir la rama principal al remoto (git branch -M main; git push -u origin main)",
        "completed": false
    }
]
```

## Integración de Inteligencia Artificial en el Flujo de Trabajo

### Consumo de APIs Externas

La potencia de una aplicación se expande exponencialmente al integrar servicios como los modelos de lenguaje de OpenAI. Mediante el uso de un cliente de API y una gestión segura de credenciales (utilizando variables de entorno para proteger claves sensibles), es posible delegar tareas cognitivas, como el desglose automático de objetivos complejos en subtareas accionables, a un modelo GPT.

La clave se gestiona mediante una variable de entorno definida en `.env` (nunca en el código fuente, y excluida del control de versiones vía `.gitignore` como se vio arriba):

```text
OPENAI_API_KEY=TU_API_KEY
```

Y el consumo de la API se encapsula por completo en `ai_service.py`, que construye el prompt, invoca al modelo y parsea la respuesta en una lista de subtareas, con manejo defensivo de errores (API key ausente o fallo de conexión):

```python
import os
from dotenv import load_dotenv
from openai import OpenAI

load_dotenv()

client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))

def create_simple_tasks(description):

    if not client.api_key:
        return ["Error: La API key de OpenAI no está configurada."]
    
    try:

        prompt = f"""Desglosa la siguiente tarea compleja en una lista de 3 a 5 subtareas simples y accionables.

Tarea: {description}

Formato de respuesta:
- Subtarea 1
- Subtarea 2
- Subtarea 3
- etc.

Responde solo con la lista de subtareas, una por línea, empezando cada línea con un guión."""
        
        params = {
            "model": "gpt-5",
            "messages": [
                {"role": "system", "content": "Eres un asistente experto en gestión de tareas que ayuda a dividir tareas complejas en pasos simples y accionables."},
                {"role": "user", "content": prompt}
            ],
            "max_completion_tokens": 300,
            "verbosity": "medium",
            "reasoning_effort": "minimal"
        }

        response = client.chat.completions.create(**params)

        content = response.choices[0].message.content.strip()

        subtasks = []

        for line in content.split("\n"):
            line = line.strip()
            if line and line.startswith("-"):
                subtask = line[1:].strip()
                if subtask:
                    subtasks.append(subtask)

        return subtasks if subtasks else ["Error: No se han podido generar las subtareas."]


    except Exception:
        return ["Error: No se ha podido realizar la conexión a OpenAI."]
```

### IA como Asistente de Calidad y Documentación

Herramientas de asistencia como GitHub Copilot no deben sustituir al desarrollador, sino servir como agentes de soporte. Su uso es crítico en dos fases: el **testing automatizado** (creación de pruebas unitarias para validar que el programa no falle ante cambios) y la documentación técnica (generación de archivos README profesionales que expliquen el funcionamiento y despliegue del software).

En TaskManager, esta fase de calidad se resuelve en `test_task_manager.py`, que aísla `TaskManager` de la lectura/escritura real de disco mediante `unittest.mock` (parcheando `load_tasks`, `save_tasks` y `open`), cubriendo alta, baja, listado y completado de tareas, así como el caso de una tarea inexistente:

```python
import unittest
from unittest.mock import patch, mock_open
from task_manager import TaskManager

class TestTaskManager(unittest.TestCase):
    def setUp(self):
        with patch.object(TaskManager, 'load_tasks'), patch.object(TaskManager, 'save_tasks'):
            self.tm = TaskManager()

    @patch("builtins.open", new_callable=mock_open)
    def test_add_task(self, mock_file):
        with patch("builtins.print") as mock_print:
            self.tm.add_task("Test Task")
            mock_print.assert_called_with("Tarea añadida: Test Task")
        self.assertEqual(len(self.tm._tasks), 1)
        self.assertEqual(self.tm._tasks[0].description, "Test Task")

    @patch("builtins.open", new_callable=mock_open)
    def test_delete_task(self, mock_file):
        self.tm.add_task("Task to delete")
        task_id = self.tm._tasks[0].id
        with patch("builtins.print") as mock_print:
            self.tm.delete_task(task_id)
            mock_print.assert_called_with(f"Tarea eliminada: #{task_id}")
        self.assertEqual(len(self.tm._tasks), 0)

    @patch("builtins.open", new_callable=mock_open)
    def test_delete_nonexistent_task(self, mock_file):
        with patch("builtins.print") as mock_print:
            self.tm.delete_task(999)
            mock_print.assert_called_with("Tarea no encontrada: #999")

    @patch("builtins.open", new_callable=mock_open)
    def test_list_tasks(self, mock_file):
        self.tm.add_task("Task 1")
        self.tm.add_task("Task 2")
        with patch("builtins.print") as mock_print:
            self.tm.list_tasks()
            self.assertTrue(mock_print.call_count >= 2)

    @patch("builtins.open", new_callable=mock_open)
    def test_complete_task(self, mock_file):
        self.tm.add_task("Task to complete")
        task_id = self.tm._tasks[0].id
        with patch("builtins.print") as mock_print:
            self.tm.complete_task(task_id)
            mock_print.assert_called_with(f"Tarea completada: [✓] #{task_id}: Task to complete")
        self.assertTrue(self.tm._tasks[0].completed)

if __name__ == "__main__":
    unittest.main()
```

La documentación técnica correspondiente a esta misma fase se generó como `README.md` y se reproduce íntegra en el Anexo al final de este documento.

## Ejemplos Relacionados

**1. Variación del consumo de API con reintentos (patrón habitual al integrar servicios externos en producción, extendiendo la gestión defensiva de errores ya presente en `ai_service.py`):**

```python
import time

def create_simple_tasks_con_reintentos(description, max_intentos=3):
    """Igual que create_simple_tasks, pero reintenta ante fallos transitorios de red."""
    for intento in range(1, max_intentos + 1):
        resultado = create_simple_tasks(description)
        if not (len(resultado) == 1 and resultado[0].startswith("Error:")):
            return resultado
        time.sleep(2 ** intento)  # backoff exponencial
    return ["Error: No se pudo contactar a OpenAI tras varios intentos."]
```

**2. Variación del test unitario usando `tempfile` en lugar de mocks, para quienes prefieran probar la persistencia real en disco en vez de simularla (alternativa al enfoque con `mock_open` de `test_task_manager.py`):**

```python
import unittest
import tempfile
import os
from task_manager import TaskManager

class TestTaskManagerConArchivoReal(unittest.TestCase):
    def setUp(self):
        self.tmp_file = tempfile.NamedTemporaryFile(delete=False, suffix=".json")
        self.tmp_file.write(b"[]")
        self.tmp_file.close()
        TaskManager.FILENAME = self.tmp_file.name
        self.tm = TaskManager()

    def tearDown(self):
        os.unlink(self.tmp_file.name)

    def test_add_task_persiste_en_disco(self):
        self.tm.add_task("Tarea persistida de verdad")
        with open(self.tmp_file.name) as f:
            contenido = f.read()
        self.assertIn("Tarea persistida de verdad", contenido)
```

## Observaciones Clave

- **Seguridad de Credenciales:** Las API Keys jamás deben subirse al control de versiones; se gestionan mediante archivos `.env` y se excluyen con `.gitignore`.
- **Tipado y Validaciones:** La entrada de usuario siempre llega como texto. Es vital realizar conversiones de tipo (casting) y manejar excepciones para evitar que el programa se detenga por errores de formato.
- **Modularidad:** Separar la interfaz de usuario del núcleo lógico permite actualizar la tecnología de la UI sin afectar el funcionamiento interno de la aplicación.
- **Refactorización:** El código debe revisarse constantemente para extraer funciones repetitivas y mejorar la legibilidad del proyecto.

## Conclusión

La construcción de un proyecto real cierra el círculo entre el conocimiento teórico y la capacidad ejecutiva. Integrar Git, Python, persistencia JSON y servicios de IA en un único flujo de trabajo prepara al profesional para liderar proyectos tecnológicos con una base sólida. Entender el ciclo de vida del software —desde el algoritmo inicial hasta la documentación final— es la diferencia entre un prototipo frágil y una solución empresarial robusta que aporta valor real en el mercado actual.

## Anexo: Documentación del Proyecto (README.md)

# TaskManager 📝

Un gestor de tareas inteligente desarrollado en Python que permite crear, gestionar y completar tareas de forma eficiente. Incluye integración con IA para descomponer tareas complejas en subtareas más simples y accionables.

### 🚀 Características principales

- **Gestión básica de tareas**: Crear, listar, completar y eliminar tareas
- **Persistencia de datos**: Las tareas se guardan automáticamente en un archivo JSON
- **IA integrada**: Usa OpenAI GPT para descomponer tareas complejas en subtareas simples
- **Interfaz de línea de comandos**: Menú interactivo fácil de usar
- **Pruebas unitarias**: Suite completa de tests para garantizar la funcionalidad

### 🛠️ Tecnologías utilizadas

- **Python 3.13+**: Lenguaje principal
- **OpenAI API**: Para la funcionalidad de IA
- **JSON**: Almacenamiento de datos
- **unittest**: Framework de testing
- **python-dotenv**: Gestión de variables de entorno

### 📁 Estructura del proyecto

```
TaskManager/
├── main.py                 # Punto de entrada principal con menú interactivo
├── task_manager.py         # Lógica principal del gestor de tareas
├── ai_service.py          # Integración con OpenAI para descomponer tareas
├── test_task_manager.py   # Suite de pruebas unitarias
├── requirements.txt       # Dependencias del proyecto
├── tasks.json            # Archivo de persistencia de tareas
└── README.md             # Documentación del proyecto
```

### 🔧 Instalación y configuración

#### Prerrequisitos

- Python 3.13 o superior
- API Key de OpenAI (opcional, solo para funciones de IA)

#### Pasos de instalación

1. **Clona el repositorio**:
   ```bash
   git clone https://github.com/mouredev/taskmanager.git
   cd taskmanager
   ```

2. **Crea un entorno virtual**:
   ```bash
   python -m venv .venv
   source .venv/bin/activate  # En macOS/Linux
   # o
   .venv\Scripts\activate     # En Windows
   ```

3. **Instala las dependencias**:
   ```bash
   pip install -r requirements.txt
   ```

4. **Configura la API de OpenAI** (opcional):
   - Crea un archivo `.env` en el directorio raíz
   - Añade tu API key:
     ```
     OPENAI_API_KEY=tu-api-key-aquí
     ```

### 🎮 Uso del programa

#### Ejecutar la aplicación

```bash
python main.py
```

#### Menú principal

El programa presenta un menú interactivo con las siguientes opciones:

1. **Añadir tarea**: Crear una nueva tarea simple
2. **Añadir tarea compleja (con IA)**: Usar IA para descomponer una tarea compleja
3. **Listar tareas**: Mostrar todas las tareas con su estado
4. **Completar tarea**: Marcar una tarea como completada
5. **Eliminar tarea**: Eliminar una tarea del sistema
6. **Salir**: Cerrar la aplicación

#### Ejemplos de uso

##### Añadir una tarea simple
```
Elige una opción: 1
Descripción de la tarea: Comprar leche
Tarea añadida: Comprar leche
```

##### Añadir una tarea compleja con IA
```
Elige una opción: 2
Descripción de la tarea compleja: Organizar una fiesta de cumpleaños
```
La IA descompondrá esta tarea en subtareas como:
- Hacer lista de invitados
- Reservar lugar para la celebración
- Planificar el menú y comprar comida
- Decorar el espacio
- Coordinar actividades y entretenimiento

### 🧪 Pruebas

El proyecto incluye una suite completa de pruebas unitarias que cubren toda la funcionalidad principal.

#### Ejecutar las pruebas

```bash
python -m unittest test_task_manager.py -v
```

#### Cobertura de pruebas

Las pruebas cubren:
- ✅ Añadir tareas
- ✅ Eliminar tareas existentes
- ✅ Manejo de tareas inexistentes
- ✅ Listar tareas
- ✅ Completar tareas

### 📂 Persistencia de datos

Las tareas se almacenan automáticamente en el archivo `tasks.json` con la siguiente estructura:

```json
[
    {
        "id": 1,
        "description": "Descripción de la tarea",
        "completed": false
    }
]
```

### 🤖 Funcionalidad de IA

La integración con OpenAI permite:

- **Descomposición inteligente**: Convierte tareas complejas en 3-5 subtareas accionables
- **Manejo de errores**: Gestión robusta de fallos en la API
- **Configuración flexible**: Funciona sin IA si no se configura la API key

#### Ejemplo de descomposición de IA

**Entrada**: "Aprender Python"

**Salida**:
- Instalar Python y configurar el entorno de desarrollo
- Estudiar los conceptos básicos (variables, tipos de datos, estructuras de control)
- Practicar con ejercicios de programación básica
- Crear un proyecto pequeño para aplicar lo aprendido
- Revisar y refactorizar el código creado

### 🔒 Seguridad

- Las API keys se gestionan a través de variables de entorno
- No se almacenan credenciales en el código fuente
- Manejo seguro de errores en las llamadas a la API

### 🚧 Limitaciones conocidas

- La funcionalidad de IA requiere conexión a internet
- Las tareas se almacenan en texto plano (sin encriptación)
- No hay funcionalidad de backup automático

### 🤝 Contribuciones

Las contribuciones son bienvenidas. Para contribuir:

1. Fork del repositorio
2. Crea una rama para tu feature (`git checkout -b feature/nueva-caracteristica`)
3. Commit de tus cambios (`git commit -am 'Añadir nueva característica'`)
4. Push a la rama (`git push origin feature/nueva-caracteristica`)
5. Crea un Pull Request

### 📋 Roadmap

#### Próximas características

- [ ] Interfaz gráfica de usuario (GUI)
- [ ] Categorías de tareas
- [ ] Fechas de vencimiento
- [ ] Recordatorios
- [ ] Exportar/importar tareas
- [ ] Búsqueda y filtrado avanzado
- [ ] Estadísticas de productividad

### 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo `LICENSE` para más detalles.

### 👨‍💻 Autor

Desarrollado por [MoureDev](https://github.com/mouredev)

---

### 📞 Soporte

Si encuentras algún problema o tienes sugerencias:

- Abre un [issue](https://github.com/mouredev/taskmanager/issues)
- Contacta al desarrollador a través de [Twitter](https://twitter.com/mouredev)

---

*Proyecto desarrollado con 💙 en Python*
