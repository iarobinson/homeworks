class Tile
  attr_reader :given
  attr_accessor :value

  def initialize(value)
    @value = value
    @given = empty?
  end

  def empty?
    @value != 0
  end
end

# tile = Tile.new(1)
# p "#{tile.given} <= given"
