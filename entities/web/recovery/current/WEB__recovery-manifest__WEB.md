# Recovery manifest ВЕБМАСТЕРА

## Назначение

Проверяемый аварийный recovery-пакет WEB для запуска нового чата, когда прежний WEB-чат не может надёжно подготовить собственный snapshot.

## Locator

    store: github
    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/web/recovery/current
    ref: main
    manifest: WEB__recovery-manifest__WEB.md
    checksums: sha256sums.txt

`main` изменяемый. Cold-start обязан зафиксировать commit/blob identifiers и сверить SHA-256.

## Состав

    WEB__initiation-current__WEB.md
    WEB__snapshot__WEB.md
    WEB__recovery-manifest__WEB.md
    sha256sums.txt

## Происхождение

Пакет создан КООРДИНАТОРОМ в аварийном режиме, потому что ОПЕРАТОР подтвердил неработоспособность прежнего чата WEB.

Основание:

- действующие Project Instructions;
- пять approved Project Sources;
- утверждённая роль ВЕБМАСТЕРА;
- проверенный KOO recovery-registry;
- внешняя проверка отсутствия `entities/web/recovery/current` до создания пакета;
- явное решение ОПЕРАТОРА перейти к новой технологии инициации.

## Что пакет НЕ утверждает

Пакет не утверждает:

- что восстановил всю память прежнего WEB;
- что знает current production-state сайта;
- что старые публикации доступны;
- что старые конфиги актуальны;
- что DNS/HTTPS/VDS находятся в каком-либо конкретном состоянии;
- что старые задачи продолжают действовать.

## Проверка нового экземпляра

Новый WEB обязан:

1. прочитать пять approved Project Sources;
2. открыть locator;
3. подтвердить ровно четыре файла;
4. сверить `sha256sums.txt`;
5. зафиксировать commit/blob identifiers;
6. отделить minimal current от unknown/legacy;
7. выдать один из статусов:
   - `initiation_verified`;
   - `initiation_loaded_external_unverified`;
   - `initiation_failed`.

После успешного cold-start первая профильная работа — read-only аудит внешнего веб-контура.

Статус `upgraded` закрывает КООРДИНАТОР только после cold-start.

---

document_type: recovery-manifest
entity: WEB
status: emergency_bootstrap_candidate
recovery_canon: v1.2
project_time: generated_without_trusted_project_time
