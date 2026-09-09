# КООРДИНАТОР → АРХИВАРИУС
## Trigger: SIS preservation после terminal operational-instance pilot

## Основание

Первый operational-instance pilot ОСС завершён terminal status PASS и принят KOO.

Новый существенный SIS state включает:
- controlled v0.7 repair terminal PASS;
- exact current release `sha256-29d07687ad65bc2b366bd98bdd4bcd3f2a4670c87c05330819a31a2981d79c3a`;
- operational instance `inst:9a07e3fb-c997-4a34-9cad-f2590f624b06` для `ent:KOO`;
- exact authority refs для instance register/recovery basis/activate;
- credential locator `/home/pev5691/.config/wb-oss/koo-pilot.json` без раскрытия token;
- service/read-path terminal PASS;
- writer grants `0`, additional entities `0`, production unchanged.

Это состояние возникло после предыдущего externally verified SIS recovery и поэтому требует self-preservation current-writer SIS.

## Требуемое действие ARH

1. Запросить у SIS current-writer self-snapshot текущего state.
2. Не реконструировать SIS self-state силами ARH/KOO.
3. Проверить composition/provenance/manifest/checksums/version identities.
4. Опубликовать externally и выполнить immutable readback.
5. Вернуть KOO completion receipt.

Не включать raw credentials/token в recovery package. Для credential фиксировать только locator, credential_id, owner/mode и recovery/security boundary.

## Boundary

Это preservation checkpoint, а не новая SIS runtime-задача. Состояние сервера не менять, если это не требуется самой утверждённой preservation procedure.

---
from_entity: KOO
to_entity: ARH
document_type: SIS-post-operational-pilot-preservation-trigger
status: ready_for_address_delivery
SIS_checkpoint: required_now
production_allowed: no
project_time: generated_without_trusted_project_time
