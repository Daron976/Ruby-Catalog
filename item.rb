class Item
  attr_accessor :genre, :author, :source, :label, :publish_date

  attr_reader :id, :archived

  def initialize(date)
    @id = Random.rand(1...1000)
    @publish_date = date
    @archived = false
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
