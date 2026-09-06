# Реестр апгрейда Сущностей под recovery v1.2 — v0.1

## Смысл

Это первая проверяемая карта Сущностей для перехода на новый порядок инициации и восстановления.

Реестр не является списком всех когда-либо существовавших чатов. В него включаются:

- Сущности, подтверждённые утверждёнными role/routing-источниками;
- внешние bootstrap/recovery-контуры, фактически обнаруженные в проверенных GitHub-репозиториях;
- отдельные legacy-профили, если они обнаружены, но их текущий нормативный статус не подтверждён.

Реестр хранит указатели и состояние миграции, а не содержимое snapshot.

## Область проверки v0.1

Структурно проверены:

- `puev5691/wellbeing-entity-bootstrap`;
- `puev5691/wellbeing-archivist`.

По ключевым recovery/initiation-маркерам проверены также:

- `puev5691/wellbeing`;
- `puev5691/wellbeing-log16`;
- `puev5691/wbn2026`;
- `puev5691/HAS`;
- `puev5691/MiroFish`;
- `puev5691/wbchain-lab`;
- `puev5691/teraOrigin`;
- `puev5691/PromeTorch`;
- `puev5691/sglang`.

Отсутствие находки в этой версии означает только `not_confirmed_in_audit_v01`, а не доказанное отсутствие артефакта во всём проекте.

## Машина состояний

Используются технические состояния миграции:

`discovered -> assessed -> recovery_prepared -> externally_published -> externally_verified -> cold_start_verified -> upgraded`

Дополнительные:

- `role_confirmed_recovery_not_confirmed`;
- `bootstrap_only`;
- `legacy_recovery_assessed`;
- `blocked_missing_role`;
- `legacy_unmapped`;
- `not_in_chat_upgrade_scope_until_confirmed`.

Они не заменяют канонические статусы инициации `initiation_verified / initiation_loaded_external_unverified / initiation_failed`.

## Реестр

| Код | Сущность | Основание существования | Найденный внешний контур | Состояние migration | Что подтверждено | Блокер / следующий шаг |
|---|---|---|---|---|---|---|
| KOO | КООРДИНАТОР | approved roles/routing + текущий recovery | `puev5691/wellbeing-entity-bootstrap/entities/koo/` | `upgraded` | initiation, snapshot, manifest, checksums, locator; внешний пакет проверен по v1.2 | cold-start уже использовался при новой инициации; дальше только событийное обновление |
| KAN | КАНЦЕЛЯР | approved roles/routing + текущий recovery | `puev5691/wellbeing-archivist/docs/entities/kancelyariya/recovery-current/` | `upgraded` | initiation, snapshot, manifest, checksums, locator; внешний пакет приведён к v1.2 | дальнейшее событийное обновление |
| ARH | АРХИВАРИУС | approved roles/routing + bootstrap + snapshot-пакеты | `wellbeing-entity-bootstrap/packages/core/arhivarius-v01/`; `packages/handoffs/arhivarius-current-chat-snapshot-v01/`; `...-v02/`; также старые `wellbeing-archivist/docs/entities/archivarius/` | `legacy_recovery_assessed` | bootstrap v01; полный snapshot v01 + дельта v02; initiation-backup v02; README задаёт цепочку восстановления | v02 не содержит формализованных v1.2 `manifest + sha256sums`; следующий отдельный цикл — миграция ARH |
| RED | РЕДАКТОР | approved roles/routing + bootstrap | `wellbeing-entity-bootstrap/packages/core/redaktor-v01/` | `bootstrap_only` | bootstrap-manifest v0.1, start-context, reading list, constraints, profile | внешнего recovery v1.2 в аудите v0.1 не подтверждено; после ARH провести assessment актуального чата/состояния RED |
| SIS | СИСАДМИН | approved roles/routing | не подтверждён в аудите v0.1 | `role_confirmed_recovery_not_confirmed` | роль и код | найти фактический текущий чат/внешний контур; не создавать snapshot из памяти |
| WEB | ВЕБМАСТЕР | approved roles/routing | не подтверждён в аудите v0.1 | `role_confirmed_recovery_not_confirmed` | роль и код | найти фактический внешний контур и текущее состояние |
| KOD | КОДЕР | approved roles/routing | не подтверждён в аудите v0.1 | `role_confirmed_recovery_not_confirmed` | роль и код | найти фактический внешний контур и текущее состояние |
| SHD | ШАРДОВИК | approved roles/routing | не подтверждён в аудите v0.1 | `role_confirmed_recovery_not_confirmed` | роль и код | найти фактический внешний контур и текущее состояние |
| SHK | ШКОЛА | approved roles/routing | не подтверждён в аудите v0.1 | `role_confirmed_recovery_not_confirmed` | роль и код | найти фактический внешний контур и текущее состояние |
| KON | КОНСУЛЬТАНТ | approved roles/routing | не подтверждён в аудите v0.1 | `role_confirmed_recovery_not_confirmed` | роль и код | найти фактический внешний контур и текущее состояние |
| VOL | ВОЛОНТЁР | approved routing; approved role-source прямо говорит, что профиль недостаточно определён | не подтверждён | `blocked_missing_role` | код существует | не мигрировать до подтверждённой профильной инструкции/границ роли |
| SHT | ШТАБИСТ | approved routing; approved role-source прямо говорит, что профиль недостаточно определён | не подтверждён | `blocked_missing_role` | код существует | не мигрировать до подтверждённой профильной инструкции/границ роли |
| — | ПРОВОДНИК БЛАГОПОЛУЧИЯ | approved role-source | отдельный chat-recovery не подтверждён | `not_in_chat_upgrade_scope_until_confirmed` | роль описана как web-помощник посетителю | сначала решить, является ли он отдельной чат-Сущностью для recovery, а не только web-режимом |
| — | Следопыт | legacy bootstrap/profile обнаружены в `wellbeing-entity-bootstrap` | `packages/core/sledopyt-v01/`, `profiles/sledopyt-profile.md` | `legacy_unmapped` | старый профиль и bootstrap существуют | в approved role-source v2 отдельная роль «Следопыт» отсутствует; нужен разбор: legacy, часть КОДЕРА или отдельная Сущность |

