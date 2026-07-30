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
├── .agents/                Fuente de verdad para Antigravity (y para el LLM en general)
│   ├── agents/
│   │   ├── ingest.md       Workflow completo de INGEST
│   │   ├── query.md        Workflow completo de QUERY
│   │   └── lint.md         Workflow completo de LINT
│   ├── skills/
│   │   └── grill-me.md     Examen socrático interactivo (/grill-me)
│   └── settings.json       Registro de agentes/skills (documental)
│
├── .claude/                Solo para Claude Code
│   ├── agents/             Symlinks → .agents/agents/*.md (mismos archivos)
│   ├── commands/           Symlink → .agents/skills/grill-me.md
│   └── settings.json       Enforcement real: permisos + hook SessionStart
│
├── .templates/             Plantillas para nuevas páginas
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
├── AGENTS.md               🗺️  Root agent — punto de entrada real (Antigravity y estándar agents.md)
├── CLAUDE.md               Puente de una línea (@AGENTS.md) para que Claude Code lea lo mismo
├── PROMPTS.md              🎯  Cheatsheet de prompts para el humano
├── HOME.md                 Punto de entrada del vault (Obsidian)
├── index.md                Índice navegable
├── log.md                  Log cronológico de operaciones
└── README.md               Este archivo
```

> **Multi-agente:** este template está pensado para usarse con más de un agente LLM (Antigravity,
> Claude Code, etc.) sin duplicar instrucciones. `AGENTS.md` + `.agents/` son la única fuente de
> verdad; `CLAUDE.md` y `.claude/` son puentes (import de una línea + symlinks) hacia esos mismos
> archivos. Ver la sección "Multi-agente" en `AGENTS.md` antes de editar workflows o añadir un
> nuevo skill.

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

---

## 🎓 Flujo Ideal de Estudio (Active Learning Workflow)

El wiki no es un libro pasivo; es un mapa interconectado de aprendizaje activo. El flujo de estudio óptimo consta de 5 fases:

1. **🗺️ Mapa y Visión Macro (Graph View & Hubs):** Inicia en `index.md` o abre el Grafo Visual (`Ctrl+G` en Obsidian) para ubicar los Hubs de Conocimiento antes de profundizar.
2. **📖 Lectura y Comprensión (Conceptos & Sources):** Lee notas atómicas en `wiki/concepts/` y consulta sus fuentes originales en `wiki/sources/`. Aplica la técnica de auto-explicación (Patito de Goma) en voz alta.
3. **💻 Práctica Deliberada en Vivo (Hands-on):** Pon en práctica las ideas en tu entorno de trabajo real (ejercicios, análisis de problemas o proyectos del tema).
4. **🧪 Autoevaluación socrática con IA (Quizes & Drill):** Solicita un examen interactivo utilizando la slash command `/grill-me` o pidiendo simulaciones de casos de estudio y preguntas de aplicación.
5. **🔄 Síntesis y Evolución del Wiki:** Registra tus dudas resueltas o hallazgos como nuevas notas en `wiki/queries/` o actualiza los conceptos.

---

## Por Qué Funciona

> *"The tedious part of maintaining a knowledge base is not the reading or the thinking — it's the bookkeeping."*  
> — Andrej Karpathy

Los LLMs hacen el bookkeeping; tú haces la curaduría, el aprendizaje activo y el pensamiento crítico.
