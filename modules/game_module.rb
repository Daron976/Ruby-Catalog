require_relative '../item/game'
require_relative 'create'

module GameModule
  def add_game
    puts ''
    print 'Released date (YYYY-MM-DD) : '
    release = gets.chomp
    print 'Last played (YYYY-MM-DD) : '
    last_played = gets.chomp
    print 'Is this a multiplayer game [Y/N] : '
    mode = gets.chomp
    case mode.downcase
    when 'y' then mode = true
    when 'n' then mode = false
    else
      print 'Please select either Y or N'
      mode = gets.chomp
    end
    new_game = Game.new(last_played, release, multiplayer: mode)

    create(new_game)

    @games << new_game

    add_rel(new_game)

    puts "Game succesfully addded\n"

    select_input
  end

  def list_games
    puts ''
    print 'There are no games available' if @games.empty?
    @games.each do |obj|
      puts "[ Game: #{obj.label.title} | Release: #{obj.publish_date} | Recent Activity: #{obj.last_played_at} ]"
    end
    puts ''
    select_input
  end

  def list_authors
    puts ''
    puts 'There are no authors available' if @authors.empty?
    @authors.each do |obj|
      puts "[ Authors: #{obj.first_name} #{obj.last_name} ]"
    end
    select_input
  end
end
