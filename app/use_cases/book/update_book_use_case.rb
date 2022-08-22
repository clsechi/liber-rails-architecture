# frozen_string_literal: true

module Book
  class UpdateBookUseCase
    include ActiveModel::Validations

    validates :id, :title, :quantity, presence: true

    def initialize(params: {
      id: nil,
      title: nil,
      quantity: nil
    })
      @id = params[:id]
      @title = params[:title]
      @quantity = params[:quantity]
    end

    def call!
      validate!

      updated_book = update_book!
      emit_event(updated_book)
      updated_book
    end

    private

    attr_reader :id, :title, :quantity

    def emit_event(book)
      EventsService.book_updated(book: book)
    end

    def update_book!
      Book::BookRepository.update!(
        id: id,
        title: title,
        quantity: quantity
      )
    end
  end
end
