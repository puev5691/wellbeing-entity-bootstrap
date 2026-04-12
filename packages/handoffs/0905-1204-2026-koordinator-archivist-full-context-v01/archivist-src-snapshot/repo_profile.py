from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
import json


EXCLUDED_DIR_NAMES = {
    ".git",
    "__pycache__",
    ".venv",
    "node_modules",
    "dist",
    "build",
    ".idea",
    ".vscode",
}


@dataclass(slots=True)
class RepoProfile:
    repo_name: str
    repo_path: str
    is_git_repo: bool
    detected_stack: str
    readme_files: list[str]
    dependency_files: list[str]
    source_directories: list[str]
    docs_directories: list[str]
    script_directories: list[str]
    entry_points: list[str]
    package_json_name: str | None
    package_json_version: str | None
    package_json_main: str | None
    package_json_scripts: list[str]
    notes: list[str]


def _iter_files(repo_root: Path):
    for path in repo_root.rglob("*"):
        if any(part in EXCLUDED_DIR_NAMES for part in path.parts):
            continue
        if path.is_file():
            yield path


def _iter_top_dirs(repo_root: Path):
    for path in sorted(repo_root.iterdir(), key=lambda p: p.name.lower()):
        if path.name in EXCLUDED_DIR_NAMES:
            continue
        if path.is_dir():
            yield path


def _load_json(path: Path) -> dict:
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except Exception:
        return {}


def build_repo_profile(repo_path: str | Path) -> RepoProfile:
    repo_root = Path(repo_path).expanduser().resolve()
    if not repo_root.exists() or not repo_root.is_dir():
        raise FileNotFoundError(f"Repository directory not found: {repo_root}")

    is_git_repo = (repo_root / ".git").exists()

    readme_files: list[str] = []
    dependency_files: list[str] = []
    source_directories: list[str] = []
    docs_directories: list[str] = []
    script_directories: list[str] = []
    entry_points: list[str] = []
    notes: list[str] = []

    package_json_name = None
    package_json_version = None
    package_json_main = None
    package_json_scripts: list[str] = []

    found_package_json = False
    found_pyproject = False
    found_requirements = False

    for path in _iter_files(repo_root):
        rel = str(path.relative_to(repo_root))
        lower_name = path.name.lower()

        if lower_name.startswith("readme"):
            readme_files.append(rel)

        if lower_name in {
            "package.json",
            "package-lock.json",
            "yarn.lock",
            "pnpm-lock.yaml",
            "pyproject.toml",
            "requirements.txt",
            "requirements-dev.txt",
            "pipfile",
            "pipfile.lock",
            "poetry.lock",
        }:
            dependency_files.append(rel)

        if lower_name == "package.json" and package_json_name is None:
            found_package_json = True
            payload = _load_json(path)
            package_json_name = payload.get("name")
            package_json_version = payload.get("version")
            package_json_main = payload.get("main")
            scripts = payload.get("scripts", {})
            if isinstance(scripts, dict):
                package_json_scripts = sorted(scripts.keys())

        if lower_name == "pyproject.toml":
            found_pyproject = True
        if lower_name.startswith("requirements"):
            found_requirements = True

        if lower_name in {"run-node.js", "run-nw.js", "run-test.js", "main.py", "main.js", "server.js", "app.js", "cli.js"}:
            entry_points.append(rel)

    for path in _iter_top_dirs(repo_root):
        lower_name = path.name.lower()
        rel = str(path.relative_to(repo_root))

        if lower_name in {"source", "src", "app", "lib"}:
            source_directories.append(rel)
        elif lower_name in {"doc", "docs", "documentation"}:
            docs_directories.append(rel)
        elif lower_name in {"scripts", "script", "tools"}:
            script_directories.append(rel)

    if found_package_json and (found_pyproject or found_requirements):
        detected_stack = "mixed"
        notes.append("Обнаружены признаки Node.js и Python одновременно.")
    elif found_package_json:
        detected_stack = "nodejs"
        notes.append("Основной стек выглядит как Node.js/JavaScript.")
    elif found_pyproject or found_requirements:
        detected_stack = "python"
        notes.append("Основной стек выглядит как Python.")
    else:
        detected_stack = "unknown"
        notes.append("Явный стек по зависимостям не определён.")

    if package_json_main:
        notes.append(f"В package.json указан main: {package_json_main}")

    if package_json_scripts:
        notes.append("В package.json обнаружены scripts для запуска и обслуживания проекта.")

    if not source_directories:
        notes.append("Верхнеуровневые каталоги исходников явно не распознаны.")
    if not docs_directories:
        notes.append("Верхнеуровневые каталоги документации явно не распознаны.")

    return RepoProfile(
        repo_name=repo_root.name,
        repo_path=str(repo_root),
        is_git_repo=is_git_repo,
        detected_stack=detected_stack,
        readme_files=sorted(set(readme_files), key=str.lower),
        dependency_files=sorted(set(dependency_files), key=str.lower),
        source_directories=sorted(set(source_directories), key=str.lower),
        docs_directories=sorted(set(docs_directories), key=str.lower),
        script_directories=sorted(set(script_directories), key=str.lower),
        entry_points=sorted(set(entry_points), key=str.lower),
        package_json_name=package_json_name,
        package_json_version=package_json_version,
        package_json_main=package_json_main,
        package_json_scripts=package_json_scripts,
        notes=notes,
    )


def render_repo_profile(profile: RepoProfile) -> str:
    lines: list[str] = []
    lines.append("# Репозиторный профиль")
    lines.append("")
    lines.append(f"Репозиторий: {profile.repo_name}")
    lines.append(f"Путь: {profile.repo_path}")
    lines.append(f"Git-репозиторий: {'да' if profile.is_git_repo else 'нет'}")
    lines.append(f"Определённый стек: {profile.detected_stack}")
    lines.append("")
    lines.append("Назначение: дать кодовой Сущности короткий стартовый профиль репозитория для быстрого входа в работу.")
    lines.append("")

    lines.append("## Основные сведения")
    lines.append("")
    lines.append(f"- package.json name: {profile.package_json_name or 'нет данных'}")
    lines.append(f"- package.json version: {profile.package_json_version or 'нет данных'}")
    lines.append(f"- package.json main: {profile.package_json_main or 'нет данных'}")
    lines.append("")

    def add_section(title: str, items: list[str]) -> None:
        lines.append(f"## {title}")
        lines.append("")
        if not items:
            lines.append("- Нет элементов")
            lines.append("")
            return
        for item in items:
            lines.append(f"- {item}")
        lines.append("")

    add_section("README и вводные документы", profile.readme_files)
    add_section("Файлы зависимостей", profile.dependency_files)
    add_section("Каталоги исходников", profile.source_directories)
    add_section("Каталоги документации", profile.docs_directories)
    add_section("Каталоги скриптов", profile.script_directories)
    add_section("Вероятные точки входа", profile.entry_points)
    add_section("Скрипты из package.json", profile.package_json_scripts)
    add_section("Примечания", profile.notes)

    return "\n".join(lines).rstrip() + "\n"


def default_repo_profile_output_path(repo_path: str | Path) -> str:
    repo_root = Path(repo_path).expanduser().resolve()
    return f"/storage/emulated/0/Documents/Blagopoluchie/_ARCHIVIST/repo_reports/{repo_root.name}-repo-profile.md"
