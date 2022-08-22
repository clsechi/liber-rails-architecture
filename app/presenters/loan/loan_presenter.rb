# frozen_string_literal: true

module Loan
  class LoanPresenter
    def initialize(loans:)
      @loans = loans
    end

    def attributes
      if loans.is_a(Array)
        loans.map do |loan|
          mapper(loan)
        end

      else
        mapper(loans)
      end
    end

    private

    def mapper(loan)
      loan.to_h
    end

    attr_reader :loans
  end
end
