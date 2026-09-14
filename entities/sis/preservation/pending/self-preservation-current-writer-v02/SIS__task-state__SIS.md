# SIS — task state for replacement recovery

status: `self_preservation_candidate`
rule: `statuses below are preserved without promotion`
project_time: omitted; trusted project-time source not used

## ACTIVE

### SIS self-preservation / replacement preparation
State: `ACTIVE_PRESERVATION_ONLY`.

Purpose:
- publish this self-owned recovery candidate;
- verify immutable composition/checksums;
- route result to ARH for independent verification.

This is not profile execution and does not transfer writer authority.

## WAITING_OPERATOR

### Telegram Phase 1B bounded host gate
State: `WAITING_OPERATOR / PAUSED_FOR_REPLACEMENT_RECOVERY`.

Preserved facts:
- historical one-shot script was actually executed by OPERATOR in the current session;
- returned `HOST_GATE=FAIL reason=user_collision`, `SCRIPT_RC=1`;
- subsequent readback showed the expected sandbox user/group/paths/unit already exist;
- resume-aware v2 script exists at `/home/pev5691/sis-phase1b-tooling/phase1b-host-gate-once-v2.sh`;
- v2 SHA-256 `1208ff4e123afcd407115c476c549b7c24730624dc2e01bd0c2751ad448e9d3d`;
- v2 execution is not verified.

Do not execute v2 automatically. Replacement SIS must first complete recovery verification and run `Remote Desktop Commander → list_devices`.

Forbidden without fresh authorization:
live Telegram send, real credentials, public webhook, production deployment.

## WAITING_KOO

### Historical SIS recovery composition correction
State: `WAITING_KOO_INDEPENDENT_REVERIFICATION`.

ARH correction candidate:
`puev5691/wellbeing-entity-bootstrap@23c83ad27c9a727efca6b6ed8d50e475aeb5fa06:entities/sis/preservation/pending/base-recovery-composition-correction-v01`.

Fresh HQ evidence says KOO re-verification had not yet been completed at the preflight boundary.

This self-preservation candidate is separate and must receive its own independent ARH/KOO verification.

## BLOCKED_EXTERNAL

### Entity Runner r1
State: `BLOCKED_EXTERNAL`.

Accepted local conclusion:
`HOST_RUNTIME_READY_FOR_FUTURE_AUTHORIZED_ONE_SHOT_PROBE`.

External prerequisites remain unproved:
provider entitlement/billing, Agent ID, Environment ID, API key validity, separately authorized provider-side request.

No provider-side execution is permitted by recovery.

### Remote Desktop Commander capability in the old chat
State: `BLOCKED_EXTERNAL_CHAT_CAPABILITY`.

Burzh host agent was alive; old chat tool capability remained disabled after plugin-side reconnect.

Replacement first test:
`Remote Desktop Commander → list_devices`.

Do not confuse plugin/session failure with Burzh host failure.

## CLOSED

### VPN/Hiddify experience merge + runbook
State: `CLOSED_ACCEPTED_BOUNDED`.

KOO receipt result:
`PASS_EXPERIENCE_MERGE_RUNBOOK_ACCEPTED`.

Preserved boundary:
- experience `EXP-SIS-014..019` merged;
- Android VPN diagnostics runbook accepted as working practice;
- no device/client registry;
- no production VPN/server mutation;
- no public secret/access material.

### Stage A GitHub information-entry SIS boundary
State: `CLOSED_ACCEPTED_BOUNDED`.

Previously accepted as bounded Stage A infrastructure/security working result. Do not redo without new addressed task or changed evidence.

## HISTORICAL

The following are historical evidence, not automatic work queue entries:
- OSS v0.6 exact-binary transport/staging/install;
- OSS v0.7 controlled repair;
- first operational `ent:KOO` pilot;
- old PR-triggered Work preparation;
- historical Telegram tooling path scripts/actions;
- old Entity Runner package-integrity chain before accepted r1 host/runtime readiness;
- old WBN/TERA2 diagnostics not revalidated by this preservation task;
- historical `artifacts/` subtree under the old SIS base recovery.

Historical does not mean invalid evidence. It means: do not replay as a current task without fresh Resume-First evidence and authority.

---
КТО: SIS / СИСАДМИН
ДЛЯ ЧЕГО: preserve exact causal states separately and prevent stale-task replay
СТАТУС: self_preservation_candidate_task_state
