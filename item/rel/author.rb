class Author
  attr_accessor :id, :first_name, :last_name

  attr_reader :author, :items

  def initialize(first_name, last_name)
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.add_author = self
  end
end
