# projects manage

## Setup

Ruby 3.1.2
Rails 7.0.8

Set your ```RAILS_PGSQL_USER``` and ```RAILS_PGSQL_PASSWORD``` environment variables if you haven't already.

```
bundle install

rake db:create
rake db:migrate
rake db:seed
```

Now you can run ```rspec spec/``` and all the tests should pass (unless the devs are lazy)!

## Authentication

  Devise: Set up Devise for user authentication.

  gem 'devise'

## Authentication with JWT (JSON Web Tokens)
  Security: Implement JWT for securing API endpoints.

  gem 'jwt'
  gem 'rack-cors'

## Authorization

  Pundit: Implement Pundit for role-based access control.
  gem 'pundit'  

## Multi-Tenancy

  Each tenant will have its own schema within a PostgreSQL database. But it hash been integrated without subdomain.

  gem 'ros-apartment', require: 'apartment'
  bundle install
  rails generate apartment:install


## Background Jobs

  Sidekiq: Integrate Sidekiq for background job processing.
  Notifications: Set up daily email notifications for task updates.

  gem 'sidekiq'


## real-time notifications
  To send notifications to the specific user to whom a task is assigned. 
  real-time notifications using ActionCable when a task is created for a user.
