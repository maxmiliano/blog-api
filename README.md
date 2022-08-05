# README
This is a simple blog API project written in Ruby on Rails. The main objective of this is to serve as a study and showcase for Ruby on Rails features.

## Ruby version
3.1.2

## Database
PostgreSQL

## Running on Docker containers

Build and start cotainers:

`docker-compose up`

API will run on `localhost:3000`.

If running for the first time, create the database:

`docker compose run web rake db:create`

If there are pending migrations, run migrations:

`docker compose run web rake db:migrate`

## Running on local machine
Make sure you have:
- Required Ruby version
- Bundler
- Postgres database running

#### Database creation
`bundle exec rake db:create`

#### How to run the test suite
`bundle exec rspec` 

#### Start server
`bundle exec rails s`

#### Start console
`bundle exec rails c`
