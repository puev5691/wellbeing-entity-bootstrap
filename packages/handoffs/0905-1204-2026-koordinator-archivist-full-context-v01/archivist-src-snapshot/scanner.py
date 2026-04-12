from __future__ import annotations

import hashlib
from datetime import datetime, timezone
from pathlib import Path
from typing import Iterator

from .constants import (
    CHAT_CARD_FILENAME,
    CHAT_README_FILENAME,
    COPY_MAP_FILENAME,
    DEFAULT_PROJECT_CONTOURS,
    SCAN_STATE_OK,
)
from .models import FileRecord
from .utils import lower_extension, now_iso, safe_relative_path


def iter_files(
    roots: list[str],
    exclude_dirs: list[str],
    exclude_paths: list[str] | None = None,
) -> Iterator[Path]:
    excluded_dir_names = set(exclude_dirs)
    excluded_path_prefixes = [
        str(Path(p).expanduser().resolve()) for p in (exclude_paths or [])
    ]

    for root_str in roots:
        root = Path(root_str).expanduser().resolve()
        if not root.exists() or not root.is_dir():
            continue

        for path in root.rglob("*"):
            if not path.is_file():
                continue
            if should_skip_path(path, excluded_dir_names, excluded_path_prefixes):
                continue
            yield path


def should_skip_path(
    path: Path,
    exclude_dirs: set[str],
    exclude_paths: list[str],
) -> bool:
    resolved = str(path.resolve())

    if any(part in exclude_dirs for part in path.parts):
        return True

    for prefix in exclude_paths:
        if resolved == prefix or resolved.startswith(prefix + "/"):
            return True

    return False


def detect_project_contour(path: Path) -> str | None:
    for part in path.parts:
        if part in DEFAULT_PROJECT_CONTOURS:
            return part
    return None


def detect_file_flags(path: Path) -> dict[str, bool]:
    name = path.name
    return {
        "is_chat_readme": name == CHAT_README_FILENAME,
        "is_copy_map": name == COPY_MAP_FILENAME,
        "is_chat_card": name == CHAT_CARD_FILENAME,
    }


def compute_sha256(path: Path) -> str | None:
    try:
        digest = hashlib.sha256()
        with path.open("rb") as fh:
            for chunk in iter(lambda: fh.read(1024 * 1024), b""):
                digest.update(chunk)
        return digest.hexdigest()
    except Exception:
        return None


def now_iso_from_timestamp(timestamp: float) -> str:
    return datetime.fromtimestamp(timestamp, tz=timezone.utc).replace(microsecond=0).isoformat()


def build_file_record(path: Path, project_root: Path | None = None) -> FileRecord:
    stat = path.stat()
    flags = detect_file_flags(path)

    return FileRecord(
        full_path=str(path.resolve()),
        relative_path=safe_relative_path(path, project_root),
        name=path.name,
        extension=lower_extension(path),
        size_bytes=stat.st_size,
        modified_at=now_iso_from_timestamp(stat.st_mtime),
        indexed_at=now_iso(),
        hash_sha256=compute_sha256(path),
        text_excerpt=None,
        full_text=None,
        text_available=False,
        project_contour=detect_project_contour(path),
        chat_package_path=None,
        is_chat_readme=flags["is_chat_readme"],
        is_copy_map=flags["is_copy_map"],
        is_chat_card=flags["is_chat_card"],
        scan_state=SCAN_STATE_OK,
        error_note=None,
    )
