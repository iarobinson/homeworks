require_relative "tile.rb"

class Board
  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  # Class method
  def self.from_file(file_name)
    file = File.readlines(file_name).map(&:chomp)
    file.map! { |x| x.split('') }
    file.each do |row|
      row.map!(&:to_i)
      row.map! { |e| Tile.new(e) }
    end

    Board.new(file)
  end

  def [](index)
    @grid[index]
  end

  def []=(index)
    @grid[index]
  end

  def update_tile(x, y, new_value)
    @grid[x][y].value = new_value
  end

  def render
    @grid.each do |row|
      p row.map(&:value)
    end
  end
end

a = Board.from_file("sudoku1.txt")
puts ""
a.render
puts ""
