class UuidRequester
  # We can use a custom error handler or Response entity
  def self.create_uuid
    RestClient.get('https://httpbin.org/uuid')
  end
end
