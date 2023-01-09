require_relative './item'

# Book class
class Book < Item
  attr_reader :publisher, :cover_state, :id, :archived

  def initialize(id, publisher, cover_state, publish_date, archived)
    super(publish_date, id, archived: archived)
    @id = Random.rand(1..1000)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    true if super || cover_state == 'bad'
    false
  end
end
