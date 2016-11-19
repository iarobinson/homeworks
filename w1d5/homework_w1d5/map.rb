class Map
  def initialize
    @map = [] # Create new array to write new values to
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

my_map = Map.new
my_map.assign(:hi, 2)
my_map.assign("ian", true)
p my_map.lookup("ian")
p my_map
