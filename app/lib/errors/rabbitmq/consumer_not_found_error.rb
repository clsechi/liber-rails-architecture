# frozen_string_literal: true

module Errors
  module Rabbitmq
    class ConsumerNotFoundError < StandardError
      def initialize(message = 'Consumer Not Found Error')
        super(message)
      end
    end
  end
end
