# KOD recovery manifest v1.2

## Назначение

Минимальный пакет восстановления КОДЕРА. Он содержит роль, текущее состояние, provenance, хвосты и безопасный следующий шаг. Исходные репозитории, runtime-артефакты, длинные логи и секреты сюда не включаются.

## Состав

- `KOD__initiation-current__KOD.md`
- `KOD__snapshot__KOD.md`
- `KOD__recovery-manifest__KOD.md`
- `sha256sums.txt`

## Locator

    store: github
    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/kod/recovery/current
    ref: main
    manifest: KOD__recovery-manifest__KOD.md
    checksums: sha256sums.txt

`main` является mutable ref (изменяемой ссылкой). После публикации commit/blob identifiers фиксируются в assessment-отчёте КООРДИНАТОРУ.

## Provenance

Legacy predecessor: Следопыт.

Legacy package: `packages/core/sledopyt-v01/`.

Его статус: `legacy provenance`, не current recovery.

## Проверка cold-start

1. Получить каталог по locator.
2. Проверить наличие четырёх файлов.
3. Проверить SHA-256 трёх markdown-файлов по `sha256sums.txt`.
4. Прочитать initiation и snapshot.
5. Не наследовать иных задач и путей без отдельного evidence.
6. Продолжить с безопасного следующего шага snapshot либо вернуть blocker.

## Ограничения

Пакет не содержит secrets, production-конфигураций, больших репозиториев, полного архива TERA/teraOrigin и runtime-логов.

Статус `upgraded` этим manifest не присваивается.

---
entity: KOD
document_type: recovery-manifest
recovery_schema: v1.2
status: current-candidate-pending-coordinator
project_time: generated_without_trusted_project_time
