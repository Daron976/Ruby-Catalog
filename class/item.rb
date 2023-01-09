# Item class
class Item
  attr_reader :publish_date, :id, :archived

  def initialize(_id, publish_date, _archived)
    @id = random.rand(1..1000)
    @publish_date = Date.strptime(publish_date, '%Y-%m-%d')
    @archived = false
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.includes?(self)
  end

  def source=(source)
    @source = source
    source.items.push(self) unless source.items.includes?(self)
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.includes?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.includes?(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    current = Time.now.year - publish_date.year.to_i
    true if current > 10
  end
end
