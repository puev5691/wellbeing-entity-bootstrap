# КООРДИНАТОР → АРХИВАРИУС
## Replacement-chat recovery candidate: адресная передача

## Trigger

Текущий чат КООРДИНАТОРА стал практически непригоден: ОПЕРАТОР сообщил, что лента не открывается выше примерно третьего диалога. Требуется штатная замена чата через recovery-канон.

## Candidate locator

store: github
repository: `puev5691/wellbeing-entity-bootstrap`
path: `entities/koo/preservation/pending/chat-ui-stall-v01`
immutable candidate commit: `2b00fd3ec5f2c991dcd824b9ef6a4bbe27433bd1`
manifest: `MANIFEST.md`
checksums: `sha256sums.txt`

Candidate package локально также собран как:
`KOO__replacement-chat-recovery-candidate__ARH.tar.gz`

Archive SHA-256:
`e9e47109b1cd621b1f86f9e79980e7d67396e3f7df9ae47e3a7691ec06e9e98e`

Локальная проверка `sha256sum -c sha256sums.txt`: `5/5 OK`.

## Требуемое действие ARH

1. Прочитать approved Project Sources и собственный current recovery.
2. Проверить candidate locator на exact immutable commit.
3. Проверить composition/provenance/checksums.
4. Не редактировать KOO self-state от имени ARH.
5. После PASS опубликовать accepted KOO package в canonical `entities/koo/recovery/current`.
6. Выполнить immutable post-publication readback.
7. Вернуть completion receipt с canonical commit/blob identities/checksum result.

До ARH completion новый KOO не должен объявлять `initiation_verified`; допустим только `initiation_loaded_external_unverified`.

## Важный current-state marker

Старый canonical KOO recovery на `main` содержательно stale: он всё ещё описывает OSS authority defect и `Stage A operational acceptance: BLOCKED`. Этот candidate содержит последующие принятые состояния ОСС, КООПЕРАЦИИ, SIS preservation и School pause.

---
from_entity: KOO
to_entity: ARH
document_type: replacement-chat-recovery-candidate-dispatch
status: ready_for_address_delivery
candidate_commit: 2b00fd3ec5f2c991dcd824b9ef6a4bbe27433bd1
production_allowed: no
project_time: generated_without_trusted_project_time
