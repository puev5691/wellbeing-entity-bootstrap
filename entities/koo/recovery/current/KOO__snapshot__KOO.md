# Snapshot КООРДИНАТОРА

## Смысл

Snapshot создан перед переходом от принятой isolated external sandbox ОСС к real-host stage. Цель — не потерять проверенную версию KOO/KOD state и не восстанавливать её из длинной цепочки чатов.

## Current KOO

- Entity: KOO / КООРДИНАТОР;
- current instance: действующий рабочий экземпляр;
- recovery schema: v1.3;
- current-writer: этот checkpoint не выполняет handoff/failover; известное состояние сохраняется до отдельного подтверждённого изменения;
- active development: общая среда Сущностей;
- production changes: no.

## Главный завершённый результат

Isolated external sandbox KOD v0.6 принята.

Artifact reference:

    artifact_identity: KOD_entity-env-sandbox-v06_KOO.tar.gz
    source_entity: KOD
    locator: repository puev5691/wellbeing-entity-bootstrap / entities/kod/recovery/current/artifacts/KOD_entity-env-sandbox-v06_KOO.tar.gz
    version_identity: sha256:2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f
    git_blob: a25018efca6d84ff3d13bee0a790b623cc806e57
    recovery_commit: feed2913424d852f2d05a8125d92a3c991e3418f
    normative_status: accepted_for_real_host_preflight
    purpose: baseline следующего host-stage

Acceptance evidence находится в том же KOD recovery:

`artifacts/KOO_entity-env-sandbox-v06-review_KOD.md`

## Проверенный KOD state

- KOD = `upgraded`;
- recovery v1.3 externally published;
- current recovery immutable commit: `feed2913424d852f2d05a8125d92a3c991e3418f`;
- isolated sandbox accepted v0.6;
- real-host deployment разрешён только после preflight;
- production не разрешён;
- TERA/Stage 04 остаются parked/unknown согласно KOD recovery.

## Действующие Project Sources

- `project-instructions-core-v2_1-approved.md` — `8a86945c28e361b5adf7ecc96326a1591a193118ce7be258a9c0a21ddd2ace26`;
- `entity-roles-short-v2_1-approved.md` — `1a644a378eea0edc0257884da26a15bbcfe5fbd41fdbdfb24f0540777a842e2b`;
- `entity-state-preservation-and-recovery-canon-v1_3-approved.md` — `9d493a9691e51bc1c2df85c74eaad7d35b03471828c91bf6ed504e5657061d47`;
- `file-work-canon-universal-v2_3-approved.md` — `5ec75e480c0b78a72bb2faa702a21064b32bd3b919b225b1ae25a30dd0a700e5`;
- `source-loading-policy-v2-approved.md` — `2661a3a266547a5e0f6b70c3dab8a02add2bb788b4a90b1136b7e9445b2d6061`.

## Активный следующий барьер

Никакой deployment пока не выполняется.

Следующий безопасный шаг:

> получить и проверить фактические вводные конкретного host для ОСС; только после этого выдать KOD отдельную deployment task.

Required preflight data:

- host identity;
- OS/version;
- operator access;
- systemd/firewall/TLS permissions/boundary;
- storage root;
- external HTTPS endpoint/name.

## Deferred

- ChatGPT bridge — после real-host sandbox;
- SHD recovery — отдельный цикл;
- WEB post-init audit — deferred;
- KON — не инициировать автоматически;
- прочие parked исследования не активировать только из-за наличия старого файла.

## Восстановимость

Новый KOO должен быть способен по этому snapshot + current boards + development-state + KOD immutable recovery commit понять, что isolated stage завершён и что следующий шаг — именно host preflight, а не новая ревизия sandbox и не deployment на случайно выбранный сервер.

---
entity: KOO
artifact_role: recovery_snapshot
status: current_snapshot
recovery_schema: v1.3
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
project_time: generated_without_trusted_project_time
