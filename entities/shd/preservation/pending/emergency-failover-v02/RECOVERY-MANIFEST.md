# SHD emergency failover v02 — recovery manifest

status: candidate_pending_independent_verification
entity: SHD / ШАРДОВИК
canonical: no
self_snapshot: no_new_self_snapshot_current_writer_unreliable
canonical_recovery_replaced: no
current_writer_transfer: not_performed
practical_reinitiation: not_performed
secrets_included: no
project_time: omitted; trusted project-time source not used

## Package purpose

Provide an emergency replacement-chat launch package without fabricating a foreign SHD self-snapshot.

Recovery basis:
1. last independently verified SHD recovery `ce9891f63b6123600623e01b8da84131f239c5c7`;
2. ARH external coordination checkpoint containing newer exact evidence;
3. verified local non-secret MAZHOR backup;
4. explicit OPERATOR failover decision.

## Composition

- `SHD__emergency-initiation-master.md`
- `SHD__external-recovery-checkpoint.md`
- `SHD__experience-resume.md`
- `SHD__mazhor-backup-index.md`
- `SOURCES.md`
- `RECOVERY-MANIFEST.md`
- `sha256sums.txt`

## External candidate locator

repository: `puev5691/wellbeing-entity-bootstrap`
path: `entities/shd/preservation/pending/emergency-failover-v02`
immutable commit: to be bound after final publication
checksums: `sha256sums.txt`

## Hard boundaries

- This candidate does not replace the verified base recovery.
- This candidate does not claim a new SHD self-snapshot.
- ARH does not grant replacement current-writer authority.
- No secrets, passwords, tokens, keys, QR/URI bundles or secret contents are included.
- MAZHOR backup remains local and non-secret; only hashes/locator are recorded here.
- PWH/hashchain remains research candidate.
- WBN/TERA2 is not authorized to launch by this package.
- New SHD must perform practical initiation and fresh preflight.
- Independent KOO verification should precede authoritative writer handoff where available.

## Failure mode

Any mismatch in package composition/checksums/base recovery identity/role identity means `initiation_failed` or `initiation_loaded_external_unverified`; do not improvise profile work.

---
КТО: ARH / АРХИВАРИУС
ДЛЯ ЧЕГО: manifest external emergency failover package v02
СТАТУС: candidate_pending_independent_verification
