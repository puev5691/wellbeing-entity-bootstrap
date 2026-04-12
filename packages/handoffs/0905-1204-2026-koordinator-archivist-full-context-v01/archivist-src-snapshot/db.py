from __future__ import annotations

import sqlite3
from pathlib import Path
from typing import Any

from .constants import (
    INDEX_RUN_STATUS_COMPLETED,
    INDEX_RUN_STATUS_RUNNING,
)
from .models import AppStats, ChatPackageRecord, FileRecord, SearchResult


SCHEMA_SQL = """
CREATE TABLE IF NOT EXISTS files (
    id INTEGER PRIMARY KEY,
    full_path TEXT NOT NULL UNIQUE,
    relative_path TEXT,
    name TEXT NOT NULL,
    extension TEXT,
    size_bytes INTEGER,
    modified_at TEXT,
    indexed_at TEXT NOT NULL,
    hash_sha256 TEXT,
    text_excerpt TEXT,
    full_text TEXT,
    text_available INTEGER NOT NULL DEFAULT 0,
    project_contour TEXT,
    chat_package_path TEXT,
    is_chat_readme INTEGER NOT NULL DEFAULT 0,
    is_copy_map INTEGER NOT NULL DEFAULT 0,
    is_chat_card INTEGER NOT NULL DEFAULT 0,
    scan_state TEXT NOT NULL DEFAULT 'ok',
    error_note TEXT
);

CREATE TABLE IF NOT EXISTS chat_packages (
    id INTEGER PRIMARY KEY,
    package_path TEXT NOT NULL UNIQUE,
    package_name TEXT NOT NULL,
    readme_file_path TEXT,
    copy_map_file_path TEXT,
    chat_card_file_path TEXT,
    last_indexed_at TEXT NOT NULL,
    file_count INTEGER NOT NULL DEFAULT 0,
    note TEXT
);

CREATE TABLE IF NOT EXISTS settings (
    key TEXT PRIMARY KEY,
    value TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS index_runs (
    id INTEGER PRIMARY KEY,
    started_at TEXT NOT NULL,
    finished_at TEXT,
    status TEXT NOT NULL,
    files_seen INTEGER NOT NULL DEFAULT 0,
    files_indexed INTEGER NOT NULL DEFAULT 0,
    files_updated INTEGER NOT NULL DEFAULT 0,
    files_failed INTEGER NOT NULL DEFAULT 0,
    chat_packages_found INTEGER NOT NULL DEFAULT 0,
    note TEXT
);

CREATE INDEX IF NOT EXISTS idx_files_name
    ON files(name);

CREATE INDEX IF NOT EXISTS idx_files_extension
    ON files(extension);

CREATE INDEX IF NOT EXISTS idx_files_project_contour
    ON files(project_contour);

CREATE INDEX IF NOT EXISTS idx_files_chat_package_path
    ON files(chat_package_path);

CREATE INDEX IF NOT EXISTS idx_files_modified_at
    ON files(modified_at);

CREATE INDEX IF NOT EXISTS idx_files_hash_sha256
    ON files(hash_sha256);

CREATE INDEX IF NOT EXISTS idx_chat_packages_name
    ON chat_packages(package_name);

CREATE INDEX IF NOT EXISTS idx_index_runs_started_at
    ON index_runs(started_at);

CREATE INDEX IF NOT EXISTS idx_index_runs_status
    ON index_runs(status);
"""


