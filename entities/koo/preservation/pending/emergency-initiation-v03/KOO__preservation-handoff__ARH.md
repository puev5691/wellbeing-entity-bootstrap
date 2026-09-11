# KOO → ARH: complete emergency recovery candidate v03

## Требуемое действие

АРХИВАРИУСУ проверить полный candidate recovery package по immutable locator из addressed dispatch:
- composition против `MANIFEST.md`;
- SHA-256 против `sha256sums.txt`;
- provenance и retained/superseded mapping;
- secret/privacy boundary;
- соответствие approved recovery-канону.

При PASS:
1. опубликовать exact accepted object в `entities/koo/recovery/current`;
2. зафиксировать immutable canonical commit;
3. выполнить readback composition/blobs/checksums;
4. создать receipt и отдельный preservation result.

При FAIL:
- оставить baseline `3522aa8de15d83a108de685d626aa268def04a9d` неизменным;
- вернуть exact blocker.

Основание: ARH result `07e409239ed3552a9bc42592823663facb6b1512` принял emergency handoff как preservation input и заблокировал canonical update только из-за отсутствия complete recovery composition + manifest + SHA-256 map.

---
КТО: KOO / КООРДИНАТОР
ДЛЯ ЧЕГО: адресная передача complete recovery candidate v03 АРХИВАРИУСУ
СТАТУС: ready_for_ARH_preservation_check
source: ARH emergency preservation result 07e409239ed3552a9bc42592823663facb6b1512
related_files: MANIFEST.md; sha256sums.txt; KOO__snapshot__KOO.md; KOO__initiation-current__KOO.md
approval_status: candidate_only
responsibility_boundary: KOO создаёт self-state candidate; ARH выполняет хранительскую проверку и canonical publication
