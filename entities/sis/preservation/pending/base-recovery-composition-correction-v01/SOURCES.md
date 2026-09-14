# SOURCES — SIS base recovery composition correction v01

## Historical SIS-authored base

repository: `puev5691/wellbeing-entity-bootstrap`
commit: `861645789d206db19e5135a6771564660d99158f`
path: `entities/sis/recovery/current`

Historical recovery manifest:
`SIS__recovery-manifest__SIS.md`
blob: `dcedf329ff3ca14dd625c387b00faf118702be21`

Historical checksum table:
`sha256sums.txt`
blob: `b6a1c2a28562239772dff0f598bb508ac8d4d650`

## KOO independent verification that triggered this correction

HQ artifact:
`entities/koordinator/outbox/KOO__SIS-replacement-initiation-v01-verification__ARH.md`
HQ artifact commit:
`e22f33594518696f49c018fae78c4ea4b2dc5fac`
HQ artifact blob:
`3bc397f81835fc50f5a0534f0b2e950014e3484b`

Verdict:
`FAIL_BASE_RECOVERY_COMPOSITION_MISMATCH`

Verified declared core raw-byte result:
`4/4 PASS`

Replacement overlay result:
`5/5 PASS`

## ARH correction request locator

HQ inbox:
`entities/archivarius/inbox/KOO__SIS-replacement-base-composition-correction__ARH.md`
dispatch commit:
`3e27f7b0f7c4b8b704bc19841cfab3e165441fd8`

This correction is ARH-authored recovery metadata over immutable SIS-authored historical source bytes. It is not a SIS self-state rewrite and not a writer grant.
