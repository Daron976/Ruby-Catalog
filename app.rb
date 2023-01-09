class App

  def select_input(input)
    case input
    when '1'
      'List of books:'
    when '2'
      'List of albums:'
    when '3'
      'List of movies:'
    when '4'
      'List of genres:'
    when '5'
      'List of labels:'
    when '6'
      'List of authors:'
    when '7'
      'List of sources:'
    when '8'
      'Add a book'
    when '9'
      'Add a music album'
    when '10'
      'Add a movie'
    when '11'
      Exit
    else
      'Wrong input!'
    end
  end
end
