source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
gem 'rb-readline'
# Use sqlite3 as the database for Active Record
gem 'wdm', '>= 0.1.0' if Gem.win_platform?

# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0', '>= 5.0.6'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2', '>= 4.2.1'

# User management
gem 'devise', '>= 4.2.1'
gem 'cancancan'
gem 'rails_admin', '~> 1.3.0'
gem 'google-analytics-rails', '1.1.0'

gem 'mailgun_rails', '>= 0.9.0'

# Paperclip & AWS Developper
gem 'paperclip', '>= 5.2.1'
gem 'paperclip-i18n'

#Database visualisation
gem 'annotate', '>= 2.7.1'

#FrontEnd
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem "jquery-rails", ">= 4.3.1"
gem 'jquery-ui-rails', '>= 5.0.5'
gem 'momentjs-rails', '>= 2.17.1'
gem "pikaday-gem", ">= 1.4.0"
gem "font-awesome-rails", ">= 4.7.0.1"
gem 'bootstrap-sass', '~> 3.3.6'


# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # Unit tests
  gem 'rspec-rails', '>= 3.5.2'
  # Local DB
  gem 'sqlite3'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.5.0'
  gem 'listen', '~> 3.0.5'
  gem "rails-erd"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg', '~> 0.20'
  gem 'rails_12factor'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
