Запуск проекта
==============

Для начала необходимо установить [vagga](http://vagga.readthedocs.io/en/latest/installation.html#ubuntu) (из репозитория *testing*)

Требуется версия не ниже **v0.6.1-144-geca03ab** (проверить можно через `vagga --version`)

В этой версии том `mysql` инициализируется автоматически, так что при удалении его из `.vagga/.volumes/mysql` и последующем запуске проекта он корректно инициализирутся.

В чистую базу (созданную автоматически или вручную, через `_init_db`) требуется загрузить фикстуры (минимально рабочую схему базы). **Требуется остановить проект**, если он запущен с помощь `vagga run`. Если процессы запущены по отдельности, например, `vagga run --only php`, `vagga run --only mysql` и т.д., то нужно остановить только процесс `mysql`

Загружать фикстуры нужно так:

    vagga _load_fixtures fixtures/schema.sql
    
Таким образом можно загружать любые другие SQL-дампы, в т.ч. сжатые (`*.sql.gz`)

Затем нужно собрать статику:

    vagga build-static

Запустить проект

    vagga run

Другое
======

* cправка по отдельным командам — `vagga` без аргументов
* данные `!Persistent` томов доступны в `.vagga/.volumes/`
* логи PHP — `.vagga/.volumes/php_log`, рекомендуется `tail -f .vagga/.volumes/php_log/tabun.error.log` в другой консоли для просмотра ошибок