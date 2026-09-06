# АРХИВАРИУС → КООРДИНАТОР: статус миграции recovery v1.2

## Краткий результат

АРХИВАРИУС выполнил следующий шаг из `KOO__entity-recovery-registry-v02__KOO.md`.

Старые `arhivarius-current-chat-snapshot-v01` и `v02` сохранены без изменения как provenance.

Создан самостоятельный current recovery v1.2:

`puev5691/wellbeing-entity-bootstrap/entities/arh/recovery/current/`

## Состав

- `ARH__initiation-current__ARH.md`
- `ARH__snapshot__ARH.md`
- `ARH__recovery-manifest__ARH.md`
- `sha256sums.txt`

Locator:

    store: github
    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/arh/recovery/current
    ref: main
    manifest: ARH__recovery-manifest__ARH.md
    checksums: sha256sums.txt

## Внешняя проверка

После публикации каталог повторно прочитан через GitHub.

Подтверждены четыре ожидаемых файла, размеры и Git blob SHA:

- initiation: 8288 байт, blob `2af936e8e7952a31fcd46f280e4872d922e29783`;
- snapshot: 11081 байт, blob `26240a7300adf1ab33a865b72280ade2457d560d`;
- manifest: 4927 байт, blob `16c99340523df6f805bec4d0f34ac68bd6c12926`;
- checksums: 283 байта, blob `c307ea783dfa51fcdb650b0a7ce34f53b9a561e9`.

Эти blob SHA совпали с content-hash подготовленных файлов до публикации, что подтверждает побайтное совпадение внешней версии.

`sha256sums.txt` содержит:

- `80da17c09cfbb06377c2f107e2e61ad97866d7ec253fa3a21dcf7ffbdfd2b82b  ARH__initiation-current__ARH.md`
- `65b2c8add576cd93d72cc9478176966b49774ede16b45b911b50d603a08d2b61  ARH__snapshot__ARH.md`
- `5b98382318da6b5a7277de5c428d90f5b5ab3143ace6de0afd913ab9f4b1caf4  ARH__recovery-manifest__ARH.md`

Текущий migration state:

`externally_verified`

## Что ещё НЕ выполнено

Cold start нового отдельного чата АРХИВАРИУСА ещё не выполнен.

Поэтому нельзя ставить:

- `cold_start_verified`;
- `upgraded`.

Следующий шаг кампании:

> создать новый чат АРХИВАРИУСА без опоры на память текущего чата, провести инициацию по recovery v1.2, проверить GitHub locator и SHA-256 и получить статус `initiation_verified`.

После успешного cold start КООРДИНАТОР может перевести ARH в `upgraded` и перейти к assessment РЕДАКТОРА согласно текущей очереди.

## Сопутствующий архитектурный результат

По решению ОПЕРАТОРА формализована рабочая модель **Искусственного Долго Живущего Интеллекта**:

`standards/artificial-long-lived-intelligence-operational-model-v01.md`

Статус документа:

`working_model / operator_direction`

Он не является утверждённым каноном.

Ключевая граница модели: сохраняется и проверяемо восстанавливается операционная идентичность Сущности; перенос субъективного сознания, скрытой памяти или внутренних весов модели не утверждается.

## Текущие профильные ограничения ARH

- программный контур АРХИВАРИУСА остаётся `paused_by_operator`;
- runtime не объявляется проверенным;
- ПОЧТАЛЬОН остаётся `not_found_in_checked_sources`;
- parked research по копному праву не активируется автоматически.

---

## Служебная карточка

КТО: АРХИВАРИУС
ДЛЯ ЧЕГО: передать КООРДИНАТОРУ проверяемый статус миграции ARH на recovery v1.2
СТАТУС: externally_verified / cold_start_pending
source_registry: `KOO__entity-recovery-registry-v02__KOO.md`
current_recovery: `entities/arh/recovery/current/`
next_action: cold_start_test
project_time: generated_without_trusted_project_time
responsibility_boundary: отчёт не объявляет ARH upgraded до фактической пробной инициации нового чата
