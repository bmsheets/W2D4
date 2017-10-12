def bad_two_sum?(arr, target_sum)
  arr.length.times do |i|
    (i + 1...arr.length).each do |j|
      return true if arr[i] + arr[j] == target_sum
    end
  end
  false
end

# arr = [0, 1, 5, 7]
# puts bad_two_sum?(arr, 6) # => should be true
# puts bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr, target_sum)
  arr.sort!
  i, j = 0, arr.length - 1
  until i >= j
    test_sum = arr[i] + arr[j]
    result = test_sum <=> target_sum
    case result
    when 0
      return true
    when -1
      i += 1
    when 1
      j -= 1
    end
  end
  false
end

# arr = [0, 1, 5, 7]
# puts okay_two_sum?(arr, 6) # => should be true
# puts okay_two_sum?(arr, 10) # => should be false

def good_two_sum?(arr, target_sum)
  hash = Hash.new(0)
  arr.each do |num|
    hash[num] += 1
  end
  puts hash.inspect
  hash.each_key do |key|
    difference = target_sum - key
    if difference == key && hash[key] == 1
      next
    end
    puts "difference is #{difference}"
    return true if hash.key?(difference)
  end
  false
end


arr = [0, 1, 5, 7]
puts good_two_sum?(arr, 6) # => should be true
puts good_two_sum?(arr, 10) # => should be false
puts good_two_sum?([0, 1, 5, 5, 7], 10) # => should be true
