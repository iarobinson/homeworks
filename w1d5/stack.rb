class Stack
  def initialize
    @stack = [] # My initial thought was = stack
  end

  def add(el)
    # My initial thought was @stack.shift(el)
    @stack << el
    el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup # My initial thought was = p @stack
  end
end
