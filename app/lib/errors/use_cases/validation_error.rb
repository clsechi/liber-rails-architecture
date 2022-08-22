# frozen_string_literal: true

module Errors
  module UseCases
    class ValidationError < StandardError
      def initialize(message = 'Validation error')
        super(message)
      end
    end
  end
end
