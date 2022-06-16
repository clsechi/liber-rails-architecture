# frozen_string_literal: true

module Author
  module AuthorRepository
    # include RepositoryErrorHandler Here we can use a custom error handler to correct map ActiveRecord errors

    def create!(args:)
      Author.create!(args)
    end
  end
end
