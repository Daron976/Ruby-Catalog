require 'json'
require 'fileutils'

def preserve_data(file_name, data_arr)
  write_data = []
  FileUtils.touch("./json_data/#{file_name}.json") unless File.exist?("./json_data/#{file_name}.json")
  File.write("./json_data/#{file_name}.json", JSON.pretty_generate(write_data)) if data_arr.empty?
  data_arr.each do |obj|
    write_data << {
      id: obj.id, release: obj.publish_date, author_id: obj.author.id, fname: obj.author.first_name,
      lname: obj.author.last_name, label_id: obj.label.id, title: obj.label.title, color: obj.label.color,
      genre_id: obj.genre.id, genre: obj.genre.name
    }

    case obj.class
    when 'MusicAlbum' then write_data[:on_spotify] = obj.on_spotify
    when 'Game'
      write_data[:Activity] = obj.last_played_at
      write_date[:multiplayer] = obj.multiplayer
    when 'Book'
      write_data[:publisher] = obj.publisher
      write_date[:cover_state] = obj.cover_state
    end
  end
  File.write("./json_data/#{file_name}.json", JSON.pretty_generate(write_data))
end
