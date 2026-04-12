from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path

from .copy_map import parse_copy_map
from .copy_map_recommendations import build_copy_map_recommendations


@dataclass(slots=True)
class CopyMapCandidateLine:
    source_filename: str
    target_relative_directory: str
    origin: str


def build_copy_map_candidate(
    package_path: str | Path,
    copy_map_path: str | Path,
) -> list[CopyMapCandidateLine]:
    existing_entries = parse_copy_map(copy_map_path)
    recommendations = build_copy_map_recommendations(package_path, copy_map_path)

    merged: dict[str, CopyMapCandidateLine] = {}

    for entry in existing_entries:
        merged[entry.source_filename] = CopyMapCandidateLine(
            source_filename=entry.source_filename,
            target_relative_directory=entry.target_relative_directory,
            origin="existing",
        )

    for entry in recommendations:
        if entry.source_filename in merged:
            continue

        merged[entry.source_filename] = CopyMapCandidateLine(
            source_filename=entry.source_filename,
            target_relative_directory=entry.suggested_target_relative_directory,
            origin="recommended",
        )

    return sorted(merged.values(), key=lambda item: item.source_filename.lower())


def render_copy_map_candidate(entries: list[CopyMapCandidateLine]) -> str:
    lines = ["# filename<TAB>relative-canonical-directory"]
    for entry in entries:
        lines.append(f"{entry.source_filename}\t{entry.target_relative_directory}")
    return "\n".join(lines) + "\n"
