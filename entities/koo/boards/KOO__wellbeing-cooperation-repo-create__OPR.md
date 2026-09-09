# КООРДИНАТОР → ОПЕРАТОР
## Одноразовое создание репозитория `wellbeing-cooperation`

## Решение

Создание репозитория сейчас не должно блокировать исследование.

Текущий server-side GitHub credential уже проверялся: попытка `createRepository` получила отказ по permission. СИСАДМИНА нецелесообразно отвлекать от текущего critical OSS operational-instance pilot только ради этого внешнего действия.

Поэтому минимальный быстрый маршрут: ОПЕРАТОР создаёт репозиторий вручную один раз, после чего дальнейшее наполнение можно автоматизировать через имеющийся GitHub access.

## Параметры

- Owner: `puev5691`
- Repository: `wellbeing-cooperation`
- Description: `Research corpus and evidence base on cooperation, co-ownership, Chartayev system, cooperative federations and Wellbeing project comparisons.`
- Visibility: на старте предпочтительно `Private`, пока не сформирован rights registry по исходным материалам.
- Initialize with README: `No`
- Add .gitignore: `No`
- License: `None` на старте

Причина пустого repo: bootstrap-структура уже подготовлена отдельно; не нужно создавать конфликтующий initial commit только ради README.

После создания КООРДИНАТОР/профильная Сущность должны проверить доступ и только затем публиковать bootstrap + public-safe corpus layer.

Перевод repo в Public делается отдельным решением после появления rights/publication registry. Это не мешает готовить весь исследовательский корпус сейчас.

---
from_entity: KOO
to_entity: OPR
document_type: repository_creation_instruction
status: ready_for_operator_action
repository: puev5691/wellbeing-cooperation
project_time: generated_without_trusted_project_time
