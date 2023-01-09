require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    age = Time.now.year - Date.parse(@publish_date).year
    age > 10 || @cover_state == 'bad'
  end

  private :can_be_archived?
end
