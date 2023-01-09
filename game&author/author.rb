require_relative '../item'

class Author
  attr_accessor :first_name, :last_name

  attr_reader :id, :author

  def initialize(first_name, last_name)
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_items(item)
    item.author(self)
    @items.push(item)
  end
end
