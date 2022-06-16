# frozen_string_literal: true

module UuidRequester
  # We can use a custom error handler or Response entity
  def create_uuid
    RestClient.get('https://httpbin.org/uuid')
  end
end
