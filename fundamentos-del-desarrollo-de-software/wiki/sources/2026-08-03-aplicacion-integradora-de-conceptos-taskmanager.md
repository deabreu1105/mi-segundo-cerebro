---
type: source
created: 2026-08-03
updated: 2026-08-03
tags: [proyecto-integrador, python, testing, apis, git, capstone]
source: raw/papers/2026-08-03-aplicacion-integradora-de-conceptos-taskmanager.md
author: BIG School / MoureDev
---

# Aplicación Integradora de Conceptos — TaskManager

## Metadata
- **Fuente original:** `raw/papers/2026-08-03-aplicacion-integradora-de-conceptos-taskmanager.md`
- **Autor:** [[big-school]] (documento) / [[brais-moure]] — MoureDev (proyecto de código)
- **Fecha:** 2026-08-03
- **Tipo de documento:** Documento Técnico + Proyecto de Código completo (estudio de caso integrador — `main.py`, `task_manager.py`, `ai_service.py`, `test_task_manager.py`, `tasks.json`, `requirements.txt`, `.env`, `.gitignore`, `README.md`)

## Summary
Fuente capstone que cierra el ciclo del Máster: un proyecto real (**TaskManager**, un gestor de tareas en Python) que aplica en un único código ejecutable prácticamente todos los pilares ya cubiertos por el wiki — pensamiento computacional (descomposición en 4 pilares: datos, CLI, persistencia, IA), arquitectura modular (clases `Task`/`TaskManager` separadas por responsabilidad), persistencia en JSON, consumo de la API de OpenAI con gestión segura de credenciales (`.env` + `.gitignore`), y una suite de tests unitarios con `unittest.mock` que aísla la lógica de negocio del disco. No introduce ningún concepto nuevo — es la primera fuente del wiki que funciona puramente como **integración práctica** de conocimiento ya existente, con código real y ejecutable como evidencia.

## Key Takeaways
1. **Descomposición en 4 pilares antes de codificar:** gestión de la colección de datos, interacción CLI, persistencia, comunicación con servicios externos (IA) — pensamiento computacional aplicado a un proyecto real.
2. **Separación estricta de responsabilidades:** `main.py` (presentación/CLI) → `task_manager.py` (`Task` como entidad de datos + `TaskManager` como lógica de gestión/persistencia) → `ai_service.py` (integración externa) — ninguna capa mezcla las responsabilidades de otra.
3. **Tipado y validación defensiva:** toda entrada de `input()` se castea explícitamente (`int()`) dentro de `try/except ValueError`, aplicando el mismo patrón visto desde el Módulo 3.
4. **Seguridad de credenciales real:** la API key de OpenAI vive en `.env` (vía `python-dotenv`), nunca en el código fuente, y `.env` se excluye explícitamente en `.gitignore` junto con `.venv/`, `__pycache__/` y el propio archivo de datos `tasks.json`.
5. **Persistencia en JSON:** `TaskManager.save_tasks()`/`load_tasks()` serializan/deserializan objetos `Task` a JSON como formato de intercambio estándar y legible.
6. **Testing con mocks:** `test_task_manager.py` aísla `TaskManager` de la lectura/escritura real de disco parcheando `load_tasks`, `save_tasks` y `builtins.open` con `unittest.mock` — permite testear la lógica de negocio sin tocar el sistema de archivos real.
7. **IA como asistente, no sustituto, en dos frentes distintos:** (a) `ai_service.py` consume GPT para desglosar tareas complejas en subtareas (funcionalidad de producto), y (b) herramientas como Copilot asisten en generar tests y documentación (productividad del desarrollador) — ambos usos supervisados por el criterio humano.

## Detailed Breakdown

### 1. Arquitectura y Pensamiento Computacional
Antes de implementar, el proyecto se descompone en cuatro pilares: gestión de datos, CLI, persistencia, comunicación con IA. `main.py` resuelve el pilar de CLI exponiendo un menú interactivo que delega toda la lógica a `TaskManager` y `create_simple_tasks`, sin mezclar presentación con lógica de negocio. La entrada de usuario, siempre texto por `input()`, se castea explícitamente con manejo de excepciones.

