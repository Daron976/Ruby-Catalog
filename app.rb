require './label'
require './book'
require_relative './data/book_data'

class App
  def initialize
    @all_books = []
    @all_labels = []
  end

  def run
    load_preserve_data
    until options
      input = gets.chomp
      if input == '11'
        puts 'Good Bye!'
        break
      end
      select_input
    end
  end

  def options
    puts "
    1 - List all book
    2 - List all music albums
    3 - List all movies
    4 - List all genres
    5 - List all labels
    6 - List all authors
    7 - List all sources
    8 - Add a book
    9 - Add a music album
    10 - Add a movie\n
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
      list_books
    when 2
      puts 'List of albums:'
    when 3
      puts 'List of movies:'
    when 4
      puts 'List of genres:'
    when 5
      puts 'List of labels:'
      list_labels
    when 6
      puts 'List of authors:'
    when 7
      puts 'List of sources:'
    when 8
      puts 'Add a book'
      create_book
    when 9
      puts 'Add a music album'
    when 10
      puts 'Add a movie'
    when 11
      exit
    else
      'Wrong input!'
    end
    options
  end
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength

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
    @all_labels << mylabel

    mylabel.add_item(mybook)
    save_book(book_publisher, book_cover_state, book_label_title, book_label_color, book_publish_date)

    puts 'Book created.'
  end

  def list_books
    puts 'No book recordssss.' if @all_books.empty?

    @all_books.each do |book|
      puts "ID:#{book.id}"
      puts "Publisher:#{book.publisher}"
      puts "Cover State:#{book.cover_state}"
      puts "Label:'#{book.label.title}', '#{book.label.color}'"
      puts "Publish date:#{book.publish_date}"
      puts
    end
  end

  def load_preserve_data
    load_labels_books @all_books, @all_labels
  end

  def list_labels
    puts 'No label recordsss.' if @all_labels.empty?

    @all_labels.each { |label| puts "Id: '#{label.id}', Title: '#{label.title}', Color: '#{label.color}'" }
  end
end
