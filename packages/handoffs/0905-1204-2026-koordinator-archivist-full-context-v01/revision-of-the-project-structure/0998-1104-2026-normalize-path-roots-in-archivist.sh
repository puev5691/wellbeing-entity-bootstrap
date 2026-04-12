#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

REPO="/storage/emulated/0/Documents/repos/wellbeing-archivist"
CLI_FILE="$REPO/src/archivist/cli.py"
PATH_FILE="$REPO/src/archivist/path_abstraction.py"
BACKUP_DIR="$REPO/.wb-backups-query-layer"

mkdir -p "$BACKUP_DIR"

for f in "$CLI_FILE" "$PATH_FILE"; do
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

STAMP="$(date +%Y%m%d-%H%M%S)"
cp "$CLI_FILE" "$BACKUP_DIR/cli.py.$STAMP.bak"
cp "$PATH_FILE" "$BACKUP_DIR/path_abstraction.py.$STAMP.bak"

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


def _set_root(
    details: dict[str, dict[str, str]],
    *,
    key: str,
    value: str,
    source: str,
) -> None:
    details[key] = {
        "path": _norm_path(value),
        "source": source,
    }


def build_path_roots_detailed(
    *,
    config_path: str | None = None,
    overrides: dict[str, str] | None = None,
) -> dict[str, dict[str, str]]:
    details: dict[str, dict[str, str]] = {}

    _set_root(
        details,
        key="documents_root",
        value="/storage/emulated/0/Documents",
        source="default",
    )

    env_documents = os.getenv(DEFAULT_ENV_KEYS["documents_root"])
    if env_documents:
        _set_root(
            details,
            key="documents_root",
            value=env_documents,
            source=f"env:{DEFAULT_ENV_KEYS['documents_root']}",
        )

    cfg = _read_json_config(config_path)
    cfg_roots = cfg.get("path_roots")
    if isinstance(cfg_roots, dict):
        value = cfg_roots.get("documents_root")
        if isinstance(value, str) and value.strip():
            _set_root(
                details,
                key="documents_root",
                value=value.strip(),
                source="config:path_roots.documents_root",
            )

    if overrides and "documents_root" in overrides:
        _set_root(
            details,
            key="documents_root",
            value=overrides["documents_root"],
            source="override:documents_root",
        )

    documents_root = details["documents_root"]["path"]

    _set_root(
        details,
        key="repos_root",
        value=str(Path(documents_root) / "repos"),
        source="derived:documents_root/repos",
    )

    env_repos = os.getenv(DEFAULT_ENV_KEYS["repos_root"])
    if env_repos:
        _set_root(
            details,
            key="repos_root",
            value=env_repos,
            source=f"env:{DEFAULT_ENV_KEYS['repos_root']}",
        )

    if isinstance(cfg_roots, dict):
        value = cfg_roots.get("repos_root")
        if isinstance(value, str) and value.strip():
            _set_root(
                details,
                key="repos_root",
                value=value.strip(),
                source="config:path_roots.repos_root",
            )

    if overrides and "repos_root" in overrides:
        _set_root(
            details,
            key="repos_root",
            value=overrides["repos_root"],
            source="override:repos_root",
        )

    _set_root(
        details,
        key="project_root",
        value=str(Path(documents_root) / "Blagopoluchie"),
        source="derived:documents_root/Blagopoluchie",
    )

    env_project = os.getenv(DEFAULT_ENV_KEYS["project_root"])
    if env_project:
        _set_root(
            details,
            key="project_root",
            value=env_project,
            source=f"env:{DEFAULT_ENV_KEYS['project_root']}",
        )

    if isinstance(cfg_roots, dict):
        value = cfg_roots.get("project_root")
        if isinstance(value, str) and value.strip():
            _set_root(
                details,
                key="project_root",
                value=value.strip(),
                source="config:path_roots.project_root",
            )

        for key, value in cfg_roots.items():
            if key in details:
                continue
            if isinstance(key, str) and isinstance(value, str) and value.strip():
                _set_root(
                    details,
                    key=key,
                    value=value.strip(),
                    source=f"config:path_roots.{key}",
                )

    if overrides:
        for key, value in overrides.items():
            if key in {"documents_root", "repos_root", "project_root"}:
                continue
            _set_root(
                details,
                key=key,
                value=value,
                source=f"override:{key}",
            )

    return {key: details[key] for key in sorted(details.keys())}


def build_path_roots(
    *,
    config_path: str | None = None,
    overrides: dict[str, str] | None = None,
) -> dict[str, str]:
    details = build_path_roots_detailed(
        config_path=config_path,
        overrides=overrides,
    )
    return {key: item["path"] for key, item in details.items()}


