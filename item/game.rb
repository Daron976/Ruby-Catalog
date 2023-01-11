require_relative './item'
require 'date'

class Game < Item
  attr_accessor :last_played_at, :multiplayer

  attr_reader :game_items

  def initialize(last_played_at, date, multiplayer: false)
    super(date)
    @last_played_at = Date.parse(last_played_at)
    @multiplayer = multiplayer
    @game_items = []
  end

  def can_be_archived?
    item_age = Time.now.year - @publish_date.year
    since_played = Time.now.year - @last_played_at.year
    return true if item_age > 10 && since_played > 2

    false
  end
end
