require 'json'
require_relative '../item/music_album'
require_relative 'create'

module MusicModule
  # Show List of All music
  def music_list
    puts ''
    if @albums.empty?
      puts "<<< Music list empty >>>\n"
    else
      @albums.each do |element|
        puts "[ Title: #{element.label.title} | On spotify: #{element.on_spotify} ]"
      end
    end
    select_input
  end

  def show_genres
    puts ''
    if @genres.empty?
      puts "<<< Genre list empty >>>\n"
    else
      @genres.each do |element|
        puts "[ Genre: #{element.name} ]"
      end
    end
    select_input
  end

  # Add a new Music
  def add_a_music
    puts ''
    print 'Publish date (DD-MM-YYYY) : '
    publish_date = gets.chomp

    print 'on spotify [Y/N] : '
    on_spotify = gets.chomp.capitalize

    new_album = Album.new(publish_date, on_spotify)

    create(new_album)

    @albums << new_album

    add_rel(new_album)

    puts "New music album added succesfully\n"
    select_input
  end
end
