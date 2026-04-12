#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

DOC_DIR="/storage/emulated/0/Documents/Blagopoluchie/00_INBOX/my-structure/chats-gpt-name/revision-of-the-project-structure"
REPO="/storage/emulated/0/Documents/repos/wellbeing-archivist"
CLI_FILE="$REPO/src/archivist/cli.py"
BOOT_FILE="$REPO/src/archivist/bootstrap_packages.py"
BACKUP_DIR="$REPO/.wb-backups-query-layer"

mkdir -p "$DOC_DIR" "$BACKUP_DIR"

if [ ! -f "$CLI_FILE" ]; then
  echo "Required file not found: $CLI_FILE" >&2
  exit 1
fi

PYBIN=""
if command -v python3 >/dev/null 2>&1; then
  PYBIN="python3"
elif command -v python >/dev/null 2>&1; then
  PYBIN="python"
else
  echo "Neither python3 nor python is available." >&2
  exit 127
fi

cat > "$DOC_DIR/1058-1104-2026-cycle-open-bootstrap-summary-bridge.md" <<'MD_EOF'
# Открытие цикла: bridge between Archivist and bootstrap packages

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: открыть цикл сцепки Архивариуса с bootstrap-материалами через различение и summary bootstrap packages

artifact_type: cycle_plan
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0978-1104-2026-bootstrap-core-four-entities-success-log.md
- 1018-1104-2026-path-roots-normalization-success-log.md

## Основная мысль цикла

Архивариус уже умеет учитывать сущности, шаги, query-layer, service-layer и path roots. Следующий шаг состоит в том, чтобы он начал различать bootstrap packages как отдельный класс объектов.

## Цель цикла

Добавить первый мост между `wellbeing-archivist` и `wellbeing-entity-bootstrap` через summary bootstrap packages.

## Критерий успеха

Цикл считается завершённым, если Архивариус умеет:
- перечислять bootstrap packages;
- показывать summary отдельного bootstrap package;
- различать его базовые поля и полноту минимального состава.
MD_EOF

cat > "$DOC_DIR/1068-1104-2026-technical-task-bootstrap-summary-bridge.md" <<'MD_EOF'
# Техническое задание: bootstrap summary bridge

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: задать инженерную задачу на первый мост между Архивариусом и bootstrap packages

artifact_type: specification
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 1058-1104-2026-cycle-open-bootstrap-summary-bridge.md

## Требуется

1. Создать модуль `bootstrap_packages.py`.
2. Реализовать разбор bootstrap package directory.
3. Добавить команды:
   - `list-bootstrap-packages`
   - `show-bootstrap-package-summary`
4. Научить Архивариуса различать:
   - package id
   - entity author
   - contour
   - approval status
   - обязательные файлы
   - полноту минимального состава

## Ограничения

На этом этапе не требуется:
- индексация bootstrap packages в SQLite
- сложный parser markdown
- автоматическая валидация всех полей header v2
- полная интеграция с service-layer

## Критерий успеха

Summary bootstrap packages должен работать на текущем bootstrap repository с четырьмя базовыми пакетами.
MD_EOF

cat > "$DOC_DIR/1078-1104-2026-mvp-plan-bootstrap-summary-bridge.md" <<'MD_EOF'
# MVP-план: bootstrap summary bridge

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: определить минимально достаточный объём первого моста между Архивариусом и bootstrap repository

artifact_type: mvp_definition
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 1068-1104-2026-technical-task-bootstrap-summary-bridge.md

## MVP цикла

1. Перечислять bootstrap packages из `packages/core`.
2. Показывать summary одного package directory.
3. Различать наличие обязательных файлов.
4. Показывать базовые поля header без тяжёлой универсальной валидации.

## Критерий завершения

MVP считается завершённым, если Архивариус показывает summary для пакета Редактора и корректно видит базовое ядро пакетов.
MD_EOF

cat > "$DOC_DIR/1088-1104-2026-task-package-bootstrap-summary-bridge.md" <<'MD_EOF'
# Пакет задач: bootstrap summary bridge

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: зафиксировать пакет задач первого моста между Архивариусом и bootstrap repository

artifact_type: task_package
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 1078-1104-2026-mvp-plan-bootstrap-summary-bridge.md

## Задача 1
Создать модуль `bootstrap_packages.py`.

## Задача 2
Добавить summary bootstrap package.

## Задача 3
Добавить list и show команды в CLI.

## Задача 4
Проверить команды на локальном bootstrap repository.
MD_EOF

