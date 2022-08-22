# frozen_string_literal: true

class LoansController < ApplicationController
  include Errors::Handlers::Http::Response

  def index
    response = Loan::ListLoanUseCase.new(index_params).call

    # This can be done using a decorator
    return handle_response_error(response) if response.error?

    result = Loan::LoanPresenter.new(loans: response.data).attributes

    render(json: result, status: :ok)
  end

  def show
    response = Loan::FindLoanUseCase.new(show_params).call

    return handle_response_error(response) if response.error?

    result = Loan::LoanPresenter.new(loans: response.data).attributes

    render(json: result, status: :ok)
  end

  def create
    response = Loan::CreateLoanUseCase.new(create_params).call

    return handle_response_error(response) if response.error?

    result = Loan::LoanPresenter.new(loans: response.data).attributes

    render(json: result, status: :created)
  end

  def update
    response = Loan::UpdateLoanUseCase.new(update_params).call

    return handle_response_error(response) if response.error?

    result = Loan::LoanPresenter.new(loans: response.data).attributes

    render(json: result, status: :ok)
  end

  private

  def index_params
    params.permit(:filters, :pagination)
  end

  def show_params
    params.permit(:id)
  end

  def create_params
    params.permit(:book_id, :user_id, :due_date)
  end

  def update_params
    params.permit(:id, :due_date, :status)
  end
end
