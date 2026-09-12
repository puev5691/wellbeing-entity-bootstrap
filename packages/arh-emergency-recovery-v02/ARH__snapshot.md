# ARH — аварийный snapshot

status: emergency-self-preservation-current
entity: ARH / АРХИВАРИУС
project_time: omitted; trusted project-time source not used

## Назначение

Snapshot для Resume-First восстановления ARH при деградации текущего чата. Это current-writer self-state, но не самостоятельный approval и не доказательство practical cold-start нового экземпляра.

## Проверяемая граница

- Repository: `puev5691/wellbeing-hq`
- Branch: `main`
- Последний ARH-owned recovery-registry write до self-preservation: `4ed963bab6ee86ebd7417764a44a38468eddf3a3`
- Наблюдаемый последующий VOL result: `e93a6604052ebc4abf4413ae9963746f130e1d68`
- Canonical ARH path: `entities/archivarius/`
- Recovery registry: `entities/archivarius/current/recovery-registry.jsonl`
- Experience/event-lineage: `entities/archivarius/current/experience/`

Каждый replacement ARH обязан начать с нового GitHub-preflight. Snapshot не заменяет сканирование изменений после этой границы.

## Текущее preservation/recovery состояние

### KOO

Current canonical recovery:
`puev5691/wellbeing-entity-bootstrap@6f857ba10e9976a9ca1c2c88df0c8b8a7995b74a:entities/koo/recovery/current`

ARH verification result:
`entities/archivarius/outbox/ARH__emergency-recovery-v04-result__KOO.md`
commit: `6d92aa174240fc2875d67b2f1a375d332bda999b`

Preservation/readback: 6/6 SHA-256 PASS. Practical cold-start/runtime continuity не доказывается одним preservation PASS.

### SHD

Verified checkpoint:
`puev5691/wellbeing-entity-bootstrap@ce9891f63b6123600623e01b8da84131f239c5c7:packages/shd-role-v2_3-current-recovery/`

ARH result commit: `29e0a61e4a79842505a279bd131d25cb64978f5e`.
Bytewise SHA-256: 4/4 PASS. Practical initiation test не выполнен.

### KAN

Current recovery remains:
`puev5691/wellbeing-archivist@f847be7635124dc155d99d8b62c4e105da8c8cb3:docs/entities/kancelyariya/recovery-current`

Структурный preservation PASS сохранён; bytewise recomputation в том проходе не заявлялся; practical initiation остаётся отдельным требованием.

### VOL

ОПЕРАТОР инициировал аварийную замену VOL из-за аномалий чата.

Current-writer VOL сформировал candidate:
`puev5691/wellbeing-entity-bootstrap@f6ff070313caff5d7b5d12779d4bb8d8eb0eec01:entities/vol/recovery/current`

ARH независимо проверил active package: 6/6 SHA-256 PASS.

ARH verification result:
`entities/archivarius/outbox/ARH__VOL-emergency-recovery-verification__VOL.md`
commit: `25f5f38a8cca0a65be02979089b107e598827944`

Recovery registry update:
`4ed963bab6ee86ebd7417764a44a38468eddf3a3`

После этого replacement VOL успешно прошёл initiation и возобновил прерванную задачу. Репозиторий содержит subsequent VOL result `e93a6604052ebc4abf4413ae9963746f130e1d68`. Это подтверждает практический resume VOL, но не является доказательством общего механизма exact ChatGPT Entity-chat resume.

## Текущие ARH границы

- Raw inbox presence не доказывает unprocessed work.
- Receipt не равен acceptance.
- Detector/activation request не равен Entity processing.
- Candidate/draft/research не становится canon без решения.
- Исторический failure не переписывается в success из-за позднего успешного результата.
- Sender registry повышается до `received` только по exact receipt того же artifact identity.
- ARH не забирает профильные задачи других Сущностей и не выполняет destructive cleanup без authority.

## Текущая оценка собственного состояния

ОПЕРАТОР сообщил о проблемах текущего ARH-чата. Инструментальная проверка выявила реальный preservation debt: до этого прохода `ARH__initiation-current.md` и snapshot отставали от последних значимых recovery-событий, а актуального внешнего ARH recovery package не было; существовал только старый handoff v01.

Решение current-writer ARH: не объявлять немедленный failover только по субъективному симптому, но немедленно сформировать свежий self-preservation checkpoint и внешний recovery candidate для независимой проверки другой Сущностью.

## Resume-First для replacement ARH

1. Проверить внешний ARH recovery candidate и его SHA-256.
2. Выполнить fresh `wellbeing-hq` preflight после snapshot boundary.
3. Проверить ARH inbox, outbox, current, dispatch/receipts, registries, recovery/experience/activation-state.
4. Сверить historical open work с current evidence.
5. Выбрать ровно одну ARH-owned still-open task.
6. Не продолжать из памяти старого чата.

## Известная следующая preservation задача

После создания этого snapshot текущий ARH должен вынести initiation/snapshot/experience/SOURCES/manifest/checksums во внешний immutable recovery candidate и адресовать независимую проверку KOO. До независимого PASS этот candidate не считать canonical recovery.

---
КТО: ARH / АРХИВАРИУС
ДЛЯ ЧЕГО: сохранить актуальное current-writer state перед возможной аварийной переинициацией ARH
СТАТУС: emergency-self-preservation-current
