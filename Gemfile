# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'graphql'
gem 'graphql-client'

gem 'fast_jsonapi'
gem 'oj'

gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.0'

gem 'rails', '~> 5.1.5'

group :development, :test do
  gem 'factory_bot_rails', require: false
  gem 'faker', require: false
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec' # https://github.com/Shopify/statsd-instrument/issues/83
  gem 'rspec-collection_matchers', require: false
  gem 'rspec-rails'

  gem 'rubocop', '~> 0.52', require: false
  gem 'rubocop-rspec', '~> 1.5', require: false
end

group :development do
  gem 'coffee-rails'
  gem 'graphiql-rails'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'sass-rails'
  gem 'uglifier'
end

group :test do
  gem 'database_cleaner'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