STAMP="$(date +%Y%m%d-%H%M%S)"
cp "$CLI_FILE" "$BACKUP_DIR/cli.py.$STAMP.bak"

cat > "$BOOT_FILE" <<'PY_EOF'
from __future__ import annotations

from pathlib import Path
from typing import Any

DEFAULT_BOOTSTRAP_PACKAGES_ROOT = (
    "/storage/emulated/0/Documents/repos/wellbeing-entity-bootstrap/packages/core"
)

REQUIRED_PACKAGE_FILES = [
    "README-initiation-package.md",
    "start-context.md",
    "required-reading-list.md",
    "constraints-and-permissions.md",
    "bootstrap-manifest.md",
]


def _read_text(path: Path) -> str:
    try:
        return path.read_text(encoding="utf-8")
    except Exception:
        return ""


def _extract_header_fields(text: str) -> dict[str, str]:
    result: dict[str, str] = {}
    for line in text.splitlines():
        stripped = line.strip()
        if not stripped:
            continue
        if stripped.startswith("## "):
            break
        if stripped.startswith("# "):
            continue
        if ":" not in stripped:
            continue
        key, value = stripped.split(":", 1)
        key = key.strip()
        value = value.strip()
        if not key:
            continue
        result[key] = value
    return result


def collect_bootstrap_package_summary(package_dir: str | Path) -> dict[str, Any]:
    package_path = Path(package_dir)
    readme_path = package_path / "README-initiation-package.md"
    readme_text = _read_text(readme_path)
    fields = _extract_header_fields(readme_text)

    existing = []
    missing = []
    for name in REQUIRED_PACKAGE_FILES:
        if (package_path / name).is_file():
            existing.append(name)
        else:
            missing.append(name)

    package_name = package_path.name
    package_id = fields.get("bootstrap_package_id", "")
    entity_author = fields.get("entity_author", "")
    entity_role = fields.get("entity_role", "")
    entity_contour = fields.get("entity_contour", fields.get("Контур", ""))
    approval_status = fields.get("approval_status", fields.get("Статус", ""))
    human_responsible = fields.get("human_responsible", "")
    tooling_origin = fields.get("tooling_origin", "")

    return {
        "package_dir": str(package_path),
        "package_name": package_name,
        "package_id": package_id,
        "entity_author": entity_author,
        "entity_role": entity_role,
        "entity_contour": entity_contour,
        "approval_status": approval_status,
        "human_responsible": human_responsible,
        "tooling_origin": tooling_origin,
        "required_files_total": len(REQUIRED_PACKAGE_FILES),
        "existing_files": existing,
        "missing_files": missing,
        "is_minimally_complete": len(missing) == 0,
    }


def list_bootstrap_packages(packages_root: str | Path) -> list[dict[str, Any]]:
    root = Path(packages_root)
    items: list[dict[str, Any]] = []
    if not root.is_dir():
        return items

    for entry in sorted(root.iterdir(), key=lambda p: p.name):
        if not entry.is_dir():
            continue
        if not (entry / "README-initiation-package.md").is_file():
            continue
        items.append(collect_bootstrap_package_summary(entry))
    return items


def render_bootstrap_packages_list(items: list[dict[str, Any]]) -> str:
    lines: list[str] = []
    lines.append("Bootstrap packages")
    lines.append(f"  total: {len(items)}")
    if not items:
        return "\n".join(lines) + "\n"

    for item in items:
        lines.append("")
        lines.append(f"{item['package_name']}")
        lines.append(f"  package_id: {item.get('package_id') or ''}")
        lines.append(f"  entity_author: {item.get('entity_author') or ''}")
        lines.append(f"  contour: {item.get('entity_contour') or ''}")
        lines.append(f"  approval_status: {item.get('approval_status') or ''}")
        lines.append(
            f"  minimally_complete: {'yes' if item.get('is_minimally_complete') else 'no'}"
        )
        if item.get("missing_files"):
            lines.append("  missing_files:")
            for name in item["missing_files"]:
                lines.append(f"    - {name}")
    return "\n".join(lines) + "\n"


