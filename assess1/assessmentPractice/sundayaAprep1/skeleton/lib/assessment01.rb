require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &block)
    index = 0

    if accumulator.nil?
      accumulator = self.first
      index += 1
    end

    while index < self.length
      accumulator = block.call(accumulator, self[index])
      index += 1
    end

    accumulator
  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  if num < 2
    return false
  end

  index = 2
  while index < num
    if num % index == 0
      return false
    end

    index += 1
  end

  true
end

def primes(num)
  res = []

  index = 0
  while res.length < num
    res << index if is_prime?(index)
    index += 1
  end

  res
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  if num == 1
    [1]
  else
    factorial = factorials_rec(num - 1)
    factorial << factorial.last * (num - 1)
    factorial
  end
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    res = {}

    self.each_with_index do |x, i|
      if res[x] == nil
        res[x] = [i]
      else
        res[x] << i
      end
    end

    final = {}
    res.select do |k, v|
      if v.length > 1
        final[k] = v
      end
    end

    final
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    sym_subs = []

    self.each_char.with_index do |v, idx1|
      idx2 = 0
      while idx2 < self.length
        substring = self[idx1..idx2]
        if substring.palindrome? && substring.length > 1
          sym_subs << substring
        end
        idx2 += 1
      end
    end

    sym_subs
  end

  def palindrome?
    return true if self.reverse == self
    false
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    midpoint = self.length / 2

    left = self.take(midpoint).merge_sort(&prc)
    right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(left, right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.length == 0 || right.length == 0
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end
