source 'https://rubygems.org'
ruby '2.1.0'
gem 'rails', '4.0.2'

gem 'puma'                          # note to comment out unicorn when using puma
gem 'twitter', '5.0.0'

gem 'google-analytics-rails'

# OAUTH AUTHENTICATION GEMS
gem 'omniauth'
gem 'omniauth-twitter'

# gem 'twitter-bootstrap-rails'
gem 'haml'
gem 'haml-rails'										# haml templates for rails
gem 'sass-rails', '~> 4.0.0'				# Use SCSS for stylesheets
gem 'less-rails'
gem 'uglifier', '>= 1.3.0'					# Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.0.0'			# Use CoffeeScript for .js.coffee assets and views
gem 'therubyracer', :require => 'v8'
gem 'figaro'                        # global env vars for config

gem 'jquery-rails'									# Use jquery as the JavaScript library
gem 'turbolinks'										# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'rickshaw_rails'                # graphing with scatter plots

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'mailcatcher'
gem 'pg'
group :development, :test do
  gem 'rspec-rails'
  gem 'capybara', '2.2.0'
  gem 'shoulda-matchers'
  gem 'simplecov'
  gem 'shoulda-matchers'						# cleaner, simpler tests with great validation testing
  gem 'guard-rspec'
  gem 'spork-rails', '4.0.0'
  gem 'guard-spork', '1.5.0'
  gem 'childprocess', '0.3.6'
  gem 'pry-rails'
  gem 'pry-remote'
  gem 'pry-debugger'
end

group :development do
  gem 'better_errors'               # more helpful error screens for dev
  gem 'binding_of_caller'         # enable REPL and local/instance variable inspection
end

group :test do
  gem 'cucumber-rails', '~> 1.4.0', :require => false
  gem 'selenium-webdriver', '2.35.1'
  gem 'annotate'
  gem 'factory_girl_rails', '4.2.0'
  gem 'database_cleaner'          # removed github address because of PEM auth issues
  gem 'vcr'                       # record test suite http interactions for playback in future tests
  gem 'webmock'                   # lib for stubbing and setting expectation on HTTP requests
  gem 'launchy'
end

group :production do
  gem 'rails_12factor', '0.0.2'
end

group :doc do
  gem 'sdoc'											# bundle exec rake doc:rails generates the API under doc/api.
end

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0', :require => 'bcrypt'
# gem 'unicorn'											# Use unicorn as the app server

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'redcarpet'
gem 'fabrication'										# object generation library
