require 'json'
require 'fileutils'

def preserve_data(file_name, data_arr)
  write_data = []
  FileUtils.touch("./json_data/#{file_name}.json") unless File.exist?("./json_data/#{file_name}.json")
  File.write("./json_data/#{file_name}.json", JSON.pretty_generate(write_data)) if data_arr.empty?

  data_arr.each do |obj|
    new_hash = {
      id: obj.id, release: obj.publish_date,
      label_id: obj.label.id, title: obj.label.title, color: obj.label.color
    }
    case obj.type
    when 'Book'
      new_hash.merge!({
                        publisher: obj.publisher, cover_state: obj.cover_state,
                        author_id: obj.author.id, fname: obj.author.first_name, lname: obj.author.last_name
                      })
    when 'Game' then new_hash.merge!({ activity: obj.last_played_at, multiplayer: obj.multiplayer })
    when 'Music' then new_hash.merge!({ on_spotify: obj.on_spotify, genre_id: obj.genre.id, genre: obj.genre.name })
    end
    write_data << new_hash
  end
  File.write("./json_data/#{file_name}.json", JSON.pretty_generate(write_data))
end
