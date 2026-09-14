# SIS — host/runtime non-secret state

status: `self_preservation_candidate`
scope: `non-secret evidence only`
project_time: omitted; trusted project-time source not used

## Burzh verification host

Known host identity:
- hostname: `ruvds-xnqc6`;
- normal administrative principal used by SIS tooling: `pev5691`;
- prior confirmed uid/gid: `1000/1000`;
- prior confirmed membership included group `sudo`.

This file does not contain passwords, keys or credentials.

## Remote Desktop Commander host agent

Confirmed before preservation:
- detached tmux session: `desktop-commander`;
- remote agent process chain remained alive on Burzh;
- device-state directory existed:
  `/home/pev5691/.desktop-commander-device`;
- the old chat later lost ChatGPT-side tool capability after plugin restart/reconnect.

Interpretation boundary:
- host agent alive does not prove the replacement chat has tool capability;
- OAuth/plugin UI success does not prove `list_devices` works;
- first replacement test must be an actual `list_devices` call.

Do not re-register or reinstall Burzh merely because an old chat reports tool disabled.

## Stale cwd behavior

Confirmed on Remote Desktop Commander command execution:
- inherited working directory can be stale/deleted;
- symptom:
  `getcwd: cannot access parent directories: No such file or directory`;
- known working hygiene:
  `cd /tmp` before shell operations.

Do not classify that warning alone as node/application failure.

## Telegram Phase 1B non-production objects

After OPERATOR executed the historical one-shot host-gate script and it stopped with `user_collision`, subsequent readback confirmed:

- service user:
  `wellbeing-tg-p1b` (uid observed `996`);
- service group:
  `wellbeing-tg-p1b` (gid observed `989`);
- `/opt/wellbeing/telegram-phase1b-runtime-r01`
  owner/group `root:wellbeing-tg-p1b`, mode observed `0750`;
- `/etc/wellbeing/telegram-phase1b`
  owner/group `root:wellbeing-tg-p1b`, mode observed `0750`;
- `/var/lib/wellbeing/telegram-phase1b-sandbox`
  owner/group `wellbeing-tg-p1b:wellbeing-tg-p1b`, mode observed `0750`;
- systemd unit `wellbeing-telegram-phase1b-sandbox.service` existed and was observed `inactive (dead)` and disabled.

The evidence file from that failed pass contained:
`HOST_GATE=FAIL reason=user_collision`.

A resume-aware v2 script was staged:
`/home/pev5691/sis-phase1b-tooling/phase1b-host-gate-once-v2.sh`
SHA-256:
`1208ff4e123afcd407115c476c549b7c24730624dc2e01bd0c2751ad448e9d3d`.

No successful v2 execution is preserved. Do not execute it automatically.

## Entity Runner host/readiness evidence

Repository-accepted bounded host/runtime evidence on Burzh:
- Python `3.12.3`;
- Git `2.43.0`;
- `/tmp` usable;
- required Python stdlib imports passed;
- DNS resolution to `api.anthropic.com` passed at that check;
- required provider environment variables were absent in the checked runtime.

These facts do not prove current provider entitlement, credentials, Agent/Environment identity, deployment or E2E execution.

## Non-production / secret boundary

This host-state file authorizes no mutation.

Specifically it does not authorize:
- production changes;
- live Telegram send;
- public webhook;
- provider-side request;
- nginx/Xray/TERA2/UFW/DNS mutation;
- credential creation/publication;
- destructive cleanup;
- historical sudo replay.

---
КТО: SIS / СИСАДМИН
ДЛЯ ЧЕГО: preserve non-secret host/runtime facts that affect safe resume
СТАТУС: self_preservation_candidate_host_state
