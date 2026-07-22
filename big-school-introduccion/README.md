# Vault Template — Segundo Cerebro con LLM

Template listo para usar basado en el patrón **LLM Wiki** de Andrej Karpathy.

## Cómo Usar Este Template

### 1. Copiar el template

```bash
# Copia la carpeta vault-template con el nombre de tu tema
cp -r vault-template mi-tema-vault

# Entra al nuevo vault
cd mi-tema-vault
```

### 2. Inicializar el vault con `init.sh`

```bash
# Dale permisos de ejecución (solo la primera vez)
chmod +x init.sh

# Ejecútalo — te pedirá tu nombre y el tema del vault
./init.sh
```

El script detecta automáticamente si el vault está sin inicializar, te pide los datos
interactivamente y reemplaza todos los placeholders. También crea las carpetas que falten.

**Modo no-interactivo** (para scripting o automatización):
```bash
./init.sh -n "Tu Nombre" -t "Tema del Vault"
```

**Verificar integridad** en cualquier momento:
```bash
./init.sh --check
```

### 3. Abrir en Obsidian

- Obsidian → "Open folder as vault" → selecciona la carpeta nueva
- El vault ya tiene la configuración de core plugins lista

### 4. Inicializar Git (opcional pero recomendado)

```bash
git init
git add -A
git commit -m "init: {{TEMA_VAULT}} vault"
```

### 5. Primera sesión con el agente LLM

1. Añade un archivo a `raw/` (artículo, PDF convertido, notas, etc.)
2. Abre tu agente LLM con el contexto del vault:
   - Dale acceso a los archivos del vault
   - El agente leerá `AGENTS.md` (root) → luego `.agents/agents/ingest.md` (workflow detallado)
3. Dile: `"Procesa [nombre del archivo]"`

## Estructura del Template

```
vault-template/
├── init.sh                 ⚙️  Script de inicialización y verificación
│
├── .obsidian/              Configuración de Obsidian
│   ├── core-plugins.json   Plugins activos
│   └── graph.json          Grupos de color por sección
│
├── .agents/                Sistema de subagentes (carpeta oculta)
│   ├── agents/
│   │   ├── ingest.md       Workflow completo de INGEST
│   │   ├── query.md        Workflow completo de QUERY
│   │   └── lint.md         Workflow completo de LINT
│   └── settings.json       Registro de subagentes y permisos
│
├── _templates/             Plantillas para nuevas páginas
│   ├── concept.md
│   ├── entity.md
│   ├── source.md
│   └── query.md
│
├── raw/                    Fuentes originales (INMUTABLES)
│   ├── assets/             Imágenes y multimedia
│   ├── books/              Capítulos de libros
│   ├── journal/            Entradas de diario (YYYY-MM-DD.md)
│   ├── papers/             Papers académicos y PDFs convertidos a .md
│   └── web/                Artículos web clipeados
│
├── wiki/                   Base de conocimiento (LLM la mantiene)
│   ├── concepts/
│   ├── entities/
│   ├── queries/
│   └── sources/
│
├── AGENTS.md               🗺️  Root agent — punto de entrada del LLM
├── HOME.md                 Punto de entrada del vault (Obsidian)
├── index.md                Índice navegable
├── log.md                  Log cronológico de operaciones
└── README.md               Este archivo
```

## Flujo de Trabajo

```
Tú añades fuente → raw/
        ↓
LLM procesa (INGEST)
        ↓
LLM escribe en wiki/
• sources/   → summary de la fuente
• entities/  → páginas de personas/orgs
• concepts/  → páginas de ideas
        ↓
LLM actualiza index.md + log.md
        ↓
Tú haces preguntas (QUERY)
        ↓
LLM sintetiza del wiki → opcionalmente archiva en queries/
        ↓
Periódicamente: LINT → reporte de salud
```

## Las Tres Operaciones

| Operación | Comando | Qué hace el LLM |
|-----------|---------|-----------------|
| **INGEST** | `"Procesa [archivo]"` | Lee fuente, crea summary, actualiza conceptos/entidades, cross-refs |
| **QUERY** | `"¿Qué sabemos sobre X?"` | Busca en wiki, sintetiza respuesta, archiva si es valiosa |
| **LINT** | `"Lint el wiki"` | Contradicciones, huérfanas, gaps, sugerencias |

## Por Qué Funciona

> *"The tedious part of maintaining a knowledge base is not the reading or the thinking — it's the bookkeeping."*  
> — Andrej Karpathy

Los LLMs hacen el bookkeeping; tú haces la curaduría y el pensamiento crítico.
