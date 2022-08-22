# frozen_string_literal: true

module Errors
  module Rabbitmq
    class NotImplementedError < StandardError
      def initialize(message = 'Not Implemented Error')
        super(message)
      end
    end
  end
end
