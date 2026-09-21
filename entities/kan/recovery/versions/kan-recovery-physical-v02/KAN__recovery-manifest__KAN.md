# Манифест checkpoint KAN v0.2

Пакет фиксирует собственное подтверждённое состояние нового writer после аварийной замены физического чата. Требуется независимая проверка ARH и preservation; receipt/acceptance ещё не предполагаются.

package_id: KAN-RECOVERY-PHYSICAL-V02
author: KAN-current-writer-v02
physical_instance: KAN-physical-v02-1caebedc-d9bd-4a59-8317-b9c78bfca857
source_repository: puev5691/wellbeing-hq
source_path: entities/kancelar/outbox/kan-recovery-v02
discovery_ref: main
immutable_identity: publication commit and checksum-table blob from separate terminal result/dispatch; verify every file by SHA-256
manifest: KAN__recovery-manifest__KAN.md
checksums: sha256sums.txt

Состав:
- KAN__initiation-current__KAN.md — профиль инициации и границы authority;
- KAN__snapshot__KAN.md — собственный authoritative self-snapshot этого checkpoint;
- sources.md — обязательные источники и significant artifact references;
- KAN__recovery-manifest__KAN.md — этот манифест;
- sha256sums.txt — SHA-256 четырёх файлов выше, без self-hash таблицы.

Всего пять файлов. Таблица контрольных сумм идентифицируется отдельным Git blob в terminal/dispatch. Никакие изменения содержания при переносе не допускаются без новой версии и авторства KAN.

authority_basis: explicit OPERATOR Resume-First instruction + recovery v1.6 mandatory checkpoint after significant writer transition
preflight_commit: 254500649a2bfa3ace7d2e4cc72b4d00cacaaa4d
writer_commit: 588493b011cf4ad85a94d40f6513644d9c207b9c
writer_blob: 13b91b0e189f681be8abf13a76a47b03a5c830fa
gate_terminal_commit: 254500649a2bfa3ace7d2e4cc72b4d00cacaaa4d
gate_terminal_blob: b58219e9655a4caa85cdcaeac15b59331e3436b4
source_status: authoritative self-state of verified current-writer; pending independent archival acceptance
recipient: archivarius
required_action: independent composition/provenance/integrity check, preservation/readback and recovery registry result or exact blocker
receipt: NOT_YET_CONFIRMED
acceptance: NOT_YET_CONFIRMED
recoverability_test: NOT_PERFORMED_FOR_THIS_PACKAGE
lost_predecessor_state: NOT_RECONSTRUCTED
profile_task_replay: FORBIDDEN
failure_mode: missing file, checksum/blob mismatch, unverifiable locator or competing writer blocks acceptance; return exact evidence to KAN, do not repair self-state by inference

Последний прежний registered recovery и активные/припаркованные хвосты указаны в snapshot. Не объявлять этот пакет заменой ARH recovery-current только по факту публикации в HQ.

Секретов, runtime DATA и персональных закрытых данных пакет не содержит. Проектное время не подставляется. Git commit metadata не трактуется как trusted project time.

---
КТО: KAN-current-writer-v02
ДЛЯ ЧЕГО: состав и целостность checkpoint
СТАТУС: READY_FOR_EXTERNAL_PUBLICATION_AND_ARH_CHECK
project_time: omitted