### 2. Modelado de Datos y Lógica Modular
`Task` es la entidad de datos pura (id, descripción, estado); `TaskManager` es la clase gestora que administra alta, listado, completado, borrado y persistencia. Esta separación por responsabilidad única permite que cada clase sea testeable de forma independiente.

### 3. Ecosistema de Desarrollo Profesional
`requirements.txt` fija versiones exactas de dependencias (incluyendo `openai` y `python-dotenv`) para reproducibilidad. `.gitignore` excluye `.venv/`, `__pycache__/`, `tasks.json` (datos) y `.env` (credenciales) del control de versiones — Git rastrea código, nunca estado local ni secretos.

### 4. Persistencia de Datos mediante JSON
Los datos deben sobrevivir al cierre del programa. JSON se elige por ser un estándar de intercambio compatible con bases de datos modernas y APIs, permitiendo convertir objetos Python en estructuras legibles y viceversa de forma eficiente y directa (`json.dump`/`json.load`).

### 5. Integración de Inteligencia Artificial en el Flujo de Trabajo
La API key se gestiona vía variable de entorno (`.env`, nunca en código fuente ni en Git). `ai_service.py` encapsula por completo el consumo de la API de OpenAI: construye el prompt, invoca al modelo, parsea la respuesta línea a línea en una lista de subtareas, con manejo defensivo de errores (API key ausente, fallo de conexión) que degrada con gracia en vez de romper el programa.

Herramientas como GitHub Copilot no sustituyen al desarrollador, sino que asisten en dos fases críticas: generación de tests unitarios y documentación técnica (README).

### 6. Testing con Mocks
`test_task_manager.py` aísla `TaskManager` del sistema de archivos real parcheando `load_tasks`, `save_tasks` y `builtins.open` (`unittest.mock.patch`, `mock_open`) — permite verificar la lógica de negocio (añadir, listar, completar, eliminar, caso de tarea inexistente) sin dependencias externas reales, cumpliendo la definición estricta de test unitario **aislado**.

### 7. Observaciones Clave
- Las API Keys jamás se suben al control de versiones — se gestionan con `.env` y se excluyen vía `.gitignore`.
- La entrada de usuario siempre es texto: casting y manejo de excepciones son obligatorios.
- Separar UI del núcleo lógico permite actualizar la tecnología de interfaz sin afectar el funcionamiento interno.
- El código debe revisarse constantemente para extraer funciones repetitivas y mejorar legibilidad (refactorización continua).

### 8. Conclusión
Integrar Git, Python, persistencia JSON y servicios de IA en un único flujo de trabajo prepara al profesional para liderar proyectos reales. La diferencia entre un prototipo frágil y una solución empresarial robusta es exactamente el ciclo completo demostrado aquí: desde el algoritmo inicial hasta la documentación final.

## Code & Pseudocode Examples

### CLI — separación de presentación y lógica (`main.py`)
```python
from task_manager import TaskManager
from ai_service import create_simple_tasks

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
                case 6:
                    break
        except ValueError:
            print("Opción no válida. Selecciona otra.")
```

### Entidad + Gestor con persistencia JSON (`task_manager.py`)
```python
import json

class Task:
    def __init__(self, id, description, completed=False):
        self.id = id
        self.description = description
        self.completed = completed

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
        self.save_tasks()

    def load_tasks(self):
        try:
            with open(self.FILENAME, "r") as file:
                data = json.load(file)
                self._tasks = [Task(item["id"], item["description"], item["completed"]) for item in data]
        except FileNotFoundError:
            self._tasks = []

    def save_tasks(self):
        with open(self.FILENAME, "w") as file:
            json.dump([{"id": t.id, "description": t.description, "completed": t.completed} for t in self._tasks], file, indent=4)
```

