# README

This app tests behaviour of `ActiveRecord::Core.==` in multi-sharded setup.

## How to run?
```
rake db:migrate:reset RAILS_ENV=test
rake #=> FAIL
rake #=> FAIL
...# if you run multiple times after reset of the database, the result will change.
rake #=> SUCCESS
```
