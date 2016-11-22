# # String upcase recursion
# def upcase(string)
#   return string.upcase if string.length <= 1
#   p string
#   p string[0].upcase + upcase(string[1..-1])
# end
#
#
# p upcase("i love veronica")

# def reverse(string)
#   return string if string.length <= 1
#   string[-1] + reverse(string[0..-2])
# end
#
# p reverse("Hello")

# "Hello" => "olleH"
# "Hell" => "lleH" +
# "ello" => "olle" + "H"

# def quick_sort(arr)
#   return arr if arr.length <= 1
#   # need a pivot element. Then a left side and a right side
#   pivot_arr = [arr.first]
#   left_side = arr[1..-1].select { |el| el < arr.first }
#   right_side = arr[1..-1].select { |el| el >= arr.first }
#   quick_sort(left_side) + pivot_arr + quick_sort(right_side)
# end
#
# p quick_sort([3, 50, 1, 399, 10000])
#
# # # A naturally recursive algorithm.
# # [4, 12, 3, 9, 8, 2, 7]
# # # First sort around 4
# # [3, 2, 4, 12, 9, 8, 7]
# # # Recusive start of next part
# # # quick sort left and right and apend to middle
# #
# #           [12, 9, 8, 7]
# #           [9, 8, 7, | 12]
# #           [7, |8,| 9]
# # [3|, 2]
# # [2, |3]
# # # Combine all the splits
# # [2, 3, 4, 7, 8, 9]

# ## Stack Overflow
# def factorial(n)
#   n * factorial(n - 1)
# end
#
# p factorial(2)

# # Stack Overflow Notes
# Stack frame is the tool Ruby uses to make calculations
# Stack Frames are stored in the memory
#
# Mail <- 