def render_bootstrap_package_summary(item: dict[str, Any]) -> str:
    lines: list[str] = []
    lines.append("Bootstrap package summary")
    lines.append(f"  package_name: {item.get('package_name') or ''}")
    lines.append(f"  package_dir: {item.get('package_dir') or ''}")
    lines.append(f"  package_id: {item.get('package_id') or ''}")
    lines.append(f"  entity_author: {item.get('entity_author') or ''}")
    lines.append(f"  entity_role: {item.get('entity_role') or ''}")
    lines.append(f"  entity_contour: {item.get('entity_contour') or ''}")
    lines.append(f"  approval_status: {item.get('approval_status') or ''}")
    lines.append(f"  human_responsible: {item.get('human_responsible') or ''}")
    lines.append(f"  tooling_origin: {item.get('tooling_origin') or ''}")
    lines.append(
        f"  minimally_complete: {'yes' if item.get('is_minimally_complete') else 'no'}"
    )
    lines.append(f"  required_files_total: {item.get('required_files_total') or 0}")

    lines.append("  existing_files:")
    for name in item.get("existing_files", []):
        lines.append(f"    - {name}")

    if item.get("missing_files"):
        lines.append("  missing_files:")
        for name in item["missing_files"]:
            lines.append(f"    - {name}")
    else:
        lines.append("  missing_files: none")

    return "\n".join(lines) + "\n"
PY_EOF

"$PYBIN" - "$CLI_FILE" <<'PY_EOF'
from pathlib import Path
import sys

path = Path(sys.argv[1])
text = path.read_text(encoding="utf-8")

import_block = """from .bootstrap_packages import (
    DEFAULT_BOOTSTRAP_PACKAGES_ROOT,
    collect_bootstrap_package_summary,
    list_bootstrap_packages,
    render_bootstrap_package_summary,
    render_bootstrap_packages_list,
)
"""

if import_block not in text:
    anchor = "from .path_abstraction import (\n"
    idx = text.find(anchor)
    if idx == -1:
        raise SystemExit("path_abstraction import anchor not found in cli.py")
    text = text[:idx] + import_block + text[idx:]

if "list-bootstrap-packages" not in text:
    marker = "\n    return parser\n"
    insertion = """
    list_bootstrap_packages_cmd = subparsers.add_parser(
        "list-bootstrap-packages",
        help="List bootstrap packages from a packages root",
    )
    list_bootstrap_packages_cmd.add_argument(
        "packages_root",
        nargs="?",
        default=DEFAULT_BOOTSTRAP_PACKAGES_ROOT,
        help="Root directory with bootstrap packages",
    )

    show_bootstrap_package_summary_cmd = subparsers.add_parser(
        "show-bootstrap-package-summary",
        help="Show summary for a bootstrap package directory",
    )
    show_bootstrap_package_summary_cmd.add_argument(
        "package_dir",
        help="Bootstrap package directory",
    )
"""
    if marker not in text:
        raise SystemExit("return parser marker not found")
    text = text.replace(marker, insertion + marker, 1)

dispatch_old = """    if args.command == "split-absolute-path":
        return cmd_split_absolute_path(args)

    parser.error(f"Unknown command: {args.command}")
    return 2
"""
dispatch_new = """    if args.command == "split-absolute-path":
        return cmd_split_absolute_path(args)
    if args.command == "list-bootstrap-packages":
        return cmd_list_bootstrap_packages(args)
    if args.command == "show-bootstrap-package-summary":
        return cmd_show_bootstrap_package_summary(args)

    parser.error(f"Unknown command: {args.command}")
    return 2
"""
if dispatch_old not in text:
    raise SystemExit("dispatch block not found")
text = text.replace(dispatch_old, dispatch_new, 1)

helper_anchor = """

def _db_from_args(args) -> Database:
"""
helper_insertion = """

def cmd_list_bootstrap_packages(args) -> int:
    items = list_bootstrap_packages(args.packages_root)
    print(render_bootstrap_packages_list(items), end="")
    return 0


def cmd_show_bootstrap_package_summary(args) -> int:
    item = collect_bootstrap_package_summary(args.package_dir)
    print(render_bootstrap_package_summary(item), end="")
    return 0


def _db_from_args(args) -> Database:
"""
if helper_anchor not in text:
    raise SystemExit("_db_from_args anchor not found")
text = text.replace(helper_anchor, helper_insertion, 1)

path.write_text(text, encoding="utf-8")
PY_EOF

echo "Created docs:"
echo "  $DOC_DIR/1058-1104-2026-cycle-open-bootstrap-summary-bridge.md"
echo "  $DOC_DIR/1068-1104-2026-technical-task-bootstrap-summary-bridge.md"
echo "  $DOC_DIR/1078-1104-2026-mvp-plan-bootstrap-summary-bridge.md"
echo "  $DOC_DIR/1088-1104-2026-task-package-bootstrap-summary-bridge.md"
echo
echo "Patched repo files:"
echo "  $BOOT_FILE"
echo "  $CLI_FILE"
echo
echo "Backup:"
echo "  $BACKUP_DIR/cli.py.$STAMP.bak"
