# dronny.ru
[dronny.ru](http://dronny.ru)
[![Build Status](https://travis-ci.org/arrowcircle/dronny.svg?branch=master)](https://travis-ci.org/arrowcircle/dronny)

Поделиться билдом квадракоптера теперь легко

# Установка

* Ruby 2.3.1
* Postgresql 9.5+
* `cp config/database.yml.sample config/database.yml`
* `cp config/secrets.yml.sample config/secrets.yml`
* `rake db:create db:migrate db:seed`
