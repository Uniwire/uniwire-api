source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'aasm'
gem 'carrierwave'
gem 'cloudinary'
gem 'dotenv-rails'
gem 'graphiti'
gem 'graphiti-rails'
gem 'kaminari'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rack-cors'
gem 'responders'
gem 'sentry-raven'
gem 'vandal_ui'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'graphiti_spec_helpers'
  gem 'rspec-rails', '~> 4.0.0'
end

group :test do
  gem 'database_cleaner'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
