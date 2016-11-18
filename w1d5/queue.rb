
class Queue
  def initialize
    @stack = []
  end

  def enqueue(el)
    @stack.unshift(el)
  end

  def dequeue
    @stack.pop
  end

  def show
    @stack.dup
  end
end

q = Queue.new
q.enqueue(1)
q.enqueue(2)
q.dequeue
q.enqueue(3)
p q

# This shows the pattern of this LIFO system. 1 is removed while 2
#   and three remain.
