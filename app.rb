require_relative './game/json_data/game_module'

class App
  include Game_and_author

  attr_reader :games, :authors

  def initialize
    @games = []
    @authors = []
  end

  def options
    puts "
    1 - List all book
    2 - List all music albums
    3 - List of games
    4 - List all genres
    5 - List all labels
    6 - List all authors
    7 - List all sources
    8 - Add a book
    9 - Add a music album
    10 - Add a game\n
    11 - Exit
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
      puts 'List of books:'
    when 2
      puts 'List of albums:'
    when 3
      list_games
    when 4
      puts 'List of genres:'
    when 5
      puts 'List of labels:'
    when 6
      list_authors
    when 7
      puts 'List of sources:'
    when 8
      puts 'Add a book'
    when 9
      puts 'Add a music album'
    when 10
      add_game
    when 11
      Exit
    else
      'Wrong input!'
    end
  end

  def create_book
    print 'Publisher:'
    book_publisher = gets.chomp
    print 'Cover State:'
    book_cover_state = gets.chomp
    print 'Label Title:'
    book_label_title = gets.chomp
    print 'Label Color:'
    book_label_color = gets.chomp
    print 'Publish Date(DD-MM-YYYY):'
    book_publish_date = gets.chomp
    mylabel = Label.new book_label_title, book_label_color
    mybook = Book.new book_publisher, book_cover_state, book_publish_date

    @all_books << mybook
    @all_labels << Label

    mylabel.add_item(mybook)
    save_book(book_publisher, book_cover_state, book_label_title, book_label_color, book_publish_date)
    puts 'Book saved.'
  end

  def list_books
    puts 'No book records.' if @all_books.empty?
    @all_books.each do |book|
      puts "ID: #{book.id}"
      puts "Publisher: #{book.publisher}"
      puts "Cover State: #{book.cover_state}"
      puts "Label: \'#{book.label.title}\', \'#{book.label.color}\'"
      puts "Publish Date: #{book.publish_date}"
    end
  end

  def list_labels
    puts 'No label records.' if @all_labels.empty?
    @all_labels.each { |label| puts "Id: \'#{label.id}\', Title: \'#{label.title}\', Color: \'#{label.color}\'" }
  end
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength
end
