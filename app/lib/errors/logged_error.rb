# frozen_string_literal: true

module Errors
  module LoggedError
    def log(class_name, error, message)
      message_backtrace = error.try(:backtrace)

      Rails.logger.error("[#{class_name}]: #{message}")
      Rails.logger.error("[#{class_name}]: #{message_backtrace.join("\n")}") if message_backtrace.present?
    end
  end
end
