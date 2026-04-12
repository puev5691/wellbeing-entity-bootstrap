from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path

from .classify_files import classify_file


@dataclass(slots=True)
class DraftCopyMapEntry:
    source_filename: str
    suggested_target_relative_directory: str


EXCLUDED_FILE_TYPES = {
    "readme",
    "copy_map",
    "copy_map_generated",
    "chat_card",
    "script",
    "scratch",
    "demo",
    "noncanonical_name",
}


def should_exclude_file(path: Path) -> bool:
    classified = classify_file(path)
    return classified.file_type in EXCLUDED_FILE_TYPES


def suggest_target_directory(filename: str) -> str:
    lower_name = filename.lower()

    if any(token in lower_name for token in ("scene", "story", "synopsis", "media", "literary")):
        return "04_DOCS/media"

    if any(token in lower_name for token in ("log", "journal", "summary", "instruction", "regulation")):
        return "09_ADMIN/chat_entity_bootstrap"

    if any(token in lower_name for token in ("technical-specification", "entity-model", "mvp-plan", "code-structure", "sqlite-schema", "python-code-draft")):
        return "09_ADMIN/chat_entity_bootstrap"

    return ""


def collect_draft_copy_map_entries(package_path: str | Path) -> list[DraftCopyMapEntry]:
    package_dir = Path(package_path).expanduser().resolve()
    if not package_dir.exists() or not package_dir.is_dir():
        raise FileNotFoundError(f"Chat package directory not found: {package_dir}")

    entries: list[DraftCopyMapEntry] = []

    for path in sorted(package_dir.iterdir(), key=lambda p: p.name.lower()):
        if not path.is_file():
            continue

        if should_exclude_file(path):
            continue

        entries.append(
            DraftCopyMapEntry(
                source_filename=path.name,
                suggested_target_relative_directory=suggest_target_directory(path.name),
            )
        )

    return entries


def render_draft_copy_map(entries: list[DraftCopyMapEntry]) -> str:
    lines = ["# filename<TAB>relative-canonical-directory"]
    for entry in entries:
        lines.append(f"{entry.source_filename}\t{entry.suggested_target_relative_directory}")
    return "\n".join(lines) + "\n"
