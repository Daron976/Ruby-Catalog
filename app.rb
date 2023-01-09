class App
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
    when 2
      puts 'List of albums:'
    when 3
      puts 'List of movies:'
    when 4
      puts 'List of genres:'
    when 5
      puts 'List of labels:'
    when 6
      puts 'List of authors:'
    when 7
      puts 'List of sources:'
    when 8
      puts 'Add a book'
    when 9
      puts 'Add a music album'
    when 10
      puts 'Add a movie'
    when 11
      puts Exit
    else
      'Wrong input!'
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength
end
