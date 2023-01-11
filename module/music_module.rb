require 'json'
require_relative '../class/music_album'
require_relative '../class/genre'
require_relative '../game/author'
require_relative '../label'

module MusicModule
  # Show List of All music
  def music_list
    if @album.empty?
      puts "<<< Music list empty >>>\n\n"
      run
    else
      puts 'list all music albums'
      @album.each do |element|
        puts "Label: #{element.label.title} Publish date: #{element.publish_date} On spotify: #{element.on_spotify}"
      end
    end
    select_input
  end

  def show_genres
    if @genre.empty?
      puts "<<< Genre list empty >>>\n\n"
      run
    else
      puts 'Genres List'
      @genre.each do |element|
        puts "Id: #{element.id} Name: #{element.name}"
      end
    end
  end

  # Add a new Music
  def add_a_music
    puts 'Publish date: [DD-MM-YYYY]'
    publish_date = gets.chomp

    puts 'on spotify [Y/N]:'
    on_spotify = gets.chomp.capitalize

    new_album = MusicAlbum.new(publish_date, on_spotify)

    create(new_album)

    @album << new_album

    add_rel(new_album)

    puts 'New music album added succesfully'
    select_input
  end
end

# READ JSON FILES <<<<
module ReadMusic
  # Music album
  def read_list
    if File.exist?('./JSON/music_album.json')
      list_of_music = File.open('./JSON/music_album.json')
      JSON.parse(list_of_music.read)
    else
      puts 'Creating a new Music List file'
      File.write('./JSON/music_album.json', [])
    end
  end

  # Genre files
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
module WriteMusic
  # Music album
  def add_new_music(new_item)
    File.write('./JSON/music_album.json', JSON.pretty_generate(new_item))
  end

  # Genre list
  def add_new_genre(new_item)
    File.write('./JSON/genre.json', JSON.pretty_generate(new_item))
  end
end
