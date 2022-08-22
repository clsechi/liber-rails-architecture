# frozen_string_literal: true

module Book
  class FindBookUseCase
    include ActiveModel::Validations

    validates :id, presence: true

    def initialize(params: {
      id: nil
    })
      @id = params[:id]
    end

    def call!
      validate!

      find_book!
    end

    private

    attr_reader :id

    def find_book!
      Book::BookRepository.find!(
        id: id
      )
    end
  end
end
