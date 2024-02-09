source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.6'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.8'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# Admin
gem 'motor-admin', '~> 0.4.23'

# Pagination
gem 'pagy', '~> 6.4'

# Serializers
gem 'blueprinter', '~> 0.30.0'

# HTTP client
gem 'faraday', '~> 2.9'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
  gem 'dotenv-rails'

  # Annotation of models
  gem 'annotate', '~> 3.2'

  # Testing
  gem 'factory_bot_rails', '~> 6.4'
  gem 'faker', '~> 3.2'
  gem 'rspec-rails', '~> 6.0'
  gem 'shoulda-matchers', '~> 6.0'
  gem 'simplecov', '~> 0.22.0'

  # Linting
  gem 'rubocop', '~> 1.59'
  gem 'rubocop-rails', '~> 2.23'
end
