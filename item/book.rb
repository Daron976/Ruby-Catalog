require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  attr_reader :type

  def initialize(publisher, cover_state, date)
    super(date)
    @publisher = publisher
    @cover_state = cover_state
    @type = 'Book'
  end

  def can_be_archived?
    age = Time.now.year - Date.parse(date).year
    age > 10 || @cover_state == 'bad'
  end

  private :can_be_archived?
end
