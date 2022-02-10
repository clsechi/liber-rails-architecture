module Http
  module ErrorHandler
    def self.included(clazz)
      clazz.class_eval do
        rescue_from(StandardError) do |e|
          Errors::LoggedError.new(self.class, e)
          respond(:standard_error, 500, e.to_s)
        end
        rescue_from(ActiveRecord::RecordNotFound) do |e|
          respond(:record_not_found, 404, e.to_s)
        end
        rescue_from(Errors::Operations::AuthorizationError) do |e|
          respond(:forbidden, 403, e.to_s)
        end
        rescue_from(Errors::Operations::AuthenticationError) do |e|
          respond(:unauthorized, 401, e.to_s)
        end
        rescue_from(Errors::Operations::ValidationError) do |e|
          respond(:bad_request, 400, e.to_s)
        end
      end
    end

    private

    def respond(_error, status, message)
      render(JsonResponse.error(message: message, status: status))
    end
  end
end
