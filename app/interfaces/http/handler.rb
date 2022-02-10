module Http
  class Handler < ActionController::API
    include Http::ErrorHandler

    # authorize ??

    def create
      author = Author::CreateAuthorOperation.new(args: create_permitted_params)
      # We can use the presenter in the operation or in the inteface layers
      Author::AuthorPresenter.new(author).attributes
    end

    private

    def create_permitted_params
      params.permit(:author)
    end
  end
end
