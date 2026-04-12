from __future__ import annotations

from dataclasses import dataclass

from .classify_files import classify_package_files


@dataclass(slots=True)
class ContextManifestItem:
    filename: str
    full_path: str
    file_type: str


@dataclass(slots=True)
class ContextManifest:
    package_path: str
    sections: dict[str, list[ContextManifestItem]]


SECTION_ORDER = [
    "package_readme",
    "engineering_core",
    "logs_and_decisions",
    "literary_context",
    "manual_review",
]


SECTION_TITLES = {
    "package_readme": "README пакета",
    "engineering_core": "Инженерное ядро",
    "logs_and_decisions": "Журналы и решения",
    "literary_context": "Литературный контекст",
    "manual_review": "Требует ручного просмотра",
}


def build_context_manifest(package_path: str) -> ContextManifest:
    classified = classify_package_files(package_path)

    sections: dict[str, list[ContextManifestItem]] = {
        key: [] for key in SECTION_ORDER
    }

    for item in classified:
        full_path = f"{package_path.rstrip('/')}/{item.filename}"

        manifest_item = ContextManifestItem(
            filename=item.filename,
            full_path=full_path,
            file_type=item.file_type,
        )

        if item.file_type == "readme":
            sections["package_readme"].append(manifest_item)
        elif item.file_type in {"engineering", "final"}:
            sections["engineering_core"].append(manifest_item)
        elif item.file_type == "log":
            sections["logs_and_decisions"].append(manifest_item)
        elif item.file_type == "literary":
            sections["literary_context"].append(manifest_item)
        elif item.file_type in {"unknown", "noncanonical_name", "scratch", "demo", "draft"}:
            sections["manual_review"].append(manifest_item)

    for key in sections:
        sections[key] = sorted(sections[key], key=lambda x: x.filename.lower())

    return ContextManifest(
        package_path=package_path,
        sections=sections,
    )


def render_context_manifest(manifest: ContextManifest, package_name: str) -> str:
    lines: list[str] = []
    lines.append(f"# Манифест контекста для новой Сущности")
    lines.append("")
    lines.append(f"Пакет: {package_name}")
    lines.append(f"Путь пакета: {manifest.package_path}")
    lines.append("")
    lines.append("Назначение: помочь выбрать минимально полезный набор файлов для передачи новой Сущности, дочернему чату или handoff-пакету.")
    lines.append("")

    for section_key in SECTION_ORDER:
        title = SECTION_TITLES[section_key]
        items = manifest.sections.get(section_key, [])
        lines.append(f"## {title}")
        lines.append("")
        lines.append(f"Количество файлов: {len(items)}")
        lines.append("")

        if not items:
            lines.append("- Нет файлов")
            lines.append("")
            continue

        for item in items:
            lines.append(f"- {item.filename}")
            lines.append(f"  path: {item.full_path}")
            lines.append(f"  file_type: {item.file_type}")
        lines.append("")

    return "\n".join(lines).rstrip() + "\n"
