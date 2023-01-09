# Label class
class Label
  attr_reader :id, :title, :color, :items

  def initialize(title, color, items = [])
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = items
  end

  def add_item
    @items << item
    item.label = self
  end
end
