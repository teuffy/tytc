source 'http://rubygems.org'

ruby '1.9.3'

gem 'rails', '3.2.13'

group :development do
  gem 'pry'
end
# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'
group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
end
group :production do
  gem 'pg'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.2.0"
  gem 'coffee-rails', "~> 3.2.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'mocha', :require => false
end

gem 'devise'
gem 'heroku'
gem 'haml'
gem 'omniauth'
gem 'omniauth-github'
gem 'newrelic_rpm'
gem "airbrake"
gem 'unicorn'
gem "oink"
gem 'sentry-raven' #for sentry error logging