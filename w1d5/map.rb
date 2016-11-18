class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    pair_index = @map.index { |pair| pair[0] == key }
    pair_index ? @map[pair_index][1] = value : @map.push([key, value])
    [key, value]
  end

  def lookup(key)
    @map.each do |pair|
      if pair[0] == key
        return pair[1]
      end
    end

    nil
  end

  def remove(key)
    #
  end

  def show
    #
  end
end

m = Map.new
m.assign(:hi, 2)
# p m.lookup(:hi)
