# Gemfile
#
# Gem dependencies for Rails Application
# Always use bundle exec when running commands

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.3'

# Core Rails gems
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.2.3'

# Build JSON APIs with objects
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[windows jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
gem 'rack-cors'

# Environment variables
gem 'dotenv-rails', groups: %i[development test]

# API documentation
gem 'rswag-api'
gem 'rswag-ui'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri windows]

  # Testing framework and related gems
  gem 'factory_bot_rails'  # For creating test data
  gem 'faker'              # Generate fake data for testing
  gem 'pry-byebug'         # Better debugging
  gem 'rspec-rails'        # Better testing framework than minitest

  # Code quality and linting
  gem 'rubocop-factory_bot' # FactoryBot-specific Rubocop rules
  gem 'rubocop-rails' # Ruby linting and code formatting
  gem 'rubocop-rspec' # RSpec-specific Rubocop rules
  gem 'rubocop-rspec_rails' # RSpec Rails-specific Rubocop rules

  # API documentation generation
  gem 'rswag-specs' # Generate Swagger docs from RSpec tests
end

group :development do
  # Development helpers
  gem 'annotate'           # Adds schema info as comments to models
  gem 'bullet'             # Helps identify N+1 queries
end

group :test do
  gem 'database_cleaner-active_record' # Clean database between tests
  gem 'shoulda-matchers' # Additional RSpec matchers
end
