# ARH recovery manifest v1.4

## Назначение

Manifest текущего внешнего recovery-пакета АРХИВАРИУСА после первого source-change preservation cycle по roles v2.2 / recovery v1.4.

## Locator

    store: github
    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/arh/recovery/current
    ref: main
    manifest: ARH__recovery-manifest__ARH.md
    checksums: sha256sums.txt

`main` является mutable ref и не используется как единственная version identity.

## Состав current recovery

Обязательные файлы:

1. `ARH__initiation-current__ARH.md` — роль, границы, active sources, cold-start и внешний locator.
2. `ARH__snapshot__ARH.md` — authoritative ARH self-state текущего current-writer.
3. `ARH__recovery-manifest__ARH.md` — этот manifest.
4. `ARH__recovery-registry__ARH.md` — единый минимальный recovery-registry, необходимый АРХИВАРИУСУ как process owner.
5. `ARH__source-change-cycle-report__KOO.md` — проверяемая фиксация первого эксплуатационного source-change cycle.
6. `sha256sums.txt` — SHA-256 пяти содержательных файлов выше; собственную сумму файл не включает.

## Integrity / readback

До использования нового пакета как externally verified требуется:

1. проверить наличие всех шести файлов;
2. проверить состав по этому manifest;
3. проверить SHA-256 пяти содержательных файлов по `sha256sums.txt` либо подтвердить их внешние immutable Git blob identities;
4. зафиксировать результат readback.

## Active Project Sources

Базовые управляющие Project Sources не копируются в recovery-пакет. Точные обязательные версии и SHA-256 перечислены в initiation/snapshot.

## Provenance

Предыдущее поколение recovery:

`entities/arh/recovery/current` на Git commit `c6914d2257382901c9b579dd301ef382e636d4cc`

Предыдущий пакет относился к recovery v1.2 и сохраняется в Git history как provenance.

## Границы

- registry не является authority на чужой current-state;
- report не является approval чужих recovery;
- наличие publication не равно recoverability;
- свежий cold-start нового ARH экземпляра в этом cycle не выполняется и не заявляется.

## Следующий безопасный шаг

`KAN source-change preservation checkpoint`

---

package_id: ARH-recovery-current-v1.4-source-change-01  
source_location: authoritative current-writer ARH current chat  
generated_files: `ARH__initiation-current__ARH.md`; `ARH__snapshot__ARH.md`; `ARH__recovery-manifest__ARH.md`; `ARH__recovery-registry__ARH.md`; `ARH__source-change-cycle-report__KOO.md`; `sha256sums.txt`  
recipients: ARH recovery; KOO report consumer  
copied_to: external locator above after publication  
checksum_file: `sha256sums.txt`  
operator_action: none for package creation; next coordination action is KAN checkpoint  
unresolved_questions: exact current recovery locator/version KAN; fresh cold-start ARH not run  
status: current_manifest  
recovery_standard: v1.4  
project_time: generated_without_trusted_project_time  
