# frozen_string_literal: true

module EventsService
  def author_created(author:)
    mapped = EventsMapper.author(author)
    dispacher(mapped)
  end
end
