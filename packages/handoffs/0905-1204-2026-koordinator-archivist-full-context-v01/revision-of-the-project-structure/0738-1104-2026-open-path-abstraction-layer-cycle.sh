#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

DOC_DIR="/storage/emulated/0/Documents/Blagopoluchie/00_INBOX/my-structure/chats-gpt-name/revision-of-the-project-structure"
REPO="/storage/emulated/0/Documents/repos/wellbeing-archivist"
CLI_FILE="$REPO/src/archivist/cli.py"
PATH_FILE="$REPO/src/archivist/path_abstraction.py"
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

cat > "$DOC_DIR/0738-1104-2026-cycle-open-path-abstraction-layer.md" <<'MD_EOF'
# Открытие цикла: path abstraction layer

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: открыть цикл введения слоя абстракции путей и корневых переменных для переносимости Архивариуса

artifact_type: cycle_plan
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0728-1104-2026-service-layer-extraction-success-log.md
- 0618-1104-2026-technical-task-local-service-layer.md

## Основная мысль цикла

Архивариус уже полезен, но пока опирается на абсолютные пути. Это удобно на одном устройстве и опасно при переносе на другое железо.

Следующий шаг состоит в том, чтобы ввести слой логических корней и резолвинг путей через них.

## Цель цикла

Добавить:
- логические root keys;
- резолвер логического пути в абсолютный;
- обратное разложение абсолютного пути в root key и relative path;
- первые CLI-команды для проверки path abstraction layer.

## Критерий успеха

Цикл считается завершённым, если Архивариус умеет:
- показать набор корней;
- собрать абсолютный путь из root key и relative path;
- разложить абсолютный путь обратно в root key и relative path.
MD_EOF

cat > "$DOC_DIR/0748-1104-2026-technical-task-path-abstraction-layer.md" <<'MD_EOF'
# Техническое задание: path abstraction layer

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: задать инженерную задачу на введение слоя логических корней и резолвинга путей

artifact_type: specification
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0738-1104-2026-cycle-open-path-abstraction-layer.md

## Требуется

1. Создать модуль path abstraction.
2. Ввести корни:
   - documents_root
   - repos_root
   - project_root
3. Поддержать приоритеты источников:
   - defaults
   - environment variables
   - config JSON key `path_roots`
   - явные CLI overrides
4. Реализовать:
   - show roots
   - resolve logical path
   - split absolute path

## Ограничения

На этом этапе не требуется:
- миграция существующей БД
- немедленная замена всех абсолютных путей в проекте
- перепроектирование service-layer
- HTTP или внешний протокол

## Критерий успеха

После реализации path abstraction layer должен работать как отдельный строительный слой для будущей переносимости Архивариуса.
MD_EOF

cat > "$DOC_DIR/0758-1104-2026-mvp-plan-path-abstraction-layer.md" <<'MD_EOF'
# MVP-план: path abstraction layer

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: определить минимально достаточный объём первого шага по path abstraction layer

artifact_type: mvp_definition
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0748-1104-2026-technical-task-path-abstraction-layer.md

## MVP цикла

1. Создать `src/archivist/path_abstraction.py`.
2. Реализовать:
   - `build_path_roots`
   - `resolve_logical_path`
   - `split_absolute_path`
3. Добавить CLI-команды:
   - `show-path-roots`
   - `resolve-logical-path`
   - `split-absolute-path`
4. Проверить работу на Android-путях текущего хранилища.

## Критерий завершения

MVP считается завершённым, если path abstraction layer работает как отдельный слой и даёт воспроизводимый результат на текущем устройстве.
MD_EOF

cat > "$DOC_DIR/0768-1104-2026-task-package-path-abstraction-layer.md" <<'MD_EOF'
# Пакет задач: path abstraction layer

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: зафиксировать минимальный пакет задач цикла path abstraction layer

artifact_type: task_package
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0758-1104-2026-mvp-plan-path-abstraction-layer.md

## Задача 1
Создать модуль `path_abstraction.py`.

## Задача 2
Добавить сборку набора корней.

## Задача 3
Добавить прямой и обратный резолвинг путей.

## Задача 4
Добавить CLI-команды для проверки path abstraction layer.

## Задача 5
Проверить path abstraction layer на текущем Android-хранилище.
MD_EOF

STAMP="$(date +%Y%m%d-%H%M%S)"
cp "$CLI_FILE" "$BACKUP_DIR/cli.py.$STAMP.bak"

cat > "$PATH_FILE" <<'PY_EOF'
from __future__ import annotations

import json
import os
from pathlib import Path
from typing import Any

