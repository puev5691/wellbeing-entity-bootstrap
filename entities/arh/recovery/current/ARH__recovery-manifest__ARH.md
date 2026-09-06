# ARH recovery manifest v1.2

## Назначение

Этот manifest определяет проверяемый current recovery-пакет АРХИВАРИУСА для нового чата.

## Locator

    store: github
    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/arh/recovery/current
    ref: main
    manifest: ARH__recovery-manifest__ARH.md
    checksums: sha256sums.txt

При проверке изменяемая ветка `main` недостаточна сама по себе. Необходимо сопоставить SHA-256 файлов с `sha256sums.txt`.

## Состав current recovery

Обязательные файлы:

1. `ARH__initiation-current__ARH.md`
   - роль;
   - границы;
   - обязательные источники;
   - внешний locator;
   - процедура cold start;
   - следующий безопасный шаг.

2. `ARH__snapshot__ARH.md`
   - текущее подтверждённое состояние;
   - paused/parked/open контуры;
   - provenance;
   - фазовый статус миграции.

3. `ARH__recovery-manifest__ARH.md`
   - этот manifest;
   - состав;
   - locator;
   - правила проверки.

4. `sha256sums.txt`
   - SHA-256 трёх содержательных файлов recovery-пакета.
   - файл контрольных сумм не включает собственную контрольную сумму.

## Базовые управляющие источники

До подтверждения инициации должны быть прочитаны утверждённые текущие источники проекта:

- `file-work-canon-universal-v2_2-approved.md`;
- `project-instructions-core-v2-approved.md`;
- `entity-roles-short-v2-approved.md`;
- `source-loading-policy-v2-approved.md`;
- `entity-state-preservation-and-recovery-canon-v1_2-approved.md`.

Эти источники являются базовыми управляющими, а не частью этого recovery-пакета.

## Provenance

Current recovery создан на основе уже существующей и проверенной цепочки:

- `packages/core/arhivarius-v01/`;
- `packages/handoffs/arhivarius-current-chat-snapshot-v01/`;
- `packages/handoffs/arhivarius-current-chat-snapshot-v02/`;
- `packages/handoffs/0905-1204-2026-koordinator-archivist-full-context-v01/`.

Старые пакеты не изменяются и сохраняются как provenance/evidence.

## Значимые внешние ссылки состояния

Программный исходный репозиторий:

`puev5691/wellbeing-archivist`

Parked research:

`packages/handoffs/kanzeliariya-kopnoe-pravo-research-v01/`

Текущий recovery registry КООРДИНАТОРа поступил как:

`KOO__entity-recovery-registry-v02__KOO.md`

Сам registry не включён в recovery-пакет как постоянный базовый источник: текущую межсущностную кампанию ведёт КООРДИНАТОР.

## Текущие ограничения

- программный контур АРХИВАРИУСА: `paused_by_operator`;
- runtime: `not_verified`;
- ПОЧТАЛЬОН: `not_found_in_checked_sources`;
- ARH cold start по v1.2: `pending`;
- старые v01/v02: provenance, не current recovery.

## Проверка перед использованием

Новый чат обязан:

1. открыть locator;
2. проверить, что присутствуют четыре ожидаемых файла;
3. прочитать manifest;
4. проверить SHA-256 трёх содержательных файлов;
5. прочитать initiation и snapshot;
6. прочитать пять базовых управляющих источников;
7. зафиксировать один из статусов:
   - `initiation_verified`;
   - `initiation_loaded_external_unverified`;
   - `initiation_failed`.

## Следующий безопасный шаг

После внешней публикации и проверки current recovery:

`отдельная cold-start инициация нового чата АРХИВАРИУСА`.

Только успешный cold start позволяет перевести migration state в `cold_start_verified`, а затем в `upgraded`.

---

## Служебная карточка

document_type: recovery-manifest
entity: ARH
recovery_standard: v1.2
package_generation: current-01
status: current_manifest
project_time: generated_without_trusted_project_time
responsibility_boundary: manifest описывает пакет и проверку; он не утверждает cold-start успех до фактической пробной инициации
