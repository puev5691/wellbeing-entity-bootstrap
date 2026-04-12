from __future__ import annotations
from dataclasses import dataclass
from pathlib import Path

from .classify_files import classify_file
from .copy_map_coverage import build_copy_map_coverage_report
from .draft_copy_map import suggest_target_directory


@dataclass(slots=True)
class RecommendedCopyMapEntry:
    source_filename: str
    suggested_target_relative_directory: str
    file_type: str
    reason: str


def build_copy_map_recommendations(
    package_path: str | Path,
    copy_map_path: str | Path,
) -> list[RecommendedCopyMapEntry]:
    report = build_copy_map_coverage_report(package_path, copy_map_path)
    package_dir = Path(package_path).expanduser().resolve()

    recommendations: list[RecommendedCopyMapEntry] = []

    for filename in report.uncovered_files:
        path = package_dir / filename
        classified = classify_file(path)

        suggested_target = suggest_target_directory(filename)

        if not suggested_target:
            if classified.file_type == "literary":
                suggested_target = "04_DOCS/media"
            elif classified.file_type in {"engineering", "log"}:
                suggested_target = "09_ADMIN/chat_entity_bootstrap"
            elif classified.file_type == "scratch":
                suggested_target = ""

        recommendations.append(
            RecommendedCopyMapEntry(
                source_filename=filename,
                suggested_target_relative_directory=suggested_target,
                file_type=classified.file_type,
                reason=classified.reason,
            )
        )

    return recommendations


def render_copy_map_recommendations(entries: list[RecommendedCopyMapEntry]) -> str:
    lines = ["# filename<TAB>relative-canonical-directory"]
    for entry in entries:
        lines.append(f"{entry.source_filename}\t{entry.suggested_target_relative_directory}")
    return "\n".join(lines) + "\n"
