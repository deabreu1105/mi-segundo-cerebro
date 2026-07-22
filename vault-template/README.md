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

### 2. Personalizar placeholders

Reemplaza en `AGENTS.md` y `HOME.md`:
- `{{NOMBRE_USUARIO}}` → tu nombre
- `{{TEMA_VAULT}}` → el tema (ej: "Filosofía Estoica", "Machine Learning", "Historia Romana")
- `{{FECHA_CREACION}}` → la fecha de hoy (YYYY-MM-DD)

```bash
# Reemplazo rápido con sed (cambia los valores)
TEMA="Mi Tema"
NOMBRE="Mi Nombre"
FECHA=$(date +%Y-%m-%d)

sed -i "s/{{TEMA_VAULT}}/$TEMA/g" AGENTS.md HOME.md index.md log.md
sed -i "s/{{NOMBRE_USUARIO}}/$NOMBRE/g" AGENTS.md HOME.md
sed -i "s/{{FECHA_CREACION}}/$FECHA/g" AGENTS.md HOME.md log.md
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
2. Abre Claude/GPT con el contexto de `AGENTS.md`
3. Dile: `"Procesa [nombre del archivo]"`

## Estructura del Template

```
vault-template/
├── .obsidian/              Configuración de Obsidian
│   ├── app.json
│   ├── appearance.json
│   ├── core-plugins.json   Plugins activos
│   └── graph.json          Grupos de color por sección
│
├── _templates/             Plantillas para nuevas páginas
│   ├── concept.md
│   ├── entity.md
│   ├── source.md
│   └── query.md
│
├── raw/                    Fuentes originales (inmutables)
│   ├── assets/
│   ├── books/
│   ├── journal/
│   ├── papers/             Papers académicos y PDFs convertidos a .md
│   └── web/
│
├── wiki/                   Base de conocimiento (LLM la mantiene)
│   ├── concepts/
│   ├── entities/
│   ├── queries/
│   └── sources/
│
├── AGENTS.md               Manual del agente LLM
├── HOME.md                 Punto de entrada del vault
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
