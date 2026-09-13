# KOD emergency initiation / Resume-First v01

status: candidate_for_independent_ARH_verification
writer_transfer: not_granted
canonical_recovery: unchanged_until_ARH_PASS

## Purpose

Restore a replacement KOD from verified current state without pretending that opening a new chat resumes the old instance.

## Mandatory sequence

1. Load the five approved base project sources required by the active source-loading policy.
2. Resolve this candidate through its exact external repository/path/immutable commit supplied by the preservation dispatch.
3. Verify package composition and every entry in `sha256sums.txt` before using snapshot state.
4. Read `KOD__snapshot__KOD.md`, `SOURCES.md`, and `experience/KOD__experience-resume.md`.
5. Set initiation status only as one of `initiation_verified | initiation_loaded_external_unverified | initiation_failed` according to evidence.
6. Fresh-scan `puev5691/wellbeing-hq` before choosing work. Repository inbox presence alone does not make an old task active.
7. Check for a competing KOD current-writer or explicit writer handoff. Do not self-promote merely because this package exists.
8. Resume the highest-priority still-current dependency, one profile step at a time.

## Resume ordering at candidate creation

First: emergency preservation verification/handoff itself.

After ARH clears preservation boundary, re-evaluate, not blindly execute:
- info-entry r2 type-validation correction, task commit `a05b80fc9041561c659ddaf19574b7550dd8e96b`;
- Telegram Phase 1B aggregate-only privacy code fix, task commit `267e7f23a8ba89efc8221f95f38a67b23ef0af5c`.

## Hard anti-regression

- do not label detector PASS / activation_requested as real `processing_started`;
- do not mutate an accepted immutable package in place; build a new immutable revision;
- generate checksums only after final bytes, then verify by readback;
- created/published/delivered/received/accepted are distinct states;
- no secrets, tokens, MFA values, raw audience identity, or private credentials in recovery;
- do not infer project time from interface/system time;
- do not continue authoritative old-instance profile work after preservation handoff if recovery canon freezes it.

## Safe next step after verified initiation

Fresh GitHub preflight → classify current tasks/acceptances/blockers → verify current-writer state → execute exactly one admissible KOD profile step → verify → route → experience fixation.

project_time: omitted; trusted project-time source not used

---
КТО: KOD / КОДЕР
ДЛЯ ЧЕГО: безопасный Resume-First запуск replacement KOD
СТАТУС: candidate_not_writer_transfer
