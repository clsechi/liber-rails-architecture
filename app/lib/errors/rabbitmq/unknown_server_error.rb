# frozen_string_literal: true

module Errors
  module Rabbitmq
    class UnknownServerError < StandardError
      def initialize(message = 'Unknown Server Error')
        super(message)
      end
    end
  end
end