## Подтверждённые внешние находки

### KOO

Текущий канонический внешний контур существует в:

`puev5691/wellbeing-entity-bootstrap/entities/koo/`

В recovery-каталоге присутствуют:

- snapshot;
- manifest;
- `sha256sums.txt`;
- ссылка на current initiation;
- внешний locator и процедура проверки.

Статус: `upgraded`.

### KAN

Текущий внешний recovery существует в:

`puev5691/wellbeing-archivist/docs/entities/kancelyariya/recovery-current/`

Пакет содержит initiation, snapshot, recovery-manifest и checksums и уже приведён к v1.2.

Статус: `upgraded`.

### ARH

Обнаружена более сложная старая схема:

- `packages/core/arhivarius-v01/` — bootstrap;
- `arhivarius-current-chat-snapshot-v01/` — предыдущий полный snapshot;
- `arhivarius-current-chat-snapshot-v02/` — дельта к v01.

README v02 прямо требует для полного восстановления читать v01 + v02 + project sources + recovery policy.

В v02 находятся три файла:

- `ARH__chat-initiation-backup__ARH.md`;
- `ARH__chat-state-snapshot__ARH.md`;
- `README.md`.

`sha256sums.txt` и отдельный v1.2 recovery-manifest в каталоге v02 отсутствуют.

Вывод: ARH не нужно восстанавливать с нуля. Нужно преобразовать существующую цепочку состояния в current recovery v1.2, сохранив v01/v02 как provenance.

### RED

В `packages/core/redaktor-v01/` существует bootstrap-пакет.

Его `bootstrap-manifest.md` имеет статус `working`, датирован 2026-04-11 и предназначен для инициации Редактора в новом чате/handoff-среде.

Это полезный исходный материал, но не подтверждение текущего состояния РЕДАКТОРА и не recovery v1.2.

## Обнаруженные структурные проблемы

1. **Единого каталога всех Сущностей нет.** Это не считается дефектом само по себе. Нужен единый реестр locator, а не обязательное физическое переселение.
2. **Есть разные поколения технологии:** старые bootstrap core-packages, handoff snapshots и новые v1.2 recovery.
3. **Есть legacy-профили, не совпадающие с текущим approved role-source**, например Следопыт.
4. **Наличие bootstrap не доказывает текущее состояние чата.**
5. **Наличие роли не доказывает наличие recovery.**
6. **Отсутствие находки в GitHub-аудите не доказывает отсутствие локального или ещё не опубликованного состояния.**

## Очередь после аудита

### 1. АРХИВАРИУС

Первая полноценная миграция после KOO/KAN.

Проверяемый результат:

- current initiation;
- current snapshot, сведённый из подтверждённой цепочки v01/v02 и текущего чата;
- recovery-manifest v1.2;
- `sha256sums.txt`;
- внешний locator;
- повторная проверка внешней копии;
- затем cold-start нового экземпляра.

### 2. РЕДАКТОР

После стабилизации алгоритма на ARH.

Причина: есть хороший bootstrap-материал, но нет подтверждённого current recovery.

### 3. Остальные role-confirmed Сущности

Идти не по алфавиту, а по фактической активности и риску потери состояния. Перед каждой миграцией сначала искать текущий чат и внешние материалы.

## Следующий шаг

Не расширять реестр домыслами.

Следующая отдельная задача:

> assessment и миграция АРХИВАРИУСА на recovery v1.2 с сохранением v01/v02 как provenance.

---

## Служебная карточка

document_type: entity-recovery-registry
version: v0.1
entity: KOO
status: current_registry
audit_mode: read_only_external_evidence
project_time: generated_without_trusted_project_time
responsibility_boundary: реестр фиксирует только подтверждённые роли и внешние находки; `not_confirmed` не означает доказанное отсутствие
