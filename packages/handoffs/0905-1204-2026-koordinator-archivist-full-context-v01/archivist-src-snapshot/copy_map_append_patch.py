from __future__ import annotations

from dataclasses import dataclass

from .copy_map_recommendations import build_copy_map_recommendations


@dataclass(slots=True)
class AppendPatchEntry:
    source_filename: str
    target_relative_directory: str
    file_type: str
    reason: str


@dataclass(slots=True)
class AppendPatchSkippedEntry:
    source_filename: str
    file_type: str
    reason: str


@dataclass(slots=True)
class CopyMapAppendPatchReport:
    append_entries: list[AppendPatchEntry]
    skipped_entries: list[AppendPatchSkippedEntry]


def build_copy_map_append_patch(
    package_path: str,
    copy_map_path: str,
) -> CopyMapAppendPatchReport:
    recommendations = build_copy_map_recommendations(package_path, copy_map_path)

    append_entries: list[AppendPatchEntry] = []
    skipped_entries: list[AppendPatchSkippedEntry] = []

    for item in recommendations:
        if item.suggested_target_relative_directory:
            append_entries.append(
                AppendPatchEntry(
                    source_filename=item.source_filename,
                    target_relative_directory=item.suggested_target_relative_directory,
                    file_type=item.file_type,
                    reason=item.reason,
                )
            )
        else:
            skipped_entries.append(
                AppendPatchSkippedEntry(
                    source_filename=item.source_filename,
                    file_type=item.file_type,
                    reason=item.reason,
                )
            )

    return CopyMapAppendPatchReport(
        append_entries=append_entries,
        skipped_entries=skipped_entries,
    )


def render_append_patch(entries: list[AppendPatchEntry]) -> str:
    lines = ["# filename<TAB>relative-canonical-directory"]
    for item in entries:
        lines.append(f"{item.source_filename}\t{item.target_relative_directory}")
    return "\n".join(lines) + "\n"
