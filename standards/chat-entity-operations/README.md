# Стандарты рабочих Сущностей чатов проекта Благополучие

Статус: working  
Версия: v0.1  
Назначение: единая точка входа для масштабируемых правил по инициации, контексту, файловому обмену, execution reports, финалу shell-блоков и handoff-переходам между рабочими чатами Сущностей.

## Что входит в пакет

- `entity-context-and-role-settings-v01.md`
- `file-exchange-and-routing-protocol-v01.md`
- `execution-report-and-shell-output-standard-v01.md`
- `chat-refresh-and-handoff-regulation-v01.md`

## Зачем нужен этот пакет

Этот пакет нужен, чтобы:

- новые Сущности сразу получали единый рабочий канон;
- действующие Сущности можно было переводить на общий стандарт без ручной импровизации;
- ОПЕРАТОР не путался в маршрутах файлов и в состоянии рабочих циклов;
- длинные технические результаты перестали жить только в терминальной прокрутке;
- handoff в новый чат происходил по понятному регламенту, а не по ощущению усталости от накопившегося хаоса.

## Как применять

### Для новых Сущностей

Включать эти стандарты в bootstrap package:

- profile
- start-context
- constraints-and-permissions
- shell-output technology
- acceptance test

### Для уже существующих Сущностей

Применять через retrofit-пакет:

- route decision
- protocol update
- quick reference
- один тестовый цикл

## Порядок чтения

1. `entity-context-and-role-settings-v01.md`
2. `file-exchange-and-routing-protocol-v01.md`
3. `execution-report-and-shell-output-standard-v01.md`
4. `chat-refresh-and-handoff-regulation-v01.md`

## Краткий вывод

Это не просто набор красивых бумажек. Это рабочий пакет, который должен уменьшать путаницу, дублирование, шум контекста и деградацию длинных рабочих чатов.