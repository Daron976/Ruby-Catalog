require_relative '../item'
require 'date'

# Music Album class
class MusicAlbum < Item
  attr_reader :id, :on_spotify

  def initialize(date, on_spotify)
    super(date)
    @id = Random.rand(1..1000)
    @on_spotify = on_spotify
    @publish_date = Date.parse(date)
  end

  def can_be_archived?
    true if super || on_spotify == true
  end
end
