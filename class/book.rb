require_relative './item'
require 'date'

# Book class
class Book < Item
  attr_reader :publisher, :cover_state, :id, :archived

  def initialize(publisher, cover_state, publish_date)
    super()
    @id = Random.rand(1..1000)
    @publisher = publisher
    @cover_state = cover_state
    @publish_date = Date.parse(publish_date)
  end

  def can_be_archived?
    true if super || cover_state == 'bad'
    false
  end
end
