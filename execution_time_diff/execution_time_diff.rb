def my_min(arr)
  min = arr.first
  arr.each_with_index do |num1, idx1|
    arr.each_with_index do |num2, idx2|
      next if idx1 == idx2
      min = [min, num1, num2].min
      # if num1 < num2 && num1 < min
      #   min = num1
      # elsif num2 < num1 && num2 < min
      #   min = num2
      # end
    end
  end
  min
end

def my_min2(arr)
  min = arr.first
  arr.each do |el|
    min = el if el < min
  end
  min
end

def largest_sum(arr)
  best_sum = arr.first
  arr.each_index do |idx1|
    (idx...arr.length).each do |idx2|
      sum = arr[idx1..idx2].reduce(:+)
      best_sum = sum if sum > best_sum
    end
  end
  best_sum
end

# def largest_sum2(arr)
#   hash = {}
#   sum = 0
#   arr.each_with_index do |num, idx|
#     sum += num
#     hash[idx] = sum
#   end
#
#   best_idx = 0
#   second_best_idx = 0
#   arr.each_index do |idx|
#     if hash[idx] > hash[best_idx]
#       second_best_idx = best_idx
#       best_idx = idx
#     end
#   end
#   first = [best_idx, second_best_idx].min
#   last = [best_idx, second_best_idx].max
#   arr[first..last].reduce(:+)
#   #puts [first, last]
# end

def largest_sum2(arr)
  best_sum = arr.first
  current_sum = arr.first

  return arr.max if arr.all? { |num| num < 0 }

  arr[1..-1].each do |num|
    current_sum = 0 if current_sum < 0
    current_sum += num
    best_sum = current_sum if current_sum > best_sum
  end
  best_sum
end

list = [2, 3, -6, 7, -6, 7]
puts largest_sum2(list)
list2 = [-5, -1, -3]
puts largest_sum2(list2)
