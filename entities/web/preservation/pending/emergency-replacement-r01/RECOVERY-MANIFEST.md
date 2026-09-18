# RECOVERY-MANIFEST — WEB emergency replacement r0.1

status: `PRESERVATION_CANDIDATE_FOR_IMMUTABLE_READBACK`
entity: WEB / ВЕБМАСТЕР
project_time: omitted; trusted project-time source not used

Composition:
1. `WEB__writer-failure-state.md`
2. `WEB__evidence-snapshot.md`
3. `WEB__replacement-initiation.md`
4. `RECOVERY-MANIFEST.md`

Authority boundary: ARH preserves evidence and failure-state; it does not author WEB self-state and does not transfer WEB writer.
Secrets: none intentionally included or read.
Canonical/current pointers: unchanged.
Integrity method: exact immutable publication commit + Git blob identities/readback for all four files. No self-referential commit/checksum is embedded in package bytes.

Expected terminal after immutable readback:
`PASS_ARH_WEB_RECOVERY_PACKAGE_READY_FOR_REPLACEMENT_INITIATION_R01`.