### Gestión segura de credenciales y consumo de API (`ai_service.py`)
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
        prompt = f"Desglosa la siguiente tarea compleja en 3 a 5 subtareas: {description}"
        response = client.chat.completions.create(
            model="gpt-5",
            messages=[{"role": "user", "content": prompt}],
        )
        content = response.choices[0].message.content.strip()
        return [line[1:].strip() for line in content.split("\n") if line.startswith("-")]
    except Exception:
        return ["Error: No se ha podido realizar la conexión a OpenAI."]
```

### .gitignore — qué nunca se versiona
```text
.venv/
__pycache__/
tasks.json
.env
```

### Test unitario con mocks (`test_task_manager.py`)
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
        self.tm.add_task("Test Task")
        self.assertEqual(len(self.tm._tasks), 1)

    @patch("builtins.open", new_callable=mock_open)
    def test_delete_nonexistent_task(self, mock_file):
        with patch("builtins.print") as mock_print:
            self.tm.delete_task(999)
            mock_print.assert_called_with("Tarea no encontrada: #999")
```

## Entities Mentioned
- [[big-school]]
- [[brais-moure]] (MoureDev, autor del proyecto de código TaskManager)

## Concepts Discussed
- [[pensamiento-computacional]]
- [[descomposicion]]
- [[programacion-orientada-a-objetos]]
- [[modularidad-modulos-y-paquetes]]
- [[funciones-y-parametros]]
- [[manejo-de-errores-y-excepciones]]
- [[entornos-virtuales-y-dependencias]]
- [[control-de-versiones-git]]
- [[modelado-de-datos-y-bases-de-datos]]
- [[apis-rest]]
- [[testing-y-piramide-de-pruebas]]
- [[refactorizacion]]
- [[soberania-humana-en-ia]]
- [[etica-y-responsabilidad-en-el-desarrollo]]

## Notable Quotes
> "Entender el ciclo de vida del software —desde el algoritmo inicial hasta la documentación final— es la diferencia entre un prototipo frágil y una solución empresarial robusta que aporta valor real en el mercado actual."

## Connections & Reflections
- Esta fuente **no introduce ningún concepto nuevo**: es la primera del wiki que actúa puramente como integración práctica, tocando 14 conceptos ya existentes con código real y ejecutable como evidencia. Confirma, en vez de contradecir, todo el conocimiento acumulado en los Módulos 0-5.
- Aporta un matiz concreto nuevo a [[testing-y-piramide-de-pruebas]]: el uso de `unittest.mock` (`patch`, `mock_open`) para lograr el aislamiento estricto que la definición de "test unitario" exige — el wiki no tenía hasta ahora un ejemplo de mocking real.
- Aporta un patrón concreto de seguridad a [[apis-rest]] y [[etica-y-responsabilidad-en-el-desarrollo]]: el trío `.env` + `python-dotenv` + `.gitignore` como implementación real de "nunca credenciales en el código fuente ni en control de versiones".
- El manejo defensivo de errores en `ai_service.py` (try/except genérico que degrada con un mensaje en vez de crashear) es una aplicación directa de [[manejo-de-errores-y-excepciones]] a una integración de IA real.

## Open Questions
- ¿Qué patrón de retry/backoff (como el sugerido en los "Ejemplos Relacionados" del propio documento) debería ser el estándar mínimo al integrar cualquier API externa en producción, más allá de capturar la excepción una sola vez?

## Related Sources
- [[wiki/sources/2026-08-03-testing]] — origen de la pirámide de testing y `unittest`, aquí aplicado con mocks reales.
- [[wiki/sources/2026-08-03-apis-comunicacion]] — consumo de APIs REST con `requests`; aquí se consume el SDK de OpenAI, un patrón de cliente equivalente.
- [[wiki/sources/2026-08-03-gestion-entornos-dependencias]] — `requirements.txt` y entornos virtuales aplicados en un proyecto real.
- [[wiki/sources/2026-08-03-deuda-tecnica-y-refactorizacion]] — la refactorización continua como observación clave también en este proyecto.

---

**Estado:** ✅ Completamente procesado e integrado en el wiki
