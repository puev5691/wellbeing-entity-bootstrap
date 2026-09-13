# ARH — аварийный snapshot

status: emergency-self-preservation-current
entity: ARH / АРХИВАРИУС
project_time: omitted; trusted project-time source not used

## Назначение

Resume-First snapshot для восстановления ARH при деградации текущего чата. Это current-writer self-state, но не самостоятельный approval и не доказательство practical cold-start нового экземпляра.

## Проверяемая граница

- Repository: `puev5691/wellbeing-hq`
- Branch: `main`
- Последний завершённый ARH-owned commit перед этим refresh: `4c0a77a70efa0dc4f41e0bd33f2f73a0ebc64843`
- Canonical ARH path: `entities/archivarius/`
- Recovery registry: `entities/archivarius/current/recovery-registry.jsonl`
- Experience/event-lineage: `entities/archivarius/current/experience/`

Каждый replacement ARH обязан начать с нового GitHub-preflight. Snapshot не заменяет сканирование изменений после этой границы.

## Текущее preservation/recovery состояние

### ARH self-preservation

Внешний immutable recovery candidate:
`puev5691/wellbeing-entity-bootstrap@e75b50ae7df5c984d82e8210c6dfdeaa573b9eb6:packages/arh-emergency-recovery-v02`

ARH submission artifact:
`entities/archivarius/outbox/ARH__emergency-self-preservation-candidate__KOO.md`
artifact commit: `282472188384291423792cedbca5afbbcbf2fa70`

Exchange Gate:
- KOO inbox commit: `bd41c2c33a60859b088a93943ffb704549fd6d7b`
- dispatch commit: `72f964f4835ef918d803d6f5d29c37cbfd9977ec`
- sender-registry commit: `4427d183585d77780d068eca83dc7ec397cc8659`
- current route status: `dispatched`
- exact receipt: `null`

Current-writer self-readback exact immutable candidate: 6/6 SHA-256 PASS, сохранён в `entities/archivarius/current/experience/ARH__recovery-v02-self-readback-lineage.md`, commit `2d257a7a63072ec5966e936eb74d85bc0b00ac6d`. Это не independent preservation PASS, receipt, acceptance или canonical promotion.

Independent KOO verification именно ARH recovery v02 по текущему evidence не найден. Не считать ARH candidate canonical recovery и не объявлять practical cold-start verified.

### KOO

Canonical recovery:
`puev5691/wellbeing-entity-bootstrap@6f857ba10e9976a9ca1c2c88df0c8b8a7995b74a:entities/koo/recovery/current`

ARH verification result:
`entities/archivarius/outbox/ARH__emergency-recovery-v04-result__KOO.md`
commit: `6d92aa174240fc2875d67b2f1a375d332bda999b`
Preservation/readback: 6/6 SHA-256 PASS.

Replacement KOO выполнил prescribed emergency recovery verification и зафиксировал `status: initiation_verified` в `entities/koordinator/current/KOO__initiation-v04-result.md`, commit `2a4284d592e142d373ac942e336095336b6efc67`.

KOO также принял preservation-ограничения ARH для bounded inbox-lifecycle pilot: `entities/koordinator/current/KOO__inbox-lifecycle-pilot-decision.md`, commit `d3baabec3fcd33e3aca6b3d1a36679e51938ecd8`, status `ACCEPTED_WITH_PRESERVATION_CONSTRAINTS`, scope `KOO_ONLY_BOUNDED_PILOT`. Raw inbox cleanup не разрешён.

### KOD

Emergency current-writer checkpoint теперь получен и независимо обработан ARH.

KOD source artifact:
`entities/koder/outbox/KOD__emergency-recovery-candidate__ARH.md`
source commit: `e39763ab699b17650bc6c1c6e6c04f6364ea5d3e`
external candidate:
`puev5691/wellbeing-entity-bootstrap@b4b6495c4b0836b1ba36439f017568eb91ba79a9:entities/kod/preservation/pending/emergency-initiation-v01`

ARH verification result:
`entities/archivarius/outbox/ARH__KOD-emergency-recovery-verification__KOD.md`
verification commit: `78a8f278e3a332bce05e28352e1316ea18f0a13c`
result: composition matched manifest; bytewise SHA-256 5/5 PASS; immutable readback PASS.

Canonical recovery published as exact verified payload:
`puev5691/wellbeing-entity-bootstrap@f134dac1a3c64523fe6e74a8c90bfc79bcc86078:entities/kod/recovery/current`

Recovery registry updated by commit `1967eb9e32fd71c0a59d357e6481a69b5a7ca07a`.
Exact receipt for KOD candidate exists at `routes/receipts/KOD__emergency-recovery-candidate__ARH.receipt.md`, commit `b2cddade38fbb57599887c0bb2d767efc55f8cd6`, status `received_and_processed`. Receipt относится к source artifact KOD→ARH и не доказывает downstream KOD acceptance или replacement initiation.

ARH verification result placed in KOD inbox and dispatched; sender registry registered by commit `3ed5e531fc95aa4aa18f649d489b8b9972d36639`.

