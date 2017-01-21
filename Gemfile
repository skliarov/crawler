source 'https://rubygems.org'

# Specify exact version of Rails
gem 'rails', '5.0.1'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Use Puma as the app server
gem 'puma'

group :development, :test do
  # Use Rspec to test Rails app
  gem 'rspec-rails'
end

group :test do
  # Fixture replacement
  gem 'factory_girl_rails'
  # Fake data generator
  gem 'faker'
  # RSpec one-line tests
  gem 'shoulda-matchers'
  # Express expected outcomes for RSpec tests
  gem 'rspec-expectations'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
