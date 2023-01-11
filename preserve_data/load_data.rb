require 'json'
require_relative './module/create'

class Load
  def load_game_data
    game_data = []
    return item_arr unless File.exist('./json_data/games.json')

    file = File.open('./json_data/games.json')
    parsed = JSON.parse(file.read)
    parsed.each do |game|
      new_game = Game.new(game['activity'], game['release'], game['multiplayer'])
      new_game.id = game['id']
      create_on_retrieval(game, new_game)
      games_data << new_game
    end
    file.close
    game_data
  end

  def load_book_data
    book_data = []
    return item_arr unless File.exist('./json_data/books.json')

    file = File.open('./json_data/books.json')
    parsed = JSON.parse(file.read)
    parsed.each do |book|
      new_book = Book.new(book['publisher'], book['cover_state'], book['release'])
      new_book.id = book['id']
      create_on_retrieval(book, new_book)
      books_data << new_book
    end
    file.close
    book_data
  end

  def load_album_data
    album_data = []
    return item_arr unless File.exist('./json_data/albums.json')

    file = File.open('./json_data/albums.json')
    parsed = JSON.parse(file.read)
    parsed.each do |album|
      new_album = MusicAlbum.new(album['release'], album['on_spotify'])
      new_album.id = album['id']
      create_on_retrieval(album, new_album)
      albums_data << new_album
    end
    file.close
    album_data
  end
end
