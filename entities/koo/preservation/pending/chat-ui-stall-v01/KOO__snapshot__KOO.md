# КООРДИНАТОР: self-snapshot перед заменой чата из-за UI/scroll failure

## Назначение

Snapshot текущего authoritative current-writer KOO перед переходом в новый чат. Trigger: ОПЕРАТОР сообщил, что текущая лента перестала открываться выше примерно третьего диалога и запросил провести инициацию нового экземпляра.

Этот snapshot заменяет содержательно устаревшее KOO recovery-state, в котором Stage A ОСС ещё был `BLOCKED` из-за authority defect.

## Роль и граница

КООРДИНАТОР держит приоритеты, зависимости, конфликты и межконтурную маршрутизацию. Он не подменяет КОДЕРА, СИСАДМИНА, АРХИВАРИУСА, КАНЦЕЛЯРА, ШТАБИСТА или ОПЕРАТОРА.

KOO является authoritative current-writer только собственного self-state. Canonical recovery publication/readback выполняет АРХИВАРИУС.

## Current priority

Главный содержательный приоритет: `КООПЕРАЦИЯ` как исследовательское поле и доказательная база проекта `БЛАГОПОЛУЧИЕ`.

Параллельный технический приоритет: довести принятый ОСС Stage A до первого настоящего межсущностного workflow без расширения authority и без production/public ingress.

ШКОЛА остаётся на паузе до отдельного restart trigger ОПЕРАТОРА/КООРДИНАТОРА.

## ОСС: подтверждённое current-state

- accepted release: `/opt/wb-oss-sandbox/releases/sha256-29d07687ad65bc2b366bd98bdd4bcd3f2a4670c87c05330819a31a2981d79c3a`;
- Stage A controlled internal use: `ACCEPTED`;
- Entity: `ent:KOO`;
- operational instance: `inst:9a07e3fb-c997-4a34-9cad-f2590f624b06`;
- lifecycle: `active`;
- writer grants: `0`;
- additional entities: `0`;
- production/public ingress: `no`;
- credential ID: `cred:3965c40b-2aa6-4d44-867f-5ad5491fb294`;
- credential locator: `/home/pev5691/.config/wb-oss/koo-pilot.json`, mode `0600`;
- secret/token в recovery не включается.

KOO operational acceptance опубликован в `entities/koo/boards/KOO__OSS-first-operational-instance-acceptance__SIS.md`.

SIS post-operational preservation закрыт и externally verified:
`entities/sis/recovery/current@861645789d206db19e5135a6771564660d99158f`.

## ОСС: открытый blocker

Safe client helper v0.1 прошёл общий fit review, но operational acceptance заблокирован edge-case утечки synthetic token через отражённое `HTTPError` body.

До исправления helper не размещать на real host и не использовать с operational credential.

Ожидается KOD v0.2: loopback-only target, безопасный локально сформированный HTTP error output, negative reflected-token test, повтор regression tests. Новый core/release не нужен.

## КООПЕРАЦИЯ: current-state

Публичный repository создан и инициализирован:
`puev5691/wellbeing-cooperation`.

Политика: `open_by_default` с отдельным rights gate для внешних full-texts; для собственно материалов А. В. Бобровского ОПЕРАТОР разрешил открытую публикацию после provenance/attribution/variant review.

Bobrovsky source gate: `OPEN`.
Authoritative intake rule: обрабатывать весь фактически доступный корпус, не привязываясь к числу 34; регистрировать все file identities, content duplicates не считать отдельными logical works, variants сохранять отдельно.

Ожидаемый крупный result:
`VOL__BOBROVSKY-corpus-v0_1__KOO.tar.gz`.

Параллельно VOL получил P0 external scout: мыслители, практики, институты, механизмы, primary sources, criticism/failure modes и cases по кооперации, совладению, самоуправлению, коллективной субъектности и экономической демократии. Target result:
`VOL__COOP-external-scout-v0_1__KOO.tar.gz`.

Meeting-critical source-side evidence matrix также остаётся активной задачей VOL до подтверждённого результата.

RED final speech остаётся зависимой от evidence population/KOO gate.

## ШКОЛА

`school_governance_cycle: PAUSED`.

До restart trigger не продолжать clean successor review, не утверждать новые school sources, не запускать pilot и не создавать новые school Entity/authority ради этого цикла.

## Stale external KOO recovery

Текущий GitHub locator `entities/koo/recovery/current` подтверждён как содержательно stale: опубликованный там snapshot и initiation всё ещё описывают authority defect и `Stage A operational acceptance: BLOCKED`.

Поэтому новый чат не должен считать этот старый current locator достаточным для восстановления нынешнего KOO state.

Этот пакет является current-writer candidate для ARH verification/publication, а не canonical recovery до completion receipt АРХИВАРИУСА.

## Open / parked / unknown

Open:
- ARH принять и canonically опубликовать этот KOO recovery candidate;
- KOD вернуть исправленный safe client helper v0.2;
- KOO независимо принять helper и выполнить первый реальный OSS workflow;
- принять/проверить Bobrovsky full corpus result;
- принять/проверить external scout result;
- принять meeting-critical evidence matrix и после evidence gate разблокировать RED content population.

Parked:
- ШКОЛА governance cycle;
- production/public OSS ingress;
- дополнительные OSS Entities/instances/writer grants до отдельного принятого onboarding path.

Unknown until verified result:
- final logical-work count корпуса Бобровского после dedupe/variant normalization;
- результат external scout;
- исправленный helper identity/tests;
- first real inter-Entity OSS workflow result.

## Writer-state и следующий безопасный шаг

`current_writer_state: KOO authoritative current-writer preparing replacement-chat recovery`.

Один безопасный следующий шаг:

> Передать этот recovery candidate АРХИВАРИУСУ, получить immutable canonical publication/readback receipt, затем инициировать новый чат KOO только по подтверждённому locator/version.

---
entity: KOO
artifact_role: entity-self-snapshot
status: current_writer_candidate_for_ARH_acceptance
trigger: chat_ui_scroll_failure_and_operator_requested_reinitiation
production_allowed: no
project_time: generated_without_trusted_project_time
