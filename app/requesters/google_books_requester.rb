# frozen_string_literal: true

module GoogleBooksRequester
  # We can use a custom error handler or Response entity
  def book_year
    response = Faraday.get('https://httpbin.org/uuid')

    response.data
  end
end