DEFAULT_ENV_KEYS = {
    "documents_root": "WB_DOCUMENTS_ROOT",
    "repos_root": "WB_REPOS_ROOT",
    "project_root": "WB_PROJECT_ROOT",
}


def _norm_path(value: str) -> str:
    expanded = os.path.expanduser(value)
    return os.path.normpath(os.path.abspath(expanded))


def _read_json_config(config_path: str | None) -> dict[str, Any]:
    if not config_path:
        return {}
    path = Path(config_path)
    if not path.exists():
        return {}
    try:
        data = json.loads(path.read_text(encoding="utf-8"))
    except Exception:
        return {}
    return data if isinstance(data, dict) else {}


def parse_root_overrides(items: list[str] | None) -> dict[str, str]:
    result: dict[str, str] = {}
    for item in items or []:
        if "=" not in item:
            raise ValueError(f"Invalid root override: {item}")
        key, value = item.split("=", 1)
        key = key.strip()
        value = value.strip()
        if not key or not value:
            raise ValueError(f"Invalid root override: {item}")
        result[key] = value
    return result


def build_path_roots(
    *,
    config_path: str | None = None,
    overrides: dict[str, str] | None = None,
) -> dict[str, str]:
    roots: dict[str, str] = {
        "documents_root": "/storage/emulated/0/Documents",
        "repos_root": "/storage/emulated/0/Documents/repos",
    }

    for root_key, env_key in DEFAULT_ENV_KEYS.items():
        env_value = os.getenv(env_key)
        if env_value:
            roots[root_key] = env_value

    cfg = _read_json_config(config_path)
    cfg_roots = cfg.get("path_roots")
    if isinstance(cfg_roots, dict):
        for key, value in cfg_roots.items():
            if isinstance(key, str) and isinstance(value, str) and value.strip():
                roots[key] = value.strip()

    if overrides:
        for key, value in overrides.items():
            roots[key] = value

    if "project_root" not in roots:
        roots["project_root"] = str(Path(roots["documents_root"]) / "Blagopoluchie")

    return {key: _norm_path(value) for key, value in sorted(roots.items())}


def resolve_logical_path(
    roots: dict[str, str],
    *,
    root_key: str,
    relative_path: str,
) -> dict[str, str]:
    if root_key not in roots:
        raise KeyError(f"Unknown root key: {root_key}")
    base = roots[root_key]
    clean_relative = relative_path.lstrip("/").strip()
    if clean_relative:
        absolute_path = os.path.join(base, clean_relative)
    else:
        absolute_path = base
    return {
        "root_key": root_key,
        "relative_path": clean_relative,
        "absolute_path": _norm_path(absolute_path),
    }


def split_absolute_path(
    roots: dict[str, str],
    *,
    absolute_path: str,
) -> dict[str, str] | None:
    target = _norm_path(absolute_path)
    matches: list[tuple[int, str, str]] = []

    for key, root in roots.items():
        root_norm = _norm_path(root)
        if target == root_norm:
            matches.append((len(root_norm), key, ""))
            continue
        prefix = root_norm + os.sep
        if target.startswith(prefix):
            rel = os.path.relpath(target, root_norm)
            if rel == ".":
                rel = ""
            matches.append((len(root_norm), key, rel))

    if not matches:
        return None

    _, best_key, best_relative = max(matches, key=lambda item: item[0])
    return {
        "root_key": best_key,
        "relative_path": best_relative,
        "absolute_path": target,
    }


def render_path_roots(roots: dict[str, str]) -> str:
    lines: list[str] = []
    lines.append("Path roots")
    lines.append(f"  total: {len(roots)}")
    lines.append("")
    for key in sorted(roots.keys()):
        lines.append(f"{key}: {roots[key]}")
    return "\\n".join(lines) + "\\n"


def render_resolved_path(item: dict[str, str]) -> str:
    lines = [
        "Resolved logical path",
        f"  root_key: {item['root_key']}",
        f"  relative_path: {item['relative_path']}",
        f"  absolute_path: {item['absolute_path']}",
    ]
    return "\\n".join(lines) + "\\n"


def render_split_path(item: dict[str, str] | None) -> str:
    if item is None:
        return "Split absolute path\\n  state: no matching root\\n"
    lines = [
        "Split absolute path",
        f"  root_key: {item['root_key']}",
        f"  relative_path: {item['relative_path']}",
        f"  absolute_path: {item['absolute_path']}",
    ]
    return "\\n".join(lines) + "\\n"
PY_EOF

"$PYBIN" - "$CLI_FILE" <<'PY_EOF'
from pathlib import Path
import sys

path = Path(sys.argv[1])
text = path.read_text(encoding="utf-8")

