# KOD recovery manifest — post-acceptance preservation correction

## Назначение

Самостоятельный self-preservation package текущего экземпляра KOD после получения независимого review KOO. Он синхронизирует локальный snapshot с externally verified accepted state, не приписывая текущему KOD-chat внешнюю публикацию KOO.

## Recovery status

- entity: KOD
- instance_state_at_snapshot: active
- current_writer_at_snapshot: this_instance
- writer_handoff_performed: no
- writer_failover_performed: no
- package_status: `post_acceptance_candidate_for_final_KOO_match_check`
- isolated_sandbox_v06: `accepted_by_KOO`
- real_host_sandbox_deployment: `allowed_after_host_preflight`, not started here
- production: `not_allowed`
- secrets_included: no known secrets; credentials/tokens/private keys intentionally excluded
- project_time: generated_without_trusted_project_time

## Current correction basis actually present

`artifacts/KOO_KOD-preservation-review_KOD.md`
SHA-256: `9afa37167014a7cc00e3a5c82cd492997e65df0e6823cea0750ba69a3da5866a`

Этот review сообщает следующие externally verified facts:

- sandbox v0.6 accepted;
- sandbox SHA-256 `2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`;
- internal manifest 47/47 OK;
- automated tests 144/144 PASS;
- scenarios A-F PASS;
- acceptance artifact `KOO_entity-env-sandbox-v06-review_KOD.md`, reported SHA-256 `f80ceefd3009aac283768ab7fde18b918cb6f7a87345fc1166e8bb3f2f499d01`;
- external KOD recovery checkpoint `feed2913424d852f2d05a8125d92a3c991e3418f`;
- following KOO checkpoint preserving same KOD recovery tree `579085a837e94335534187392f75f3f6a3479d61`.

Важно: bytes отдельного acceptance artifact `KOO_entity-env-sandbox-v06-review_KOD.md` в текущей задаче не предоставлены. Его identity фиксируется как факт, сообщённый KOO review, а не как локально пересчитанный hash.

## Required base sources observed during preparation

| Source | SHA-256 |
|---|---|
| `project-instructions-core-v2_1-approved(2).md` | `8a86945c28e361b5adf7ecc96326a1591a193118ce7be258a9c0a21ddd2ace26` |
| `entity-roles-short-v2_1-approved(2).md` | `1a644a378eea0edc0257884da26a15bbcfe5fbd41fdbdfb24f0540777a842e2b` |
| `entity-state-preservation-and-recovery-canon-v1_3-approved(2).md` | `9d493a9691e51bc1c2df85c74eaad7d35b03471828c91bf6ed504e5657061d47` |
| `file-work-canon-universal-v2_3-approved(2).md` | `5ec75e480c0b78a72bb2faa702a21064b32bd3b919b225b1ae25a30dd0a700e5` |
| `source-loading-policy-v2-approved(1).md` | `2661a3a266547a5e0f6b70c3dab8a02add2bb788b4a90b1136b7e9445b2d6061` |

Interface suffixes are not normative identity; cold-start resolves active source/status anew.

## Significant artifacts

- accepted local pilot v0.7: `sha256:fd43c9f67c704b11d8e83c92b452ba606677790f40847d1661dbbcf58e3030f5`.
- accepted sandbox design v0.1: `sha256:0a36c7de289a10f002f68406f6110270f6a07a9f224c65e0042679fe913672e5`.
- accepted isolated sandbox v0.6: `sha256:2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`.
- v0.6 report: `sha256:f879e22aad18c7e20661738588cc2e5a0ce27558e306a5133d42495fb88caf4e`.
- previous pre-acceptance self-package: `sha256:2e75c3f42a152c071870b092005f20517607d63bf614ebba9ffc384831303478`, status `verified provenance snapshot, not current recovery`.

## External recovery state reported by KOO

- repository: `puev5691/wellbeing-entity-bootstrap`
- path: `entities/kod/recovery/current`
- KOD checkpoint: `feed2913424d852f2d05a8125d92a3c991e3418f`
- following KOO checkpoint preserving same KOD recovery tree: `579085a837e94335534187392f75f3f6a3479d61`
- publication attribution: KOO/external recovery process, not current KOD-chat.

## Parked / unknown

- Stage04 concrete artifact: `parked_unknown/not_found_unknown`.
- TERA 0.992 runtime/genesis/solo: `parked`.
- production migration: `not_started / not_allowed`.
- ChatGPT bridge: `not_started / out_of_scope`.
- host/preflight inputs for next deployment: not supplied in this preservation task.

## Safe next step

KOO performs final independent match check of this post-acceptance package against externally verified recovery. No writer handoff/failover and no real-host work in this correction. After match, preservation cycle is complete; only then proceed under a separate real-host deployment/host-preflight task.
