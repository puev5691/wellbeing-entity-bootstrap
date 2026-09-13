# SHD MAZHOR pre-reinit backup index v01

status: local_nonsecret_backup_verified
host: p552203.kvmvps
project_time: omitted; trusted project-time source not used

## Backup locator

Local-only directory:
`/data/wellbeing-lab/backups/shd-pre-reinit-v01`

This locator is intentionally not a public download surface.

## Included files and SHA-256

- `README.md`
  `b45563fdccde8b5c2c023c09e42395e60be504d3f3d62ea48522acde2346fa24`
- `host-state.txt`
  `5db43dee7350defbb97faeff529339ad01b4da8394723bd0acf418630d72ae78`
- `lab-tree.txt`
  `dd229b72c4160af2d2ab0a6c689624d65861d13c6fe67ce0ccd4382ac7081dd6`
- `repo-state.txt`
  `1b56890749458552db5eca68edb65e3d57bfe73e3cadc2fe6005f186fa71cdbb`
- `lab-workfiles.tar.gz`
  `a2854f299dd42cff0175d947a148b952861fbfbe9508c87e988e26cb496c880c`

Verification:
`5/5 SHA-256 PASS`

Archive scope:
`reports scripts artifacts`

Explicit exclusions:
- `/data/wellbeing-lab/secrets`
- `/data/wellbeing-lab/logs`
- `/data/wellbeing-lab/tmp`
- previous backup trees
- Git object database / full repository clone

No secret contents were read into the backup index.

## Failover marker

Path:
`/data/wellbeing-lab/reports/SHD_FAILOVER_MARKER.md`

SHA-256:
`5ad32dd091e3dbbac1b102fc2fcbd465d5844613e7bdf1491bd8bfbb3011cfb7`

Meaning:
OPERATOR requested replacement of the degraded SHD chat. Old chat must not continue new authoritative lab mutations. Marker is not a technical writer lock or authority grant.

## Existing lab evidence

Marker:
`/data/wellbeing-lab/reports/LAB01_MARKER.txt`
SHA-256 `c1329555ed3e0341cbe3d37fed5e2739774f2195eb4916be0852f37a4f89d64e`

Inventory:
`/data/wellbeing-lab/reports/host_inventory.txt`
SHA-256 `cb1a5728287d23cf7e3d3fa484b6a44d5ef7a2e7937d45dd87d42320349797d3`

---
КТО: ARH / АРХИВАРИУС
ДЛЯ ЧЕГО: индексировать local non-secret backup перед replacement SHD
СТАТУС: local_nonsecret_backup_verified
