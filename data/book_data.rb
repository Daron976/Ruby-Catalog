require_relative '../book'
require_relative '../label'
require 'json'

def load_labels_books(mybook, mylabel)
  if !File.exist?('./data/books.json') || File.size('./data/books.json').zero?
    mybook << []
    mylabel << []
    return
  end

  books = JSON.parse(File.read('./data/books.json'))
  books.each do |book|
    label = Label.new(book['book_label_title'], book['book_label_color'])
    book = Book.new(book['book_publisher'], book['book_cover_state'], book['book_publish_date'])
    mybook << book
    mylabel << label
    label.add_item(book)
  end
end

def save_book(book_publisher, book_cover_state, book_label_title, book_label_color, book_publish_date)
  obj = {
    book_publisher: book_publisher,
    book_cover_state: book_cover_state,
    book_label_title: book_label_title,
    book_label_color: book_label_color,
    book_publish_date: book_publish_date
  }

  book = if !File.exist?('./data/books.json') || File.size('./data/books.json').zero?
           [obj]
         else
           JSON.parse(File.read('./data/books.json')) << obj
         end

  File.write('./data/books.json', JSON.pretty_generate(book))
end
