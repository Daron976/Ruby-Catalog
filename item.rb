class Item
  attr_accessor :publish_date

  attr_reader :id, :archived, :genre, :author, :label

  def initialize(date)
    @id = Random.rand(1...1000)
    @publish_date = date
    @archived = false
  end

  def add_genre=(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def add_author=(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def add_label=(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  private

  def can_be_archived?
    age = Time.now.year - @publish_date.year
    age > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
