source 'https://rubygems.org'

# Specify exact version of Rails, update it manually by running full test suite and performing manual QA
gem 'rails', '5.0.1'

# Use sqlite3 as the database for Active Record
# For production projects you should use PosrgreSQL, MySQL or other RDMS instead in all environments
gem 'sqlite3'

# Use Puma as the app server
gem 'puma'

# Active Model Serializers (for JSON API)
gem 'active_model_serializers'

# HTML/XML parser
gem 'nokogiri', '1.7.0.1'

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
