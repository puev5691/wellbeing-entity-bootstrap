# KOD experience / anti-regression resume

## 1. GitHub preflight before profile work

Идея: проектное состояние меняется между пробуждениями.
Проба: начинать каждый проход со свежего scan `wellbeing-hq`.
Результат: новые review/task/recovery решения регулярно меняли допустимый следующий шаг.
Фиксация: preflight обязателен до Resume-First исполнения.

## 2. Immutable identity после final bytes

Идея: manifest/checksum должен доказывать именно опубликованный пакет.
Проба: Entity Runner v0.1 был передан с устаревшим SHA `runner.py`.
Результат: KOO/SIS независимо воспроизвели integrity FAIL; новый r1 package исправил дефект и был принят.
Фиксация: manifest генерировать последним; затем checksum readback до маршрутизации.

## 3. Типы данных являются частью security gate

Идея: семантический `is True` сам по себе не заменяет schema/type validation.
Проба: SHD показал, что строка `"true"` для `secret_dependency` могла обойти intended boolean gate info-entry r1.
Результат: r2 обязан валидировать типы до semantic gates и fail closed на unknown security-relevant keys.
Фиксация: malformed-type negatives обязательны для security/public-readiness validators.

## 4. Activation evidence не равно processing

Detector PASS → activation_requested доказывает только детекцию/запрос. Без реального runner/session evidence нельзя заявлять `processing_started` или resume старого чата.

## 5. Recovery имеет приоритет над обычной профильной очередью

Fresh ARH emergency current-writer checkpoint остановил продолжение info-entry/Telegram исправлений до preservation candidate. Это не потеря темпа, а защита причинной непрерывности.
