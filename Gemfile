source 'https://rubygems.org'
ruby '2.2.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.9'
# Keep pg gem to this version until rails can be upgraded
# https://github.com/rails/rails/issues/29521
gem 'pg', '0.20.0'
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
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'bcrypt'
gem 'bootstrap-sass'
gem 'devise', '4.1.1'
gem 'faker'
gem 'figaro'
gem 'information_machine_api', github: 'information-machine/information-machine-api-ruby'
gem "jquery-datatables-rails", github: 'rweng/jquery-datatables-rails'
gem 'mandrill_dm'
gem 'materialize-sass'
gem "mocha", "~> 1.1"
gem 'momentjs-rails'
gem 'pg_search'
gem 'puma'
gem 'react-rails'
gem 'unirest'
gem "will_paginate", "~> 3.0"
gem "will_paginate-bootstrap", "~> 1.0"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'pry'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  gem 'rails_12factor'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'bullet'
end

group :test do
  gem "codeclimate-test-reporter", require: false
  gem "rspec-rails"
  gem "factory_girl_rails"
end
