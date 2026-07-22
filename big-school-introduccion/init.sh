#!/usr/bin/env bash
# init.sh — Inicialización y verificación del vault "Segundo Cerebro"
#
# MODOS:
#   Setup  → Si detecta placeholders {{...}}, pide datos y los reemplaza.
#   Check  → Si el vault ya está inicializado, verifica integridad.
#
# USO:
#   ./init.sh                        # Interactivo (pide nombre y tema)
#   ./init.sh -n "Daniel" -t "ML"    # No-interactivo (flags)
#   ./init.sh --check                # Solo verificar, nunca modificar
#
# Salida: [OK] / [WARN] / [FAIL] en cada paso. Exit code 0 = todo OK.

set -euo pipefail

# ── Colores ────────────────────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

ok()   { printf "${GREEN}[OK]${NC}    %s\n" "$1"; }
warn() { printf "${YELLOW}[WARN]${NC}  %s\n" "$1"; }
fail() { printf "${RED}[FAIL]${NC}  %s\n" "$1"; }
info() { printf "${CYAN}  →${NC} %s\n" "$1"; }
header() { printf "\n${BOLD}── %s %s\n${NC}" "$1" "$(printf '─%.0s' $(seq 1 $((50 - ${#1}))))"; }

EXIT_CODE=0
ONLY_CHECK=false
NOMBRE=""
TEMA=""

# ── Parsear flags ───────────────────────────────────────────────────────────
while [[ $# -gt 0 ]]; do
  case "$1" in
    -n|--nombre) NOMBRE="$2"; shift 2 ;;
    -t|--tema)   TEMA="$2";   shift 2 ;;
    --check)     ONLY_CHECK=true; shift ;;
    -h|--help)
      echo "Uso: ./init.sh [-n NOMBRE] [-t TEMA] [--check]"
      echo "  -n, --nombre NOMBRE   Tu nombre (reemplaza {{NOMBRE_USUARIO}})"
      echo "  -t, --tema   TEMA     Tema del vault (reemplaza {{TEMA_VAULT}})"
      echo "  --check               Solo verificar, sin modificar archivos"
      exit 0
      ;;
    *) fail "Flag desconocido: $1"; exit 1 ;;
  esac
done

# ── Verificar que estamos en el directorio correcto ─────────────────────────
header "0. Verificando ubicación"

if [[ ! -f "AGENTS.md" ]] || [[ ! -f "HOME.md" ]]; then
  fail "No parece un vault válido. Ejecuta init.sh desde la raíz del vault."
  fail "Asegúrate de que existen AGENTS.md y HOME.md en el directorio actual."
  exit 1
fi
ok "Directorio correcto (AGENTS.md y HOME.md presentes)"

# ── Detectar modo: setup vs check ──────────────────────────────────────────
header "1. Detectando modo"

HAS_PLACEHOLDERS=false
if grep -rq "{{NOMBRE_USUARIO}}\|{{TEMA_VAULT}}\|{{FECHA_CREACION}}" \
    AGENTS.md HOME.md index.md log.md 2>/dev/null; then
  HAS_PLACEHOLDERS=true
fi

if $ONLY_CHECK; then
  info "Modo: verificación (--check activo, no se modificarán archivos)"
elif $HAS_PLACEHOLDERS; then
  info "Modo: SETUP (se encontraron placeholders sin reemplazar)"
else
  info "Modo: CHECK (vault ya inicializado, solo verificación)"
fi

