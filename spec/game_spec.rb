require_relative '../game/game'
require 'date'

describe Game do
  context 'with valid game data'

  it 'inserted data should be equal to attributes' do
    publish_date = Date.new(1990, 2, 3)
    new_game = Game.new('COD', '2021/01/12', publish_date, multiplayer: true)

    year = new_game.publish_date.year

    expect(year).to eq 1990
  end

  it 'can_be_archived should return true' do
    publish_date = Date.new(1990, 2, 3)
    new_game = Game.new('COD', '2020/01/12', publish_date, multiplayer: true)

    bool = new_game.can_be_archived?

    expect(bool).to be true
  end
end
