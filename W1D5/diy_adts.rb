# LIFO: Last one in, first one out
class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack.push(el)
  end

  def remove
    @stack.pop
    @stack
  end

  def show
    @stack
  end
end

# FIFO: First one in, first one out
class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
  end

  def dequeue
    @queue.pop
    @queue
  end

  def show
    @queue
  end
end

class Map
  def initialize
    @my_map = []
  end

  def assign(key, value)
    if @my_map.any? { |k, _| k == key}
      @my_map.map! do |k, v|
        k == key ? [key, value] : [k, v]
      end
    else
      @my_map << [key, value]
    end
  end

  def lookup(key)
    @my_map.select { |k, v| k == key }.flatten
  end

  def remove(key)
    @my_map.reject! { |k, v| k == key }
  end
end
