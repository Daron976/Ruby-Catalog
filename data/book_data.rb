require_relative '../book'
require_relative '../label'
require 'json'


def load_label_and_books(mybook, mylabel)
  if File.exist?('./data/books.json')
    file = File.open('./data/books.json')
    if file.size.zero?
      mybook << []
      mylabel << []
    else
      books = JSON.parse(File.read('./data/books.json'))
      books.each do |book|
        label = Label.new(book['book_label_title'], book['book_label_color'])
        book = Book.new(book['book_publisher'], book['book_cover_state'], book['book_publish_date'])
        mybook << book
        mylabel << label
        label.add_item(book)
      end
    end
    file.close
  else
    mybook << []
    mylabel << []
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

  return unless File.exist?('./data/books.json')
  file = File.open('./data/books.json')
  if file.size.zero?
    book = [obj]
  else
    book = JSON.parse(File.read('./data/books.json'))
    book << obj
  end
  file.close
  myfile = File.open('./data/books.json', 'w')
  myfile.write(JSON.pretty_generate(book))
  myfile.close
end
