# СИСАДМИН — initiation current update

## Назначение

Этот initiation update заменяет содержательно устаревшее представление SIS initiation внутри нового recovery package после terminal operational-instance pilot.

## Initiation state

- Entity: `SIS` / СИСАДМИН.
- Current-writer: authoritative SIS current-writer.
- Последняя подтверждённая внешняя recovery verification прежнего SIS package: immutable publication commit `950f01dc5cdb56c3ea63ba540c4e72eda24973bb`, repo `puev5691/wellbeing-entity-bootstrap`, path `entities/sis/recovery/current`; на той проверке `sha256sum -c` дал `8/8 OK`, после чего статус был `initiation_verified`.
- После этой verification выполнены terminal repair v0.7 и operational-instance pilot, поэтому прежний внешний recovery package теперь stale относительно current SIS state.
- Новый post-operational package подготовлен current-writer SIS и ещё не имеет подтверждённого external publication/readback.

## Current operational anchor

- Current release: `sha256-29d07687ad65bc2b366bd98bdd4bcd3f2a4670c87c05330819a31a2981d79c3a`.
- KOO operational instance: `inst:9a07e3fb-c997-4a34-9cad-f2590f624b06`, lifecycle `active`.
- Credential locator: `/home/pev5691/.config/wb-oss/koo-pilot.json`; secret не включён.
- Writer grants: `0`; additional entities: `0`; production allowed: `no`.

## Recovery locator state

До внешней публикации этого пакета current external locator нового recovery состояния: `unknown / pending ARH publication`.

Предыдущий verified locator сохраняется как provenance, но не должен выдаваться за актуальную post-operational recovery version.

## Cold-start requirement

Новый экземпляр SIS не должен объявлять полную инициацию по одному локальному пакету. После публикации АРХИВАРИУСОМ он обязан получить immutable locator нового пакета, проверить manifest/checksum map/readback и только после совпадения версии считать post-operational recovery внешне подтверждённым.
