require_relative './app'

def display_options
  options = { 1 => 'List all books', 2 => 'List all music albums', 3 => 'List of games',
              4 => 'List all genres', 5 => 'List all labels', 6 => 'List all authors',
              7 => 'Add a book', 8 => 'Add a music album',
              9 => 'Add a game', 10 => 'Exit' }
  options.each { |key, value| puts "#{key} - #{value}\n" }
  choice = gets.chomp.to_i
  if choice >= 1 && choice <= 10
    choose_option(choice)
  else
    puts 'Select a valid option'
  end
end

def choose_option(choice)
  list_all_books if choice == 1
  list_all_music_albums if choice == 2
  list_of_games if choice == 3
  choose_option_one(choice)
end

def choose_option_one(choice)
  list_all_genres if choice == 4
  list_all_labels if choice == 5
  list_all_authors if choice == 6
  choose_option_two(choice)
end

def choose_option_two(choice)
  add_a_book if choice == 7
  add_a_music_album if choice == 8
  add_a_game if choice == 9
  exit if choice == 10
end

def main
  app = App.new
  app.run
end

main
