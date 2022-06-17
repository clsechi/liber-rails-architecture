class BooksController < ApplicationController
  before_action :authenticate, :authorize

  # Add generic error handler here or in ApplicationController

  def index
    result = Book::ListBookOperation.new(index_params).call

    render(json: result, status: 200)
  end

  def show
    result = Book::FindBookOperation.new(show_params).call

    render(json: result, status: 200)
  end

  def create
    result = Book::CreateBookOperation.new(create_params).call

    render(json: result, status: 201)
  end

  def update
    result = Book::UpdateBookOperation.new(update_params).call

    render(json: result, status: 200)
  end

  private

  def index_params
    params.permit(
      :filter
    )
  end

  def show_params
    params.permit(
      :id
    )
  end

  def create_params
    params.permit(
      :title,
      :author,
      :year,
      :quantity
    )
  end

  def create_params
    params.permit(
      :quantity
    )
  end

  def authenticate
    # do some authetication
  end

  def authorize
    # this can be done with Pundit
    # sounds better do that here, as other interfaces can be unauthenticated
  end
end
