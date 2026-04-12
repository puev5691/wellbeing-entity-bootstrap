from __future__ import annotations

from collections import Counter
from dataclasses import dataclass

from .classify_files import ClassifiedPackageFile, classify_package_files


@dataclass(slots=True)
class PackageStatusReport:
    total_files: int
    counts: dict[str, int]
    files_by_type: dict[str, list[str]]


def build_package_status_report(package_path: str) -> PackageStatusReport:
    classified = classify_package_files(package_path)

    counter = Counter(item.file_type for item in classified)
    files_by_type: dict[str, list[str]] = {}

    for item in classified:
        files_by_type.setdefault(item.file_type, []).append(item.filename)

    for key in files_by_type:
        files_by_type[key] = sorted(files_by_type[key], key=str.lower)

    return PackageStatusReport(
        total_files=len(classified),
        counts=dict(sorted(counter.items(), key=lambda kv: kv[0])),
        files_by_type=files_by_type,
    )
