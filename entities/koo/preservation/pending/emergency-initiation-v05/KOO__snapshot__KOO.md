# KOO self-snapshot — emergency recovery v05

status: CURRENT_WRITER_EMERGENCY_SNAPSHOT_CANDIDATE
entity: KOO / КООРДИНАТОР
project_time: omitted; trusted project-time source not used

## Authority / writer basis

Current KOO instance was established by:
`entities/koordinator/current/KOO__initiation-v04-result.md`
status: `initiation_verified`
current-writer accepted within existing KOO role.

Last externally verified canonical KOO recovery:
repository: `puev5691/wellbeing-entity-bootstrap`
path: `entities/koo/recovery/current`
canonical commit: `6f857ba10e9976a9ca1c2c88df0c8b8a7995b74a`

This v05 package is a newer self-snapshot candidate authored by the current KOO writer. It does not replace canonical recovery until ARH preservation verification/publication/readback.

## Fresh project boundary

Fresh `wellbeing-hq` HEAD before v05 package creation:
`457865df475b5296c5ce087eb69c9e06826936ba`

Stable queue pointer:
`entities/koordinator/current/KOO__work-queue-current.md`

Current operator queue:
`entities/koordinator/current/KOO__work-queue-v09-ru.md`
commit: `c86522cd14b96b14ee36a7222cb9d8f803d105db`

Current wake card:
`entities/koordinator/current/KOO__operator-wake-card-v04-ru.md`
commit: `40cb60f5f6b4dcf4ced9ff7bcde313beb24f7de4`

## Current project decisions and queue

1. WEB Static Preview v0.3 E1 narrow recheck: PASS accepted by KOO.
   KOO acceptance commit: `c172818c015782a9232e65828428abb5491e1e7b`.

2. Recovery-canon wake/initiation/resume candidate r0.4:
   ARH verdict `PASS_RECOVERY_COMPATIBLE_READY_FOR_OPERATOR_GATE`.
   KOO acceptance commit: `026771a37ff19deb7c98ac795698dfbe0adca05c`.
   OPERATOR gate:
   `entities/koordinator/outbox/KOO__entity-recovery-canon-v1_5-operator-gate__OPERATOR.md`
   commit `17190f729eef6537f0404af387253c9c11eb3a21`.
   Candidate is NOT approved/effective until explicit OPERATOR decision.

3. SHD TERA2 main/root genesis research accepted:
   KOO acceptance commit `1f250e2bcb4c06aa18bc439c76f57d1ad5473ef5`.
   Next root-profile candidate requires KOD and is queued behind Telegram threading fix.

4. SHT recovery-record lifecycle convention accepted:
   KOO acceptance commit `18b016761637b139e51ceb81d76e7e3540d9e4e3`.

5. VOL prospective P5 measurement protocol accepted:
   KOO acceptance commit `4449c48755a866c5448d70853bfa075ce646b840`.

6. SIS Telegram Phase1B blocker accepted:
   `BLOCKED_PHASE1B_RUNTIME_THREADING_DEFECT`.
   KOO acceptance commit `772daf0c8a05c51d17fa74bdc766c3ba92658038`.
   Required next owner: KOD. Do not replay sudo or unchanged host gate.

7. KOD replacement instance:
   initiation result is `initiation_verified`, but old verified KOD current-writer is not retired.
   OPERATOR writer-decision gate:
   `entities/koordinator/outbox/KOO__KOD-replacement-writer-decision-gate__OPERATOR.md`
   commit `a0c8f70cbe3edd9031ee4881d189639f5a166d98`.
   No KOD profile task should start before writer boundary is resolved.

8. Prepared KOD serialized successors:
   a) Telegram Phase1B threading fix:
      `entities/koordinator/outbox/KOO__telegram-phase1b-threading-fix-r01__KOD.md`
      commit `5553e1857936755ee4cc511eb5d5f1d8a0b4c092`.
   b) TERA2 root-profile candidate:
      `entities/koordinator/outbox/KOO__tera2-root-profile-candidate-r01__KOD.md`
      commit `9c6972681ae8b058cbe99c5ae4a3674a5cd1d3eb`.

9. ARH and WEB showed depth/latency symptoms but remained functional.
   Prepared preservation tasks:
   - ARH: `KOO__ARH-pre-replacement-self-preservation-r01__ARH.md`, task commit `65eb351c2b428e4ec3ee38bbfd5e0a1644b421dc`.
   - WEB: `KOO__WEB-continuity-preservation-candidate-r01__WEB.md`, task commit `4ee6182f069e023ac2a33ffbb9db2348730d99ec`.

10. Work-mode transition research:
   - VOL pilot observation task commit `88021fe9f2baa6beabf5d93a530629816c2b6b2e`.
   - SHT staged Chat→Work process task commit `df3cdcd429f8673a12ede9eceb8b0cb47a54fa15`.

## Automation state

Tool-verified immediately before v05 preservation:
- `Новости и сигналы`: enabled.
- ARH GitHub Work: disabled.
- KOO GitHub Work: disabled.
- KOD GitHub Work: disabled.
- SIS GitHub Work: disabled.
- SHT GitHub Work: disabled.
- KAN GitHub Watch: disabled.
- legacy one-shot reminders: disabled.

Do not re-enable old Entity GitHub-work automations merely to resume profile execution.

## Emergency handoff rule

After v05 preservation publication, this old KOO instance should not perform normal authoritative profile/current-state mutation except preservation/dispatch needed to complete this handoff.

A replacement KOO must:
1. verify canonical recovery v04 at exact immutable commit;
2. inspect this v05 self-snapshot candidate and ARH verification state;
3. do fresh `wellbeing-hq` preflight;
4. if v05 has been ARH-verified/published as canonical, verify locator/composition/integrity and prefer it;
5. otherwise treat v04 as last externally verified recovery and v05 only as fresher candidate evidence;
6. check competing-writer/handoff state;
7. obtain/confirm explicit OPERATOR emergency replacement authority;
8. only then establish replacement current-writer with immutable fixation/readback.

## First safe action of replacement KOO

Recovery/initiation only. Do not continue queue work until `initiation_verified` and writer boundary are fixed.

After verified replacement, fresh-preflight the current queue pointer and recompute priorities rather than replaying v09 blindly.

---
КТО: KOO / КООРДИНАТОР
ДЛЯ ЧЕГО: authoritative self-snapshot before emergency replacement of degraded KOO chat
СТАТУС: current_writer_emergency_snapshot_candidate_v05
