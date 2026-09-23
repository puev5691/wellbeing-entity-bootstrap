# Memory-layering r01: preparation package

Материализован тестовый пакет ML-E2E-DESIGN-R01. MAIN НЕ ЗАПУСКАЛСЯ.
Все recovery данные — синтетические fixtures, а не результат исполнения OLD-01.

Authority: AUTHORIZE_MEMORY_LAYERING_E2E_R01_EXECUTION_PREPARATION.
Design: wellbeing-hq@9887cd2b3ea7ab09ba58dfa50f27a7f5f6718dca:entities/koder/outbox/KOD__memory-layering-e2e-design-r01__KOO-SHT.md, blob b1db36b9d2f7510ce4a4efe92071d2f97d0df0a0.
Basis/review/writer identities: provenance/basis.json. Frozen approved sources copied completely, 6 files / 192853 bytes. No source shortening.

## Как проверить offline

Из package directory: `python3 -B run_tests.py`.
`python3 -B seal.py` воспроизводит manifest/checksums после любых локальных изменений; на immutable package ничего не менять. Tests сверяют существующий manifest и повторное sealing в temporary copy. В test log отсутствует недостоверное project time.

`verifier.py` принадлежит checker. Он содержит только pure validation/admission; main_admission всегда BLOCKED_MAIN_NOT_AUTHORIZED. OLD→NEW runner намеренно отсутствует на preparation этапе. Self-tests передают verifier заранее созданные положительные/отрицательные sample reports, а не изображают настоящий восстановленный контекст. Prefix сверяется арифметически; main continuation не вычисляется и не исполняется.

## Изоляция и следующий gate

Recovery payload, approved sources и contracts отделены от verifier-private, tests, provenance и design с готовым oracle. projection() строит только allowlisted recovery/source map; worker нельзя запускать с package root, checker module или произвольным GitHub fetch. PUBLIC GitHub placement само по себе не скрывает oracle: будущий supervisor обязан обеспечить read-only projection, filesystem/network isolation и запрет обхода allowlist. Проекция проверена offline; OS/process isolation не испытана и не объявляется доказанной.

OLD-01/NEW-01 — разные synthetic exec processes, пустая env, без fork inheritance, transcript/cache или project writer. Bound future: 1 main attempt, 0 retries, <=32 semantic reads, <=262144 semantic bytes, 5 s computation; 0 provider/arbitrary worker network. Mandatory-source bootstrap отдельно: exact 192853 bytes, полные 6 источников. Предложенный preparation bootstrap cap равен фактическому размеру frozen sources; independent review и final execution decision должны подтвердить cap. Новая версия sources требует fresh admission, не обрезания. Metadata/recovery reads считаются в semantic budget, source bytes — отдельным счётчиком. Это не увеличение лимита semantic payload.

Отсутствующие ARH receipt, SHT package review и main authority остаются null/required, не заменяются placeholders PASS. До main: SHT independent verification, ARH preservation/readback exact commit/subtree, KOO reconciliation, отдельное решение ОПЕРАТОРА и проверка runtime isolation. Никакой production registry/current-state здесь нет.

## Integrity boundary

MANIFEST перечисляет payload и SHA256/Git blob фактических bytes. SHA256SUMS покрывает payload+manifest, не себя. Root identity задаётся publication commit и subtree SHA в KOD result. Commit не помещается внутрь собственного содержимого. ARH читает весь test package; worker получает только проверенную projection. Integrity hashing и semantic reads учитываются раздельно.

## Кандидат опыта и журнал

Продолжение ARH-EXP-014: скрытие oracle требует capability boundary, а не только другого имени каталога. Offline projection доказана в этом preparation; runtime effectiveness неизвестна. Передать как candidate/dedup в existing ARH layer, не новый контур.
Для РЕДАКТОРА: от проекта проверки памяти перешли к проверяемым синтетическим данным и инструменту проверки. Сам опыт смены контекста ещё впереди; готовый стенд не доказывает работоспособность Fast Memory.
