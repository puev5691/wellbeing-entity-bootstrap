# KOO — current self-snapshot для emergency recovery v03

## Смысл

Self-snapshot текущего authoritative KOO после проверяемой инициации и отдельного ARH preservation result. Confirmed current, pending/unknown и historical evidence разделены.

## Confirmed current

- Entity: `KOO / КООРДИНАТОР`;
- initiation status: `initiation_verified`;
- verification report: `wellbeing-hq@d1cc614fdd17d3002028bf4e122bf19c40228632:entities/koordinator/current/KOO__initiation-verification-report.md`;
- current-writer state: accepted for this KOO instance по OPERATOR-directed emergency replacement и проверенной границе отсутствия конкурирующего authoritative writer.

### Canonical recovery

Последний accepted baseline:
`puev5691/wellbeing-entity-bootstrap@3522aa8de15d83a108de685d626aa268def04a9d:entities/koo/recovery/current`.

ARH result:
`puev5691/wellbeing-hq@07e409239ed3552a9bc42592823663facb6b1512:entities/archivarius/outbox/ARH__emergency-preservation-check__KOO.md`.

Decision:
- preservation input: ACCEPTED;
- canonical replacement: BLOCKED;
- blocker: `NEW_EMERGENCY_RECOVERY_COMPOSITION_HAS_NO_VERIFIED_MANIFEST_AND_SHA256_MAP`.

Этот v03 candidate закрывает указанный blocker. До ARH PASS baseline не меняется.

### Emergency handoff / Experience Layer

Verified publications:
- master `31e78ec4f4b031f149401410930892621b6dc946`;
- extraction `7f666c2f86a2f17d1f11b6934e5f132b79f6d985`;
- cards `15d4270fdbd36d6a28e6dfefe32ed4bc12d27117`;
- anti-regression `6217acce21a088c92687ec6c466865675ba744d6`.

Experience Layer = historical evidence, not Project Source/current truth.

## Pending

1. ARH verification complete v03 candidate.
2. При PASS: canonical publication в `entities/koo/recovery/current` + immutable readback + receipt/result.
3. Затем automation hardening: `START → TASK → ACTION → RESULT/BLOCKER → CHECK → FIXATION/ROUTING → EXPERIENCE`.
4. Затем always-active/event-driven research.

## Unknown

- Microsoft M365/Entra organizational tenant/work-account: `unknown`.
- exact existing ChatGPT Entity-chat resume capability: not proven; current adapter reports failure.

## Automation snapshot, требующий fresh recheck перед изменением

- KOO GitHub Work: enabled;
- ARH GitHub Work: enabled;
- SHT GitHub Work: enabled;
- KOD GitHub Work: disabled;
- SIS GitHub Work: disabled;
- KOO full-cycle/chat-record hardening: not applied.

## Retained / superseded относительно baseline 3522aa8...

- old initiation: superseded in candidate;
- old snapshot: superseded in candidate;
- old preservation handoff: superseded in candidate;
- approved source set: retained semantically with exact hashes;
- emergency master: retained as newer handoff evidence;
- Experience Layer: added as historical evidence.

## Active dependency

ARH must verify exact immutable candidate commit, package composition and `sha256sums.txt`. On mismatch baseline `3522aa8...` остаётся неизменным.

## Один безопасный следующий шаг

После publication/readback candidate адресно передать ARH immutable locator и запросить preservation-check. KOO не изменяет `recovery/current` самостоятельно.

---
КТО: KOO / КООРДИНАТОР
ДЛЯ ЧЕГО: authoritative self-snapshot для закрытия emergency preservation blocker
СТАТУС: current_writer_candidate_for_ARH
source: verified KOO initiation + fresh wellbeing-hq evidence + ARH preservation result
related_files: KOO__initiation-current__KOO.md; KOO__preservation-handoff__ARH.md; MANIFEST.md
approval_status: not_project_source
responsibility_boundary: ARH выполняет preservation/canonical publication; KOO не переписывает canonical recovery самостоятельно
