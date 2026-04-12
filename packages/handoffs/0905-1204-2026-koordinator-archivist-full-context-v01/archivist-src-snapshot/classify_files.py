from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
import re


@dataclass(slots=True)
class ClassifiedPackageFile:
    filename: str
    file_type: str
    reason: str


STANDARD_PREFIX_RE = re.compile(r"^\d{4}-\d{4}-\d{4}-")


def has_standard_prefix(filename: str) -> bool:
    return STANDARD_PREFIX_RE.match(filename) is not None


def read_file_header(path: Path, max_chars: int = 3000) -> str:
    try:
        return path.read_text(encoding="utf-8")[:max_chars].lower()
    except Exception:
        return ""


def extract_status_value(header: str) -> str:
    for line in header.splitlines():
        stripped = line.strip()
        if stripped.startswith("статус:"):
            return stripped.split(":", 1)[1].strip()
    return ""


def classify_file(path: str | Path) -> ClassifiedPackageFile:
    file_path = Path(path).expanduser().resolve()
    name = file_path.name
    lower_name = name.lower()
    suffix = file_path.suffix.lower()
    standard_prefix = has_standard_prefix(name)

    if name == "README-chat-folder.md":
        return ClassifiedPackageFile(name, "readme", "special package readme filename")

    if name == ".wb-copy-map.tsv":
        return ClassifiedPackageFile(name, "copy_map", "special copy map filename")

    if name.startswith(".wb-copy-map.") and name.endswith(".tsv"):
        return ClassifiedPackageFile(name, "copy_map_generated", "derived copy map helper filename")

    if name == "chat-card.md":
        return ClassifiedPackageFile(name, "chat_card", "special chat card filename")

    if suffix == ".sh":
        return ClassifiedPackageFile(name, "script", "shell script extension")

    if lower_name == "other.txt":
        return ClassifiedPackageFile(name, "scratch", "generic scratch or recovery text filename")

    if any(token in lower_name for token in ("demo", "test", "fake", "junk", "tmp", "trash")):
        return ClassifiedPackageFile(name, "demo", "matched demo/test/noise keywords in filename")

    header = read_file_header(file_path)
    status_value = extract_status_value(header)

    if any(token in status_value for token in ("демо", "демонстрац", "test", "demo", "fake", "junk", "tmp")):
        if standard_prefix:
            return ClassifiedPackageFile(name, "demo", "matched status field: demo/test/noise")
        return ClassifiedPackageFile(name, "noncanonical_name", "demo/test status but lacks standard timestamp prefix")

    if "журналная запись" in status_value:
        if standard_prefix:
            return ClassifiedPackageFile(name, "log", "matched status field: journal entry")
        return ClassifiedPackageFile(name, "noncanonical_name", "journal status but lacks standard timestamp prefix")

    if any(token in status_value for token in ("черновик", "draft", "рабочий черновик")):
        if standard_prefix:
            return ClassifiedPackageFile(name, "draft", "matched status field: draft")
        return ClassifiedPackageFile(name, "noncanonical_name", "draft status but lacks standard timestamp prefix")

    if any(token in status_value for token in ("итог", "final", "утвержден", "готово", "канонич")):
        if standard_prefix:
            return ClassifiedPackageFile(name, "final", "matched status field: final")
        return ClassifiedPackageFile(name, "noncanonical_name", "final status but lacks standard timestamp prefix")

    if any(token in lower_name for token in ("scene", "story", "synopsis", "literary", "media")):
        if standard_prefix:
            return ClassifiedPackageFile(name, "literary", "matched literary keywords in filename")
        return ClassifiedPackageFile(name, "noncanonical_name", "matched literary keywords but lacks standard timestamp prefix")

    if any(token in lower_name for token in ("technical-specification", "entity-model", "mvp-plan", "sqlite-schema", "python-code-draft", "code-structure")):
        if standard_prefix:
            return ClassifiedPackageFile(name, "engineering", "matched engineering keywords in filename")
        return ClassifiedPackageFile(name, "noncanonical_name", "matched engineering keywords but lacks standard timestamp prefix")

    if any(token in lower_name for token in ("log", "journal", "summary", "instruction", "regulation", "plan")):
        if standard_prefix:
            return ClassifiedPackageFile(name, "log", "matched log or regulation keywords in filename")
        return ClassifiedPackageFile(name, "noncanonical_name", "matched log/regulation keywords but lacks standard timestamp prefix")

    if "сцена " in header or "синопсис" in header or "литератур" in header:
        if standard_prefix:
            return ClassifiedPackageFile(name, "literary", "matched literary keywords in file header")
        return ClassifiedPackageFile(name, "noncanonical_name", "matched literary keywords in header but lacks standard timestamp prefix")

    if any(token in header for token in ("техническое задание", "модель сущностей", "sqlite-схема", "sqlite schema", "code structure", "структура проекта кода")):
        if standard_prefix:
            return ClassifiedPackageFile(name, "engineering", "matched engineering keywords in file header")
        return ClassifiedPackageFile(name, "noncanonical_name", "matched engineering keywords in header but lacks standard timestamp prefix")

    if "журнал" in header or "журналная запись" in header:
        if standard_prefix:
            return ClassifiedPackageFile(name, "log", "matched journal keywords in file header")
        return ClassifiedPackageFile(name, "noncanonical_name", "matched journal keywords in header but lacks standard timestamp prefix")

    if suffix in {".md", ".txt", ".tsv", ".json", ".yaml", ".yml", ".csv", ".log"}:
        return ClassifiedPackageFile(name, "unknown", "known text extension but no stronger classification")

    return ClassifiedPackageFile(name, "unknown", "no classification rule matched")


def classify_package_files(package_path: str | Path) -> list[ClassifiedPackageFile]:
    package_dir = Path(package_path).expanduser().resolve()
    if not package_dir.exists() or not package_dir.is_dir():
        raise FileNotFoundError(f"Chat package directory not found: {package_dir}")

    results: list[ClassifiedPackageFile] = []

    for path in sorted(package_dir.iterdir(), key=lambda p: p.name.lower()):
        if not path.is_file():
            continue
        results.append(classify_file(path))

    return results
