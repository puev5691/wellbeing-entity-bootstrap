# Recovery manifest СИСАДМИНА

## Назначение

Проверяемый recovery-пакет СИСАДМИНА для нового чата без реконструкции состояния по памяти.

## Locator

    store: github
    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/sis/recovery/current
    ref: main
    manifest: SIS__recovery-manifest__SIS.md
    checksums: sha256sums.txt

`main` изменяемый. При cold-start надо сверить SHA-256 и зафиксировать commit/blob identifiers.

## Состав

    SIS__initiation-current__SIS.md
    SIS__snapshot__SIS.md
    SIS__recovery-manifest__SIS.md
    sha256sums.txt

## Основание создания

- входящая задача `KOO__recovery-v12-migration-assessment__SIS.md`;
- approved project sources;
- текущий SIS-чат и подтверждённые результаты текущего чата;
- GitHub-проверки `puev5691/wellbeing-entity-bootstrap`;
- явные решения ОПЕРАТОРА.

## Предпубликационная проверка

До создания пакета:

- `entities/sis` вернул `404 Not Found`;
- четыре ожидаемых файла в `entities/sis/recovery/current/` вернули `404 Not Found`;
- поиск `SIS__`, `sisadmin`, `entities/sis` не нашёл current SIS recovery;
- KOO registry/board/snapshot подтверждают: SIS — следующий цикл, current recovery SIS не подтверждён.

Конфликтующий current recovery SIS в проверенном GitHub-контуре не выявлен.

## Не включать и не восстанавливать автоматически

- secrets, SSH/private keys, пароли, токены;
- полные production-конфиги;
- runtime-данные и chain state;
- длинные логи и архивы диагностических пакетов;
- старые сетевые состояния без свежей проверки.

## Проверка нового экземпляра

Новый SIS читает источники, открывает locator, проверяет четыре файла, сверяет SHA-256 и фиксирует commit/blob identifiers. Допустимые статусы: `initiation_verified`, `initiation_loaded_external_unverified`, `initiation_failed`.

Статус `upgraded` закрывает только КООРДИНАТОР после независимой проверки и cold-start.

---
document_type: recovery-manifest
entity: SIS
status: published_candidate_for_external_verification
recovery_canon: v1.2
project_time: generated_without_trusted_project_time
