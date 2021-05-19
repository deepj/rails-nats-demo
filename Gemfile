# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

rails_version = '6.0.2.2'

# Custom Rails stack
gem 'railties',      rails_version
gem 'activerecord',  rails_version
gem 'actionpack',    rails_version

gem 'bootsnap', '1.4.6',  require: false

gem 'pg',                '1.2.3'
gem 'puma',              '4.3.8'
gem 'rails_event_store', '0.43.0'

# Messaging
gem 'nats-pure', '0.6.2'
gem 'dry-configurable', '0.11.3'

group :development do
  gem 'web-console',   '4.0.1'
  gem 'listen',        '3.2.1'
  gem 'letter_opener', '1.7.0'
end
