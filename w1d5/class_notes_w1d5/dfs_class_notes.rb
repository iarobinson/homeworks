# def dfs(target = nil)
#
#   return self if self.value == target
#
#   self.each do |x|
#     current_value = x.dfs(target)
#     return current_value if current_value
#   end
#
#   nil
# end


class Tree

  def initialize
    @value = value
  end


  def dfs(target = nil)

    return self if self.value == target

    self.each do |x|
      current_result = x.dfs(x)
      return current_result if current_result
    end

    nil
  end
end
