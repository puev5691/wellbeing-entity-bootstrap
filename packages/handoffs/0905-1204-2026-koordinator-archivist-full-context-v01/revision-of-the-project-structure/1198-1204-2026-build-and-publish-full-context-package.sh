#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

DOC_DIR="/storage/emulated/0/Documents/Blagopoluchie/00_INBOX/my-structure/chats-gpt-name/revision-of-the-project-structure"
ARCH_REPO="/storage/emulated/0/Documents/repos/wellbeing-archivist"
BOOT_REPO="/storage/emulated/0/Documents/repos/wellbeing-entity-bootstrap"

STAMP="$(date +%H%M-%d%m-%Y)"
PKG_NAME="${STAMP}-koordinator-archivist-full-context-v01"
PKG_REL="packages/handoffs/${PKG_NAME}"
PKG_DIR="${BOOT_REPO}/${PKG_REL}"

LOG_FILE="${DOC_DIR}/${STAMP}-full-context-package-success-log.md"

mkdir -p \
  "${PKG_DIR}/revision-of-the-project-structure" \
  "${PKG_DIR}/archivist-root-snapshot" \
  "${PKG_DIR}/archivist-src-snapshot" \
  "${PKG_DIR}/repo-state"

if [ ! -d "$DOC_DIR" ]; then
  echo "Missing DOC_DIR: $DOC_DIR" >&2
  exit 1
fi

if [ ! -d "$ARCH_REPO" ]; then
  echo "Missing ARCH_REPO: $ARCH_REPO" >&2
  exit 1
fi

if [ ! -d "$BOOT_REPO" ]; then
  echo "Missing BOOT_REPO: $BOOT_REPO" >&2
  exit 1
fi

find "$DOC_DIR" -maxdepth 1 -type f -print0 | while IFS= read -r -d '' f; do
  cp "$f" "${PKG_DIR}/revision-of-the-project-structure/"
done

for f in archivist.py README.md pyproject.toml requirements.txt; do
  if [ -f "${ARCH_REPO}/${f}" ]; then
    cp "${ARCH_REPO}/${f}" "${PKG_DIR}/archivist-root-snapshot/"
  fi
done

find "${ARCH_REPO}/src/archivist" -maxdepth 1 -type f -print0 | while IFS= read -r -d '' f; do
  cp "$f" "${PKG_DIR}/archivist-src-snapshot/"
done

git -C "$ARCH_REPO" status --short > "${PKG_DIR}/repo-state/archivist-git-status.txt"
git -C "$ARCH_REPO" log --oneline -n 30 > "${PKG_DIR}/repo-state/archivist-git-log.txt"
git -C "$ARCH_REPO" diff > "${PKG_DIR}/repo-state/archivist-working-diff.patch" || true
git -C "$ARCH_REPO" remote -v > "${PKG_DIR}/repo-state/archivist-git-remote.txt" || true

git -C "$BOOT_REPO" status --short > "${PKG_DIR}/repo-state/bootstrap-git-status-before-add.txt"
git -C "$BOOT_REPO" log --oneline -n 20 > "${PKG_DIR}/repo-state/bootstrap-git-log-before-add.txt"
git -C "$BOOT_REPO" remote -v > "${PKG_DIR}/repo-state/bootstrap-git-remote.txt" || true

(
  cd "${PKG_DIR}"
  find . -type f | sort > MANIFEST.files.txt
)

cat > "${PKG_DIR}/README-context-package.md" <<MD_EOF
# Full context package: Координатор / Архивариус / bootstrap recovery

Дата сборки: $(date '+%Y-%m-%d %H:%M:%S')
Статус: working
Назначение: полный пакет рабочего сознания контура для переноса в новый чат и хранения в репозитории Сущностей

Состав:
- revision-of-the-project-structure/ : все файлы рабочего пакета текущего чата
- archivist-root-snapshot/ : снимок корня wellbeing-archivist
- archivist-src-snapshot/ : снимок src/archivist
- repo-state/ : git status, git log, git diff и remote

Цель:
- передача нового чата Координатора
- recovery broken state в wellbeing-archivist
- сохранение памяти контура в wellbeing-entity-bootstrap
MD_EOF

cat > "$LOG_FILE" <<MD_EOF
# Журнал завершения шага: full context package

Дата: $(date '+%Y-%m-%d')
Статус: working
Контур: revision-of-the-project-structure
Назначение: зафиксировать сборку и публикацию полного пакета рабочего сознания контура

artifact_type: journal
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: ${BOOT_REPO}
evidence_level: confirmed_by_local_filesystem
handoff_to: new_chat
related_docs:
- ${PKG_DIR}/README-context-package.md
- ${PKG_DIR}/MANIFEST.files.txt
- ${PKG_DIR}/repo-state/archivist-git-status.txt
- ${PKG_DIR}/repo-state/archivist-git-log.txt
- ${PKG_DIR}/repo-state/archivist-working-diff.patch

human_owner: ЗУМ
human_responsible: ЗУМ

entity_author: Координатор
entity_role: корневая координирующая Сущность

tooling_origin: ChatGPT
generation_mode: interactive collaborative drafting

source_chat_contour: revision-of-the-project-structure
bootstrap_package_id: not_applicable

approval_status: working
responsibility_boundary: пакет собран для передачи памяти контура и хранения в репозитории Сущностей

## Что сделано

Собран и помещён в репозиторий хранения Сущностей полный пакет рабочего сознания контура:

${PKG_DIR}

Пакет содержит:
- все файлы текущего рабочего пакета чата
- снимок репозитория wellbeing-archivist
- git-состояние и diff для recovery
- manifest содержимого

## Итог

Пакет собран и готов для:
- загрузки в новый чат
- долговременного хранения
- recovery и продолжения работы
MD_EOF

git -C "$BOOT_REPO" add "$PKG_REL"
git -C "$BOOT_REPO" commit -m "Add full context package for archivist recovery"
git -C "$BOOT_REPO" push origin "$(git -C "$BOOT_REPO" branch --show-current)"

echo "Created context package:"
echo "  ${PKG_DIR}"
echo
echo "Created local log:"
echo "  ${LOG_FILE}"
echo
echo "Bootstrap repo log:"
git -C "$BOOT_REPO" log --oneline -n 6
