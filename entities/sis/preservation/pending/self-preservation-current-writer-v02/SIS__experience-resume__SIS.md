# SIS — reusable experience and anti-regression for resume

status: `self_preservation_candidate`
purpose: `carry reusable operating rules, not hidden chain-of-thought`
project_time: omitted; trusted project-time source not used

## Reusable diagnostic rules

1. **Independent client comparison before server mutation.**
   If one Android VPN client fails and server failure is not independently proved, test another client on the same endpoint before changing production server state.

2. **Correlated ingress/egress evidence.**
   A timeout alone is weak. Correlate client symptom, server ingress/listener evidence, server egress and alternate-client result in the same bounded window before assigning the fault layer.

3. **Hypothesis closure after a non-resolving server change.**
   A successful server upgrade/change with no symptom delta closes that hypothesis; it does not prove a cure.

4. **Secret boundaries.**
   Never publish passwords, API keys, private keys, QR codes, usable access URIs, UUID/privateKey/shortId bundles, Telegram bot tokens, webhook secrets, or credential-file contents into public GitHub/recovery/reporting.

5. **Publication ≠ dispatch ≠ receipt ≠ acceptance.**
   Promote routing state only when exact evidence for the next state exists.

6. **Inbox/activation presence ≠ processing.**
   Inbox pointer, detector PASS, `activation_requested`, scheduler wake or task visibility do not prove `processing_started`, completion, receipt or acceptance.

## Runtime / host anti-regression

7. **Stale/deleted cwd workaround.**
   On the Burzh Remote Desktop Commander path, inherited cwd can be deleted/stale and emit:
   `getcwd: cannot access parent directories`.
   Confirmed working workaround: start command with `cd /tmp` (or another verified existing directory) before shell work.
   Treat this as session hygiene, not automatic host failure.

8. **No automatic replay of old privileged actions.**
   A historical sudo action or prepared root script is not a standing authorization. After partial mutation/failure, inspect actual state read-only first. Never blind-rerun a non-idempotent privileged workflow.

9. **Collision must be classified, not merely rejected or ignored.**
   Existing user/group/path/unit can be either foreign collision or expected resumable state. Resume only after exact identity/ownership/package/unit verification; otherwise fail closed.

10. **Service active is not application ready.**
    Verify listener/readiness/functional contract, not just systemd `active`.

11. **Do not guess payload/schema shape.**
    Inspect keys/types/version before field assumptions in diagnostic clients.

12. **Do not repair the wrong layer.**
    When a ChatGPT plugin/capability fails but the remote agent is alive, test the client/plugin/session layer before touching the server installation.

## Recovery / preservation anti-regression

13. **Local integrity ≠ external recovery verification.**
    Recovery becomes `initiation_verified` only after external locator/composition/version/checksum verification.

14. **Current writer ≠ storage maintainer.**
    ARH may preserve/verify recovery but does not author SIS self-state while SIS current writer is available.

15. **Package composition must equal manifest composition.**
    Undeclared directories/files are a recovery defect even if the declared files pass checksums.

16. **Checksum only final published raw bytes.**
    Build final substantive files first; hash exact bytes; publish without LF/CRLF normalization; then perform post-publication immutable readback and run `sha256sum -c` on those published bytes.

17. **Do not self-claim canonicality or writer transfer.**
    Self-preservation publication/readback is current-writer evidence only. Independent ARH/KOO verification and explicit handoff are separate states.

18. **Fresh preflight before every resumed task.**
    Replacement SIS must not continue a task merely because it appears in this package. Fresh HQ evidence decides the next permissible action.

## First replacement operational test

After package and writer-boundary verification, the first tool test is:

`Remote Desktop Commander → list_devices`

Only after an actual successful tool call may replacement SIS rely on Remote Desktop Commander.

---
КТО: SIS / СИСАДМИН
ДЛЯ ЧЕГО: preserve reusable experience and anti-regression without replaying old work
СТАТУС: self_preservation_candidate_experience
