# frozen_string_literal: true

module Book
  module BookRepository
    # include RepositoryErrorHandler Here we can use a custom error handler to correct map ActiveRecord errors

    def create!(title:, author:, year:, quantity:)
      Book.create!(
        title: title,
        author: author,
        year: year,
        quantity: quantity,
      )
    end
  end
end
