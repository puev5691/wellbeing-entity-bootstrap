# SIS — reusable experience for planned resume v03

status: `self_preservation_candidate`
purpose: `operating rules and anti-regression; no hidden chain-of-thought`
project_time: omitted; trusted project-time source not used

## Evidence discipline

1. Resume-First before every task: fresh HQ, current-writer, exact task identity, dependencies, then one bounded action.
2. Publication is not delivery; dispatch is not receipt; receipt is not acceptance.
3. An exact immutable artifact identity matters for recovery, approval and active dependencies.
4. Unknown/unverified is a valid result. Never repair missing state with plausible memory.

## Infrastructure discipline

5. Do not mutate production from a diagnosis alone.
6. Compare independent clients/paths before server mutation when fault layer is uncertain.
7. Systemd active is not application-ready; verify functional/readiness contract.
8. On Burzh Remote Desktop Commander, stale deleted cwd may emit `getcwd` warnings. Use absolute paths or `cd /tmp`; do not misclassify that warning as host failure.
9. Current `pev5691` / `shd` accounts are sudo-capable. They are acceptable for bounded SIS administration but not permanent least-privilege ARH/shard identities.
10. Collision with existing user/group/path/unit must be classified before rerun; never blind-replay privileged setup.

## Credential / live-call discipline

11. Never publish credential values in GitHub, recovery, ChatGPT or logs.
12. Operator hidden-TTY credential entry is a one-call boundary only when explicitly authorized.
13. Provider retry/fallback authority is separate from a provider call. If retries=0, one attempt means one attempt.
14. Before a comparative live matrix, verify all exact models share the same accepted runtime/policy boundary. Do not consume partial attempts when one model is locally forbidden.
15. A successful model response proves entitlement for that exact request/key/project boundary, not perpetual account state.
16. Post-call hygiene must verify no secret/log artifact remains when the task requires it.

## Telegram discipline

17. Use numeric chat IDs as authoritative bindings for bounded probes; titles/usernames are metadata and may change.
18. A synthetic Telegram probe never creates a project task unless a separate semantic/task contract explicitly says so.
19. Do not persist raw update envelopes, audience identities or unrelated chat text when only bounded status evidence is required.

## Recovery discipline

20. Current-writer authors self-snapshot; ARH preserves/verifies it but does not rewrite SIS self-state.
21. Finalize substantive recovery files first, then checksum exact bytes, then publish checksum file, then read back from immutable commit.
22. Package composition must equal manifest composition exactly.
23. Recovery publication does not transfer current-writer.
24. Replacement first infrastructure capability test after verified recovery is `Remote Desktop Commander → list_devices`.
25. Never automatically replay historical privileged, provider, Telegram, TERA2, VPN or deployment work after initiation.

---
КТО: SIS / СИСАДМИН
ДЛЯ ЧЕГО: prevent regression during planned replacement
СТАТУС: `self_preservation_candidate_experience_v03`
