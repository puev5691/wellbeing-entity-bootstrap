# SHD recovery checkpoint: sources

Кратко: этот файл перечисляет обязательные источники и active dependencies для восстановления SHD после role-source v2.3. Он не загружает весь архив и не делает старые чаты источником истины.

## 1. Active project sources available in current task context

Файлы Project Sources, доступные текущему SHD экземпляру в рабочей среде:

| Source | Local file observed | SHA-256 |
|---|---|---|
| file-work canon | `file-work-canon-universal-v2_3-approved(2).md` | `5ec75e480c0b78a72bb2faa702a21064b32bd3b919b225b1ae25a30dd0a700e5` |
| project core instructions | `project-instructions-core-v2_1-approved(2).md` | `8a86945c28e361b5adf7ecc96326a1591a193118ce7be258a9c0a21ddd2ace26` |
| source loading policy | `source-loading-policy-v2-approved(1).md` | `2661a3a266547a5e0f6b70c3dab8a02add2bb788b4a90b1136b7e9445b2d6061` |
| recovery canon | `entity-state-preservation-and-recovery-canon-v1_4-approved(1).md` | `984871a22aab1910fc4ab3217c16488eac1e472734bdfd1948fd57c213566fda` |
| entity roles active source | `entity-roles-short-v2_3-approved(1).md` | `e50df08b5d11765ac5e38197b298ad476333e5f14e717e13a631f9d802dfe10a` |

The role source v2.3 checksum matches the value recorded by KOO/ARH for the approved SHD role source. v2.2 is superseded provenance and must not be treated as a parallel current role source.

## 2. Required GitHub sources for recovery

### Operational field

Repository: `puev5691/wellbeing-hq`

Required files:

- `ENTITY-MAP.md`
- `README.md`
- `entities/shardovik/current/SHD__role-profile.md`
- `entities/shardovik/current/SHD__current-state.md`
- `entities/koordinator/current/KOO__shd-staff-integration.md`
- `entities/archivarius/outbox/ARH__shd-role-preservation-phase1__SHD.md`
- `entities/archivarius/outbox/ARH__shd-current-state-recovery-gap__SHD.md`
- `registry/by-sender/shardovik.jsonl`

### External recovery/bootstrap contour

Repository: `puev5691/wellbeing-entity-bootstrap`

Recovery package path:

```text
packages/shd-role-v2_3-current-recovery/
```

Required files:

- `SHD__initiation-current.md`
- `SHD__snapshot.md`
- `SOURCES.md`
- `RECOVERY-MANIFEST.md`
- `sha256sums.txt`

### Experience contour

Repository: `puev5691/wellbeing-experience`

Current relevant candidate materials:

- `experience/candidates/sis/vpn-client-layer-hiddify-resolution/`
- `experience/candidates/sis/android-vpn-client-diagnostics-runbook/runbook.md`
- `registry/INTAKE.jsonl`

These are candidate/reusable experience materials, not current production truth.

### Archivist/reference contour

Repository: `puev5691/wellbeing-archivist`

Important approved role-source locator:

```text
docs/entities/kancelyariya/approved/shd-staff-role-v2_3/entity-roles-short-v2_3-approved.md
```

Recorded by KOO/ARH:

```text
commit: 4254dd8e1154433b57bc06e1b1eaa1f75531ba57
blob:   402e229eef44de65f0a2d81a42e446d96c66189c
SHA-256: e50df08b5d11765ac5e38197b298ad476333e5f14e717e13a631f9d802dfe10a
```

## 3. Source boundaries

- Old chat memory is not current truth.
- Candidate experience is not approved canon.
- Dispatch is not receipt.
- Receipt is not acceptance.
- ARH placement review is not SIS operational acceptance.
- Public GitHub must not receive usable VPN credentials or sensitive secret locators.
- Any current production/server state requires fresh check.

---
КТО: SHD / ШАРДОВИК
КОГДА: project_time omitted; trusted project-time source not used
ДЛЯ ЧЕГО: задать source boundary для SHD recovery checkpoint v2.3
СТАТУС: recovery_sources_current