# frozen_string_literal: true

module Loan
  class FindLoanUseCase
    include ActiveModel::Validations

    validates :id, presence: true

    def initialize(params: {
      id: nil
    })
      @id = params[:id]
    end

    def call
      validate!

      Response.new(success: true, data: find_loan!)
    rescue StandardError => e
      Errors::LoggedError.log(self.class, e)
      Response.new(success: false, error: e)
    end

    private

    attr_reader :id

    def parse_result(book)
      Loan::LoanPresenter.new(books: book).attributes
    end

    def find_loan!
      Loan::LoanRepository.find!(
        id: id
      )
    end
  end
end
