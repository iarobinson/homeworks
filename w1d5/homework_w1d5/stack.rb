class Stack
  def initialize
    @stack = [] # My initial thought was = stack
  end

  def add(el)
    @stack << el # My initial thought was @stack.shift(el)
    el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup # My initial thought was = p @stack
  end
end

s = Stack.new
s.add("i")
s.add("a")
s.add("p")
s.add(1)
s.remove
s.show # What does s.show do? Duplicates, sure... but why?
s.add("n")
p s
