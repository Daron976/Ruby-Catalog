require 'json'
require_relative '../class/music_album'
require_relative '../class/genre'

module MusicModule
  # Show List of All music
  def music_list
    if @music_album.empty?
      puts "<<< Music list empty >>>\n\n"
      run
    else
      puts 'list all music albums'
      @music_album.each do |element|
        puts "Id: #{element['id']} Publish date: #{element['publish_date']} On spotify: #{element['on_spotify']}"
      end
    end
  end

  def show_genres
    if @genre.empty?
      puts "<<< Genre list empty >>>\n\n"
      run
    else
      puts 'Genres List'
      @genre.each do |element|
        puts "Id: #{element['id']} Name: #{element['name']}"
      end
    end
  end

  # Add a new Music
  def add_a_music
    puts 'Publish date: [DD-MM-YYYY]'
    publish_date = gets.chomp

    puts 'on spotify [Y/N]:'
    on_spotify = gets.chomp.capitalize

    @new_album = MusicAlbum.new(publish_date, on_spotify)
    @container = []
    check_genre_list

    puts 'New music album added succesfully'
  end

  def check_genre_list
    if @genre.empty?
      add_genre
    else
      puts 'Select one of the genres from the list please'
      show_genres
      puts 'Add a new genre [0]'
      user_select = gets.chomp.to_i
      if user_select.zero?
        add_genre
      else
        @genre.select { |element| @container << element if element['id'] == user_select }

        @music_album << {
          id: @new_album.id,
          archived: @new_album.can_be_archived?,
          publish_date: @new_album.publish_date,
          on_spotify: @new_album.on_spotify,
          genre: @container
        }
        add_new_music(@music_album)
      end
    end
  end

  def add_genre
    puts 'Add a genre'
    puts 'Genre Name:'
    @name = gets.chomp.capitalize
    new_genre = Genre.new(@name)
    @container << {
      id: Random.rand(1..100),
      name: new_genre.name
    }

    @music_album << {
      id: @new_album.id,
      archived: @new_album.can_be_archived?,
      publish_date: @new_album.publish_date,
      on_spotify: @new_album.on_spotify,
      genre: @container
    }

    @genre << @container[0]

    add_new_music(@music_album)
    add_new_genre(@genre)
  end
end

# READ JSON FILES <<<<
# Music album
module ReadMusic
  def read_list
    if File.exist?('./JSON/music_album.json')
      list_of_music = File.open('./JSON/music_album.json')
      JSON.parse(list_of_music.read)
    else
      puts 'Creating a new Music List file'
      File.write('./JSON/music_album.json', [])
    end
  end
end

# Genre files
module ReadGenre
  def read_genre
    if File.exist?('./JSON/genre.json')
      list_of_genre = File.open('./JSON/genre.json')
      JSON.parse(list_of_genre.read)
    else
      puts 'Creating a new Genre List file'
      File.write('./JSON/genre.json', [])
    end
  end
end

# WRITE JSON FILES <<<<
# Music album
module WriteMusic
  def add_new_music(new_item)
    File.write('./JSON/music_album.json', JSON.pretty_generate(new_item))
  end
end

# Genre list
module WriteGenre
  def add_new_genre(new_item)
    File.write('./JSON/genre.json', JSON.pretty_generate(new_item))
  end
end
