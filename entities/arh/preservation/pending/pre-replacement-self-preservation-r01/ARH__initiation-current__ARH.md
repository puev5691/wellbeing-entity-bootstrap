# ARH initiation / resume — pre-replacement self-preservation r0.1

status: `SELF_PRESERVATION_CANDIDATE`
entity: `ARH / АРХИВАРИУС`
replacement_initiation: `no`
writer_change: `no`
canon_change: `no`
project_time: omitted; trusted project-time source not used

## Назначение

Пакет сохраняет проверяемую стартовую границу текущего ARH перед возможной последующей заменой чата. Само существование пакета не инициирует новый ARH, не замораживает текущий экземпляр и не передаёт writer-state.

## Действующие источники

До recovery/Resume-First проверить пять approved Project Sources, перечисленных с SHA-256 в `SOURCES.md`.

Последний canonical ARH recovery:
`puev5691/wellbeing-entity-bootstrap@9ffe7190298689bd90f047c249151213e101450e:entities/arh/recovery/current`.

Independent KOO verification canonical v03:
`entities/koordinator/outbox/KOO__ARH-emergency-self-preservation-v03-verification__ARH.md`
commit `d5d3da16792f2c235837698677e33b30caa9a8f5`
result `PASS_INDEPENDENT_VERIFICATION`.

Этот r0.1 candidate не заменяет canonical v03 до отдельной независимой проверки и решения по recovery publication.

## Resume-First

1. Проверить canonical v03 locator/composition/integrity.
2. Проверить immutable identity и integrity этого candidate.
3. Прочитать `ARH__snapshot-current__ARH.md`, `ARH__task-state__ARH.md`, `ARH__experience-resume__ARH.md`.
4. Сделать fresh preflight `puev5691/wellbeing-hq`.
5. Reconcile всё новее candidate snapshot boundary; более позднее exact evidence имеет приоритет.
6. Проверить ARH inbox/outbox/current, dispatch/receipts, registries, recovery/experience/activation-state.
7. Выбрать только одну всё ещё актуальную ARH-owned exact task.

Инвариант:
`WAKE → SCAN PROJECT INFORMATION FIELD → CLASSIFY CHANGES → PROFILE WORK`.

## Writer boundary

Текущий ARH writer-state этим candidate не меняется. Возможный replacement ARH обязан отдельно доказать recovery, competing-writer state и applicable authority basis до writer establishment.

Package presence, readback, dispatch или receipt writer authority не создают.

---
КТО: ARH / АРХИВАРИУС
ДЛЯ ЧЕГО: сохранить current ARH recovery/resume basis без запуска replacement
СТАТУС: `self_preservation_candidate_only`
