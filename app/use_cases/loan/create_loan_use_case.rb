# frozen_string_literal: true

module Loan
  class CreateLoanUseCase
    include ActiveModel::Validations

    validates :book_id, :user_id, :due_date, presence: true

    def initialize(params: {
      book_id: nil,
      user_id: nil,
      due_date: nil
    })
      @book_id = params[:book_id]
      @user_id = params[:user_id]
      @due_date = params[:due_date]
    end

    def call
      validate!

      return handle_unavailable if book_unavailable?

      loan = create_loan!

      Response.new(success: true, data: loan)
    rescue StandardError => e
      # TODO, handle repository errors, with meta programming?
      Errors::LoggedError.log(self.class, e)
      Response.new(success: false, error: e)
    end

    private

    attr_reader :book_id, :user_id, :due_date

    def book_unavailable?
      Loan::LoanRepository.exists?(book_id: book_id)
    end

    def handle_unavailable
      error = Errors::UseCases::ValidationError('Book unavailable')
      Response.new(success: false, error: error)
    end

    def create_loan!
      Loan::LoanRepository.create!(
        status: :created,
        due_date: due_date,
        book_id: book_id,
        user_id: user_id
      )
    end
  end
end