def collect_path_root_warnings(details: dict[str, dict[str, str]]) -> list[str]:
    warnings: list[str] = []

    documents_root = details.get("documents_root", {}).get("path")
    repos_root = details.get("repos_root", {}).get("path")
    project_root = details.get("project_root", {}).get("path")

    if documents_root and repos_root:
        expected = _norm_path(str(Path(documents_root) / "repos"))
        if repos_root != expected:
            warnings.append(
                f"repos_root differs from canonical documents_root/repos: expected {expected}"
            )

    if documents_root and project_root:
        expected = _norm_path(str(Path(documents_root) / "Blagopoluchie"))
        if project_root != expected:
            warnings.append(
                f"project_root differs from canonical documents_root/Blagopoluchie: expected {expected}"
            )
        if not (
            project_root == documents_root
            or project_root.startswith(documents_root + os.sep)
        ):
            warnings.append(
                "project_root is outside documents_root hierarchy"
            )

    return warnings


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


def render_path_roots(details_or_roots: dict[str, Any]) -> str:
    if details_or_roots and isinstance(next(iter(details_or_roots.values())), dict):
        details = details_or_roots  # type: ignore[assignment]
    else:
        details = {
            key: {"path": value, "source": "unknown"}
            for key, value in details_or_roots.items()
        }

    lines: list[str] = []
    lines.append("Path roots")
    lines.append(f"  total: {len(details)}")
    lines.append("")

    for key in sorted(details.keys()):
        item = details[key]
        lines.append(f"{key}: {item['path']}")
        lines.append(f"  source: {item.get('source', 'unknown')}")

    warnings = collect_path_root_warnings(details)
    if warnings:
        lines.append("")
        lines.append("Warnings:")
        for item in warnings:
            lines.append(f"- {item}")

    return "\n".join(lines) + "\n"


def render_resolved_path(item: dict[str, str]) -> str:
    lines = [
        "Resolved logical path",
        f"  root_key: {item['root_key']}",
        f"  relative_path: {item['relative_path']}",
        f"  absolute_path: {item['absolute_path']}",
    ]
    return "\n".join(lines) + "\n"


def render_split_path(item: dict[str, str] | None) -> str:
    if item is None:
        return "Split absolute path\n  state: no matching root\n"
    lines = [
        "Split absolute path",
        f"  root_key: {item['root_key']}",
        f"  relative_path: {item['relative_path']}",
        f"  absolute_path: {item['absolute_path']}",
    ]
    return "\n".join(lines) + "\n"
PY_EOF

"$PYBIN" - "$CLI_FILE" <<'PY_EOF'
from pathlib import Path
import re
import sys

path = Path(sys.argv[1])
text = path.read_text(encoding="utf-8")

pattern = re.compile(
    r"from \.path_abstraction import \([\s\S]*?\)\n",
    re.M,
)
replacement = """from .path_abstraction import (
    build_path_roots,
    build_path_roots_detailed,
    parse_root_overrides,
    render_path_roots,
    render_resolved_path,
    render_split_path,
    resolve_logical_path,
    split_absolute_path,
)
"""
text, count = pattern.subn(replacement, text, count=1)
if count != 1:
    raise SystemExit("path_abstraction import block not found or ambiguous")

old_helper = """def _build_path_roots_from_args(args) -> dict[str, str]:
    overrides = parse_root_overrides(getattr(args, "root", []))
    return build_path_roots(
        config_path=getattr(args, "config_path", None),
        overrides=overrides,
    )
"""

new_helper = """def _build_path_roots_from_args(args) -> dict[str, str]:
    overrides = parse_root_overrides(getattr(args, "root", []))
    return build_path_roots(
        config_path=getattr(args, "config_path", None),
        overrides=overrides,
    )


def _build_path_roots_detailed_from_args(args) -> dict[str, dict[str, str]]:
    overrides = parse_root_overrides(getattr(args, "root", []))
    return build_path_roots_detailed(
        config_path=getattr(args, "config_path", None),
        overrides=overrides,
    )
"""
if old_helper not in text:
    raise SystemExit("_build_path_roots_from_args helper not found")
text = text.replace(old_helper, new_helper, 1)

old_cmd = """def cmd_show_path_roots(args) -> int:
    roots = _build_path_roots_from_args(args)
    print(render_path_roots(roots), end="")
    return 0
"""
new_cmd = """def cmd_show_path_roots(args) -> int:
    details = _build_path_roots_detailed_from_args(args)
    print(render_path_roots(details), end="")
    return 0
"""
if old_cmd not in text:
    raise SystemExit("cmd_show_path_roots block not found")
text = text.replace(old_cmd, new_cmd, 1)

path.write_text(text, encoding="utf-8")
PY_EOF

echo "Patched:"
echo "  $PATH_FILE"
echo "  $CLI_FILE"
echo "Backups:"
echo "  $BACKUP_DIR/path_abstraction.py.$STAMP.bak"
echo "  $BACKUP_DIR/cli.py.$STAMP.bak"
