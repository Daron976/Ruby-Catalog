def display_options
  options = { 1 => 'List all books', 2 => 'List all music albums', 3 => 'List of games',
              4 => 'List all genres', 5 => 'List all labels', 6 => 'List all authors',
              7 => 'List all sources', 8 => 'Add a book', 9 => 'Add a music album',
              10 => 'Add a game', 11 => 'Exit' }
  options.each { |key, value| puts "#{key} - #{value}\n" }
  user_select
end

def user_select
  choice = gets.chomp.to_i
  puts choice
end

def main
  display_options
end

main
