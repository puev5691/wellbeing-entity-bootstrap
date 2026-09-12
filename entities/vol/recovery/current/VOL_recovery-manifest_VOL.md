# VOL recovery manifest — emergency reinitiation

## Назначение

Manifest текущего recovery-набора ВОЛОНТЁРА, подготовленного authoritative current-writer по прямому решению ОПЕРАТОРА об аварийной инициации нового чата.

- entity_name: `ВОЛОНТЁР`
- entity_code: `VOL`
- entity_id: `ent:VOL`
- recovery_standard: `entity-state-preservation-and-recovery-canon v1.4`
- trigger: `operator_emergency_chat_reinitiation`

## External locator

store: `github`
repository: `puev5691/wellbeing-entity-bootstrap`
path: `entities/vol/recovery/current`
ref: `main`
manifest: `VOL_recovery-manifest_VOL.md`
checksums: `sha256sums.txt`

`main` является изменяемым ref. Проверка recovery должна опираться на состав этого manifest и SHA-256 из `sha256sums.txt`, а для active research dependency — также на зафиксированный commit/blob.

## Active package composition

1. `VOL_initiation-current_VOL.md` — current initiation и процедура запуска нового чата.
2. `VOL_snapshot_VOL.md` — authoritative self-snapshot перед failover.
3. `VOL_experience-resume_VOL.md` — опыт, антиошибки и Resume-First checkpoint.
4. `SOURCES.md` — минимальная карта управляющих и профильных источников.
5. `KOO_VOL-identity-role_VOL.md` — подтверждённое основание identity/role VOL.
6. `VOL_recovery-manifest_VOL.md` — этот manifest.
7. `sha256sums.txt` — контрольные суммы значимых файлов active package; сам файл `sha256sums.txt` не хеширует себя.

Файл `VOL_preservation-initiation-report_KOO.md`, если остаётся в каталоге, является историческим следом предыдущего preservation-цикла и **не входит** в active emergency recovery set.

## Expected SHA-256 for content files

- `VOL_initiation-current_VOL.md` — `ecf19d150574c294743eb44c108ff7868300674295825a0f7a28988e56f0ad39`
- `VOL_snapshot_VOL.md` — `82b99ebe03b48b2eec486b6a7f90dbd07bf31a2135146587b31e9519bc57b70d`
- `VOL_experience-resume_VOL.md` — `441dd2228c3498576d225f95a32b84e31ebd7d93472b820f57114ef47aaa2f6f`
- `SOURCES.md` — `cf656cc97d9a529dcc2ba8d63affdf5f7b1ea45d04e71e168bf67fd85261de40`
- `KOO_VOL-identity-role_VOL.md` — `0f3a8432191e30e6464765d05f91af72b9998e28d3b87315241ec145cb9ebeac`

## Active dependency required for Resume-First

artifact_identity: `VOL__COOP-coownership-constitution-v0_1.md`
source_entity: `VOL`
locator: `puev5691/wellbeing-hq/entities/volonter/current/coop-meeting/analysis/VOL__COOP-coownership-constitution-v0_1.md`
version_identity_commit: `55be36e9432b4b5c13102c7172079171e958b452`
version_identity_blob: `ffa5179fafb5594fc0f37ea0489c7722740a3b57`
normative_status: `candidate`
purpose: база прерванного stress-test и мост к будущей системе учёта WBN/WBNP.

## State boundaries

- Cooperation / coownership research: `active`.
- Candidate constitution stress-test: `interrupted_active_task / resume_first`.
- WBN/WBNP accounting-system bridge: `operator_direction / research_stage`.
- WBN/WBNP monetary policy: `not_yet_developed / not_approved`.
- DeepMind: `parked_by_operator`.
- EVENT-CONTRACT/operational metrics: `secondary_paused_background`.
- Production authority: `none`.
- Experience Layer waiting state: `closed_by_KOO_decision`; later normalization only by separate task.

## Preservation status

- self-snapshot author: `VOL current authoritative writer`;
- files prepared and written to external GitHub recovery locator by current VOL instance;
- self-readback/verification: `verified_by_current_VOL_against_published_Git_blobs`;
- preservation-check / recovery-registry update by АРХИВАРИУС: `pending / not claimed`;
- recoverability by actual new-chat initiation: `not yet tested`.

## Safe next step

Новый экземпляр сначала выполняет обязательную initiation verification. После `initiation_verified` читает exact-version active dependency и выполняет stress-test candidate constitution. Код, production и монетарная политика не начинаются на основании одного recovery-пакета.

---

document_type: recovery-manifest
entity_id: ent:VOL
status: current_emergency_self_readback_verified
project_time: omitted_trusted_project_time_not_used
КТО: VOL / ВОЛОНТЁР
ДЛЯ ЧЕГО: проверяемый состав emergency recovery и Resume-First продолжение работы
