# frozen_string_literal: true

module Errors
  module Operations
    class AuthorizationError < StandardError
      def initialize(message = 'Authorization error')
        super(message)
      end
    end
  end
end
