require_relative 'game'
require_relative 'author'
require_relative 'create'

module Game
  def add_game
    puts "What is the name of the game\n"
    name = gets.chomp
    puts "When was this game released e.g. 1990/05/25\n"
    release = gets.chomp
    puts "When did you last play this game e.g. 1990/05/25\n"
    last_played = gets.chomp
    puts "Is this a multiplayer game: [Y/N]\n"
    mode = gets.chomp
    case mode.downcase
    when 'y' then mode = true
    when 'n' then mode = false
    else
      puts 'Please select either Y or N'
      mode = gets.chomp
    end
    new_game = Game.new(name, last_played, release, multiplayer: mode)
    create(new_game)
    @games << new_game
    puts 'Game succesfully addded\n'
    select_input
  end

  def list_games
    puts 'There are no games available' if @games.empty?
    @games.each do |obj|
      puts "[ Game: #{obj.name} | Release: #{obj.publish_date} | Recent Activity: #{obj.last_played_at} ]"
    end
    puts ''
    select_input
  end

  def list_authors
    puts 'There are no authors available' if @books.empty?
    @books.each do |obj|
      puts "[ Name: #{obj.author.first_name} #{obj.author.first_name}]"
    end
    puts ''
    select_input
  end
end
