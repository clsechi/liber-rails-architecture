# frozen_string_literal: true

module EventsService
  def book_created(book:)
    mapped = EventsMapper.book(book)
    dispacher(mapped)
  end
end
