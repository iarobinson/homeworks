require 'byebug'
class Array

  def my_each(&prc)
    each = []
    idx = 0

    while idx < self.length
      each << prc.call(self[idx])
      idx += 1
    end

    each
  end

  def my_each_with_index(&prc)
    each_with_index = []

    idx = 0
    while idx < self.length
      each_with_index << prc.call(self[idx], idx)
      idx += 1
    end

    each_with_index
  end

  def my_select(&prc)
    selected = []

    self.each do |x|
      selected << x if prc.call(x)
    end

    selected
  end

  def my_reject(&prc)
    rejected = []

    self.each do |x|
      rejected << x if !prc.call(x)
    end

    rejected
  end

  def my_any?(&prc)
    self.each { |x| return true if prc.call(x) }
    false
  end

  def my_all?(&prc)
    self.each { |x| return false if !prc.call(x) }
    true
  end

  # Takes a multi-dimentional array and returns a single array of all the elements
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,5]
  def my_flatten
    flat = []

    self.each do |x|
      if x.class != Array
        flat << x
      else
        sub_array = x.my_flatten
        flat.concat(sub_array)
      end
    end

    flat
  end

  # Write a version of flatten that only flattens n levels of an array.
  # E.g. If you have an array with 3 levels of nested arrays, and run
  # my_flatten(1), you should return an array with 2 levels of nested
  # arrays
  #
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,[5]]

  def my_controlled_flatten(n)
    controlled_flat = []

    n.times do
      self.each do |x|
        if x.class != Array
          controlled_flat << x
        else
          x.each { |y| controlled_flat << y }
        end
      end
    end

    controlled_flat
  end

  def my_zip(*arrs)
    zipped = []
    self.length.times { zipped << [] }

    zipped.each_with_index do |ele, i|

    end

    zipped
  end

  def my_rotate(num=nil)
    num = 1 if num == nil
    rotated_arr = self.dup
    rotations = num % self.length

    rotations.times do
      rotate = rotated_arr.shift
      rotated_arr << rotate
    end

    rotated_arr
  end

  def my_join(str = "")
    joined = ''

    idx = 0
    while idx < self.length - 1
      joined += self[idx] + str
      idx += 1
    end

    joined + self.last
  end

  def my_reverse
    reverse = []
    self.each { |x| reverse.unshift(x) }
    reverse
  end

  #Write a monkey patch of quick sort that accepts a block
  def my_quick_sort(&prc)

  end

  # Write a monkey patch of binary search that accepts a comparison block:
  # E.g. [1, 2, 3, 4, 5, 7].my_bsearch(6) {|el, targ| el+1 <=> targ} => 4
  def my_bsearch(target, &prc)

  end

end

# [1,2,3].my_each_with_index { |x, i| p "#{x} <= x #{i} <= i"}
# [1,2,3].my_select { |x| p "#{x} <= x in my_select" if x % 2 == 0 }
# p 'abcd'.split('').my_rotate(2)# == ["b", "c", "d", "a"]
