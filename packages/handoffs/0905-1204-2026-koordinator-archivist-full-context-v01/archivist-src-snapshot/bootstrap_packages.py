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
