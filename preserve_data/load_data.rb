require 'json'
require_relative 'create'

class JsonRetrieve
  def retrieve_games
    games = []
    game_data = File.open('./json_data/games.json')
    JSON.parse(game_data.read).each do |game|
      new_game = Game.new(game['name'], game['activity'], game['release'], multiplayer: game['mode'])
      create_on_retrieval(game, new_game)
      games << new_game
    end
    file.close
    games
  end

  def retrieve_authors(item_arr)
    authors = []
    item_arr&.each do |item|
      authors << item.author
    end
    authors
  end
end
