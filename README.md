# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

  Add Administrate to your Gemfile and re-bundle:

  gem "administrate"
  The included installer will create dashboards for each model in your app, complete with routes:

  $ rails generate administrate:install
  Restart your server, and visit http://localhost:3000/admin to see your new dashboard in action.

* Configuration

	You should create file config/secrets.yml
	in the file should be google credentials

development:
  GOOGLE_CLIENT_ID: <youcredentials>.apps.googleusercontent.com
  GOOGLE_SECRET_KEY: <your_passkey>

production:
  GOOGLE_CLIENT_ID: <youcredentials>.apps.googleusercontent.com
  GOOGLE_SECRET_KEY: <your_passkey>

* Database creation
  rake db:migrate, rake db:test:prepare,

* Database initialization
  rake db:seed - for testing purposes.

* How to run the test suite
   rspec
* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
