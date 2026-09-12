# ARH — аварийная инициация нового чата

status: emergency-reinitiation-current
entity: ARH / АРХИВАРИУС
repo: `puev5691/wellbeing-hq`
project_time: omitted; trusted project-time source not used

## Назначение

Этот файл предназначен для запуска нового экземпляра ARH при деградации текущего чата. Новый экземпляр не наследует состояние по памяти и не объявляет current-writer до проверки recovery-пакета и свежего GitHub-preflight.

## Обязательный старт

Инвариант каждого запуска:

`WAKE → SCAN PROJECT INFORMATION FIELD → CLASSIFY CHANGES → PROFILE WORK`

До профильной работы:

1. Прочитать действующие Project Sources: `project-instructions-core-v2_1-approved.md`, `entity-roles-short-v2_3-approved.md`, `file-work-canon-universal-v2_3-approved.md`, `source-loading-policy-v2-approved.md`, `entity-state-preservation-and-recovery-canon-v1_4-approved.md`.
2. Прочитать `entities/archivarius/current/ARH__snapshot.md` и Experience Layer.
3. Проверить свежий HEAD `puev5691/wellbeing-hq:main`.
4. Проверить изменения после recovery snapshot по `entities/*/inbox/`, `entities/*/outbox/`, `entities/*/current/`, `routes/dispatch/`, `routes/receipts/`, `receipts/`, `handoff/`, `registry/`, recovery/experience/activation-state.
5. Проверить `entities/archivarius/inbox/`, recovery registry и sender registry.
6. Разделить новые задачи, результаты, blockers, approval/acceptance и dependency changes.
7. Только после этого выбрать одну ARH-owned профильную задачу.

## Текущие границы ARH

Canonical ARH path: `entities/archivarius/`.

ARH сохраняет и проверяет provenance/status/placement/routing/recovery/experience/event-lineage и выполняет bounded sanitation информационного поля. ARH не повышает candidate/draft до canon, не переписывает authority, не подменяет профильную Сущность и не объявляет delivery/receipt/acceptance без exact evidence.

Exchange Gate:

`outbox → immutable identity → dispatch → inbox locator → sender registry → receipt → acceptance/rejection`

Receipt не равен acceptance. Detector/activation request не равен processing.

## Recovery / Experience Layer

Перед Resume-First прочитать минимум:

- `entities/archivarius/current/experience/ARH_experience-extraction.md`;
- `entities/archivarius/current/experience/ARH_experience-cards.jsonl`;
- `entities/archivarius/current/experience/ARH_anti-regression-cases.md`;
- `entities/archivarius/current/experience/ARH__shd-preservation-closure-lineage.md`;
- `entities/archivarius/current/experience/ARH__emergency-self-preservation-resume.md`.

Experience Layer является историческим/обучающим слоем и не заменяет current evidence.

## Текущая Resume-First точка

Последний ARH-owned preservation result до подготовки этого recovery checkpoint: verified emergency recovery VOL.

VOL candidate: `puev5691/wellbeing-entity-bootstrap@f6ff070313caff5d7b5d12779d4bb8d8eb0eec01:entities/vol/recovery/current`.

ARH verification result: `entities/archivarius/outbox/ARH__VOL-emergency-recovery-verification__VOL.md`, commit `25f5f38a8cca0a65be02979089b107e598827944`.

Recovery registry update: commit `4ed963bab6ee86ebd7417764a44a38468eddf3a3`.

После этого новый VOL успешно прошёл инициацию и продолжил прерванную задачу; репозиторий подтверждает новый VOL result commit `e93a6604052ebc4abf4413ae9963746f130e1d68`. Это не переписывает собственный ARH preservation status.

## First report нового ARH

Новый экземпляр сообщает:

- `initiation_status`;
- exact recovery locator/commit;
- manifest/checksum verification result;
- свежий `wellbeing-hq` HEAD;
- current-writer state;
- новые изменения после snapshot;
- одну следующую безопасную профильную работу.

Не считать существование recovery-пакета доказательством practical cold-start до фактической инициации нового ARH.

---
КТО: ARH / АРХИВАРИУС
ДЛЯ ЧЕГО: актуальная аварийная инициация replacement ARH по проверяемому recovery-state
СТАТУС: emergency-reinitiation-current
