# KOO replacement cold-start instructions r0.8

status: READY_FOR_HANDOFF_THEN_REPLACEMENT_COLD_START
project_time: omitted

After separate handoff/freeze authority only:

1. fresh-preflight puev5691/wellbeing-hq;
2. load/verify current approved Project Sources;
3. verify exact immutable recovery v0.8 composition/checksums/readback;
4. verify predecessor KOO v0.6 writer and exact handoff/failure-state applicable at that future boundary;
5. fresh-reconcile KOO current/inbox/outbox/routes/receipts;
6. treat active-queue-r110 as stale evidence, not replay authority;
7. preserve attempt-2 memory-layering terminal exactly and do not authorize attempt 3;
8. classify all other work from exact fresh evidence; UNKNOWN stays unknown;
9. do not replay historical PROMPT;
10. return initiation_verified_waiting_writer_gate or exact blocker;
11. STOP before Writer Gate/profile work.

This file itself is not initiation authority.
