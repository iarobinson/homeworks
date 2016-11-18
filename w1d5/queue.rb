
class Queue
  def initialize
    @stack = []
  end

  def enqueue(el)
    @stack.shift(el)
  end

  def dequeue
    @stack.pop
  end

  def show
    @stack.dup
  end
end
