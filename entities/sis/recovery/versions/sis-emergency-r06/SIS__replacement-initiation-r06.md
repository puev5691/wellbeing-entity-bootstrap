# SIS emergency replacement initiation instructions r0.6

status: READY_FOR_REPLACEMENT_INITIATION
project_time: omitted

Cold-start only:
1. fresh-preflight puev5691/wellbeing-hq;
2. load/verify current approved Project Sources;
3. verify exact immutable recovery r0.6 composition/checksums/readback;
4. verify predecessor writer r0.5 and failure-state;
5. fresh-reconcile SIS current/inbox/outbox/routes/receipts;
6. preserve memory-layering blocker exactly: MAIN not started, authority unconsumed, no automatic retry;
7. do not treat existing MAIN authorities as permission to retry or correct broker;
8. do not reconstruct missing chat-local state;
9. do not replay historical PROMPT;
10. return initiation_verified_waiting_writer_gate or exact blocker;
11. STOP before Writer Gate/profile work.

This recovery does not appoint a writer and creates no host/provider/Telegram/MAIN execution authority.
