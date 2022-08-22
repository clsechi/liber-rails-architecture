# frozen_string_literal: true

module Errors
  module Handlers
    module Http
      module Raised
        def self.included(clazz)
          clazz.class_eval do
            rescue_from(StandardError) do |e|
              Errors::LoggedError.log(self.class, e)
              respond(:internal_server_error, 500, e.to_s)
            end
            rescue_from(ActiveRecord::RecordNotFound) do |e|
              respond(:record_not_found, 404, e.to_s)
            end
            rescue_from(Errors::Http::AuthorizationError) do |e|
              respond(:forbidden, 403, e.to_s)
            end
            rescue_from(Errors::Http::AuthenticationError) do |e|
              respond(:unauthorized, 401, e.to_s)
            end
            rescue_from(Errors::UseCases::ValidationError) do |e|
              respond(:bad_request, 400, e.to_s)
            end
          end
        end

        private

        def respond(_error, status, message)
          render({ error: { message: message }, status: status })
        end
      end
    end
  end
end
