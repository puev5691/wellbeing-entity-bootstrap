from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path


@dataclass(slots=True)
class CopyMapEntry:
    source_filename: str
    target_relative_directory: str


def parse_copy_map(path: str | Path) -> list[CopyMapEntry]:
    file_path = Path(path).expanduser().resolve()
    if not file_path.exists():
        raise FileNotFoundError(f"Copy map file not found: {file_path}")

    entries: list[CopyMapEntry] = []

    for raw_line in file_path.read_text(encoding="utf-8").splitlines():
        line = raw_line.strip()

        if not line:
            continue

        if line.startswith("#"):
            continue

        parts = line.split("\t")
        if len(parts) >= 2:
            source_filename = parts[0].strip()
            target_relative_directory = parts[1].strip()
        else:
            parts = line.split(None, 1)
            if len(parts) < 2:
                continue
            source_filename = parts[0].strip()
            target_relative_directory = parts[1].strip()

        if not source_filename or not target_relative_directory:
            continue

        entries.append(
            CopyMapEntry(
                source_filename=source_filename,
                target_relative_directory=target_relative_directory,
            )
        )

    return entries
