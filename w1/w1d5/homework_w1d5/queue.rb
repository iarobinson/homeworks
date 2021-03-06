
class Queue
  def initialize
    @stack = []
  end

  def enqueue(el)
    @stack.unshift(el)
    # Made mistake of making this .shift rather than .unshift
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
#
# The solution tells me to use @queue for the instance variable,
#   to push el when enqueueing and to shift dequeueing rather than
#   popping.
#
# I'm unsure if mine is a incorrect solution, or simply a different
#   way of telling the same algorithm.
