#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

REPO="/storage/emulated/0/Documents/repos/wellbeing-archivist"
OUT="/storage/emulated/0/Documents/Blagopoluchie/00_INBOX/my-structure/chats-gpt-name/revision-of-the-project-structure/0288-1104-2026-archivist-cycle-1-repo-snapshot.txt"

if [ ! -d "$REPO" ]; then
  echo "Repository not found: $REPO" >&2
  exit 1
fi

{
  echo "# Архивариус-Трезвенник: снимок репозитория для цикла 1"
  echo "Дата: $(date '+%Y-%m-%d %H:%M:%S %z')"
  echo "Репозиторий: $REPO"
  echo

  echo "===== TOP LEVEL ====="
  find "$REPO" -maxdepth 1 -mindepth 1 -printf '%f\n' | sort
  echo

  echo "===== SRC/ARCHIVIST FILES ====="
  if [ -d "$REPO/src/archivist" ]; then
    find "$REPO/src/archivist" -maxdepth 2 -type f | sort
  else
    echo "[missing] $REPO/src/archivist"
  fi
  echo

  echo "===== PYTHON FILES (MAXDEPTH 4) ====="
  find "$REPO" -maxdepth 4 -type f -name '*.py' | sort
  echo

  echo "===== CLI / ARGPARSE HITS ====="
  grep -RniE 'argparse|add_parser|subparsers|set_defaults|def main|main\(' "$REPO/src" 2>/dev/null || true
  echo

  echo "===== SQLITE / DB / SCHEMA HITS ====="
  grep -RniE 'sqlite3|CREATE TABLE|schema|init_db|init-db|connect\(' "$REPO/src" 2>/dev/null || true
  echo

  echo "===== ENTITY / ARTIFACT / STEP / HANDOFF HITS ====="
  grep -RniE 'entity|entities|artifact|artifacts|step|steps|handoff' "$REPO/src" 2>/dev/null || true
  echo

  echo "===== archivist.py (HEAD 220) ====="
  if [ -f "$REPO/archivist.py" ]; then
    sed -n '1,220p' "$REPO/archivist.py"
  else
    echo "[missing] $REPO/archivist.py"
  fi
  echo

  echo "===== src/archivist/cli.py (HEAD 320) ====="
  if [ -f "$REPO/src/archivist/cli.py" ]; then
    sed -n '1,320p' "$REPO/src/archivist/cli.py"
  else
    echo "[missing] $REPO/src/archivist/cli.py"
  fi
  echo

  for f in \
    "$REPO/src/archivist/db.py" \
    "$REPO/src/archivist/database.py" \
    "$REPO/src/archivist/schema.py" \
    "$REPO/src/archivist/init_db.py" \
    "$REPO/src/archivist/models.py"
  do
    echo "===== FILE CHECK: $f ====="
    if [ -f "$f" ]; then
      sed -n '1,260p' "$f"
    else
      echo "[missing]"
    fi
    echo
  done
} > "$OUT"

echo "Snapshot written to: $OUT"
