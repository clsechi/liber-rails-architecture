# frozen_string_literal: true

module Errors
  module Handlers
    module Rabbitmq
      module Raised
        def self.included(clazz)
          # Custom rabbitmq errors can be used to handle
          # if a msg should be reprocessed or not
          clazz.class_eval do
            rescue_from(StandardError) do |e|
              respond(Errors::Rabbitmq::UnknownServerError, e.to_s)
            end
            rescue_from(ActiveRecord::RecordNotFound) do |e|
              respond(Errors::Rabbitmq::RecordNotFoundError, e.to_s)
            end
            rescue_from(Errors::UseCases::ValidationError) do |e|
              respond(Errors::Rabbitmq::ValidationError, e.to_s)
            end
          end
        end

        private

        def respond(error, message)
          raise(error, message)
        end
      end
    end
  end
end
