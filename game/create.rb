def create(item)
  print 'Author / Artist / Creator first name : '
  first_name = gets.chomp
  print 'Author / Artist / Creator last name : '
  last_name = gets.chomp
  new_author = Author.new(first_name, last_name)
  new_author.add_item(item)

  print 'Label / Title : '
  label_title = gets.chomp
  print 'Color : '
  color = gets.chomp
  new_label = Label.new(label_title, color)
  new_label.add_item(item)

  print 'Genre : '
  game_genre = gets.chomp
  new_genre = Genre.new(game_genre)
  new_genre.add_item(item)
end

def create_on_retrieval(json_data, item)
  new_author = Author.new(json_data['fname'], json_data['lname'])
  new_author.id = json_data['author_id']
  new_author.add_item(item)
  new_label = Label.new(json_data['title'], json_data['color'])
  new_label.id = json_data['label_id']
  new_label.add_items(item)
  new_genre = Genre.new(json_data['genre'])
  new_genre.id = json_data['genre_id']
  new_genre.add_game(item)
end
