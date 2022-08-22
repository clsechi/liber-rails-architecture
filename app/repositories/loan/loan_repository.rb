# frozen_string_literal: true

module Loan
  module LoanRepository
    # include RepositoryErrorHandler Here we can use a custom error handler to correct map ActiveRecord errors

    def create!(status:, due_date:, book_id:, user_id:)
      Loan.create!(status: status, due_date: due_date, book_id: book_id, user_id: user_id)
    end

    def update!(id:, status:, due_date:)
      Loan.find(id).update!(status: status, due_date: due_date)
    end

    def find!(id:)
      Loan.find(id)
    end

    def find_all(filters: {}, pagination: {})
      Loan.where(filters).page(pagination[:page]).per(pagination[:per])
    end

    def exists?(book_id:)
      Loan.active.exists?(book_id: book_id)
    end
  end
end
