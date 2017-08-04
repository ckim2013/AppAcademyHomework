# LIFO: Last one in, first one out
class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack.push(el)
    el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end

# FIFO: First one in, first one out
class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.push(el)
    el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
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
    [key, value]
  end

  def lookup(key)
    @my_map.each { |pair| return pair if pair[0] == key }
    nil
  end

  def remove(key)
    @my_map.reject! { |k, v| k == key }
  end

  def show
    deep_dup(@my_map)
  end
end

private
def deep_dup(array)
  array.inject([]) { |result, el| result << (el.is_a?(Array) ? deep_dup(el) : el) }
end

# a/A solutions below!
# # EXERCISE 1
# class Stack
#   def initialize
#     @stack = []
#   end
#
#   def add(el)
#     @stack << el
#     el
#   end
#
#   def remove
#     @stack.pop
#   end
#
#   def show
#     @stack.dup
#   end
# end
#
#
#
# # EXERCISE 2
# class Queue
#   def initialize
#     @queue = []
#   end
#
#   def enqueue(el)
#     @queue << el
#     el
#   end
#
#   def dequeue
#     @queue.shift
#   end
#
#   def show
#     @queue.dup
#   end
# end
#
#
#
# # EXERCISE 3
# class Map
#   def initialize
#     @map = []
#   end
#
#   def assign(key, value)
#     pair_index = @map.index {|pair| pair[0] == key}
#     pair_index ? @map[pair_index][1] = value : @map.push([key, value])
#     [key, value]
#   end
#
#   def lookup(key)
#     @map.each {|pair| return pair[1] if pair[0] == key}
#     nil
#   end
#
#   def remove(key)
#     @map.reject! {|pair| pair[0] == key}
#     nil
#   end
#
#   def show
#     deep_dup(@map)
#   end
#
#   private
#   def deep_dup(arr)
#     arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
#   end
# end
