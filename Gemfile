source 'https://rubygems.org'

gemspec

gem 'travis-support',     github: 'travis-ci/travis-support', ref: 'master-2014-10-06'
gem 'travis-sidekiqs',    github: 'travis-ci/travis-sidekiqs', require: nil
gem 'gh',                 github: 'travis-ci/gh'
gem 'addressable'
gem 'aws-sdk'
gem 'json', '~> 1.7.7'

gem 'dalli'
gem 'connection_pool'
gem 'keen', '~> 0.8.6'

platform :mri do
  gem 'bunny',            '~> 0.7.9'
  gem 'pg',               '~> 0.14.0'
end

platform :jruby do
  gem 'jruby-openssl',    '~> 0.8.5'
  gem 'hot_bunnies',      '~> 1.4.0.pre2'
  gem 'activerecord-jdbcpostgresql-adapter', '1.2.2.1' # see https://github.com/bmabey/database_cleaner/pull/83
  gem 'activerecord-jdbc-adapter',           '1.2.2.1'
end

group :development, :test do
  gem 'micro_migrations'
end

group :test do
  gem 'rspec',            '~> 2.8.0'
  gem 'factory_girl',     '~> 2.6.0'
  gem 'database_cleaner', '~> 0.8.0'
  gem 'mocha',            '~> 0.10.0'
  gem 'webmock',          '~> 1.8.0'
  gem 'guard'
  gem 'guard-rspec'
  gem 'rb-fsevent'
end
