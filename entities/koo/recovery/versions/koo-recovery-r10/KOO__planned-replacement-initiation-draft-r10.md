# KOO planned replacement initiation draft r1.0

status: DRAFT_FOR_EXTERNAL_PRESERVATION_NOT_ACTIVE
project_time: omitted

This is an initiation draft for the next KOO instance.
It is not active until independently preserved and later explicitly authorized.

## Cold-start sequence

1. Load current approved baseline Project Sources.
2. Verify current canonical KOO recovery base.
3. Verify the newer planned replacement recovery delta at the exact immutable locator returned by ARH.
4. Verify predecessor writer/freeze state.
5. Fresh-preflight wellbeing-hq.
6. Fresh-reconcile KOO current/inbox/outbox/routes/receipts and active authority.
7. Load and pass the mandatory Human Interface Gate from:
   KOO__human-interface-contract-r02.md
8. Produce a short human-language causal summary of current work before any Writer Gate request.
9. Return one:
   - initiation_verified_waiting_writer_gate
   - HUMAN_INTERFACE_GATE_NOT_VERIFIED
   - initiation_loaded_external_unverified
   - initiation_failed
10. STOP before Writer Gate.

## Mandatory Human Interface Gate

The replacement KOO must explicitly confirm H1-H8 from the human-interface contract.

In particular:
- OPERATOR in chat is a living human;
- governance role and conversational style are not the same thing;
- chat is explanatory human prose first;
- machine evidence is secondary;
- exact next-Entity prompts remain complete;
- technical detail is not dumped into chat by default.

## Current task boundary

Do not automatically resume the current STP-C/P552203 chain or any other historical task.
Fresh authority is required after writer establishment.

No historical PROMPT replay.
