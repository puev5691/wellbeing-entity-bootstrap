#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

DOC_DIR="/storage/emulated/0/Documents/Blagopoluchie/00_INBOX/my-structure/chats-gpt-name/revision-of-the-project-structure"
REPO="/storage/emulated/0/Documents/repos/wellbeing-archivist"
CLI_FILE="$REPO/src/archivist/cli.py"
SERVICE_FILE="$REPO/src/archivist/service_layer.py"
BACKUP_DIR="$REPO/.wb-backups-query-layer"

mkdir -p "$DOC_DIR" "$BACKUP_DIR"

for f in "$CLI_FILE" "$SERVICE_FILE"; do
  if [ ! -f "$f" ]; then
    echo "Required file not found: $f" >&2
    exit 1
  fi
done

PYBIN=""
if command -v python3 >/dev/null 2>&1; then
  PYBIN="python3"
elif command -v python >/dev/null 2>&1; then
  PYBIN="python"
else
  echo "Neither python3 nor python is available." >&2
  exit 127
fi

cat > "$DOC_DIR/1108-1204-2026-cycle-open-bootstrap-service-query.md" <<'MD_EOF'
# Открытие цикла: bootstrap service-query bridge

Дата: 2026-04-12
Статус: working
Контур: revision-of-the-project-structure
Назначение: открыть цикл добавления машинно-читаемого JSON-доступа к bootstrap packages через service-query Архивариуса

artifact_type: cycle_plan
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 1098-1104-2026-bootstrap-summary-bridge-success-log.md

human_owner: ЗУМ
human_responsible: ЗУМ

entity_author: Координатор
entity_role: корневая координирующая Сущность

tooling_origin: ChatGPT
generation_mode: interactive collaborative drafting

source_chat_contour: revision-of-the-project-structure
bootstrap_package_id: not_applicable

approval_status: working
responsibility_boundary: техническая черновая сборка могла выполняться машинным средством; утверждение и практическое применение результата остаются за человеком-ответственным

## Цель цикла

Добавить в Архивариус JSON-запросы service-query для bootstrap packages, чтобы их могли использовать не только люди через CLI, но и другие системные контуры.
MD_EOF

cat > "$DOC_DIR/1118-1204-2026-technical-task-bootstrap-service-query.md" <<'MD_EOF'
# Техническое задание: bootstrap service-query bridge

Дата: 2026-04-12
Статус: working
Контур: revision-of-the-project-structure
Назначение: задать инженерную задачу на добавление service-query для bootstrap packages

artifact_type: specification
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 1108-1204-2026-cycle-open-bootstrap-service-query.md

## Требуется

Добавить в service-query два query type:

- bootstrap-packages
- bootstrap-package-summary

## Критерий успеха

Архивариус должен уметь возвращать JSON:
- со списком bootstrap packages
- со сводкой по одному bootstrap package
MD_EOF

cat > "$DOC_DIR/1128-1204-2026-mvp-plan-bootstrap-service-query.md" <<'MD_EOF'
# MVP-план: bootstrap service-query bridge

Дата: 2026-04-12
Статус: working
Контур: revision-of-the-project-structure
Назначение: определить минимальный объём машинно-читаемого доступа к bootstrap packages

artifact_type: mvp_definition
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 1118-1204-2026-technical-task-bootstrap-service-query.md

## MVP

1. service-query bootstrap-packages
2. service-query bootstrap-package-summary
3. использование уже существующего bootstrap parser без тяжёлой дополнительной валидации
MD_EOF

cat > "$DOC_DIR/1138-1204-2026-task-package-bootstrap-service-query.md" <<'MD_EOF'
# Пакет задач: bootstrap service-query bridge

Дата: 2026-04-12
Статус: working
Контур: revision-of-the-project-structure
Назначение: зафиксировать пакет задач для добавления JSON-доступа к bootstrap packages

artifact_type: task_package
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 1128-1204-2026-mvp-plan-bootstrap-service-query.md

## Задача 1
Добавить опции parser для service-query bootstrap packages.

## Задача 2
Расширить service_layer.py новыми query type.

## Задача 3
Проверить JSON-ответы на bootstrap repository.
MD_EOF

STAMP="$(date +%Y%m%d-%H%M%S)"
cp "$CLI_FILE" "$BACKUP_DIR/cli.py.$STAMP.bak"
cp "$SERVICE_FILE" "$BACKUP_DIR/service_layer.py.$STAMP.bak"

"$PYBIN" - "$CLI_FILE" <<'PY_EOF'
from pathlib import Path
import sys

path = Path(sys.argv[1])
text = path.read_text(encoding="utf-8")

