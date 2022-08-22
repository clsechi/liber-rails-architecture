# frozen_string_literal: true

module Book
  module BookRepository
    # include RepositoryErrorHandler Here we can use a custom error handler to correct map ActiveRecord errors

    def create!(title:, author:, year:, quantity:)
      Book.create!(title: title, author: author, year: year, quantity: quantity)
    end

    def update!(id:, title:, quantity:)
      Book.find(id).update!(title: title, quantity: quantity)
    end

    def find!(id:)
      Book.find(id)
    end

    def find_all(filters: {}, pagination: {})
      Book.where(filters).page(pagination[:page]).per(pagination[:per])
    end
  end
end
