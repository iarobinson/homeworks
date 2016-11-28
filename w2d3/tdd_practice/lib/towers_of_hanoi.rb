class TowersOfHanoi
  attr_accessor :board

  def initialize
    @board = [[3, 2, 1], [], []]
  end

  def listen
    p board
    puts "Please enter your move (ex: 01)"
    gets.chomp.split('').map(&:to_i)
  end

  def make_move(move)
    from, to = move

    board[to] << board[from].pop
  end

  def play
    until won?
      make_move(listen)
    end

    puts "Huzzah!!!"
  end

  def valid_move?(move)
    from, to = move
    return false if board[from].empty?
    return true if board[to].empty?
    return false if board[from].last > board[to].last
    true
  end

  def won?
    if board[0].empty?
      return true if board[1].empty? || board[2].empty?
    end

    false
  end
end


# TowersOfHanoi.new.play
