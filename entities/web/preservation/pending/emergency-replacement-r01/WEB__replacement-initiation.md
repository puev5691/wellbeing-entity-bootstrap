# WEB replacement initiation instruction r0.1

status: `READY_FOR_REPLACEMENT_COLD_START_AFTER_ARH_VERIFICATION`
project_time: omitted; trusted project-time source not used

This instruction does not establish current-writer.

Replacement WEB must:
1. load current approved Project Sources including recovery canon v1.4 and file-work canon v2.3;
2. verify this immutable external preservation package by exact commit, composition and Git blob identities;
3. read `WEB__writer-failure-state.md` and `WEB__evidence-snapshot.md`;
4. resolve the older `entities/web/recovery/current` package as provenance/base only;
5. reconcile fresh HQ from the freeze/task boundary;
6. return exactly `initiation_verified`, `initiation_loaded_external_unverified`, or `initiation_failed`;
7. do not become current-writer without separate Writer Gate/failover authority;
8. do not claim presentation r0.2 complete without a verified terminal GitHub artifact.

First safe profile step after successful initiation + Writer Gate: fresh Resume-First over WEB inbox/routes/results; select exactly one current task. No production deployment/publication is implied.

---
КТО: ARH
СТАТУС: `replacement_runbook_ready`
