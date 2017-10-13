class MyQueue
  def initialize
    @store = []
  end

  def enqueue(elem)
    @store.push(elem)
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end

class MyStack

  attr_reader :min, :max

  def initialize
    @store = []
    @max = nil
    @min = nil
  end

  def pop
    elem, prev_min, prev_max = @store.pop
    @min = prev_min if elem == @min
    @max = prev_max if elem == @max
  end

  def push(elem)
    @store.push([elem, @min, @max])
    @max = elem if @max.nil? || elem > @max
    @min = elem if @min.nil? || elem < @min
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def to_s
    @store.to_s
  end
end

class StackQueue

  def initialize
    @stack1 = MyStack.new
    @stack2 = MyStack.new
  end

  def enqueue(elem)
    stack1.push(elem)
  end

  def dequeue
    until stack1.empty?
      stack2.push(stack1.pop)
    end
    elem = stack2.pop
    until stack2.empty?
      stack1.push(stack2.pop)
    end
    elem
  end

  def size
    stack1.size + stack2.size
  end

  def empty?
    stack1.empty? && stack2.empty?
  end
end

p stack = MyStack.new
p stack.push(2)
p stack.push(3)
p stack.push(8)
p stack.push(4)
p stack.to_s
p stack.max
p stack.min
p stack.pop
p stack.to_s
p stack.pop
p stack.to_s
p stack.max
p stack.min
