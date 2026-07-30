# 📚 Índice del Wiki — Fundamentos del desarrollo de software

> **Última actualización:** 2026-07-30  
> **Total de páginas:** 55  
> **Total de fuentes procesadas:** 16

---

## 🎯 Navegación Rápida

- [[HOME|🏠 Inicio]] — Punto de entrada del vault
- [[AGENTS|🗺️ Root Agent]] — Protocolo del agente LLM
- [[log|📋 Log Cronológico]] — Historia de todas las operaciones
- **Graph View** (Ctrl+G en Obsidian) — Ver conexiones visuales

---

## 📑 Fuentes Procesadas (`wiki/sources/`)

### Módulo 0: Fundamentos y Resolución de Problemas
- [[wiki/sources/2026-07-21-llm-wiki-pattern-karpathy|2026-07-21-llm-wiki-pattern-karpathy]] — Arquitectura de base de conocimiento acumulativa en Markdown por Andrej Karpathy
- [[wiki/sources/2026-07-29-fundamentos-del-pensamiento-computacional|2026-07-29-fundamentos-del-pensamiento-computacional]] — Los 4 pilares del pensamiento computacional, diagramas de flujo y pseudocódigo por Brais Moure / BIG School
- [[wiki/sources/2026-07-29-metodologias-de-resolucion-de-problemas|2026-07-29-metodologias-de-resolucion-de-problemas]] — Método científico aplicado al debugging, logs, stack traces y breakpoints por Brais Moure / BIG School
- [[wiki/sources/2026-07-29-ejercicios-practicos-pensamiento-computacional|2026-07-29-ejercicios-practicos-pensamiento-computacional]] — Ejercicios de descomposición atómica, diagramas de flujo y edge cases por Brais Moure / BIG School
- [[wiki/sources/2026-07-29-conclusiones-pensamiento-computacional-y-resolucion-de-problemas|2026-07-29-conclusiones-pensamiento-computacional-y-resolucion-de-problemas]] — Transmutación del rol profesional a arquitecto y soberanía en IA por Brais Moure / BIG School

### Módulo 1: Herramientas y Ecosistema del Desarrollo Moderno
- [[wiki/sources/2026-07-30-terminal-y-linea-de-comandos|2026-07-30-terminal-y-linea-de-comandos]] — Guía de Bash/Shell, permisos octales, pipes, redirecciones, Vim y tareas Cron por Brais Moure
- [[wiki/sources/2026-07-30-control-de-versiones-con-git-y-github|2026-07-30-control-de-versiones-con-git-y-github]] — Control de versiones, estados de Git, Conventional Commits, Gitflow y SSH por Fernando Herrera / Brais Moure
- [[wiki/sources/2026-07-30-entornos-de-desarrollo-ide|2026-07-30-entornos-de-desarrollo-ide]] — Entornos de desarrollo integrados (VS Code), reducción del context switch y GitHub Copilot por Brais Moure / BIG School
- [[wiki/sources/2026-07-30-ecosistema-del-desarrollo-de-software-moderno-conclusiones|2026-07-30-ecosistema-del-desarrollo-de-software-moderno-conclusiones]] — La Tríada Estratégica (Terminal, Git e IDE) e IA como acelerador por Brais Moure / BIG School

### Módulo 2: Fundamentos de la Programación
- [[wiki/sources/2026-07-30-fundamentos-de-la-programacion-introduccion-y-sintaxis|2026-07-30-fundamentos-de-la-programacion-introduccion-y-sintaxis]] — Sintaxis vs. semántica y compilación vs. interpretación por BIG School
- [[wiki/sources/2026-07-30-variables-tipos-de-datos-y-operadores|2026-07-30-variables-tipos-de-datos-y-operadores]] — Ciclo de vida de variables, tipado estático/dinámico, operadores y scope por BIG School
- [[wiki/sources/2026-07-30-estructuras-de-control|2026-07-30-estructuras-de-control]] — Condicionales, bucles y control avanzado de flujo (BREAK/CONTINUE/RETURN) por BIG School
- [[wiki/sources/2026-07-30-estructuras-de-datos|2026-07-30-estructuras-de-datos]] — Arrays, listas, pilas, colas, mapas y sets por BIG School
- [[wiki/sources/2026-07-30-funciones-y-parametros|2026-07-30-funciones-y-parametros]] — Modularización, DRY, parámetros vs. argumentos y funciones puras por BIG School
- [[wiki/sources/2026-07-30-manejo-de-errores-y-excepciones|2026-07-30-manejo-de-errores-y-excepciones]] — Taxonomía de errores, TRY/CATCH/FINALLY y excepciones personalizadas por BIG School
- [[wiki/sources/2026-07-30-fundamentos-de-la-programacion-conclusiones|2026-07-30-fundamentos-de-la-programacion-conclusiones]] — Síntesis del Módulo 2 bajo el marco del pensamiento computacional por BIG School

