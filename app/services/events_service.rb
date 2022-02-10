class EventsService
  def self.author_created(author:)
    mapped = EventsMapper.author(author)
    dispacher(mapped)
  end
end
