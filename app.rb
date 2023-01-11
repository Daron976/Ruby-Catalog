require_relative './modules/game_module'
require_relative './modules/music_module'
require_relative './modules/book_module'
require_relative './preserve_data/save_data'

class App
  include GameModule
  include MusicModule
  include BookModule

  attr_reader :games, :authors

  def initialize
    @games = []
    @authors = []
    @albums = []
    @books = []
    @labels = []
    @genres = []
    @container = { games: @games, albums: @albums, books: @books }
  end

  def options
    puts "
    1 - List all book
    2 - List all music albums
    3 - List of games
    4 - List all genres
    5 - List all labels
    6 - List all authors
    7 - Add a book
    8 - Add a music album
    9 - Add a game
    10 - Exit
    "
    puts 'Select an option'
    puts ''
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength
  def select_input
    options

    user_input = gets.chomp.to_i

    case user_input
    when 1 then list_books
    when 2 then music_list
    when 3 then list_games
    when 4 then show_genres
    when 5 then list_labels
    when 6 then list_authors
    when 7 then create_book
    when 8 then add_a_music
    when 9 then add_game
    when 10
      json_write
      puts ''
      puts "Goodbye\n"
      exit
    else
      puts "Wrong input!\n"
      select_input
    end
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/CyclomaticComplexity

  def add_rel(item)
    @authors << item.author
    @labels << item.label
    @genres << item.genre
  end

  def json_write
    @container.each do |key, value|
      preserve_data(key, value)
    end
  end
end
