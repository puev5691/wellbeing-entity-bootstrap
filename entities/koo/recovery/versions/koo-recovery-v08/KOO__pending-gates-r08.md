# KOO pending/authority gates r0.8

status: COLD_START_RECONCILIATION_REQUIRED
project_time: omitted

## Confirmed material authority state

Memory-layering attempt 2 authority: CONSUMED.
Attempt 3 authority: NOT_AUTHORIZED.
Automatic retry: forbidden.
The verifier no-bytecode/read-only lesson is experience/evidence, not correction authority.

## Replacement boundary

Current KOO v0.6 remains authoritative until a separately authorized handoff/freeze and replacement procedure changes that state.

This recovery does NOT:
- freeze KOO v0.6;
- initiate replacement;
- appoint a writer;
- replay tasks;
- grant provider/host/Telegram execution.

## Cold-start rule

Every other pending decision gate must be re-established from fresh repository evidence. Inbox presence, dispatch, old queue entries and historical PROMPTs are not execution authority.
