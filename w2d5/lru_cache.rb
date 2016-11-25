class LRUCache
  def initialize(length)
    @length = length
    @cache = Array.new
  end

  def count
    # returns number of elements currently in cache
    @length
  end

  def add(el)
    # adds element to cache according to LRU principle
    if @cache.length < @length # Should be swapped with below elsif else early duplicates be recorded in lieu of important info
      @cache << el # It was very early, I used += [] in lieu of the shovel... very strange
    elsif @cache.include?(el)
      @cache.delete(el)
      @cache << el
    else
      @cache.shift
      @cache << el
    end
  end

  def show
    # shows the items in the cache, with the LRU item first
    p @cache
    nil # So the method returns... I guess this is important
  end

  # Should have deleted private as it wasn't important

end

# For Testing
johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

# johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.show
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})

johnny_cache.show
