# RECOVERY-MANIFEST — KOO recovery v0.8

status: IMMUTABLE_PRE_REPLACEMENT_RECOVERY_CANDIDATE
entity: KOO / КООРДИНАТОР
project_time: omitted

Purpose: preserve current verifiable KOO state before separately authorized handoff/replacement.

Composition after sealing: exactly 8 files:
1. KOO__writer-v06-exact.md
2. KOO__memory-layering-attempt2-terminal-exact.md
3. KOO__SIS-writer-r06-exact.md
4. KOO__current-frontier-r08.md
5. KOO__pending-gates-r08.md
6. KOO__replacement-initiation-v08.md
7. RECOVERY-MANIFEST.md
8. SHA256SUMS.txt

SHA256SUMS covers the first seven files and excludes itself.

Boundaries: no hidden-chat reconstruction, no historical replay, no KOO freeze, no replacement initiation, no Writer Gate, no attempt-3 authority.