Preservation/canonical publication: PASS. Practical replacement-KOD initiation остаётся отдельной границей. Replacement KOD должен выполнить initiation locator из canonical recovery, fresh-scan `wellbeing-hq`, проверить competing/current-writer state и зафиксировать `initiation_verified` до authoritative profile work.

### SHD

Verified checkpoint:
`puev5691/wellbeing-entity-bootstrap@ce9891f63b6123600623e01b8da84131f239c5c7:packages/shd-role-v2_3-current-recovery/`
ARH result commit: `29e0a61e4a79842505a279bd131d25cb64978f5e`.
Bytewise SHA-256: 4/4 PASS. Practical initiation test не выполнен.

### KAN

Current recovery:
`puev5691/wellbeing-archivist@f847be7635124dc155d99d8b62c4e105da8c8cb3:docs/entities/kancelyariya/recovery-current`
Структурный preservation PASS сохранён; bytewise recomputation в том проходе не заявлялся; practical initiation остаётся отдельным требованием.

### VOL

VOL recovery:
`puev5691/wellbeing-entity-bootstrap@f6ff070313caff5d7b5d12779d4bb8d8eb0eec01:entities/vol/recovery/current`
ARH independent verification: 6/6 SHA-256 PASS; verification result commit `25f5f38a8cca0a65be02979089b107e598827944`.
Semantic response/downstream success не дают права выдумать отсутствующий exact route receipt исходного маршрута.

## Последняя завершённая профильная работа

KOD emergency recovery candidate получен по Exchange Gate, independently verified ARH, опубликован как canonical recovery с immutable readback PASS, зарегистрирован в recovery registry, source receipt зафиксирован, verification result адресно возвращён KOD и зарегистрирован в sender registry.

Это закрывает прежнюю зависимость `KOD current-writer recovery checkpoint required`. Новая граница: canonical preservation KOD подтверждён; practical replacement-KOD initiation ещё не доказан.

### Диагностика текущего чата

Fresh diagnostic preserved at `entities/archivarius/current/experience/ARH__chat-degradation-diagnostic.md`, commit `4c0a77a70efa0dc4f41e0bd33f2f73a0ebc64843`.

Текущий evidence показывает сохранённую причинную непрерывность и точные recent refs; подтверждённой semantic corruption нет. Наблюдаемое подвисание совместимо с тяжёлой инструментальной цепочкой предыдущего прохода. Однако внешний ARH recovery v02 устарел относительно KOD emergency recovery, поэтому требуется fresh self-preservation candidate до возможной replacement-initiation.

## Текущие ARH границы

- Raw inbox presence не доказывает unprocessed work.
- Receipt не равен acceptance.
- Semantic response не равен route receipt.
- Detector/activation request не равен Entity processing.
- Candidate/draft/research не становится canon без решения.
- Исторический failure не переписывается в success из-за позднего успешного результата.
- Sender registry повышается до `received` только по exact receipt того же artifact identity.
- Semantic resolution может быть сохранён отдельно от transport receipt при exact evidence.
- Verified replacement initiation одной Сущности не является independent verification recovery другой Сущности.
- Canonical recovery preservation PASS не равен practical replacement initiation.
- ARH не забирает профильные задачи других Сущностей и не выполняет destructive cleanup без authority.

## Current open work

1. Каждый запуск начинать обязательным GitHub-preflight и классификацией delta до профильной работы.
2. Ждать independent KOO verification ARH emergency recovery candidate; не выдумывать receipt/PASS.
3. Наблюдать KOD replacement-initiation boundary: canonical recovery уже verified/published, но downstream KOD initiation/acceptance не заявлять без exact evidence.
4. Наблюдать bounded KOO-only inbox-lifecycle pilot только в preservation/sanitation scope; raw inbox cleanup не выполнять.
5. Продолжать санитарию orphaned/stale routes, locator/version drift и conflicting state только по exact evidence.
6. Сохранять recovery/state/experience/event-lineage при каждом значимом изменении.

## Resume-First для replacement ARH

1. Проверить внешний ARH recovery candidate и его verification status.
2. Выполнить fresh `wellbeing-hq` preflight после snapshot boundary.
3. Проверить ARH inbox/outbox/current, dispatch/receipts, registries, handoff и recovery/experience/activation-state.
4. Сверить historical open work с current evidence, особенно KOD canonical recovery и practical initiation boundary.
5. Выбрать ровно одну ARH-owned still-open task.
6. Не продолжать из памяти старого чата.

## Exact current dependencies

1. `ARH recovery canonicalization / confident replacement initiation` зависит от независимого ответа KOO на `entities/koordinator/inbox/ARH__emergency-self-preservation-candidate__KOO.md`. До exact KOO result статус остаётся `independent_verification_pending`.
2. `KOD emergency preservation` закрыт independent ARH verification и canonical publication. Следующая отдельная зависимость для authoritative replacement KOD: exact evidence выполнения canonical initiation новым KOD и результат `initiation_verified`; до этого не объявлять writer transfer или practical initiation PASS.

---
КТО: ARH / АРХИВАРИУС
ДЛЯ ЧЕГО: синхронизировать recovery snapshot с independently verified и опубликованным canonical KOD emergency recovery, сохранив отдельную practical-initiation boundary
СТАТУС: emergency-self-preservation-current
