# Genre class
class Genre
  attr_accessor :id, :name, :items

  def initialize(name, items = [])
    @id = Random.rand(1..1000)
    @name = name
    @items = items
  end

  def add_item
    @items << item
    item.genre = self
  end
end
