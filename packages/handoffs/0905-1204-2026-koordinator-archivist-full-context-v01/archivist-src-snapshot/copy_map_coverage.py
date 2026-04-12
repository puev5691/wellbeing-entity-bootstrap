from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path

from .classify_files import classify_package_files
from .copy_map import parse_copy_map


IGNORED_FILE_TYPES = {
    "readme",
    "copy_map",
    "copy_map_generated",
    "chat_card",
    "script",
    "scratch",
    "demo",
    "noncanonical_name",
}


@dataclass(slots=True)
class CopyMapCoverageReport:
    package_path: str
    copy_map_path: str
    covered_files: list[str]
    uncovered_files: list[str]
    missing_from_package: list[str]
    ignored_files: list[str]


def build_copy_map_coverage_report(package_path: str | Path, copy_map_path: str | Path) -> CopyMapCoverageReport:
    package_dir = Path(package_path).expanduser().resolve()
    copy_map_file = Path(copy_map_path).expanduser().resolve()

    if not package_dir.exists() or not package_dir.is_dir():
        raise FileNotFoundError(f"Chat package directory not found: {package_dir}")

    if not copy_map_file.exists():
        raise FileNotFoundError(f"Copy map file not found: {copy_map_file}")

    classified = classify_package_files(package_dir)
    entries = parse_copy_map(copy_map_file)

    actual_files = {item.filename: item for item in classified}
    mapped_files = {entry.source_filename for entry in entries}

    ignored_files = sorted(
        item.filename
        for item in classified
        if item.file_type in IGNORED_FILE_TYPES
    )

    candidate_files = sorted(
        item.filename
        for item in classified
        if item.file_type not in IGNORED_FILE_TYPES
    )

    covered_files = sorted(
        filename for filename in candidate_files if filename in mapped_files
    )

    uncovered_files = sorted(
        filename for filename in candidate_files if filename not in mapped_files
    )

    missing_from_package = sorted(
        filename for filename in mapped_files if filename not in actual_files
    )

    return CopyMapCoverageReport(
        package_path=str(package_dir),
        copy_map_path=str(copy_map_file),
        covered_files=covered_files,
        uncovered_files=uncovered_files,
        missing_from_package=missing_from_package,
        ignored_files=ignored_files,
    )
