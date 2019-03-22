# Project: Ruby on Rails Final Project!!!

Learn about project specifications [here](https://www.theodinproject.com/courses/ruby-on-rails/lessons/final-project)

App is [live](https://odinbookface.herokuapp.com/)

> The purpose of the final project was to combine major concepts by building a miniature version of the popular social media site Facebook.

## Features

- user authentication(using the devise gem)
- users can sent friend requests and become friends(if the recipient user accepts of course)
- users can create posts(text only)
- users can leave comments on those posts created by their friends

- users can sign in using facebook using the omniauth-facebook gem

## Instructions

> Make sure you have [PostgreSQL](https://www.postgresql.org/) and a JavaScript runtime like [Node](https://nodejs.org/) installed.

1. clone the repository

   `git@github.com:ben-garcia/odin_facebook.git`

2. create `config/application.yml`:

   `bundle exec figaro install`

   and setup environment variables there

   ```
    FACEBOOK_APP_ID: < your_app_id >
    FACEBOOK_APP_SECRET: < your_app_secret >

    USERNAME: < your_postgresql_username >
    PASSWORD: < your_postgresql_password >
   ```

   **OR**

   open `config/database.yml` and type your postgreSQL credentials

   ```
   ...

   development:
     <<: *default
     database: wheres_facebook_development
     username: < your_postgresql_username >
     password: < your_postgresql_password >

   ...
   ```

3. run `bundle` to install gems

4. run `rails db:create` to create database

5. run `rails: db:migrate` to create tables

7) run `rails s` to run server on `localhost:3000`
