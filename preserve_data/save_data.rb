require 'json'
require 'fileutils'

def preserve_game(file_name, data_arr)
  write_data = []
  FileUtils.touch("./json_data/#{file_name}.json") unless File.exist?("./json_data/#{file_name}.json")
  File.write("./json_data/#{file_name}.json", JSON.pretty_generate(write_data)) if data_arr.empty?
  data_arr.each do |obj|
    write_data << {
      id: obj.id, release: obj.publish_date, author_id: obj.author.id, fname: obj.author.first_name,
      lname: obj.author.last_name, label_id: obj.label.id, title: obj.label.title, color: obj.label.color,
      genre_id: obj.genre.id, genre: obj.genre.name, activity: obj.last_played_at, multiplayer: obj.multiplayer
    }
  end
  File.write("./json_data/#{file_name}.json", JSON.pretty_generate(write_data))
end

def preserve_album(file_name, data_arr)
  write_data = []
  FileUtils.touch("./json_data/#{file_name}.json") unless File.exist?("./json_data/#{file_name}.json")
  File.write("./json_data/#{file_name}.json", JSON.pretty_generate(write_data)) if data_arr.empty?
  data_arr.each do |obj|
    write_data << {
      id: obj.id, release: obj.publish_date, author_id: obj.author.id, fname: obj.author.first_name,
      lname: obj.author.last_name, label_id: obj.label.id, title: obj.label.title, color: obj.label.color,
      genre_id: obj.genre.id, genre: obj.genre.name, on_spotify: obj.on_spotify
    }
  end
  File.write("./json_data/#{file_name}.json", JSON.pretty_generate(write_data))
end

def preserve_book(file_name, data_arr)
  write_data = []
  FileUtils.touch("./json_data/#{file_name}.json") unless File.exist?("./json_data/#{file_name}.json")
  File.write("./json_data/#{file_name}.json", JSON.pretty_generate(write_data)) if data_arr.empty?
  data_arr.each do |obj|
    write_data << {
      id: obj.id, release: obj.publish_date, author_id: obj.author.id, fname: obj.author.first_name,
      lname: obj.author.last_name, label_id: obj.label.id, title: obj.label.title, color: obj.label.color,
      genre_id: obj.genre.id, genre: obj.genre.name, publisher: obj.publisher, cover_state: obj.cover_state
    }
  end
  File.write("./json_data/#{file_name}.json", JSON.pretty_generate(write_data))
end
