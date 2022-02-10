module Author
  class AuthorRepository
    # include RepositoryErrorHandler Here we can use a custom error handler to correct map ActiveRecord errors

    def self.create!(args:)
      Author.create!(args)
    end
  end
end
