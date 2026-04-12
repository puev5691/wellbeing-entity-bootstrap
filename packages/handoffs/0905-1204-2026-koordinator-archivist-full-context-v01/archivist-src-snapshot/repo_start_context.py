from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path

from .repo_profile import build_repo_profile


@dataclass(slots=True)
class RepoStartContext:
    repo_name: str
    repo_path: str
    primary_reading_order: list[str]
    secondary_review: list[str]
    startup_hints: list[str]


def build_repo_start_context(repo_path: str | Path) -> RepoStartContext:
    repo_root = Path(repo_path).expanduser().resolve()
    profile = build_repo_profile(repo_root)

    primary: list[str] = []
    secondary: list[str] = []
    hints: list[str] = []

    for item in profile.readme_files:
        if item not in primary:
            primary.append(item)

    for item in profile.dependency_files:
        if item not in primary:
            primary.append(item)

    preferred_entry_order = [
        "Source/run-node.js",
        "Source/run-nw.js",
        "Source/core/server.js",
        "Source/run-test.js",
    ]

    for item in preferred_entry_order:
        if item in profile.entry_points and item not in primary:
            primary.append(item)

    for item in profile.entry_points:
        if item not in primary and item not in secondary:
            secondary.append(item)

    top_level_candidates = [
        "run-node.bat",
        "run-nw.bat",
        "LICENSE",
    ]

    for item in top_level_candidates:
        candidate = repo_root / item
        if candidate.exists() and candidate.is_file():
            secondary.append(item)

    if profile.detected_stack == "nodejs":
        hints.append("Начинать анализ как Node.js-проект.")
    if profile.package_json_main:
        hints.append(f"Поле main в package.json указывает на: {profile.package_json_main}")
    if not profile.package_json_scripts:
        hints.append("В package.json не обнаружены scripts. Сценарии запуска, вероятно, задаются вручную через файлы run-*.js или bat-обёртки.")
    if "Source" in profile.source_directories:
        hints.append("Каталог Source выглядит как основной центр исходного кода.")
    if "Doc" in profile.docs_directories:
        hints.append("Каталог Doc содержит важную документацию, её нельзя пропускать перед чтением исходников.")

    return RepoStartContext(
        repo_name=profile.repo_name,
        repo_path=profile.repo_path,
        primary_reading_order=primary,
        secondary_review=sorted(set(secondary), key=str.lower),
        startup_hints=hints,
    )


def render_repo_start_context(context: RepoStartContext) -> str:
    lines: list[str] = []
    lines.append("# Стартовый кодовый контекст репозитория")
    lines.append("")
    lines.append(f"Репозиторий: {context.repo_name}")
    lines.append(f"Путь: {context.repo_path}")
    lines.append("")
    lines.append("Назначение: дать кодовой Сущности минимальный и упорядоченный стартовый набор файлов для входа в репозиторий.")
    lines.append("")

    lines.append("## Читать в первую очередь")
    lines.append("")
    if context.primary_reading_order:
        for item in context.primary_reading_order:
            lines.append(f"- {item}")
    else:
        lines.append("- Нет элементов")
    lines.append("")

    lines.append("## Смотреть дополнительно")
    lines.append("")
    if context.secondary_review:
        for item in context.secondary_review:
            lines.append(f"- {item}")
    else:
        lines.append("- Нет элементов")
    lines.append("")

    lines.append("## Подсказки для старта")
    lines.append("")
    if context.startup_hints:
        for item in context.startup_hints:
            lines.append(f"- {item}")
    else:
        lines.append("- Нет элементов")
    lines.append("")

    return "\n".join(lines).rstrip() + "\n"


def default_repo_start_context_output_path(repo_path: str | Path) -> str:
    repo_root = Path(repo_path).expanduser().resolve()
    return f"/storage/emulated/0/Documents/Blagopoluchie/_ARCHIVIST/repo_reports/{repo_root.name}-repo-start-context.md"
