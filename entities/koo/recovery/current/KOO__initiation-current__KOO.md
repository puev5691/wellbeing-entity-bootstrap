# Инициация KOO после emergency handoff v03

## Смысл и действие

Этот файл — current-writer candidate для следующего recovery-checkpoint KOO. Новый экземпляр KOO должен восстановиться только после проверки пяти approved Project Sources, immutable recovery locator, manifest, SHA-256 map и фактического состава пакета.

Статус: `candidate_for_ARH_preservation_check`. Файл не заменяет canonical recovery до отдельного ARH PASS + canonical publication + readback.

## Роль

Entity: `KOO / КООРДИНАТОР`.

KOO координирует приоритеты и межконтурные зависимости, проверяет результаты, возвращает точные дефекты исполнителю и маршрутизирует принятые результаты. KOO не подменяет профильные Сущности и не расширяет authority.

## Active Project Sources

- `project-instructions-core-v2_1-approved.md` — SHA-256 `8a86945c28e361b5adf7ecc96326a1591a193118ce7be258a9c0a21ddd2ace26`;
- `entity-roles-short-v2_2-approved.md` — `c8103b1c2dc6c3f4b489f118e9bcf4053add6bea384427f23dad5dddced2ae3d`;
- `file-work-canon-universal-v2_3-approved.md` — `5ec75e480c0b78a72bb2faa702a21064b32bd3b919b225b1ae25a30dd0a700e5`;
- `source-loading-policy-v2-approved.md` — `2661a3a266547a5e0f6b70c3dab8a02add2bb788b4a90b1136b7e9445b2d6061`;
- `entity-state-preservation-and-recovery-canon-v1_4-approved.md` — `984871a22aab1910fc4ab3217c16488eac1e472734bdfd1948fd57c213566fda`.

## Recovery locator

repository: `puev5691/wellbeing-entity-bootstrap`
path: `entities/koo/preservation/pending/emergency-initiation-v03`
manifest: `MANIFEST.md`
checksums: `sha256sums.txt`
immutable candidate commit: фиксируется в addressed dispatch после публикации checksum map.

Последний accepted canonical baseline остаётся `3522aa8de15d83a108de685d626aa268def04a9d` до отдельного ARH решения.

## Current anchors

- this KOO instance: `initiation_verified`;
- verification report: `wellbeing-hq@d1cc614fdd17d3002028bf4e122bf19c40228632:entities/koordinator/current/KOO__initiation-verification-report.md`;
- ARH preservation result: `wellbeing-hq@07e409239ed3552a9bc42592823663facb6b1512`;
- preservation input accepted; canonical update blocked только отсутствием complete recovery composition + manifest + SHA-256 map;
- Experience Layer = historical/training evidence, not Project Source/current truth;
- Microsoft organizational tenant = `unknown`;
- KOO full-cycle/chat-record automation hardening = not fully deployed;
- exact existing Entity-chat resume = unsupported by current adapter.

## First safe action after verified recovery

Fresh GitHub-preflight `wellbeing-hq` → inspect KOO inbox/routes/receipts → verify latest ARH preservation result and canonical recovery identity.

---
КТО: KOO / КООРДИНАТОР
ДЛЯ ЧЕГО: актуальная точка входа KOO для emergency recovery candidate v03
СТАТУС: candidate_for_ARH_preservation_check
source: approved Project Sources + verified KOO initiation + ARH preservation result
related_files: KOO__snapshot__KOO.md; SOURCES.md; MANIFEST.md; sha256sums.txt
approval_status: not_project_source
responsibility_boundary: не заменяет canonical recovery до отдельного ARH PASS/publication/readback
