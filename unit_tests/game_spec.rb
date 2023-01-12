require '../item/game'

describe Game do
  context 'with valid game data'

  it 'inserted data should be equal to attributes' do
    new_game = Game.new('15-02-2012', '28-02-2010', multiplayer: true)

    year = new_game.last_played_at.year

    expect(year).to eq 2012
  end

  it 'can_be_archived should return true' do
    new_game = Game.new('15-02-2012', '03-02-1990', multiplayer: true)

    bool = new_game.can_be_archived?

    expect(bool).to be true
  end
end