---

## 👥 Entidades (`wiki/entities/`)

### Personas
- [[andrej-karpathy]] — Investigador de IA y creador del patrón LLM Wiki
- [[vannevar-bush]] — Creador conceptual del Memex (1945)
- [[brais-moure]] — Divulgador, ingeniero de software y fundador de MoureDev / BIG School
- [[fernando-herrera]] — Educador tecnológico y fundador de DevTalles (Especialista en Git/GitHub)

### Organizaciones / Proyectos
- [[big-school]] — Academia tecnológica responsable del Máster Desarrollo con IA

---

## 💡 Conceptos (`wiki/concepts/`)

### Conceptos Principales
- [[pensamiento-computacional]] — Proceso mental de estructurar problemas para que sean procesados eficientemente por máquinas
- [[llm-wiki-pattern]] — Arquitectura de base de conocimiento acumulativa mantenida por agentes de IA
- [[soberania-humana-en-ia]] — Principio de gobernanza e independencia técnica del desarrollador frente a automatismos de IA

### Ecosistema & Herramientas del Desarrollador
- [[terminal-y-cli]] — Interfaz de línea de comandos para orquestación de infraestructura y automatización
- [[shell-bash-zsh]] — Intérpretes de órdenes Unix, scripting (`.sh`) y personalización
- [[redirecciones-y-pipes]] — Conexión de flujos estándar (`stdin`, `stdout`, `|`, `>`, `>>`) entre comandos
- [[control-de-versiones-git]] — Sistema distribuido inmutable basado en DAG, Conventional Commits y Gitflow
- [[github-y-colaboracion]] — Plataforma cloud de repositorios, Pull Requests, CI/CD y SSH multi-cuenta
- [[entornos-de-desarrollo-ide]] — Centro de mando unificado (VS Code) para reducir el context switch y acelerar la depuración

### Metodologías / Patrones de Pensamiento
- [[descomposicion]] — Pilar de divide y vencerás para fragmentar problemas en unidades atómicas
- [[reconocimiento-de-patrones]] — Identificación de tendencias y estructuras comunes para reutilizar soluciones
- [[abstraccion]] — Filtrado de detalles irrelevantes y ruido para enfocarse en la esencia del modelo
- [[diseno-de-algoritmos]] — Creación de secuencias lógicas finitas, precisas y ordenadas
- [[metodologia-de-debugging]] — Método científico de 5 pasos para investigar y resolver fallos de software
- [[rubber-duck-debugging]] — Técnica de depuración verbalizando el código en lenguaje natural

### Herramientas de Inspección & Diagnóstico
- [[analisis-de-logs]] — Inspección cronológica y severidades de eventos de sistema
- [[breakpoints]] — Pausa intencional del código para inspeccionar variables y flujo en memoria
- [[stack-trace]] — Rastreo jerárquico en cascada de llamadas para hallar la causa raíz

### Teorías / Frameworks
- [[mentalidad-de-arquitecto]] — Enfoque del profesional que prioriza el diseño sistémico y la sostenibilidad sobre la sintaxis
- [[deuda-tecnica]] — Coste futuro acumulado de decisiones de diseño tomadas por rapidez o descuido en el presente

