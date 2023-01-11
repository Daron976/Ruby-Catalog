# require_relative './game/json_data/game_module'
require_relative './game/game_module'
require_relative './module/music_module'
require_relative './game/create'
require_relative 'book'
require_relative 'save_data'

class App
  include GameModule
  include MusicModule

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
    when 1
      list_books
    when 2
      music_list
    when 3
      list_games
    when 4
      show_genres
    when 5
      list_labels
    when 6
      list_authors
    when 7
      create_book
    when 8
      add_a_music
    when 9
      add_game
    when 10
      json_write
      puts "Goodbye\n"
      exit
    else
      puts "Wrong input!\n"
      select_input
    end
  end

  def create_book
    print 'Publisher : '
    book_publisher = gets.chomp
    print 'Cover State : '
    book_cover_state = gets.chomp
    print 'Publish Date(DD-MM-YYYY) : '
    book_publish_date = gets.chomp
    mybook = Book.new book_publisher, book_cover_state, book_publish_date

    create(mybook)

    @books << mybook

    add_rel(mybook)

    puts "Book saved.\n"

    select_input
    # save_book(book_publisher, book_cover_state, book_label_title, book_label_color, book_publish_date)
  end

  def list_books
    puts ''
    puts 'No book records.' if @books.empty?
    @books.each do |book|
      puts "[ Label: #{book.label.title} | Publisher: #{book.publisher} | Cover State: #{book.cover_state} ]"
      # puts "ID: #{book.id}"
      # puts "Publisher: #{book.publisher}"
      # puts "Cover State: #{book.cover_state}"
      # puts "Label: '#{book.label.title}', '#{book.label.color}'"
      # puts "Publish Date: #{book.publish_date}"
    end
    select_input
  end

  def list_labels
    puts ''
    puts 'No label records.' if @labels.empty?
    @labels.each { |label| puts "[ Title: #{label.title} | Color: #{label.color} ]" }
    select_input
  end
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength

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