if "from .path_abstraction import (" not in text:
    anchor = "from .service_layer import build_service_query_payload\n"
    if anchor not in text:
        raise SystemExit("Import anchor not found in cli.py")
    text = text.replace(
        anchor,
        anchor + """from .path_abstraction import (
    build_path_roots,
    parse_root_overrides,
    render_path_roots,
    render_resolved_path,
    render_split_path,
    resolve_logical_path,
    split_absolute_path,
)
""",
        1,
    )

if "show-path-roots" not in text:
    parser_anchor = """    service_query_cmd.add_argument("--limit", type=int, default=10, help="Maximum number of results for list-style queries")

    return parser
"""
    parser_addition = """    service_query_cmd.add_argument("--limit", type=int, default=10, help="Maximum number of results for list-style queries")

    show_path_roots_cmd = subparsers.add_parser(
        "show-path-roots",
        help="Show configured and resolved logical path roots",
    )
    show_path_roots_cmd.add_argument(
        "--root",
        action="append",
        default=[],
        help="Override root in KEY=VALUE form; may be repeated",
    )

    resolve_logical_path_cmd = subparsers.add_parser(
        "resolve-logical-path",
        help="Resolve root key and relative path into absolute path",
    )
    resolve_logical_path_cmd.add_argument("root_key", help="Logical root key")
    resolve_logical_path_cmd.add_argument("relative_path", help="Relative path inside the root")
    resolve_logical_path_cmd.add_argument(
        "--root",
        action="append",
        default=[],
        help="Override root in KEY=VALUE form; may be repeated",
    )

    split_absolute_path_cmd = subparsers.add_parser(
        "split-absolute-path",
        help="Split absolute path into root key and relative path",
    )
    split_absolute_path_cmd.add_argument("absolute_path", help="Absolute path to split")
    split_absolute_path_cmd.add_argument(
        "--root",
        action="append",
        default=[],
        help="Override root in KEY=VALUE form; may be repeated",
    )

    return parser
"""
    if parser_anchor not in text:
        raise SystemExit("Parser anchor not found in cli.py")
    text = text.replace(parser_anchor, parser_addition, 1)

    dispatch_anchor = """    if args.command == "service-query":
        return cmd_service_query(args)

    parser.error(f"Unknown command: {args.command}")
    return 2
"""
    dispatch_addition = """    if args.command == "service-query":
        return cmd_service_query(args)
    if args.command == "show-path-roots":
        return cmd_show_path_roots(args)
    if args.command == "resolve-logical-path":
        return cmd_resolve_logical_path(args)
    if args.command == "split-absolute-path":
        return cmd_split_absolute_path(args)

    parser.error(f"Unknown command: {args.command}")
    return 2
"""
    if dispatch_anchor not in text:
        raise SystemExit("Dispatch anchor not found in cli.py")
    text = text.replace(dispatch_anchor, dispatch_addition, 1)

    handler_anchor = """

def _db_from_args(args) -> Database:
"""
    handler_addition = """

def _build_path_roots_from_args(args) -> dict[str, str]:
    overrides = parse_root_overrides(getattr(args, "root", []))
    return build_path_roots(
        config_path=getattr(args, "config_path", None),
        overrides=overrides,
    )


def cmd_show_path_roots(args) -> int:
    roots = _build_path_roots_from_args(args)
    print(render_path_roots(roots), end="")
    return 0


def cmd_resolve_logical_path(args) -> int:
    roots = _build_path_roots_from_args(args)
    item = resolve_logical_path(
        roots,
        root_key=args.root_key,
        relative_path=args.relative_path,
    )
    print(render_resolved_path(item), end="")
    return 0


def cmd_split_absolute_path(args) -> int:
    roots = _build_path_roots_from_args(args)
    item = split_absolute_path(
        roots,
        absolute_path=args.absolute_path,
    )
    print(render_split_path(item), end="")
    return 0


def _db_from_args(args) -> Database:
"""
    if handler_anchor not in text:
        raise SystemExit("Handler anchor not found in cli.py")
    text = text.replace(handler_anchor, handler_addition, 1)

path.write_text(text, encoding="utf-8")
PY_EOF

echo "Created docs:"
echo "  $DOC_DIR/0738-1104-2026-cycle-open-path-abstraction-layer.md"
echo "  $DOC_DIR/0748-1104-2026-technical-task-path-abstraction-layer.md"
echo "  $DOC_DIR/0758-1104-2026-mvp-plan-path-abstraction-layer.md"
echo "  $DOC_DIR/0768-1104-2026-task-package-path-abstraction-layer.md"
echo
echo "Patched repo files:"
echo "  $PATH_FILE"
echo "  $CLI_FILE"
echo
echo "Backup:"
echo "  $BACKUP_DIR/cli.py.$STAMP.bak"
