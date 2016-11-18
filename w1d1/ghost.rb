# require 'dictionary.txt'

file_name = File.open('dictionary.txt', 'w')
puts file_name[2]
file_name.close


class Game

  def initialize(players, fragment, dictionary)
    @players = players
    @fragment = fragment
    @dictionary = dictionary
  end

  def play_round

  end

  def current_player

  end



end

class Player

  def initialize(name)
    @name = name
  end

  def guess

  end

  def alert_invalid_guess

  end

end
