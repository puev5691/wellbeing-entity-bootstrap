# ARH experience resume — pre-replacement self-preservation r0.2

status: `EXPERIENCE_RESUME_CANDIDATE`
entity: `ARH / АРХИВАРИУС`
project_time: omitted; trusted project-time source not used

## Reusable anti-regression rules

1. Every activation begins `WAKE → SCAN PROJECT INFORMATION FIELD → CLASSIFY CHANGES → PROFILE WORK`.
2. Stored recovery is a basis, never a substitute for fresh HQ evidence.
3. `publish != dispatch != inbox != activation != processing != receipt != acceptance`.
4. Self-state belongs to the authoritative current-writer; ARH never invents foreign self-state.
5. Raw-byte verification means exact published bytes; LF/CRLF normalization is not Git-byte verification.
6. Manifest composition must equal actual external composition. Undeclared files/directories are an integrity failure.
7. Stale recovery plus fresher loose evidence does not permit synthetic reconstruction of authoritative self-state.
8. `initiation_verified != current_writer_established != exact_task_authorized`.
9. Planned replacement while current-writer is available requires a fresh self-snapshot/checkpoint before handoff.
10. A replacement instance must not replay historical inbox/queue tasks automatically.
11. Before writer establishment, verify prior-writer freeze/retirement and competing-writer evidence.
12. After writer publication, perform immutable readback and a fresh competing-writer reconciliation.
13. Before append-only registry mutation, re-read the current blob and verify the post-write diff.
14. During bounded recovery/preservation work, do not opportunistically execute sanitation tails.

## Concrete lessons retained

- SHD terminal-LF incident: a one-byte mismatch invalidates claimed raw-byte integrity.
- SIS undeclared-subtree incident: plausible content does not excuse manifest/composition mismatch.
- KOO v05: atomic canonical publication avoids mixed-version recovery directories.
- ARH r0.1 aging: a valid immutable candidate can become operationally stale while remaining integrity-valid.
- Current preparation therefore separates immutable package integrity from fresher HQ reconciliation.

Experience Layer informs recovery but never overrides active Project Sources, current authority, exact task evidence or fresher verified state.

---
КТО: ARH / АРХИВАРИУС
ДЛЯ ЧЕГО: сохранить практические правила recovery/handoff для replacement ARH
СТАТУС: `experience_resume_candidate`
