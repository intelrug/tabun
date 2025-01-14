Запуск проекта
==============

Для запуска проекта нужен Docker + docker-compose.

`make run` создаст нужные контейнеры и запустит проект в dev-окружении:
* PHP
* NGINX
* MySQL
* Redis
* Celery

База данных будет проинициализана автоматически при старте её контейнера.

Некоторые часто выполняемые вещи вынесены в Makefile (генерация локалей, установка пакетов из Composer). `webpack --watch` стартует автоматически при старте контейнера `frontend`.

Локальные сервисы
=================

Redis
-----
Порт `6379`

*Базы:*

* 1 — брокер Celery
* 2 — результаты задач
* 3 — сессии PHP
* 4 — кеш приложения

MySQL
-----
Порт `3306`

php-fpm
-------
Порт `9000`
Порт xDebug `39000` (ключ *tabun*)

Почта
-----

При запуске дерева процессов также запускается отладочный почтовый сервер, позволяющий тестировать связанный с отправкой писем функционал.
Интерфейс для чтения локальных писем расположен по адресу http://127.0.0.1:1080/

База данных
-----------

Для загрузки SQL-дампов либо выполнения любых других корректных комманд, в т.ч. сжатые (`*.sql.gz`) существует комманда `_load_fixture`

При использовании команды **требуется остановить проект**, если он запущен с помощь `vagga run`. Если процессы запущены по отдельности, например, `vagga run --only php`, `vagga run --only mysql` и т.д., то нужно остановить только процесс `mysql`

Например, загрузка сжатого дампа будет выглядеть примерно так:

    vagga _load_fixture my/test/dump.sql.gz

Либо, применение патча:

    vagga _load_fixture my/patches/31337_info.sql

Фикстуры
--------

При заполнении базы данных для тестирования доступно четыре аккаунта:

    Celestia:celestia
    Luna:constellations
    Sparkle:scrolls
    Spitfire:feathers
