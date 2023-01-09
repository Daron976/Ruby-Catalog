require_relative './module/add_books'
require './module/game_module'
require_relative './module/author_module'
require_relative './module/music_module'

class App
  include GameModule
  include DataStorage
  include BookModule
  include MusicModule
  include ReadMusic
  include WriteMusic
  include ReadGenre
  include WriteGenre

  def initialize
    @books = []
    @labels = []
    @source = []
    @music_album = read_list
    @games = []
    @genre = read_genre
    @authors = []
  end

  def run
    display_options
  end

  def list_all_books
    list_books
  end

  def list_all_music_albums
    music_list
  end

  def list_of_games
    list_game
  end

  def list_all_genres
    show_genres
  end

  def list_all_labels
    list_label
  end

  def list_all_authors
    list_authors
  end

  def list_all_sources
    puts 'list_all_sources'
  end

  def add_a_book
    add_books
  end

  def add_a_music_album
    add_a_music
  end

  def add_a_game
    add_game
  end
end
