source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Create beautiful JavaScript charts with one line of Ruby
gem "chartkick"
# The Moment.js JavaScript library ready to play with the Rails Asset Pipeline
gem 'momentjs-rails'
# This gem packages the bootstrap-datetimepicker for the Rails 3.1+ asset pipeline.
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.47'
# jQuery.maskMoney plugin for rails asset pipeline
gem 'maskmoney-rails'
# Forms made easy for Rails! It's tied to a simple DSL, with no opinion on markup
gem 'simple_form'
# gem 'will_paginate', '~> 3.1.0'
gem 'will_paginate-bootstrap'
# The font-awesome font bundled as an asset for the rails asset pipeline
gem "font-awesome-rails"
# OmniAuth is a flexible authentication system utilizing Rack middleware
gem 'omniauth'
#Facebook OAuth2 Strategy for OmniAuth
gem 'omniauth-facebook'
# Oauth2 strategy for Google
gem "omniauth-google-oauth2"
# Flexible authentication solution for Rails with Warden.
gem 'devise'
# Twitter Bootstrap for Rails 5 - 4.x Asset Pipeline
gem "twitter-bootstrap-rails"
# jQuery UI dependency.
gem 'jquery-ui-rails'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
