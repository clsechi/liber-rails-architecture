# frozen_string_literal: true

module Errors
  module Operations
    class AuthenticationError < StandardError
      def initialize(message = 'Authentication error')
        super(message)
      end
    end
  end
end
