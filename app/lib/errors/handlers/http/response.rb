# frozen_string_literal: true

module Errors
  module Handlers
    module Http
      module Response
        def handle_response_error(response)
          error = response.error
          case error.class
          when ActiveRecord::RecordNotFound
            respond(:record_not_found, 404, error.to_s)
          when Errors::Http::AuthorizationError
            respond(:forbidden, 403, error.to_s)
          when Errors::Http::AuthenticationError
            respond(:unauthorized, 401, error.to_s)
          when Errors::UseCases::ValidationError
            respond(:bad_request, 400, error.to_s)
          else
            respond(:internal_server_error, 500, error.to_s)
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
