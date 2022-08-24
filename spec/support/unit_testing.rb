# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:each, :unit) do
    ActiveSupport::Notifications.subscribe('sql.active_record') do |_name, _start, _finish, _id, payload|
      if payload && payload[:name] != 'SCHEMA'
        query = payload[:sql]
        message = "Detected database call in unit test (#{query})\n" \
                  'Use VERBOSE_SQL_QUERIES=1 to help find the caller'
        raise(StandardError.new(message))
      end
    end
  end

  config.after(:each, :unit) do
    ActiveSupport::Notifications.unsubscribe('sql.active_record')
  end
end
