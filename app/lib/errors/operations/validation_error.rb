# frozen_string_literal: true

module Errors
  module Operations
    class ValidationError < StandardError
      def initialize(message = 'Validation error')
        super(message)
      end
    end
  end
end
