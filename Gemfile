source 'https://rubygems.org'

gem 'rails'
gem 'pg'
gem 'bootstrap-sass', '~> 3.3.5'
gem 'sass-rails'
gem "font-awesome-rails"
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'haml'
gem 'bcrypt', '~> 3.1.5', require: "bcrypt"
gem 'devise'
gem 'newrelic_rpm'

group :development do
  gem 'byebug'
  gem 'web-console'
  gem 'spring'
  gem 'quiet_assets'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'launchy'
  gem 'pry'
  gem 'pry-remote'
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'simplecov', require: false
  gem 'hirb'
end

group :test do
  gem 'shoulda-matchers', '3.0.0'
  gem 'poltergeist'
  gem 'database_cleaner'
end

group :production do
  gem 'rails_12factor'
end

ruby "2.2.1"
