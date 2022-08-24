# frozen_string_literal: true

require 'database_cleaner/active_record'

RSpec.configure do |config|
  DatabaseCleaner.allow_remote_database_url = true
  DatabaseCleaner.strategy = :transaction

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
