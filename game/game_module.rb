require_relative 'game'
require_relative 'author'
require_relative 'create'

module GameModule
  def add_game
    print 'Released date [DD-MM-YYYY] : '
    release = gets.chomp
    print 'Last played [DD-MM-YYYY] : '
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
    puts "There are no authors available\n" if @authors.empty?
    @authors.each do |obj|
      puts "[ Name: #{obj.first_name} #{obj.first_name}]"
    end
    puts ''
    select_input
  end
end
