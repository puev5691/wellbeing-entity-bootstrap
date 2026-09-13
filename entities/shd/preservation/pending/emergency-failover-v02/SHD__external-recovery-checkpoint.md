# SHD external recovery coordination checkpoint v02

status: external_recovery_overlay_candidate
self_snapshot: no
current_writer_self_authored_snapshot: unavailable_due_operator_declared_chat_failure
canonical_recovery_replaced: no
current_writer_transfer: not_performed
project_time: omitted; trusted project-time source not used

## Failure-state

ОПЕРАТОР явно сообщил, что текущий SHD-чат сломал рабочий процесс и должен быть заменён новым чатом.

ARH не реконструирует и не выдаёт от своего имени свежий SHD self-snapshot. Поэтому используется:
1. последний независимо проверенный SHD recovery;
2. exact newer repository evidence;
3. local non-secret MAZHOR backup;
4. explicit OPERATOR emergency failover decision.

## Last externally verified SHD recovery

Locator:
`puev5691/wellbeing-entity-bootstrap@ce9891f63b6123600623e01b8da84131f239c5c7:packages/shd-role-v2_3-current-recovery/`

ARH verification:
`puev5691/wellbeing-hq@29e0a61e4a79842505a279bd131d25cb64978f5e:entities/archivarius/outbox/ARH__shd-role-v2_3-recovery-verification__SHD.md`

Verification state:
`PRESERVATION_CHECKPOINT_VERIFIED__PRACTICAL_INITIATION_TEST_NOT_PERFORMED`

Bytewise checksum:
`4/4 PASS`

## Active role boundary

Detailed role:
`entities/shardovik/current/SHD__role-profile.md`
known approved profile commit: `a9a62bf4accbf5a793a620b41d62b48ef9e7522d`
blob: `29df9468da37fb4e9cda0a5912e1f41dffe08a13`

SHD is HQ technical integrator/diagnostician and WBN/TERA2 specialist. This failover does not expand role authority.

## KOO control state

`entities/koordinator/current/KOO__shd-control-return-v01.md`
commit: `4db759b7a24499fa8d6bc6ffeab60454ed19973a`
blob: `0756e7e62de48fba7b5fff49b5a76d81d20652cd`

Recorded state before this emergency:
- control_owner: KOO
- queue participation: adaptive
- state: WAITING_OPERATOR
- KOO should not auto-revive old WBN/TERA2 tails.

The current OPERATOR message changes the immediate task to emergency replacement/initiation, not to a crypto-platform profile mutation.

## Newer MAZHOR evidence after verified recovery

1. Host candidate:
`entities/shardovik/current/SHD__lab-01-mazhor-host-candidate.md`
commit `d0a8af4e8615eaf5bc93bc6b08c707656fbb813a`
blob `fcd651ad2fd356ccb1a585dcc2465b48c20061c0`

2. Hosting experiment plan:
`entities/shardovik/current/SHD__hosting-experiment-platform-plan.md`
commit `be412a8eb6eb3c5acd712dae71cec37f6c0e1a27`
blob `4c1c8e51a974b002cf874501d71910b6ea213c93`

3. Connection preflight:
`entities/shardovik/current/SHD__lab-01-mazhor-connection-preflight.md`
commit `4d2997494f5dd7704873df9777d1f2d013893a88`
blob `2fa0f24a34817be9ccc662ffac9b8225d34e2bb4`

4. Readiness:
`entities/shardovik/current/SHD__lab-01-mazhor-readiness-v0_1.md`
commit `b70d29e5afacefe4c79e61d1ed5b3b440f7a6a93`
blob `b37399ad5598f291981d72caa3267c86deb31283`

5. Workspace:
`entities/shardovik/current/SHD__lab-01-mazhor-workspace-v0_1.md`
commit `d658009ffc34626a0a97bddd62bd4972106dd160`
blob `1db8cb3b4d02d4077dd613a51747bbc9f4c951e6`

6. Marker/inventory:
`entities/shardovik/current/SHD__lab-01-mazhor-marker-inventory-v0_1.md`
commit `6c5bbfc1f54ce7b66463d71d9326075de60d9774`
blob `5d5fec7774d0f867c32a3fa1e381fde8618ba30d`

7. GitHub read-only clone:
`entities/shardovik/current/SHD__lab-01-mazhor-github-clone-v0_1.md`
commit `6783c47125ec7f90359da3ba77eba8a6e2f6edd5`
blob `9a99d8c732f31e68d516be7df21225ee07939f0d`

8. PWH/hashchain:
`entities/shardovik/current/SHD__project-work-hashchain-research-candidate.md`
commit `a313df8c1040cffde3174f8950d6f07d11e76bb6`
blob `f4b689a369a0abbc6285cd77a24d7925488d4f28`
status: research candidate only.

## Fresh ARH host readback before failover

Remote Desktop Commander:
- target `p552203.kvmvps`
- device visible online
- ping: PASS
- user: `shd`
- `/data/wellbeing-lab`: exists
- local clone `/data/wellbeing-lab/repos/wellbeing-hq`: clean at observed HEAD `6c5bbfc1f54ce7b66463d71d9326075de60d9774`
- Desktop Commander node processes: running
- root filesystem: about 25 GiB available
- memory: about 1.4 GiB available
- swap: none

No secret/log/tmp contents were read.

## Current safe interpretation

MAZHOR lab baseline exists and can be recovered.
No evidence authorizes immediate WBN/TERA2 launch.
No evidence turns PWH research candidate into approved architecture.
No evidence authorizes production mutation.
Replacement SHD must fresh-scan because repository and host state may advance after this checkpoint.

---
КТО: ARH / АРХИВАРИУС
ДЛЯ ЧЕГО: сохранить external coordination state без подмены отсутствующего trustworthy SHD self-snapshot
СТАТУС: external_recovery_overlay_candidate
