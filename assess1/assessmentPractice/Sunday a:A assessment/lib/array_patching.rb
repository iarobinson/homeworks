require 'byebug'
class Array

  def my_each(&prc)
    each_result = []

    idx = 0
    while idx < self.length
      each_result << prc.call(self[idx])
      idx += 1
    end

    each_result
  end

  def my_each_with_index(&prc)
    each_with_index = []

    idx = 0
    while idx < self.length
      each_with_index << prc.call([self[idx], idx])
      idx += 1
    end

    each_with_index
  end

  def my_select(&prc)
    select_result = []

    self.my_each do |x|
      if prc.call(x)
        select_result << x
      end
    end

    select_result
  end

  def my_reject(&prc)
    reject_result = []

    self.my_each do |x|
      unless prc.call(x)
        reject_result << x
      end
    end

    reject_result
  end

  def my_any?(&prc)
    self.my_each { |x| return true if prc.call(x) == true }
    false
  end

  def my_all?(&prc)
    self.my_any? { |x| return false if prc.call(x) == false }
    true
  end

  # Takes a multi-dimentional array and returns a single array of all the elements
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,5]
  def my_flatten
    flattened = []
    self.my_each do |el|
      el.is_a?(Array) ? flattened += el.my_flatten : flattened << el
    end
    flattened
  end

  # Write a version of flatten that only flattens n levels of an array.
  # E.g. If you have an array with 3 levels of nested arrays, and run
  # my_flatten(1), you should return an array with 2 levels of nested
  # arrays
  #
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,[5]]
  def my_controlled_flatten(n)

  end

  def my_zip(*arrs)

  end

  def my_rotate(num)

  end

  def my_join(str = "")
    self.join(str)
  end

  def my_reverse
    rev = []

    idx = self.length - 1
    while idx >= 0
      rev.push(self[idx])
      idx -= 1
    end

    rev
  end

  #Write a monkey patch of quick sort that accepts a block
  def my_quick_sort(&prc)

  end

  # Write a monkey patch of binary search that accepts a comparison block:
  # E.g. [1, 2, 3, 4, 5, 7].my_bsearch(6) {|el, targ| el+1 <=> targ} => 4
  def my_bsearch(target, &prc)

  end

end
