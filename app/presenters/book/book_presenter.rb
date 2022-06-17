# frozen_string_literal: true

module Book
  class BookPresenter
    def initialize(book:)
      @book = book
    end

    def attributes
      book.to_h
    end

    private

    attr_reader :book
  end
end
