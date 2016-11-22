require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &block)
    index = 0

    if accumulator == nil
      accumulator[index]
      index += 1
    end

    while self.length > index
      block.call(accumulator, self[1..0])
      index += 1
    end
  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  if num < 2
    return false
  end

  idx = 2
  while idx < num
    if num % idx == 0
      return false
    end
    idx += 1
  end
  true
end

# # Verified
# p "#{is_prime?(13)} <= should be true"
# p "#{is_prime?(14)} <= should be false"

def primes(num)
  prime_data = []

  idx = 0
  while prime_data.length < num
    prime_data << idx if is_prime?(idx)
    idx += 1
  end

  prime_data
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  if num == 1
    return [1]
  else
    facs = factorials_rec(num - 1)
    facs << facs.last * (num - 1)
    facs
  end
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    dup_data = {}

    self.each_with_index do |ele, idx|
      if ele.class == Array
        ele.dups
      else
        dup_data[ele] = [x].concat([idx])
      end
    end

    dup_data
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
  end

  private
  def self.merge(left, right, &prc)
  end
end
