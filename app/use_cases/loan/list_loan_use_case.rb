# frozen_string_literal: true

module Loan
  class ListLoanUseCase
    def initialize(params: {
      filters: {},
      pagination: {}
    })
      @filters = params[:filters]
      @pagination = params[:pagination]
    end

    def call
      validate!

      Response.new(success: true, data: find_loans)
    rescue StandardError => e
      Errors::LoggedError.log(self.class, e)
      Response.new(success: false, error: e)
    end

    private

    attr_reader :filters, :pagination

    def find_loans
      Loan::LoanRepository.find_all(
        filters: filters,
        pagination: pagination
      )
    end
  end
end
