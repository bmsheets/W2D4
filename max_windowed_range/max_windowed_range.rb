def windowed_max_range(arr, window_size)
  current_max_range = nil
  #(0..-1 * window_size).each { |num| puts num }
  (0..arr.length - window_size).each do |start_idx|
    window = arr[start_idx...start_idx+window_size]
    max = window.max
    min = window.min
    result = max - min
    current_max_range = result if current_max_range == nil
    if result > current_max_range
      current_max_range = result
    end
  end
  current_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

#def optimized_max_range

class MinMaxStackQueue

  attr_reader :max, :min

  def initialize
    @queue = []
    @max = nil
    @min = nil
  end

  def enqueue(elem)
    @queue.push(elem)
    if max == nil
      @max = elem
    end
    if min == nil
      @min = elem
    end
    @max = elem if elem > @max
    @min = elem if elem < @min
  end

  def dequeue
    elem = @queue.shift
    if elem == @max
      @max = @queue.max
    end
    if elem == @min
      @min = @queue.min
    end
  end
end
