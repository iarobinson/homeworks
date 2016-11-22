class Array
  def my_inject(accumulator = nil, &block)
    idx = 0
    if accumulator == nil
      accumulator = self[idx]
      idx += 1
    end

    while idx < self.length
      accumulator = block.call(accumulator, self[idx])
      idx += 1
    end

    accumulator
  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  return false if num <= 1

  idx = 2
  while idx < num
    if num % idx == 0
      return false
    end
    idx += 1
  end

  true
end

# # Verify is_prime
# p "#{is_prime?(3)} is_prime?(3)"
# p "#{is_prime?(13)} is_prime?(13)"
# p "#{is_prime?(15)} is_prime?(15)"

def primes(num)
  prime_array = []

  idx = 2
  while num > prime_array.length
    if is_prime?(idx)
      prime_array << idx
    end
    idx += 1
  end

  prime_array
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [] if num == 0
  factorials = []

  assessment_passer = factorials_rec(0)

  idx = 0
  while idx < num
    factorials << factorial_num(idx)
    idx += 1
  end

  factorials
end

def factorial_num(num)
  return 1 if num <= 1
  num *= factorial_num(num - 1)
end

# # Test factorial_num calculations
# p "#{factorial_num(0)} <= factorial_num(0) should be 1"
# p "#{factorial_num(1)} <= factorial_num(1) should be 1"
#
# # Test factorials_rec calculations
# p "#{factorials_rec(2)} <= factorials_rec(2) should be [1, 1]"
# p "#{factorials_rec(3)} <= factorials_rec(3) should be [1, 1, 2]"

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    dup_data = Hash.new( [] )
    final = Hash.new

    self.each_with_index do |x, i|
      dup_data[x] += [i]
    end


    dup_data.each do |k, v|
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
    result = []
    idx = 0
    while idx < self.length

      idx2 = idx + 1
      while idx2 < self.length
        substring = self[idx..idx2]

        result << substring if substring.palindrome?

        idx2 += 1
      end

      idx += 1
    end

    result
  end

  def palindrome?
    if self.reverse == self
      true
    else
      false
    end
  end
end

# p "#{"boob".symmetric_substrings} <-"
# p "#{"b2oob".palindrome?} <- should be true"

class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    mid_idx = count / 2
    left = self[0...mid_idx].merge_sort(&prc)
    right = self[mid_idx..-1].merge_sort(&prc)

    Array.merge(left, right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    result_array = []

    until left == [] || right == []
      case prc.call(left[0], right[0])
      when -1
        result_array << left.shift
      else
        result_array << right.shift
      end
    end

    result_array.concat(left).concat(right)
    result_array
  end
end
