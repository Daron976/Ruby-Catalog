class Item
  attr_accessor :genre, :author, :source, :label, :publish_date

  attr_reader :id, :archived

  def initialize(publish_date)
    @id = Random.rand(1...1000)
    @genre = genre
    @author = author
    @source = source
    @publish_date = publish_date
    @archived = false
  end

  def add_label(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    age = Time.now.year - @publish_date.year
    age > 10
  end
end
