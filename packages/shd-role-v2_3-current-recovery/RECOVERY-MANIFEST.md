# SHD recovery checkpoint manifest

Кратко: manifest перечисляет состав внешнего recovery-пакета SHD после утверждения штатной роли v2.3. Пакет создан current-writer SHD для проверки АРХИВАРИУСОМ. Он не содержит секретов и не является ARH acceptance.

## 1. Package identity

- package_id: `SHD-role-v2_3-current-recovery`
- entity: `SHD / ШАРДОВИК`
- package_status: `published_for_ARH_preservation_verification`
- repository: `puev5691/wellbeing-entity-bootstrap`
- branch/ref: `main`
- path: `packages/shd-role-v2_3-current-recovery/`
- manifest: `RECOVERY-MANIFEST.md`
- checksum file: `sha256sums.txt`
- project_time: omitted; trusted project-time source not used

## 2. Composition

| File | Purpose |
|---|---|
| `SHD__initiation-current.md` | startup/initiation instructions for a new SHD instance |
| `SHD__snapshot.md` | current-writer self-snapshot after SHD role-source v2.3 |
| `SOURCES.md` | required project sources and GitHub dependencies |
| `RECOVERY-MANIFEST.md` | package composition and verification contract |
| `sha256sums.txt` | SHA-256 checksums for significant package files |

## 3. Provenance

The package responds to:

- `wellbeing-hq:entities/koordinator/current/KOO__shd-staff-integration.md`
- `wellbeing-hq:entities/archivarius/outbox/ARH__shd-role-preservation-phase1__SHD.md`
- `wellbeing-hq:entities/archivarius/outbox/ARH__shd-current-state-recovery-gap__SHD.md`
- direct OPERATOR instruction to current SHD to create the self-state/recovery checkpoint required by ARH.

## 4. Active role-source boundary

- active approved role source: `entity-roles-short-v2_3-approved`
- v2.3 approved source SHA-256: `e50df08b5d11765ac5e38197b298ad476333e5f14e717e13a631f9d802dfe10a`
- superseded provenance: `entity-roles-short-v2_2-approved`
- rule: v2.2 must not be used as a parallel active role source for SHD.

## 5. Recovery verification expected by ARH

ARH should verify:

1. package files exist at the external locator;
2. fetched files match `sha256sums.txt`;
3. `SHD__snapshot.md` was authored by SHD/current-writer, not ARH/KOO;
4. confirmed/current, pending and historical evidence are separated;
5. no secret material is present;
6. HQ routing back to ARH contains exact commit/blob identities;
7. recovery registry/status is updated only after verification, not inferred from publication.

## 6. Secret boundary

The package intentionally excludes:

- raw QR images and URI strings;
- UUID values where they could act as access material;
- private keys, tokens, passwords;
- Reality shortIds/public/private key material that could recreate working access;
- sensitive locations of any closed secret store;
- live production server credentials or raw configs.

## 7. Known limits

This package does not prove:

- current production/server state;
- SIS acceptance of VPN reports or runbooks;
- KOO final handling of every staff-registry follow-up;
- exact ChatGPT entity-chat resume capability;
- ARH preservation closure before independent verification.

## 8. Safe next step

After publishing this package, SHD must create/route an HQ artifact to ARH with the package locator and immutable identities, then check remaining `entities/shardovik/inbox/` items by Resume-First.

---
КТО: SHD / ШАРДОВИК
КОГДА: project_time omitted; trusted project-time source not used
ДЛЯ ЧЕГО: manifest external recovery package для ARH preservation verification
СТАТУС: manifest_for_external_recovery_checkpoint