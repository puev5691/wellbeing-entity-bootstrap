from __future__ import annotations

from pathlib import Path
from typing import Any

from .chat_packages import assign_chat_package_path, collect_chat_packages_from_roots, scan_chat_package
from .config import AppConfig
from .constants import INDEX_RUN_STATUS_COMPLETED, INDEX_RUN_STATUS_FAILED
from .db import Database
from .models import FileRecord
from .scanner import build_file_record, iter_files
from .text_extract import extract_text_for_file
from .utils import format_error, now_iso


class Indexer:
    def __init__(self, config: AppConfig, db: Database, logger: Any | None = None) -> None:
        self.config = config
        self.db = db
        self.logger = logger

    def run_full_index(self) -> dict[str, int | str]:
        started_at = now_iso()
        run_id = self.db.start_index_run(started_at)

        files_seen = 0
        files_indexed = 0
        files_failed = 0

        try:
            for root_str in self.config.roots:
                root = Path(root_str).expanduser().resolve()
                if not root.exists() or not root.is_dir():
                    continue

                for path in iter_files(
                    [str(root)],
                    self.config.exclude_dirs,
                    self.config.exclude_paths,
                ):
                    files_seen += 1
                    try:
                        self._index_single_file(path, project_root=root)
                        files_indexed += 1
                    except Exception as exc:
                        files_failed += 1
                        self._log(f"Failed to index file {path}: {format_error(exc)}")

            chat_packages_found = self._collect_chat_packages()
            finished_at = now_iso()

            self.db.finish_index_run(
                run_id=run_id,
                finished_at=finished_at,
                status=INDEX_RUN_STATUS_COMPLETED,
                files_seen=files_seen,
                files_indexed=files_indexed,
                files_updated=0,
                files_failed=files_failed,
                chat_packages_found=chat_packages_found,
                note=None,
            )

            return {
                "files_seen": files_seen,
                "files_indexed": files_indexed,
                "files_failed": files_failed,
                "chat_packages_found": chat_packages_found,
                "status": INDEX_RUN_STATUS_COMPLETED,
            }

        except Exception as exc:
            finished_at = now_iso()
            self.db.finish_index_run(
                run_id=run_id,
                finished_at=finished_at,
                status=INDEX_RUN_STATUS_FAILED,
                files_seen=files_seen,
                files_indexed=files_indexed,
                files_updated=0,
                files_failed=files_failed + 1,
                chat_packages_found=0,
                note=format_error(exc),
            )
            raise

    def run_reindex(self) -> dict[str, int | str]:
        return self.run_full_index()

    def _index_single_file(self, path: Path, project_root: Path | None = None) -> None:
        record = self._build_file_record(path, project_root=project_root)
        self.db.upsert_file(record)

    def _build_file_record(self, path: Path, project_root: Path | None = None) -> FileRecord:
        record = build_file_record(path, project_root=project_root)
        record.chat_package_path = assign_chat_package_path(path)

        ok, full_text, excerpt, scan_state, error_note = extract_text_for_file(
            path=path,
            extension=record.extension,
            allowed_extensions=self.config.text_extensions,
            max_size_bytes=self.config.max_text_file_size_bytes,
        )

        record.text_available = ok
        record.full_text = full_text
        record.text_excerpt = excerpt
        record.scan_state = scan_state
        record.error_note = error_note
        return record

    def _collect_chat_packages(self) -> int:
        package_paths = collect_chat_packages_from_roots(self.config.roots)
        count = 0

        for package_dir in package_paths:
            record = scan_chat_package(package_dir)
            self.db.upsert_chat_package(record)
            count += 1

        return count

    def _log(self, message: str) -> None:
        if self.logger is not None:
            self.logger.warning(message)
