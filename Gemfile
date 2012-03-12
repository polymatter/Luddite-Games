source 'http://rubygems.org'

gem 'rails', '3.1.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# Use postgres database
gem 'pg', '0.11' #latest version (0.13) fails

# Deploy on heroku
gem 'heroku'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# Test environment
gem "rspec-rails", :group => [:test, :development]
group :test do
  gem "factory_girl_rails" # generate test data
  gem "capybara"           # simulate user
  gem "guard-rspec"        # automatically run tests
  gem 'win32console'       # for colours in windows terminal
  gem 'rb-notifu'          # for Windows system tray notifications4
  #gem 'rb-fchange'         # it was listed in railstutorial
  gem 'guard-spork'        # allow spork to speed up guard
  gem "spork"              # speed up tests (by only running rails once)
  gem 'win32-process'      # implements fork so spork can run
end

gem 'redcarpet' # support for Markdown


# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

