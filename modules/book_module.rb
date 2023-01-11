require_relative '../item/book'
require_relative 'create'

module BookModule
  def create_book
    puts ''
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
  end

  def list_books
    puts ''
    puts 'No book records.' if @books.empty?
    @books.each do |book|
      puts "[ Label: #{book.label.title} | Publisher: #{book.publisher} | Cover State: #{book.cover_state} ]"
    end
    select_input
  end

  def list_labels
    puts ''
    puts 'No label records.' if @labels.empty?
    @labels.each { |label| puts "[ Title: #{label.title} | Color: #{label.color} ]" }
    select_input
  end
end
