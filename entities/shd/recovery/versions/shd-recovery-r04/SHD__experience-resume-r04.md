# SHD experience and anti-regression resume r0.4

status: SELF_PRESERVATION_EXPERIENCE_LAYER
entity: SHD / ШАРДОВИК
project_time: omitted

This file preserves reusable operating lessons. It is not current task authority and does not replace exact current-state evidence.

## 1. Graceful preservation has priority while authoritative writer is still usable

Idea:
When replacement risk is detected, preserve the live writer's exact state before attempting emergency reconstruction.

Trial:
SHD r0.3 was externally preserved by ARH. A later emergency replacement r0.4 was prepared when the old chat was believed unusable.

Result:
Fresh OPERATOR/KOO evidence showed the current SHD was still responsive in browser. KOO issued:
HOLD_EMERGENCY_REPLACEMENT_PENDING_LIVE_SELF_PRESERVATION.

Outcome:
Emergency initiation was blocked before Writer Gate.

Lesson:
If authoritative writer is still available, prefer fresh self-snapshot → ARH preservation/readback → freeze/handoff → replacement. Emergency recovery is fallback, not a shortcut.

## 2. Supersession must be checked before expensive recovery work

Idea:
A valid earlier task/authority can become stale before execution.

Trial:
New SHD r0.4 checked fresh HQ before completing recovery reconstruction.

Result:
It found KOO hold 0006e265... issued after the emergency authority/task.

Outcome:
BLOCKED_SHD_R04_INITIATION_SUPERSEDED_BY_KOO_HOLD_R01.

Lesson:
Fresh supersession/authority check is a first-class gate. Stop early when a newer governing boundary invalidates the requested path.

## 3. Recovery state must preserve pending tasks without replaying them

Idea:
Unfinished work belongs in recovery, but recovery must not turn it into automatic execution.

Trial:
Current state includes File/Artifact Service r0.2, Telegram A r0.1+r0.2 addendum and TERA source research.

Result:
All are recorded with exact locators and status, while profile work remains paused.

Lesson:
Preserve exact task identity + authority + inputs + status + blockers. After replacement, fresh reconciliation decides whether each task remains current.

## 4. File/Artifact Service historical defect lesson

Idea:
A package can pass its own tests while immutable committed bytes, manifest identities or path/schema boundaries remain wrong.

Observed predecessor findings:
- MANIFEST SHA/bytes mismatch against immutable Git payload;
- reserved MANIFEST.json target collision;
- prior_manifest_path escape outside source_root;
- create_archive coercion instead of exact Boolean.

Result:
The original independent review correctly returned FAIL even though internal tests had passed.

Lesson:
Independent verification must bind tests to exact immutable bytes and separately attack manifest/path/schema boundaries. Self-tests are evidence, not acceptance.

## 5. Exact immutable bytes beat tool-produced annotations and presentation

Idea:
Publishing or transporting code can alter bytes after local validation.

Observed in Astra lane:
tool annotation text was appended to Python files, causing SHA mismatch and SyntaxError.

Result:
A seemingly correct allowlist package was independently rejected until a clean immutable successor was sealed.

Lesson:
Always compare final repository blob bytes, size and digest after publication. Never transfer a local PASS to different committed bytes.

## 6. Partial materialization must fail before execution

Idea:
Tool/download failure can leave a plausible partial file.

Observed in earlier File Service exact-test cycle:
a chunked materialization attempt timed out and left incomplete bytes.

Result:
Git/hash identity check caught the mismatch before execution; partial bytes were discarded.

Lesson:
Never execute candidate bytes until immutable identity has been verified after materialization.

## 7. Publication / dispatch / activation are distinct

Idea:
GitHub write events are often mistaken for actual execution.

Observed repeatedly:
publication, inbox pointer and dispatch may exist while receipt or processing_started is absent.

Result:
Activation boundary records explicitly showed activation_failed / processing_started=no.

Lesson:
Keep:
publication != dispatch != receipt != acceptance
and
wake_detected != activation != processing_started != task_completed.

## 8. Source genealogy matters in TERA/WBN research

Idea:
Repository name alone does not identify original source semantics.

Trial:
Inventory of puev5691 TERA/WBN repositories reconstructed lineage.

Result:
- teraOrigin is legacy pre-JINN line;
- wellbeing/wbn2026 are historical WBN/JINN forks;
- wbchain-lab embeds a legacy Source tree but its 2026 installer actually clones official tera2 commit 6cc2061... and overlays WBN identity.

Lesson:
Separate original upstream source, historical fork behavior and project deployment evidence. Never infer pristine TERA2 behavior from WBN-modified repositories.

## 9. Document hash integrity does not prove external truth

Idea:
Canonical bytes and hashes can prove identity of a statement, not truth of its off-chain claim.

Trial:
Telegram A/B design and JCS work separated document identity from token→bot evidence.

Result:
A/B candidates remained design-only; token_to_bot_binding remained UNKNOWN.

Lesson:
Hash/ledger/provenance systems preserve exact claims and lineage, but trusted evidence/attestation remains necessary.

## 10. Anti-regression checklist for replacement SHD

Before any profile work after replacement:

1. Initiation and Writer Gate are separate.
2. Confirm newest externally preserved recovery, not merely newest filename.
3. Check competing writer / handoff / supersession.
4. Load active approved Project Sources, not staged candidates.
5. Fresh-reconcile pending tasks.
6. Do not replay historical PROMPT/inbox automatically.
7. Verify exact immutable input bytes before tests.
8. Preserve UNKNOWN rather than reconstructing from memory.
9. Do not execute memory-layering attempt 3.
10. Resume one exact authorized task at a time.
