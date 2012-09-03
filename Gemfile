source 'https://rubygems.org'

gem 'rails', '3.2.8'

# Database
gem 'pg'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bootstrap-sass', '~> 2.0.4.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'haml-rails', '~> 0.3.4'
gem 'jquery-rails'

# Plugins
gem 'devise'
gem 'acts_as_commentable_with_threading', '~> 1.1.2'
gem 'acts_as_votable', '~> 0.3.1'
gem 'make_flaggable', git: 'git://github.com/cavneb/make_flaggable.git'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

group :deploy do
  gem 'faker'
end

group :development, :test do
  gem 'mocha', require: false
  gem 'redgreen'
  gem 'simplecov', :require => false, :group => :test
  gem 'sqlite3'
  gem 'test-unit', '1.2.3'
end
