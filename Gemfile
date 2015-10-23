source 'https://rubygems.org'

ruby File.read(".ruby-version").strip

gem 'rails', '4.2.4'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'turbolinks'
gem 'normalize-rails'
gem 'slim-rails'
gem 'pg'
gem 'devise'
gem 'devise_token_auth' # Token based authentication for Rails JSON APIs
gem 'omniauth' # required for devise_token_auth
gem 'rails-i18n'
gem "therubyracer"
gem 'modernizr-rails'
gem 'will_paginate'
gem 'will_paginate-bootstrap'
gem 'bootstrap-datepicker-rails'
gem 'formtastic', github: 'justinfrench/formtastic'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'polyamorous', github: 'activerecord-hackery/polyamorous'
gem "font-awesome-rails"
gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem "twitter-bootstrap-rails"
gem "chartkick"
gem 'faker'
gem 'unicorn'
gem 'city-state'

group 'development' do
  gem 'hirb'
end

group :test do
  gem 'capybara'
  gem 'shoulda-matchers', require: false
  gem 'rspec-activemodel-mocks'
  gem 'rspec-collection_matchers'
end

group :production do
  gem 'rails_12factor'
  gem 'fog'
end