source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.11'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

gem 'bootstrap-sass'
gem 'sprockets'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

gem 'faker'
gem 'will_paginate'
gem 'bootstrap-will_paginate'
gem 'pubnub'
gem 'sidekiq', '4.0.0'
gem 'redis-namespace'
gem 'mailcatcher'
gem 'sinatra'
# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # Use sqlite3 as the database for Active Record
	gem 'sqlite3'
  gem 'rspec-rails', '3.8.0'
  gem 'test-unit'
  gem 'pry-rails'
  gem 'pry-byebug'
end

group :text do
	gem 'selenium-webdriver', '2.35.1'
	gem 'capybara', '3.8.2'
  gem 'factory_girl_rails', '4.9.0'
end

group :doc do
	# bundle exec rake doc:rails generates the API under doc/api.
	gem 'sdoc', '~> 0.4.0'
end

group :production do
#	gem 'pg', '0.15.1'
	gem 'rails_12factor', '0.0.2'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

