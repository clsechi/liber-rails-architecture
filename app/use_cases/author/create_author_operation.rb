module Author
  class CreateAuthorOperation
    def initialize(args:)
      @args = args
    end

    validates :args, presence: true

    def call
      # validation with ActiveModel::Validations
      validate!
      author = Author::AuthorRepository.create!(args: args)
      EventsService.author_created(author: author)
      # We can use the presenter in the operation or in the inteface layers
      Author::AuthorPresenter.new(author).attributes
    end

    private

    attr_reader :args

    def do_something; end

    def do_other_thing; end

    def create_uuid
      UuidRequester.create_uuid
    end
  end
end
