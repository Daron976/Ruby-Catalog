class Item
  attr_accessor :genre, :author, :source, :label, :publish_date, :archived

  attr_reader :id

  def initialize(genre, author, source, label, date, archived: false)
    @id = Random.rand(1...1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = date
    @archived = archived
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