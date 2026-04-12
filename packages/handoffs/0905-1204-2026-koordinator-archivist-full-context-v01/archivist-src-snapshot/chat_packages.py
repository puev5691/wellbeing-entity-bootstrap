from __future__ import annotations

from pathlib import Path

from .constants import CHAT_CARD_FILENAME, CHAT_README_FILENAME, COPY_MAP_FILENAME
from .models import ChatPackageRecord
from .utils import now_iso


def is_chat_package_dir(path: Path) -> bool:
    if not path.is_dir():
        return False

    readme = path / CHAT_README_FILENAME
    copy_map = path / COPY_MAP_FILENAME
    return readme.exists() or copy_map.exists()


def find_chat_package_root(path: Path) -> Path | None:
    current = path.resolve()
    if current.is_file():
        current = current.parent

    for candidate in [current, *current.parents]:
        if candidate.name == "00_INBOX":
            break
        if is_chat_package_dir(candidate):
            return candidate

    return None


def detect_chat_support_files(package_dir: Path) -> dict[str, str | None]:
    readme = package_dir / CHAT_README_FILENAME
    copy_map = package_dir / COPY_MAP_FILENAME
    chat_card = package_dir / CHAT_CARD_FILENAME

    return {
        "readme_file_path": str(readme) if readme.exists() else None,
        "copy_map_file_path": str(copy_map) if copy_map.exists() else None,
        "chat_card_file_path": str(chat_card) if chat_card.exists() else None,
    }


def assign_chat_package_path(file_path: Path) -> str | None:
    package_root = find_chat_package_root(file_path)
    return None if package_root is None else str(package_root)


def scan_chat_package(package_dir: Path) -> ChatPackageRecord:
    support = detect_chat_support_files(package_dir)
    file_count = sum(1 for p in package_dir.rglob("*") if p.is_file())

    return ChatPackageRecord(
        package_path=str(package_dir.resolve()),
        package_name=package_dir.name,
        readme_file_path=support["readme_file_path"],
        copy_map_file_path=support["copy_map_file_path"],
        chat_card_file_path=support["chat_card_file_path"],
        last_indexed_at=now_iso(),
        file_count=file_count,
        note=None,
    )


def collect_chat_packages_from_roots(roots: list[str]) -> list[Path]:
    found: dict[str, Path] = {}

    for root_str in roots:
        root = Path(root_str).expanduser().resolve()
        if not root.exists() or not root.is_dir():
            continue

        if is_chat_package_dir(root):
            found[str(root)] = root

        for path in root.rglob("*"):
            if path.is_dir() and is_chat_package_dir(path):
                found[str(path.resolve())] = path.resolve()

    return sorted(found.values(), key=lambda p: str(p))
