# frozen_string_literal: true

module Loan
  class UpdateLoanUseCase
    include ActiveModel::Validations

    validates :id, :status, :due_date

    def initialize(params: {
      id: nil,
      status: nil,
      due_date: nil
    })
      @id = params[:id]
      @status = params[:status]
      @due_date = params[:due_date]
    end

    def call
      validate!

      Response.new(success: true, data: update_loan!)
    rescue StandardError => e
      Errors::LoggedError.log(self.class, e)
      Response.new(success: false, error: e)
    end

    private

    attr_reader :id, :status, :due_date

    def update_loan!
      Loan::LoanRepository.update!(
        id: id,
        status: status,
        due_date: due_date
      )
    end
  end
end
