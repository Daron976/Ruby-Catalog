require_relative 'app'

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
end

def entry_point
  puts ''
  puts "Welcome\n"
  options
  app = App.new
  app.select_input
end

entry_point
