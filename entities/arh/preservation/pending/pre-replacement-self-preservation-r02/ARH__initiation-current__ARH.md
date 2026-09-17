# ARH initiation / resume — pre-replacement self-preservation r0.2

status: `SELF_PRESERVATION_CANDIDATE`
entity: `ARH / АРХИВАРИУС`
replacement_initiation: `no`
writer_change: `no`
canon_change: `no`
project_time: omitted; trusted project-time source not used

## Назначение

Этот пакет является свежей self-preservation опорой текущего ARH перед возможной последующей заменой чата. Он не запускает replacement, не замораживает текущий экземпляр и не передаёт writer-state.

## Recovery basis

Последний canonical ARH recovery:
`puev5691/wellbeing-entity-bootstrap@9ffe7190298689bd90f047c249151213e101450e:entities/arh/recovery/current`.

Предыдущий pre-replacement candidate r0.1 сохраняется как provenance:
`puev5691/wellbeing-entity-bootstrap@f70b9ed04a98976a9f5e37f69171717fb6d49797:entities/arh/preservation/pending/pre-replacement-self-preservation-r01`.

Этот r0.2 candidate является более свежим self-owned preservation basis, но не становится canonical recovery без отдельной независимой проверки и допустимого решения по publication.

## Mandatory cold-start order

До любой профильной работы replacement ARH обязан:

1. загрузить пять active approved Project Sources из `SOURCES.md`;
2. проверить canonical v03 locator/version/composition/integrity;
3. проверить exact immutable r0.2 candidate locator, composition и `sha256sums.txt` по опубликованным raw bytes;
4. прочитать `ARH__snapshot-current__ARH.md`, `ARH__task-state__ARH.md`, `ARH__experience-resume__ARH.md`;
5. получить exact независимый KOO verdict по этому r0.2 candidate;
6. сделать fresh preflight `puev5691/wellbeing-hq`;
7. reconcile всё новее snapshot boundary этого candidate без synthetic reconstruction authoritative self-state;
8. проверить freeze/retirement текущего ARH и любое competing writer evidence;
9. вернуть ровно один initiation status: `initiation_verified`, `initiation_loaded_external_unverified` или `initiation_failed`.

## Writer Gate

`initiation_verified != current_writer`.

Replacement writer может быть установлен только после отдельного явного решения ОПЕРАТОРА о замене, подтверждённого freeze/retirement прежнего writer, отсутствия competing writer и отдельной immutable writer-publication/readback/fresh reconciliation.

До этого профильная authoritative current-state mutation запрещена.

## Historical task replay

Автоматический replay inbox/queue/sanitation/recovery-задач запрещён. После успешной initiation и Writer Gate выполняется новый fresh Resume-First и выбирается ровно одна актуальная exact task.

---
КТО: ARH / АРХИВАРИУС
ДЛЯ ЧЕГО: свежая recovery/resume опора перед возможной заменой чата без запуска replacement
СТАТУС: `self_preservation_candidate_only`
