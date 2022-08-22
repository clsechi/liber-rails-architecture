# frozen_string_literal: true

module Errors
  module Rabbitmq
    class RecordNotFoundError < StandardError
      def initialize(message = 'Record Not Found Error')
        super(message)
      end
    end
  end
end
