require_relative '../item/rel/author'
require_relative '../item/rel/label'
require_relative '../item/rel/genre'
require_relative '../item/book'
require_relative '../item/game'
require_relative '../item/item'

def create(item)
  print 'Title : '
  label_title = gets.chomp
  print 'Color : '
  color = gets.chomp
  new_label = Label.new(label_title, color)
  new_label.add_item(item)

  if item.instance_of?(Book)
    print 'Author\'s first name : '
    first_name = gets.chomp
    print 'Author\'s last name : '
    last_name = gets.chomp
    new_author = Author.new(first_name, last_name)
    new_author.add_item(item)
  elsif item.instance_of?(Album)
    print 'Genre : '
    game_genre = gets.chomp
    new_genre = Genre.new(game_genre)
    new_genre.add_item(item)
  end
  puts ''
end

def create_on_retrieval(json_data, item)
  new_label = Label.new(json_data['title'], json_data['color'])
  new_label.id = json_data['label_id']
  new_label.add_item(item)
  if item.instance_of?(Book)
    new_author = Author.new(json_data['fname'], json_data['lname'])
    new_author.id = json_data['author_id']
    new_author.add_item(item)
  elsif item.instance_of?(Album)
    new_genre = Genre.new(json_data['genre'])
    new_genre.id = json_data['genre_id']
    new_genre.add_item(item)
  end
end