marker = '    service_query_cmd.add_argument("--limit", type=int, default=10, help="Maximum number of results for list-style queries")\n'
addition = """    service_query_cmd.add_argument("--limit", type=int, default=10, help="Maximum number of results for list-style queries")
    service_query_cmd.add_argument(
        "--packages-root",
        default=DEFAULT_BOOTSTRAP_PACKAGES_ROOT,
        help="Bootstrap packages root for bootstrap service queries",
    )
    service_query_cmd.add_argument(
        "--package-dir",
        help="Bootstrap package directory for bootstrap package summary query",
    )
"""
if "--packages-root" not in text:
    if marker not in text:
        raise SystemExit("service_query parser marker not found")
    text = text.replace(marker, addition, 1)

path.write_text(text, encoding="utf-8")
PY_EOF

"$PYBIN" - "$SERVICE_FILE" <<'PY_EOF'
from pathlib import Path
import sys

path = Path(sys.argv[1])
text = path.read_text(encoding="utf-8")

import_block = """from .bootstrap_packages import (
    collect_bootstrap_package_summary,
    list_bootstrap_packages,
)
"""
if import_block not in text:
    anchor = "from .steps_registry import (\n"
    idx = text.find(anchor)
    if idx == -1:
        raise SystemExit("steps_registry import anchor not found in service_layer.py")
    text = text[:idx] + import_block + text[idx:]

helper_anchor = "def build_service_query_payload(args) -> dict[str, Any]:\n"
if "def build_bootstrap_packages_query_payload(args) -> dict[str, Any]:" not in text:
    helpers = """
def _compact_bootstrap_item(item: dict[str, Any]) -> dict[str, Any]:
    return {
        "package_name": item.get("package_name"),
        "package_id": item.get("package_id"),
        "entity_author": item.get("entity_author"),
        "entity_role": item.get("entity_role"),
        "entity_contour": item.get("entity_contour"),
        "approval_status": item.get("approval_status"),
        "human_responsible": item.get("human_responsible"),
        "tooling_origin": item.get("tooling_origin"),
        "is_minimally_complete": item.get("is_minimally_complete"),
        "required_files_total": item.get("required_files_total"),
        "existing_files": item.get("existing_files", []),
        "missing_files": item.get("missing_files", []),
    }


def build_bootstrap_packages_query_payload(args) -> dict[str, Any]:
    items = list_bootstrap_packages(getattr(args, "packages_root", ""))
    limit = int(getattr(args, "limit", 10) or 10)
    compact_items = [_compact_bootstrap_item(item) for item in items[:limit]]

    return {
        "ok": True,
        "query_type": "bootstrap-packages",
        "packages_root": getattr(args, "packages_root", ""),
        "total": len(items),
        "returned": len(compact_items),
        "data": {
            "items": compact_items,
        },
    }


def build_bootstrap_package_summary_query_payload(args) -> dict[str, Any]:
    package_dir = getattr(args, "package_dir", None)
    if not package_dir:
        return {
            "ok": False,
            "query_type": "bootstrap-package-summary",
            "error": "package_dir is required",
        }

    item = collect_bootstrap_package_summary(package_dir)
    return {
        "ok": True,
        "query_type": "bootstrap-package-summary",
        "package_dir": package_dir,
        "data": item,
    }


"""
    if helper_anchor not in text:
        raise SystemExit("build_service_query_payload anchor not found")
    text = text.replace(helper_anchor, helpers + helper_anchor, 1)

old_tail = """def build_service_query_payload(args) -> dict[str, Any]:
    query_type = getattr(args, "query_type", None)
    if query_type == "entity-summary":
        return build_entity_summary_query_payload(args)
    raise ValueError(f"Unsupported service query type: {query_type}")
"""
new_tail = """def build_service_query_payload(args) -> dict[str, Any]:
    query_type = getattr(args, "query_type", None)
    if query_type == "entity-summary":
        return build_entity_summary_query_payload(args)
    if query_type == "bootstrap-packages":
        return build_bootstrap_packages_query_payload(args)
    if query_type == "bootstrap-package-summary":
        return build_bootstrap_package_summary_query_payload(args)
    raise ValueError(f"Unsupported service query type: {query_type}")
"""
if old_tail not in text:
    raise SystemExit("build_service_query_payload block not found or already changed")
text = text.replace(old_tail, new_tail, 1)

path.write_text(text, encoding="utf-8")
PY_EOF

echo "Created docs:"
echo "  $DOC_DIR/1108-1204-2026-cycle-open-bootstrap-service-query.md"
echo "  $DOC_DIR/1118-1204-2026-technical-task-bootstrap-service-query.md"
echo "  $DOC_DIR/1128-1204-2026-mvp-plan-bootstrap-service-query.md"
echo "  $DOC_DIR/1138-1204-2026-task-package-bootstrap-service-query.md"
echo
echo "Patched repo files:"
echo "  $CLI_FILE"
echo "  $SERVICE_FILE"
echo
echo "Backups:"
echo "  $BACKUP_DIR/cli.py.$STAMP.bak"
echo "  $BACKUP_DIR/service_layer.py.$STAMP.bak"
