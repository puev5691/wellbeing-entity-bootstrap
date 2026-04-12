from __future__ import annotations

from collections import Counter
from dataclasses import dataclass
from pathlib import Path
import re


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


SOURCE_EXTENSIONS = {
    ".py", ".js", ".ts", ".tsx", ".jsx", ".go", ".rs", ".java", ".kt",
    ".c", ".cpp", ".h", ".hpp", ".cs", ".php", ".rb", ".swift", ".lua",
}

DOC_EXTENSIONS = {
    ".md", ".txt", ".rst",
}

CONFIG_FILENAMES = {
    "pyproject.toml",
    "requirements.txt",
    "requirements-dev.txt",
    "package.json",
    "package-lock.json",
    "pnpm-lock.yaml",
    "yarn.lock",
    "poetry.lock",
    "pipfile",
    "pipfile.lock",
    "docker-compose.yml",
    "docker-compose.yaml",
    "dockerfile",
    "makefile",
    ".env.example",
    "tsconfig.json",
}

IMPORTANT_DIR_NAMES = {
    "src",
    "app",
    "lib",
    "docs",
    "scripts",
    "tests",
    "test",
    "config",
    "configs",
    "examples",
}

ENTRYPOINT_PATTERNS = [
    re.compile(r"^main\.(py|js|ts|go|rs|java|kt|c|cpp)$", re.IGNORECASE),
    re.compile(r"^app\.(py|js|ts)$", re.IGNORECASE),
    re.compile(r"^server\.(py|js|ts)$", re.IGNORECASE),
    re.compile(r"^run[-_].+\.(py|js|ts|sh)$", re.IGNORECASE),
    re.compile(r"^cli\.(py|js|ts)$", re.IGNORECASE),
    re.compile(r"^index\.(js|ts)$", re.IGNORECASE),
]


@dataclass(slots=True)
class RepoManifest:
    repo_name: str
    repo_path: str
    is_git_repo: bool
    readme_files: list[str]
    changelog_files: list[str]
    dependency_files: list[str]
    config_files: list[str]
    important_directories: list[str]
    entry_points: list[str]
    top_level_manual_review: list[str]
    summary_counts: dict[str, int]


def _iter_files(repo_root: Path):
    for path in repo_root.rglob("*"):
        if any(part in EXCLUDED_DIR_NAMES for part in path.parts):
            continue
        if path.is_file():
            yield path


def _iter_top_level(repo_root: Path):
    for path in sorted(repo_root.iterdir(), key=lambda p: p.name.lower()):
        if path.name in EXCLUDED_DIR_NAMES:
            continue
        yield path


def build_repo_manifest(repo_path: str | Path) -> RepoManifest:
    repo_root = Path(repo_path).expanduser().resolve()
    if not repo_root.exists() or not repo_root.is_dir():
        raise FileNotFoundError(f"Repository directory not found: {repo_root}")

    is_git_repo = (repo_root / ".git").exists()

    readme_files: list[str] = []
    changelog_files: list[str] = []
    dependency_files: list[str] = []
    config_files: list[str] = []
    important_directories: list[str] = []
    entry_points: list[str] = []
    top_level_manual_review: list[str] = []

    counter = Counter()

    for path in _iter_files(repo_root):
        rel = str(path.relative_to(repo_root))
        lower_name = path.name.lower()
        suffix = path.suffix.lower()

        if lower_name.startswith("readme"):
            readme_files.append(rel)

        if lower_name.startswith("changelog"):
            changelog_files.append(rel)

        if lower_name in {
            "pyproject.toml",
            "requirements.txt",
            "requirements-dev.txt",
            "package.json",
            "package-lock.json",
            "pnpm-lock.yaml",
            "yarn.lock",
            "poetry.lock",
            "pipfile",
            "pipfile.lock",
        }:
            dependency_files.append(rel)

        if lower_name in CONFIG_FILENAMES:
            config_files.append(rel)

        if suffix in SOURCE_EXTENSIONS:
            counter["source_files"] += 1
        elif suffix in DOC_EXTENSIONS:
            counter["doc_files"] += 1
        elif suffix in {".json", ".yaml", ".yml", ".toml", ".ini", ".cfg"}:
            counter["config_like_files"] += 1
        elif suffix == ".sh":
            counter["shell_scripts"] += 1
        else:
            counter["other_files"] += 1

        if any(pattern.match(path.name) for pattern in ENTRYPOINT_PATTERNS):
            entry_points.append(rel)

    for path in _iter_top_level(repo_root):
        rel = str(path.relative_to(repo_root))
        lower_name = path.name.lower()

        if path.is_dir():
            if lower_name in IMPORTANT_DIR_NAMES:
                important_directories.append(rel)
            else:
                top_level_manual_review.append(rel + "/")
            continue

        if lower_name.startswith("readme") or lower_name.startswith("changelog"):
            continue
        if lower_name in CONFIG_FILENAMES:
            continue
        if any(pattern.match(path.name) for pattern in ENTRYPOINT_PATTERNS):
            continue

        top_level_manual_review.append(rel)

    return RepoManifest(
        repo_name=repo_root.name,
        repo_path=str(repo_root),
        is_git_repo=is_git_repo,
        readme_files=sorted(set(readme_files), key=str.lower),
        changelog_files=sorted(set(changelog_files), key=str.lower),
        dependency_files=sorted(set(dependency_files), key=str.lower),
        config_files=sorted(set(config_files), key=str.lower),
        important_directories=sorted(set(important_directories), key=str.lower),
        entry_points=sorted(set(entry_points), key=str.lower),
        top_level_manual_review=sorted(set(top_level_manual_review), key=str.lower),
        summary_counts=dict(sorted(counter.items(), key=lambda kv: kv[0])),
    )


def render_repo_manifest(manifest: RepoManifest) -> str:
    lines: list[str] = []
    lines.append("# Репозиторный манифест")
    lines.append("")
    lines.append(f"Репозиторий: {manifest.repo_name}")
    lines.append(f"Путь: {manifest.repo_path}")
    lines.append(f"Git-репозиторий: {'да' if manifest.is_git_repo else 'нет'}")
    lines.append("")
    lines.append("Назначение: дать кодовой Сущности первичный обзор структуры репозитория без ручного блуждания по исходникам.")
    lines.append("")

    lines.append("## Сводка")
    lines.append("")
    if manifest.summary_counts:
        for key, value in manifest.summary_counts.items():
            lines.append(f"- {key}: {value}")
    else:
        lines.append("- Нет данных")
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

    add_section("README и вводные документы", manifest.readme_files)
    add_section("CHANGELOG и история изменений", manifest.changelog_files)
    add_section("Файлы зависимостей", manifest.dependency_files)
    add_section("Файлы конфигурации", manifest.config_files)
    add_section("Важные каталоги", manifest.important_directories)
    add_section("Вероятные точки входа", manifest.entry_points)
    add_section("Верхнеуровневые элементы для ручного просмотра", manifest.top_level_manual_review)

    return "\n".join(lines).rstrip() + "\n"


def default_repo_manifest_output_path(repo_path: str | Path) -> str:
    repo_root = Path(repo_path).expanduser().resolve()
    return f"/storage/emulated/0/Documents/Blagopoluchie/_ARCHIVIST/repo_manifests/{repo_root.name}-repo-manifest.md"
