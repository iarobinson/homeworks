
class Array

  def my_each(&bloc)
    idx = 0
    while idx < self.length
      bloc.call(self[idx])
      idx += 1
    end
  end

  def my_select(&bloc)
    select_array = []
    self.my_each do |x|
      if bloc.call(x)
        select_array.push(x)
      end
    end

    select_array
  end


  def my_reject(&bloc)
    reject_array = []
    self.my_each do |x|
      if !bloc.call(x)
        reject_array.push(x)
      end
    end

    reject_array
  end

  def my_any?(&bloc)
    self.my_each do |x|
      if bloc.call(x)
        return true
      end
    end
    false
  end

  def my_all?(&bloc)
    self.my_each do |x|
      if bloc.call(x) == false
        return false
      end
    end
    true
  end

  def my_flatten
    flat_array = []

    self.my_each do |x|
      if x.class != Array
        flat_array.push(x)
      elsif
        flat_array.concat(x.my_flatten)
      end
    end

    flat_array
  end

  def my_zip(*args)
    zip_array = []

    self.each_index do |x|
      zip_array.push(Array(self[x]))
    end

    idx1 = 0
    while idx1 < self.length

      idx2 = 0
      while idx2 < args.length
        zip_array[idx1].push(args[idx2][idx1])
        idx2 += 1
      end

      idx1 += 1
    end

    zip_array
  end

  def my_rotate(arg = 1)
    split_here = arg % self.length
    self[split_here..self.length] + self[0...split_here]
  end


  def my_join(joiner = "")
    joint_string = ''
    self.each do |x|
      joint_string += x + joiner
    end

    joint_string
  end

  def my_reverse
    rev_array = []
    idx = self.length - 1

    while idx >= 0
      rev_array << self[idx]
      idx -= 1
    end
    rev_array
  end

end

# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]