### Fundamentos de la Programación
- [[sintaxis-y-semantica]] — La forma (mandato de la máquina) frente al fondo (mandato del negocio)
- [[compilacion-e-interpretacion]] — Las dos modalidades de traducción de código fuente a código máquina
- [[variables-y-tipos-de-datos]] — Ciclo de vida de una variable, tipos primitivos, nomenclatura y operadores
- [[tipado-estatico-vs-dinamico]] — Cuándo y cómo un lenguaje fija el tipo de una variable
- [[paso-por-valor-vs-referencia]] — Comportamiento de copia de primitivos frente a objetos/listas
- [[scope-y-lifetime]] — Ámbito de visibilidad y tiempo de vida de una variable
- [[condicionales]] — IF/ELSE, ELSE IF, anidamiento y SWITCH
- [[bucles]] — WHILE, DO-WHILE, FOR y FOREACH
- [[estructuras-de-datos]] — Arrays, listas, pilas, colas, mapas y sets
- [[funciones-y-parametros]] — Modularización, DRY, parámetro vs. argumento
- [[funciones-puras-y-efectos-secundarios]] — Determinismo vs. modificación de estado externo
- [[manejo-de-errores-y-excepciones]] — Taxonomía de errores, TRY/CATCH/FINALLY, throw y propagación

---

## 🔍 Queries Archivadas (`wiki/queries/`)

- [[lint-2026-07-29]] — Reporte de salud global (linting) tras la ingesta del Módulo 0
- [[lint-2026-07-30]] — Reporte de salud global (linting) tras la ingesta masiva del Módulo 1 (Ecosistema Moderno)

---

## 📊 Estadísticas

| Métrica | Valor |
|---------|-------|
| Fuentes totales | 16 |
| Entidades (personas) | 4 |
| Entidades (orgs/lugares) | 1 |
| Conceptos | 32 |
| Queries archivadas | 2 |
| Páginas huérfanas | 0 |
| Última operación | Ingesta Masiva Módulo 2 (Fundamentos de la Programación) 🟢 |

---

## 🏷️ Tags Más Usados

`#ia` (6) `#debugging` (6) `#arquitectura` (5) `#pilar` (4) `#persona` (4) `#git` (4) `#terminal` (3) `#stack-trace` (3) `#pensamiento-computacional` (3) `#logs` (3) `#ide` (3) `#descomposicion` (3) `#breakpoints` (3)

*(Recalculado por frecuencia real de `tags:` en frontmatter — reemplaza la lista anterior, que listaba `#bash`/`#github`/`#gitflow`/`#vscode` como "más usados" con solo 2 menciones cada uno.)*

---

## 🔗 Hubs de Conocimiento

- [[pensamiento-computacional]] — Hub central de los 4 pilares y diseño algorítmico
- [[terminal-y-cli]] — Hub de automatización de infraestructura, shell scripting y comandos Unix
- [[control-de-versiones-git]] — Hub de flujos de trabajo de versiones, Gitflow y colaboración en GitHub
- [[entornos-de-desarrollo-ide]] — Hub de productividad, reducción de context switch e integración de Copilot
- [[llm-wiki-pattern]] — Hub de arquitectura de conocimiento y gestión con agentes LLM
- [[metodologia-de-debugging]] — Hub de técnicas forenses y diagnósticos científicos de código
- [[funciones-y-parametros]] — Hub de modularización: conecta scope, paso por valor/referencia y funciones puras
- [[variables-y-tipos-de-datos]] — Hub de la materia prima de datos: tipado, scope y deuda técnica

---

## ⚙️ Instrucciones de Uso

### Para el Agente LLM:
1. **Al arrancar:** Ejecuta `./init.sh --check` y confirma que todo está OK
2. **Antes de cada operación:** Lee este índice para identificar páginas relevantes
3. **Después de cada ingest:** Actualiza las secciones correspondientes con enlaces cualificados `[[wiki/sources/YYYY-MM-DD-titulo|Alias]]`
4. **Workflow detallado:** Lee el subagente correspondiente en `.agents/agents/`

---

**🚀 Estado:** Ingesta masiva del Módulo 2 (Fundamentos de la Programación) completada. Todas las fuentes de `raw/` procesadas. Vault 100% Saludable.
