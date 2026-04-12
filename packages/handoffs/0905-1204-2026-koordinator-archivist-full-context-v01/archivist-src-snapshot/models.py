from __future__ import annotations

from dataclasses import dataclass
from typing import Optional


@dataclass(slots=True)
class FileRecord:
    full_path: str
    relative_path: str
    name: str
    extension: str
    size_bytes: int
    modified_at: str
    indexed_at: str
    hash_sha256: Optional[str] = None
    text_excerpt: Optional[str] = None
    full_text: Optional[str] = None
    text_available: bool = False
    project_contour: Optional[str] = None
    chat_package_path: Optional[str] = None
    is_chat_readme: bool = False
    is_copy_map: bool = False
    is_chat_card: bool = False
    scan_state: str = "ok"
    error_note: Optional[str] = None


@dataclass(slots=True)
class ChatPackageRecord:
    package_path: str
    package_name: str
    readme_file_path: Optional[str] = None
    copy_map_file_path: Optional[str] = None
    chat_card_file_path: Optional[str] = None
    last_indexed_at: str = ""
    file_count: int = 0
    note: Optional[str] = None


@dataclass(slots=True)
class IndexRunRecord:
    started_at: str
    finished_at: Optional[str] = None
    status: str = "running"
    files_seen: int = 0
    files_indexed: int = 0
    files_updated: int = 0
    files_failed: int = 0
    chat_packages_found: int = 0
    note: Optional[str] = None


@dataclass(slots=True)
class SearchResult:
    file_id: int
    name: str
    full_path: str
    project_contour: Optional[str] = None
    chat_package_path: Optional[str] = None
    snippet: Optional[str] = None
    score: Optional[float] = None


@dataclass(slots=True)
class AppStats:
    total_files: int
    text_files: int
    chat_packages: int
    last_index_finished_at: Optional[str] = None
