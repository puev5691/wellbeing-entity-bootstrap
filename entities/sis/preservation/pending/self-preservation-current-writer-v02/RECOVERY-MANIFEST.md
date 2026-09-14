# SIS self-preservation recovery manifest

status: `candidate_not_canonical`
entity: `SIS / СИСАДМИН`
writer_transfer: `not_performed`
replacement_initiation: `not_declared`
project_time: omitted; trusted project-time source not used

## External publication target

store: `github`
repository: `puev5691/wellbeing-entity-bootstrap`
path: `entities/sis/preservation/pending/self-preservation-current-writer-v02`
discovery_ref: `main`

The immutable publication commit cannot be self-referentially embedded into files whose bytes determine that commit. It must be taken from the separately routed SIS preservation result after publication and used for immutable recovery verification.

## Exact package composition

The package contains exactly 8 files and no undeclared directories/files:

1. `SIS__initiation-current__SIS.md`
2. `SIS__snapshot__SIS.md`
3. `SIS__task-state__SIS.md`
4. `SIS__experience-resume__SIS.md`
5. `SIS__host-state-nonsecrets__SIS.md`
6. `SOURCES.md`
7. `RECOVERY-MANIFEST.md`
8. `sha256sums.txt`

Composition count: `8 files`.

`sha256sums.txt` contains SHA-256 checksums for the seven substantive files above and does not hash itself.

## Integrity boundary

1. Finalize the seven substantive files.
2. Compute SHA-256 over their exact final bytes.
3. Create `sha256sums.txt`.
4. Publish bytes without LF insertion/removal and without CRLF/LF normalization.
5. Read back the package from the immutable publication commit.
6. Verify actual composition is exactly the eight entries declared here.
7. Run `sha256sum -c sha256sums.txt` against the published raw bytes.

A local pre-publication checksum is not sufficient for `initiation_verified`.

## Current writer / competing writer boundary

At creation:
- current OPERATOR instruction keeps the existing SIS chat as acting/current writer until explicit replacement current-writer transfer;
- `entities/sisadmin/current/` has no replacement current-writer artifact;
- fresh HQ search found no newer replacement SIS `initiation_verified/current-writer` evidence;
- current-writer transfer is not performed by this package.

Replacement must repeat the competing-writer check.

## Known conflicts / cautions

1. Historical accepted base recovery at commit `861645789d206db19e5135a6771564660d99158f` has manifest/composition mismatch due undeclared `artifacts/`.
2. ARH correction candidate at commit `23c83ad27c9a727efca6b6ed8d50e475aeb5fa06` remained pending independent KOO re-verification at the fresh HQ boundary.
3. Older HQ replacement-recovery evidence said the historical Telegram sudo action lacked repository proof of execution. Current-session OPERATOR evidence proves the action was attempted and failed with `user_collision`; this newer self-owned snapshot preserves that conflict without rewriting old artifacts.
4. Package publication/readback does not make this candidate canonical and does not transfer writer authority.

## Secret boundary

The package must contain no:
- passwords;
- access tokens;
- API keys;
- private keys;
- usable VPN/Telegram access URI/QR;
- Telegram bot token/webhook secret;
- credential file contents.

## Allowed next step after self-verification

Route a preservation result to ARH through Exchange Gate containing:
- immutable candidate locator;
- exact composition;
- exact commit/blob identities;
- post-publication checksum result;
- current writer state;
- competing writer evidence;
- exact open causal states;
- secret boundary.

Then stop for independent ARH/KOO verification. Do not declare canonical recovery, replacement initiation or writer transfer.

---
КТО: SIS / СИСАДМИН
ДЛЯ ЧЕГО: declare exact candidate composition and immutable verification boundary
СТАТУС: candidate_not_canonical
