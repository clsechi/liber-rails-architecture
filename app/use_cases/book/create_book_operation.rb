# frozen_string_literal: true

module Book
  class CreateBookOperation
    include ActiveModel::Validations

    validates :title,
              :year,
              :quantity, presence: true

    def initialize(params: {
      title: nil,
      author: nil,
      year: nil,
      quantity: nil,
    })
      @title = params[:title]
      @author = params[:author]
      @year = params[:year]
      @quantity = params[:quantity]
    end

    def call
      validate!

      updated_year = find_year if year.nil?
      book = create_book!(updated_year)
      emit_event(book)
      # We can use the presenter in the operation or in the inteface layers
      # This is a hand question, because some of our presenters return formatted data
      # and this can't be done to rabbit interface
      parse_result(book)
    end

    private

    attr_reader :title, :author, :year, :quantity

    def parse_result(book)
      Book::BookPresenter.new(book).attributes
    end

    def emit_event(book)
      EventsService.book_created(book: book)
    end

    def create_book!(updated_year)
      Book::BookRepository.create!(
        title: title,
        author: author,
        year: year || updated_year,
        quantity: quantity,
      )
    end

    def find_year
      GoogleBooksRequester.book_year
    rescue Faraday::Error
      nil
    end
  end
end
