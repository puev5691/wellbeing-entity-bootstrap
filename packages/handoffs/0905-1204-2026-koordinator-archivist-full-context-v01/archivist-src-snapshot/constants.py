from __future__ import annotations

APP_NAME = "wellbeing-archivist"
DEFAULT_DB_FILENAME = "archivist.db"

CHAT_README_FILENAME = "README-chat-folder.md"
COPY_MAP_FILENAME = ".wb-copy-map.tsv"
CHAT_CARD_FILENAME = "chat-card.md"

DEFAULT_TEXT_EXTENSIONS = [
    ".md",
    ".txt",
    ".tsv",
    ".csv",
    ".json",
    ".yaml",
    ".yml",
    ".log",
    ".sh",
    ".html",
]

DEFAULT_EXCLUDE_DIRS = [
    ".git",
    ".venv",
    "__pycache__",
    "node_modules",
]

DEFAULT_EXCERPT_LENGTH = 400
DEFAULT_MAX_TEXT_FILE_SIZE_BYTES = 1_000_000

SCAN_STATE_OK = "ok"
SCAN_STATE_READ_ERROR = "read_error"
SCAN_STATE_SKIPPED_BINARY = "skipped_binary"
SCAN_STATE_TOO_LARGE = "too_large"
SCAN_STATE_UNSUPPORTED = "unsupported"

INDEX_RUN_STATUS_RUNNING = "running"
INDEX_RUN_STATUS_COMPLETED = "completed"
INDEX_RUN_STATUS_FAILED = "failed"
INDEX_RUN_STATUS_PARTIAL = "partial"

DEFAULT_LOG_LEVEL = "INFO"

DEFAULT_PROJECT_CONTOURS = [
    "00_INBOX",
    "01_CORE",
    "02_PROJECTS",
    "03_LAB",
    "04_DOCS",
    "07_ARCHIVE",
    "09_ADMIN",
]
