# frozen_string_literal: true

module Rabbitmq
  class ConsumerInterface
    include ActiveModel::Validations

    validates :msg, :exchange, :routing_consumer, presence: true

    def initialize(msg:, exchange:, routing_key:, timestamp:)
      @msg = msg
      @exchange = exchange
      @routing_key = routing_key
      @timestamp = timestamp
    end

    def call
      validate!

      method(exchange_consumer).call if self.class.private_method_defined?(exchange_consumer)

      raise(Error::Rabbitmq::ConsumerNotFoundError)
    end

    private

    attr_reader :msg, :exchange, :routing_key, :timestamp

    def books_consumer
      case routing_key
      when 'create'
        Rabbitmq::Consumers::BooksConsumerInterface.new(msg: msg).create!
      else
        raise()
      end
    end

    def exchange_name
      exchange.split('.').first
    end

    def exchange_consumer
      @exchange_consumer ||= "#{exchange_name}_consumer"
    end
  end
end
