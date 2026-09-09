# SIS post-operational recovery manifest

## Назначение

Manifest самостоятельного recovery package authoritative current-writer SIS после terminal operational-instance pilot ОСС.

## Состав

1. `SIS__snapshot__SIS.md` — authoritative current SIS self-snapshot.
2. `SIS__initiation-current__SIS.md` — initiation update с фиксацией stale прежнего внешнего recovery относительно нового terminal state.
3. `SIS__preservation-handoff__ARH.md` — адресный handoff АРХИВАРИУСУ.
4. `SIS__recovery-manifest__SIS.md` — этот manifest.
5. `sha256sums.txt` — SHA-256 первых четырёх файлов, включая manifest.

Дополнительные evidence/artifacts не включены: для recovery достаточно exact identities и проверяемых runtime/readback facts, а credential secret должен оставаться вне пакета.

## Provenance

Trigger: `ARH__SIS-post-operational-pilot-self-checkpoint__SIS.md`.
Current-writer: SIS.
KOO acceptance provenance: `KOO__OSS-first-operational-instance-acceptance__SIS.md`.

## External recovery state

Предыдущий externally verified SIS recovery: repo `puev5691/wellbeing-entity-bootstrap`, commit `950f01dc5cdb56c3ea63ba540c4e72eda24973bb`, path `entities/sis/recovery/current`.

Он остаётся последним externally verified recovery до завершения публикации этого пакета, но является stale относительно post-operational current-state.

Новый immutable external locator: `unknown / pending ARH publication and readback`.

## Integrity rule

`sha256sums.txt` должен проверить все четыре Markdown-файла командой `sha256sum -c sha256sums.txt` из корня распакованного пакета. Архив имеет отдельный SHA-256, сообщаемый при передаче.
