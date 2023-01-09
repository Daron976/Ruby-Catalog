require_relative './item'
require 'date'

# Music Album class
class MusicAlbum < Item
  attr_reader :id, :on_spotify

  def initialize(publish_date, on_spotify)
    super()
    @id = Random.rand(1..1000)
    @on_spotify = on_spotify
    @publish_date = Date.parse(publish_date)
  end

  def can_be_archived?
    true if super || on_spotify == true
  end
end
