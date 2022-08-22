# frozen_string_literal: true

module Errors
  module Rabbitmq
    class ValidationError < StandardError
      def initialize(message = 'Validation Error')
        super(message)
      end
    end
  end
end
