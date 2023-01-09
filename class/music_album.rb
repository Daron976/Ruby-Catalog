require_relative './item'

# Music Album class
class MusicAlbum < Item
  attr_reader :id, :on_spotify

  def initialize(id, publish_date, archived, on_spotify)
    super(publish_date, id, archived: archived)
    @id = Random.rand(1..1000)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    true if super && on_spotify == true
  end
end
