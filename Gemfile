# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'pg'
gem 'rerun'
gem 'rdiscount'
gem 'rake'
gem "rack", ">= 2.1.4"
gem 'sinatra-activerecord'
gem 'sinatra'
gem 'zeitwerk', '~> 2.2.2'
gem 'rest-client', '~> 2.0', '>= 2.0.2'
gem "addressable", ">= 2.8.0"
gem "activerecord", ">= 6.0.3.5"

group :test do
  gem 'database_cleaner'
  gem 'rack-test', '~> 0.8.3'
  gem 'rspec', '~>3.0'
  gem 'webmock', '~> 3.7'
end