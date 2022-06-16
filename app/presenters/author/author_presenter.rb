# frozen_string_literal: true

module Author
  class AuthorPresenter
    def initialize(author:)
      @author = author
    end

    def attributes
      author.to_h
    end

    private

    attr_reader :author
  end
end