class Database:
    def __init__(self, database_path: str) -> None:
        self.database_path = database_path

    def connect(self) -> sqlite3.Connection:
        Path(self.database_path).parent.mkdir(parents=True, exist_ok=True)
        conn = sqlite3.connect(self.database_path)
        conn.row_factory = sqlite3.Row
        return conn

    def init_schema(self) -> None:
        with self.connect() as conn:
            conn.executescript(SCHEMA_SQL)
            conn.commit()

    def set_setting(self, key: str, value: str) -> None:
        with self.connect() as conn:
            conn.execute(
                """
                INSERT INTO settings(key, value)
                VALUES(?, ?)
                ON CONFLICT(key) DO UPDATE SET value = excluded.value
                """,
                (key, value),
            )
            conn.commit()

    def get_setting(self, key: str) -> str | None:
        with self.connect() as conn:
            row = conn.execute(
                "SELECT value FROM settings WHERE key = ?",
                (key,),
            ).fetchone()
            return None if row is None else str(row["value"])

    def upsert_file(self, record: FileRecord) -> int:
        with self.connect() as conn:
            conn.execute(
                """
                INSERT INTO files (
                    full_path, relative_path, name, extension, size_bytes,
                    modified_at, indexed_at, hash_sha256, text_excerpt, full_text,
                    text_available, project_contour, chat_package_path,
                    is_chat_readme, is_copy_map, is_chat_card, scan_state, error_note
                )
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                ON CONFLICT(full_path) DO UPDATE SET
                    relative_path = excluded.relative_path,
                    name = excluded.name,
                    extension = excluded.extension,
                    size_bytes = excluded.size_bytes,
                    modified_at = excluded.modified_at,
                    indexed_at = excluded.indexed_at,
                    hash_sha256 = excluded.hash_sha256,
                    text_excerpt = excluded.text_excerpt,
                    full_text = excluded.full_text,
                    text_available = excluded.text_available,
                    project_contour = excluded.project_contour,
                    chat_package_path = excluded.chat_package_path,
                    is_chat_readme = excluded.is_chat_readme,
                    is_copy_map = excluded.is_copy_map,
                    is_chat_card = excluded.is_chat_card,
                    scan_state = excluded.scan_state,
                    error_note = excluded.error_note
                """,
                (
                    record.full_path,
                    record.relative_path,
                    record.name,
                    record.extension,
                    record.size_bytes,
                    record.modified_at,
                    record.indexed_at,
                    record.hash_sha256,
                    record.text_excerpt,
                    record.full_text,
                    int(record.text_available),
                    record.project_contour,
                    record.chat_package_path,
                    int(record.is_chat_readme),
                    int(record.is_copy_map),
                    int(record.is_chat_card),
                    record.scan_state,
                    record.error_note,
                ),
            )
            row = conn.execute(
                "SELECT id FROM files WHERE full_path = ?",
                (record.full_path,),
            ).fetchone()
            conn.commit()
            if row is None:
                raise RuntimeError("Failed to fetch file id after upsert")
            return int(row["id"])

    def upsert_chat_package(self, record: ChatPackageRecord) -> int:
        with self.connect() as conn:
            conn.execute(
                """
                INSERT INTO chat_packages (
                    package_path, package_name, readme_file_path,
                    copy_map_file_path, chat_card_file_path,
                    last_indexed_at, file_count, note
                )
                VALUES (?, ?, ?, ?, ?, ?, ?, ?)
                ON CONFLICT(package_path) DO UPDATE SET
                    package_name = excluded.package_name,
                    readme_file_path = excluded.readme_file_path,
                    copy_map_file_path = excluded.copy_map_file_path,
                    chat_card_file_path = excluded.chat_card_file_path,
                    last_indexed_at = excluded.last_indexed_at,
                    file_count = excluded.file_count,
                    note = excluded.note
                """,
                (
                    record.package_path,
                    record.package_name,
                    record.readme_file_path,
                    record.copy_map_file_path,
                    record.chat_card_file_path,
                    record.last_indexed_at,
                    record.file_count,
                    record.note,
                ),
            )
            row = conn.execute(
                "SELECT id FROM chat_packages WHERE package_path = ?",
                (record.package_path,),
            ).fetchone()
            conn.commit()
            if row is None:
                raise RuntimeError("Failed to fetch chat package id after upsert")
            return int(row["id"])

    def start_index_run(self, started_at: str) -> int:
        with self.connect() as conn:
            cur = conn.execute(
                """
                INSERT INTO index_runs(started_at, status)
                VALUES(?, ?)
                """,
                (started_at, INDEX_RUN_STATUS_RUNNING),
            )
            conn.commit()
            return int(cur.lastrowid)

    def finish_index_run(
        self,
        run_id: int,
        finished_at: str,
        status: str = INDEX_RUN_STATUS_COMPLETED,
        files_seen: int = 0,
        files_indexed: int = 0,
        files_updated: int = 0,
        files_failed: int = 0,
        chat_packages_found: int = 0,
        note: str | None = None,
    ) -> None:
        with self.connect() as conn:
            conn.execute(
                """
                UPDATE index_runs
                SET finished_at = ?,
                    status = ?,
                    files_seen = ?,
                    files_indexed = ?,
                    files_updated = ?,
                    files_failed = ?,
                    chat_packages_found = ?,
                    note = ?
                WHERE id = ?
                """,
                (
                    finished_at,
                    status,
                    files_seen,
                    files_indexed,
                    files_updated,
                    files_failed,
                    chat_packages_found,
                    note,
                    run_id,
                ),
            )
            conn.commit()

    def search_files_by_name(self, query: str, limit: int = 50) -> list[SearchResult]:
        pattern = f"%{query}%"
        with self.connect() as conn:
            rows = conn.execute(
                """
                SELECT id, name, full_path, project_contour, chat_package_path, text_excerpt
                FROM files
                WHERE lower(name) LIKE lower(?)
                ORDER BY name ASC
                LIMIT ?
                """,
                (pattern, limit),
            ).fetchall()
        return [self._row_to_search_result(row) for row in rows]

    def search_files_by_text(self, query: str, limit: int = 50) -> list[SearchResult]:
        pattern = f"%{query}%"
        with self.connect() as conn:
            rows = conn.execute(
                """
                SELECT id, name, full_path, project_contour, chat_package_path, text_excerpt
                FROM files
                WHERE text_available = 1
                  AND lower(full_text) LIKE lower(?)
                ORDER BY name ASC
                LIMIT ?
                """,
                (pattern, limit),
            ).fetchall()
        return [self._row_to_search_result(row) for row in rows]

    def get_file_by_id(self, file_id: int) -> dict[str, Any] | None:
        with self.connect() as conn:
            row = conn.execute(
                "SELECT * FROM files WHERE id = ?",
                (file_id,),
            ).fetchone()
        return None if row is None else dict(row)

    def get_chat_package_by_id(self, package_id: int) -> dict[str, Any] | None:
        with self.connect() as conn:
            row = conn.execute(
                "SELECT * FROM chat_packages WHERE id = ?",
                (package_id,),
            ).fetchone()
        return None if row is None else dict(row)

    def get_stats(self) -> AppStats:
        with self.connect() as conn:
            total_files = conn.execute(
                "SELECT COUNT(*) AS n FROM files"
            ).fetchone()["n"]
            text_files = conn.execute(
                "SELECT COUNT(*) AS n FROM files WHERE text_available = 1"
            ).fetchone()["n"]
            chat_packages = conn.execute(
                "SELECT COUNT(*) AS n FROM chat_packages"
            ).fetchone()["n"]
            last_index_finished_at = conn.execute(
                """
                SELECT finished_at
                FROM index_runs
                WHERE status = ?
                ORDER BY id DESC
                LIMIT 1
                """,
                (INDEX_RUN_STATUS_COMPLETED,),
            ).fetchone()

        return AppStats(
            total_files=int(total_files),
            text_files=int(text_files),
            chat_packages=int(chat_packages),
            last_index_finished_at=(
                None if last_index_finished_at is None else last_index_finished_at["finished_at"]
            ),
        )

    @staticmethod
    def _row_to_search_result(row: sqlite3.Row) -> SearchResult:
        return SearchResult(
            file_id=int(row["id"]),
            name=str(row["name"]),
            full_path=str(row["full_path"]),
            project_contour=row["project_contour"],
            chat_package_path=row["chat_package_path"],
            snippet=row["text_excerpt"],
            score=None,
        )
