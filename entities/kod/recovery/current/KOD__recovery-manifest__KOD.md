# KOD recovery manifest v1.3

## Назначение

Минимальный проверяемый пакет восстановления КОДЕРА. Он содержит роль, current-state, provenance, неизвестные зависимости и безопасный следующий шаг. Большие архивы, исходные репозитории, runtime-артефакты, длинные логи и secrets (секреты) сюда не включаются и не требуются для обычного cold-start.

## Состав

- `KOD__initiation-current__KOD.md`
- `KOD__snapshot__KOD.md`
- `KOD__recovery-manifest__KOD.md`
- `sha256sums.txt`

## Внешний locator

    store: github
    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/kod/recovery/current
    ref: main
    manifest: KOD__recovery-manifest__KOD.md
    checksums: sha256sums.txt

`main` является mutable ref (изменяемой ссылкой). После публикации конкретная проверенная версия фиксируется в отчёте финализации через commit и Git blob identifiers.

## Current-state и artifact references

Для непосредственного safe next step отдельный исполнимый artifact reference не требуется: КОДЕР ожидает новую профильную постановку KOO.

Stage 04 не является active dependency:

    artifact_identity: Stage 04 executable artifact
    state: parked_unknown
    locator: unknown
    immutable_version_identity: unknown
    normative_status: not_current
    purpose: historical TERA 0.992 runtime experiment
    reconstruction_from_memory: forbidden

Отсутствующие значения не считаются разрешёнными или восстановленными.

## Provenance

Legacy predecessor: Следопыт.

Legacy package: `packages/core/sledopyt-v01/`.

Статус: `legacy provenance`, не current recovery. Старые абсолютные пути и задачи не активируются без нового evidence.

## Проверка cold-start

1. Прочитать пять действующих базовых управляющих Project Sources.
2. Получить recovery по locator.
3. Проверить фактический состав.
4. Проверить SHA-256 трёх Markdown-файлов по `sha256sums.txt`.
5. Прочитать initiation и snapshot.
6. Проверить immutable commit/blob identifiers, если они переданы recovery-задачей или последним проверенным отчётом.
7. Не наследовать иных задач, путей и unknown-зависимостей без отдельного evidence.
8. Выполнять только safe next step snapshot либо вернуть blocker.

## Ограничения

Stage 04 находится в `parked_unknown` и не должен запускаться или реконструироваться автоматически.

TERA `0.992` и связанные runtime-эксперименты находятся в parked.

Техническая модель общей среды Сущностей является ближайшим профильным направлением, но требует отдельной задачи KOO.

Пакет не присваивает статус `upgraded` и не требует загрузки всего архива проекта.

---
entity: KOD
document_type: recovery-manifest
recovery_schema: v1.3
status: current
stage04_state: parked_unknown
project_time: generated_without_trusted_project_time