# ── SETUP: Reemplazar placeholders ─────────────────────────────────────────
if $HAS_PLACEHOLDERS && ! $ONLY_CHECK; then

  header "2. Configurando el vault"

  # Pedir nombre si no vino por flag
  if [[ -z "$NOMBRE" ]]; then
    printf "${CYAN}  ¿Cuál es tu nombre?${NC} → "
    read -r NOMBRE
    [[ -z "$NOMBRE" ]] && { fail "El nombre no puede estar vacío."; exit 1; }
  fi

  # Pedir tema si no vino por flag
  if [[ -z "$TEMA" ]]; then
    printf "${CYAN}  ¿Cuál es el tema del vault?${NC} (ej: Machine Learning, Historia Romana) → "
    read -r TEMA
    [[ -z "$TEMA" ]] && { fail "El tema no puede estar vacío."; exit 1; }
  fi

  FECHA=$(date +%Y-%m-%d)

  info "Nombre   : $NOMBRE"
  info "Tema     : $TEMA"
  info "Fecha    : $FECHA"
  echo ""

  # Archivos que contienen placeholders
  TARGETS=(AGENTS.md HOME.md index.md log.md)

  for f in "${TARGETS[@]}"; do
    if [[ -f "$f" ]]; then
      sed -i \
        -e "s/{{TEMA_VAULT}}/$TEMA/g" \
        -e "s/{{NOMBRE_USUARIO}}/$NOMBRE/g" \
        -e "s/{{FECHA_CREACION}}/$FECHA/g" \
        "$f"
      ok "Placeholders reemplazados en $f"
    else
      warn "Archivo no encontrado: $f (omitido)"
    fi
  done

  # Registrar en log.md
  LOG_ENTRY="
---

## [$FECHA] init | Vault inicializado por $NOMBRE

**Tema:** $TEMA
**Script:** init.sh
**Acción:** Placeholders reemplazados en AGENTS.md, HOME.md, index.md, log.md"

  echo "$LOG_ENTRY" >> log.md
  ok "Entrada registrada en log.md"

fi

# ── CHECK: Verificar estructura de carpetas ─────────────────────────────────
header "3. Verificando estructura de carpetas"

REQUIRED_DIRS=(
  "raw/assets"
  "raw/books"
  "raw/journal"
  "raw/web"
  "raw/papers"
  "wiki/entities"
  "wiki/concepts"
  "wiki/sources"
  "wiki/queries"
  "_templates"
)

for dir in "${REQUIRED_DIRS[@]}"; do
  if [[ -d "$dir" ]]; then
    ok "Existe $dir/"
  else
    if $ONLY_CHECK; then
      warn "Falta carpeta: $dir/ (usa init.sh sin --check para crearla)"
      EXIT_CODE=1
    else
      mkdir -p "$dir"
      ok "Creada carpeta: $dir/"
    fi
  fi
done

# ── CHECK: Verificar archivos base del sistema ──────────────────────────────
header "4. Verificando archivos base del sistema"

REQUIRED_FILES=(
  "AGENTS.md"
  "HOME.md"
  "index.md"
  "log.md"
  "README.md"
  "_templates/concept.md"
  "_templates/entity.md"
  "_templates/source.md"
  "_templates/query.md"
)

for f in "${REQUIRED_FILES[@]}"; do
  if [[ -f "$f" ]]; then
    ok "Existe $f"
  else
    fail "Falta archivo base: $f"
    EXIT_CODE=1
  fi
done

# ── CHECK: Verificar que no quedan placeholders ─────────────────────────────
header "5. Verificando placeholders"

PLACEHOLDER_FILES=(AGENTS.md HOME.md index.md log.md)
FOUND_PLACEHOLDERS=false

for f in "${PLACEHOLDER_FILES[@]}"; do
  if [[ -f "$f" ]] && grep -q "{{" "$f" 2>/dev/null; then
    fail "Quedan placeholders sin reemplazar en: $f"
    grep -n "{{" "$f" | while read -r line; do
      info "$line"
    done
    FOUND_PLACEHOLDERS=true
    EXIT_CODE=1
  fi
done

if ! $FOUND_PLACEHOLDERS; then
  ok "Sin placeholders pendientes — vault correctamente personalizado"
fi

# ── Resumen ─────────────────────────────────────────────────────────────────
header "6. Resumen"

if [[ $EXIT_CODE -eq 0 ]]; then
  printf "${GREEN}${BOLD}[OK]    Vault listo.${NC}\n"
  if $HAS_PLACEHOLDERS && ! $ONLY_CHECK; then
    printf "        Tema: ${BOLD}$TEMA${NC} · Usuario: ${BOLD}$NOMBRE${NC}\n"
    printf "        Abre el vault en Obsidian y empieza con HOME.md 🚀\n"
  else
    printf "        Todo en orden. Puedes trabajar con el agente.\n"
  fi
else
  printf "${RED}${BOLD}[FAIL]  Hay problemas en el vault. Resuelve los errores antes de avanzar.${NC}\n"
fi

exit $EXIT_CODE
