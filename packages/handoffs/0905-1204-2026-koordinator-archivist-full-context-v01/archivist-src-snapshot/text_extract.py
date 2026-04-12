from __future__ import annotations

from pathlib import Path

from .constants import (
    DEFAULT_EXCERPT_LENGTH,
    SCAN_STATE_OK,
    SCAN_STATE_READ_ERROR,
    SCAN_STATE_SKIPPED_BINARY,
    SCAN_STATE_TOO_LARGE,
    SCAN_STATE_UNSUPPORTED,
)
from .utils import normalize_newlines, trim_text


def is_text_extension(extension: str, allowed_extensions: list[str]) -> bool:
    return extension.lower() in {ext.lower() for ext in allowed_extensions}


def normalize_text(text: str) -> str:
    text = normalize_newlines(text)
    return "\n".join(line.rstrip() for line in text.split("\n")).strip()


def make_excerpt(text: str, max_length: int = DEFAULT_EXCERPT_LENGTH) -> str:
    compact = " ".join(text.split())
    return trim_text(compact, max_length)


def read_text_file(
    path: Path,
    max_size_bytes: int,
) -> tuple[bool, str | None, str | None, str, str | None]:
    try:
        if path.stat().st_size > max_size_bytes:
            return False, None, None, SCAN_STATE_TOO_LARGE, None
    except Exception as exc:
        return False, None, None, SCAN_STATE_READ_ERROR, f"{type(exc).__name__}: {exc}"

    try:
        raw = path.read_bytes()
    except Exception as exc:
        return False, None, None, SCAN_STATE_READ_ERROR, f"{type(exc).__name__}: {exc}"

    if b"\x00" in raw:
        return False, None, None, SCAN_STATE_SKIPPED_BINARY, None

    text: str | None = None
    last_error: str | None = None

    for encoding in ("utf-8", "utf-8-sig", "cp1251", "latin-1"):
        try:
            text = raw.decode(encoding)
            break
        except UnicodeDecodeError as exc:
            last_error = f"{type(exc).__name__}: {exc}"

    if text is None:
        return False, None, None, SCAN_STATE_READ_ERROR, last_error

    normalized = normalize_text(text)
    excerpt = make_excerpt(normalized)
    return True, normalized, excerpt, SCAN_STATE_OK, None


def extract_text_for_file(
    path: Path,
    extension: str,
    allowed_extensions: list[str],
    max_size_bytes: int,
) -> tuple[bool, str | None, str | None, str, str | None]:
    if not is_text_extension(extension, allowed_extensions):
        return False, None, None, SCAN_STATE_UNSUPPORTED, None

    return read_text_file(path, max_size_bytes)
