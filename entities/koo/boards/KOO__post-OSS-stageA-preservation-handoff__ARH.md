# КООРДИНАТОР → АРХИВАРИУС
## Preservation handoff KOO после Stage A запуска ОСС и authority-defect

## Trigger

Существенно изменилось собственное current-state КООРДИНАТОРА после предыдущего externally current recovery KOO:

- real-host preflight и staging завершены;
- persistent Stage A ОСС установлен и работает;
- bootstrap `operator_admin` + `ent:KOO` выполнен;
- после запуска выявлен critical bootstrap authority-scope defect;
- Stage A operational acceptance заблокирован;
- KOD получил corrective task.

Предыдущие KOO snapshot/initiation/priority board/manifest во внешнем `entities/koo/recovery/current` объективно stale: они ещё считают ARH handoff и real-host preflight будущими шагами.

## Authoritative current-writer artifacts

Текущий KOO current-writer подготовил:

1. `KOO__snapshot-post-OSS-stageA-authority-defect__KOO.md`
   - SHA-256: `18ab1e219b9525909c1f075f07f46f1de596941169347a244e31bed1e420b01d`
2. `KOO__initiation-post-OSS-stageA-authority-defect__KOO.md`
   - SHA-256: `f9ff320507d3d99f174dfee6731a09579dcb2d667dc4a4f2517d524ad91af748`
3. `KOO__priority-board-post-OSS-stageA-authority-defect__KOO.md`
   - SHA-256: `a31619d58e0c30eae4240beaa0ad596f0c1f6cb2be2c2b28c6ddb7e4ac5c8281`

Эти файлы являются KOO-authored self-state/current-entry/current-priority content для этого checkpoint.

## Задача ARH

1. Проверить provenance, exact SHA-256 и соответствие active recovery v1.4.
2. Сопоставить новый KOO self-state с текущим внешним recovery package.
3. Не переписывать содержательный self-state KOO за current-writer.
4. Если для корректного current package нужен ещё один content-bearing KOO artifact, которого нет в этом handoff, остановиться и запросить его у KOO, а не реконструировать.
5. После acceptance сформировать/обновить manifest/checksum-list и external recovery package по действующему канону.
6. Выполнить external publication + immutable readback.
7. Вернуть KOO completion receipt с exact locator, immutable commit, hashes/blobs, package composition и recovery status.
8. Не запускать fresh KOO replacement instance автоматически только ради формальности. Fresh cold-start является отдельным trigger/решением.

## Critical current-state to preserve

- Stage A installation/runtime mechanics: `PASS`;
- Stage A operational acceptance: `BLOCKED`;
- blocker: `evidence_scope_widening` in first-Entity bootstrap;
- corrective task: `KOO__OSS-v06-bootstrap-authority-scope-defect__KOD.md`;
- corrective task commit: `73bd9e699def33b7d1d0f61b9fa22807223b104d`;
- no additional Entities;
- no KOO operational instance/credentials;
- writer grants remain `0`;
- production/public ingress prohibited.

## Boundary

Этот preservation cycle не исправляет authority defect и не разрешает host mutation.

Он сохраняет current KOO state перед продолжением corrective engineering cycle.

---
from_entity: KOO
to_entity: ARH
document_type: KOO-post-StageA-self-preservation-handoff
status: ready_for_address_delivery
snapshot_sha256: 18ab1e219b9525909c1f075f07f46f1de596941169347a244e31bed1e420b01d
initiation_sha256: f9ff320507d3d99f174dfee6731a09579dcb2d667dc4a4f2517d524ad91af748
priority_board_sha256: a31619d58e0c30eae4240beaa0ad596f0c1f6cb2be2c2b28c6ddb7e4ac5c8281
stageA_operational_acceptance: BLOCKED
fresh_KOO_initiation_test_required_by_this_checkpoint: no
production_allowed: no
project_time: generated_without_trusted_project_time
