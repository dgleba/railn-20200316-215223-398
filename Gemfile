####################
# BEGIN:initial gems
####################

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '5.2.4.1'

# BEGIN: SQLite
# NOTE: This section is automatically deleted by the pg_setup.rb script
group :development, :test do
  gem 'sqlite3', '1.4.2'
end
# END: SQLite

# Use Puma as the app server
gem 'puma', '3.12.4'
# Use SCSS for stylesheets
gem 'sass-rails', '5.1.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '4.2.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '4.2.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '5.2.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.10.0'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '1.4.6', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '11.1.1', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '3.7.0'
  gem 'listen', '3.1.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '2.1.0'
  gem 'spring-watcher-listen', '2.0.1'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '3.31.0'
  gem 'selenium-webdriver', '3.142.7'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'webdrivers', '4.2.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# NOTE: tzinfo-data is not installed under the Ruby on Racetracks system
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

###################
# END: initial gems
###################

# BEGIN: gems for test_code.sh
group :development, :testing do
  gem 'brakeman', '4.8.0'
  gem 'bundler-audit', '0.3.0'
  gem 'gemsurance', '0.10.0'
  gem 'rails_best_practices', '1.20.0'
  gem 'rubocop', '0.80.1' # Checks for violations of the Ruby Style Guide, not recommended for legacy apps
  gem 'sandi_meter', '1.2.0'
end
# END: gems for test_code.sh

# BEGIN: pg section
# NOTE: This section is automatically updated by the pg_setup.rb script
group :production do
  gem 'pg', '1.2.2'
end
# END: pg section

# Minitest
gem 'minitest', '5.14.0', require: false, group: :testing
gem 'minitest-reporters', '1.4.2', require: false, group: :testing # Adds special features to tests

# BEGIN: Capybara enhancements
group :test do
  gem 'capybara-email', '3.0.1'
  gem 'capybara-slow_finder_errors', '0.1.5'
end
# END: Capybara enhancements

# BEGIN: test coverage
gem 'simplecov', '0.18.5', require: false, group: :test
# END: test coverage

# BEGIN: gems used for setting up PostgreSQL in the development environment
# You do not need these gems if you use SQLite in the development environment.
# NOTE: Attempts to use "gem install" in the PostgreSQL setup scripts did not pan out.
gem 'line_containing', '0.1.2'
gem 'remove_double_blank', '0.0.0'
gem 'string_in_file', '1.0.2'
# END: gems used for setting up PostgreSQL in the development environment

# BEGIN: for outline.sh
group :development do
  gem 'annotate', '3.1.0' # Adds comments listing parameters and the output of "rails routes"
  # gem 'railroady' # Generates block diagrams
  # gem 'rails-erd' # Generates block diagrams
end
# END: for outline.sh

# BEGIN: Better Errors
# Provides more and better information in error pages
group :development do
  gem 'better_errors', '2.6.0'
  gem 'binding_of_caller', '0.8.0'
end
# END: Better Errors

gem 'pry-rails', '0.3.9' # Improves the screen output in the Rails console

gem 'email_munger', '0.0.0' # Encodes email address to prevent harvesting by bots
