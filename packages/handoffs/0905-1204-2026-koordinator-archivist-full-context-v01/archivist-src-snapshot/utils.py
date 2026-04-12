from __future__ import annotations

from datetime import datetime, timezone
from pathlib import Path


def now_iso() -> str:
    return datetime.now(timezone.utc).replace(microsecond=0).isoformat()


def safe_relative_path(path: Path, root: Path | None = None) -> str:
    try:
        if root is not None:
            return str(path.resolve().relative_to(root.resolve()))
    except Exception:
        pass
    return str(path)


def trim_text(text: str, max_length: int) -> str:
    if len(text) <= max_length:
        return text
    return text[: max_length - 3] + "..."


def normalize_newlines(text: str) -> str:
    return text.replace("\r\n", "\n").replace("\r", "\n")


def format_error(exc: Exception) -> str:
    return f"{type(exc).__name__}: {exc}"


def lower_extension(path: Path) -> str:
    return path.suffix.lower()
