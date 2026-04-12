from __future__ import annotations

import json
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any

from .constants import (
    DEFAULT_DB_FILENAME,
    DEFAULT_EXCLUDE_DIRS,
    DEFAULT_LOG_LEVEL,
    DEFAULT_MAX_TEXT_FILE_SIZE_BYTES,
    DEFAULT_TEXT_EXTENSIONS,
)


@dataclass(slots=True)
class AppConfig:
    database_path: str
    roots: list[str] = field(default_factory=list)
    exclude_dirs: list[str] = field(default_factory=lambda: DEFAULT_EXCLUDE_DIRS.copy())
    exclude_paths: list[str] = field(default_factory=list)
    text_extensions: list[str] = field(default_factory=lambda: DEFAULT_TEXT_EXTENSIONS.copy())
    max_text_file_size_bytes: int = DEFAULT_MAX_TEXT_FILE_SIZE_BYTES
    log_level: str = DEFAULT_LOG_LEVEL
    fts_enabled: bool = False


def load_default_config() -> AppConfig:
    return AppConfig(
        database_path=DEFAULT_DB_FILENAME,
        roots=[],
        exclude_paths=[],
    )


def load_config(config_path: str | None = None) -> AppConfig:
    if not config_path:
        config = load_default_config()
        validate_config(config)
        return resolve_paths(config)

    path = Path(config_path)
    if not path.exists():
        raise FileNotFoundError(f"Config file not found: {path}")

    raw = json.loads(path.read_text(encoding="utf-8"))
    config = AppConfig(
        database_path=str(raw.get("database_path", DEFAULT_DB_FILENAME)),
        roots=list(raw.get("roots", [])),
        exclude_dirs=list(raw.get("exclude_dirs", DEFAULT_EXCLUDE_DIRS)),
        exclude_paths=list(raw.get("exclude_paths", [])),
        text_extensions=[str(x).lower() for x in raw.get("text_extensions", DEFAULT_TEXT_EXTENSIONS)],
        max_text_file_size_bytes=int(
            raw.get("max_text_file_size_bytes", DEFAULT_MAX_TEXT_FILE_SIZE_BYTES)
        ),
        log_level=str(raw.get("log_level", DEFAULT_LOG_LEVEL)).upper(),
        fts_enabled=bool(raw.get("fts_enabled", False)),
    )
    validate_config(config)
    return resolve_paths(config, base_dir=path.parent)


def validate_config(config: AppConfig) -> None:
    if not config.database_path:
        raise ValueError("database_path must not be empty")
    if config.max_text_file_size_bytes <= 0:
        raise ValueError("max_text_file_size_bytes must be > 0")
    if not isinstance(config.roots, list):
        raise ValueError("roots must be a list")
    if not isinstance(config.exclude_dirs, list):
        raise ValueError("exclude_dirs must be a list")
    if not isinstance(config.exclude_paths, list):
        raise ValueError("exclude_paths must be a list")
    if not isinstance(config.text_extensions, list) or not config.text_extensions:
        raise ValueError("text_extensions must be a non-empty list")


def resolve_paths(config: AppConfig, base_dir: Path | None = None) -> AppConfig:
    base_dir = base_dir or Path.cwd()

    db_path = Path(config.database_path)
    if not db_path.is_absolute():
        db_path = (base_dir / db_path).resolve()

    roots: list[str] = []
    for root in config.roots:
        root_path = Path(root)
        if not root_path.is_absolute():
            root_path = (base_dir / root_path).resolve()
        roots.append(str(root_path))

    exclude_paths: list[str] = []
    for excluded in config.exclude_paths:
        excluded_path = Path(excluded)
        if not excluded_path.is_absolute():
            excluded_path = (base_dir / excluded_path).resolve()
        exclude_paths.append(str(excluded_path))

    return AppConfig(
        database_path=str(db_path),
        roots=roots,
        exclude_dirs=config.exclude_dirs.copy(),
        exclude_paths=exclude_paths,
        text_extensions=[ext.lower() for ext in config.text_extensions],
        max_text_file_size_bytes=config.max_text_file_size_bytes,
        log_level=config.log_level.upper(),
        fts_enabled=config.fts_enabled,
    )


def save_example_config(path: str, payload: dict[str, Any]) -> None:
    Path(path).write_text(
        json.dumps(payload, ensure_ascii=False, indent=2),
        encoding="utf-8",
    )
