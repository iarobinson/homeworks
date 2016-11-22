# # Exercise 1 - sum_to
# def sum_to(n)
#   return nil if n <= 0
#   return n if n <= 1
#   n + sum_to(n - 1)
# end
#
# p "#{sum_to(5)} <= should equal 15"
# p "#{sum_to(1)} <= should equal 1"
# p "#{sum_to(9)} <= should equal 45"
# p "#{sum_to(-8).class} <= should equal NilClass"

# # Exercise 2 - add_numbers
# def add_numbers(nums = [])
#   return nums[0] if nums.length <= 1
#   nums.shift + add_numbers(nums)
# end
#
# p add_numbers([1,2,3,4]) # => returns 10
# p add_numbers([3]) # => returns 3
# p add_numbers([-80,34,7]) # => returns -39
# p add_numbers() # => returns nil

# # Exerise 3 - Gamma Function
# def gamma_fnc(n = 0)
#   return nil if n == 0
#   return 1 if n == 1
#   (n - 1) * gamma_fnc(n - 1)
# end
#
# p gamma_fnc(0)  # => returns nil
# p gamma_fnc(1)  # => returns 1
# p gamma_fnc(4)  # => returns 6
# p gamma_fnc(8)  # => returns 5040
