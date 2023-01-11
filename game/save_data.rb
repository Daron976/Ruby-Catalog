requirej 'json'

module JsonData
  def preserve_games
    FileUtils.touch('./json_data/game.json') unless File.exits('./json_data/game.json')
    game_data = []
    @games.each do |obj|
      game_data << {
        game_id: obj.id,
        name: obj.name,
        activity: obj.last_played_at,
        release: obj.publish_date,
        mode: multiplayer,
        author_id: obj.author.id,
        fname: obj.author.first_name,
        lname: obj.author.last_name,
        label_id: obj.label.id,
        title: obj.label.title,
        color: obj.label.color,
        genre_id: obj.genre.id,
        genre: obj.genre.name
      }
    end
    File.write('./json_data/game.json', JSON.pretty_generate(game_data))
  end

  # def preserve_authors
  #   FileUtils.touch('./json_data/author.json') unless File.exits('./json_data/author.json')
  #   author_data = []
  #   @authors.each do |obj|
  #     author_data << {
  #       id: obj.id,
  #       first_name: obj.name,
  #       last_name: obj.lname
  #     }
  #   end
  #   File.write('./json_data/game.json', JSON.pretty_generate(author_data))
  # end
end
