# KOO recovery r1.4 — initiation and authority boundary

status:
RECOVERY_OWNED_PROCEDURAL_METADATA

## Replacement initiation

A genuinely NEW KOO / КООРДИНАТОР r1.4 chat/instance is Initiation-required.

Initiation mode:
INITIATION_GATE_REQUIRED

Do not use Resume-First for the genuinely new replacement instance.

The new instance must load the active approved Project Sources R07 and verify this exact external recovery package before claiming verified initiation.

## Required recovery verification

Verify the immutable locator:
puev5691/wellbeing-entity-bootstrap@<exact-r14-publication-commit>:entities/koo/recovery/versions/koo-recovery-r14

Verify:
- package tree and exact 9/9 composition;
- SHA256SUMS coverage 8/8 by independent recomputation;
- exact copied KOO self-snapshot blob 8a39b17be502cfa4f356e69fb6f6374fdc2b5029;
- exact copied KOO current-writer blob 5208fd71173b8258dfc0ef0ccd8dd21f07b6bdb1;
- exact copied Human Interface Contract blob fdea31034c370220dfb961993059500716ccfe20;
- manifest-to-tree correspondence;
- no unexplained missing or extra files.

Fresh-check wellbeing-hq for newer KOO writer, recovery, initiation, current-state or supersession evidence before accepting this package as current recovery basis.

## Mandatory Human Interface Gate

Load the exact KOO__human-interface-contract-r02.md from this package.

Pass H1-H8 explicitly before returning:
initiation_verified_waiting_writer_gate

If any H1-H8 check cannot be verified, return:
HUMAN_INTERFACE_GATE_NOT_VERIFIED

and stop before Writer Gate.

## Authority separation

package_present != initiation_verified

initiation_verified != current_writer_established

This recovery package does not establish KOO r1.4 current-writer.

Writer Gate requires a separate explicit OPERATOR decision. This recovery and its cold-start PROMPT do not create Writer Gate authority.

No KOO task authority, profile authority, approval, production authority or automation authority is created by this recovery.

## Preserved current control boundaries

- The old emergency global profile-task pause is RELEASED and must not be resurrected.
- The separate SECE primary-priority decision remains ACTIVE.
- New non-critical profile-task issuance remains paused under the SECE decision.
- Historical PROMPT/task/queue replay is FORBIDDEN.
- The prepared SHD preservation tail is historical frontier evidence pending fresh reconciliation; it is not automatically current or executable after recovery.
- The SHD frontier locator discrepancy recorded in TASK-STATE.md must be freshly reconciled by KOO; ARH does not repair it here.
- Hidden/unwritten KOO state remains UNKNOWN / MUST_NOT_BE_RECONSTRUCTED.

## Execution boundaries

This package does not execute:
- KOO r1.4 Initiation Gate;
- KOO r1.4 Writer Gate;
- any profile task;
- the prepared SHD task;
- SHD R02 rereview;
- G4/G5/G6;
- SECE/KOD/SHD/SIS continuation;
- historical replay;
- Project Source/canon mutation;
- deployment, provider, API, Telegram or live effects.

The only permitted use of this package by the new instance is the separately bounded Initiation Gate described in the exact cold-start PROMPT. After its initiation result, stop and return to OPERATOR.
