require 'byebug'

# O(n!)
def first_anagram?(str1, str2)
  permutations = str1.chars.permutation.to_a
  permutations.index(str2.chars) != nil

end


# O(n^2) 
def second_anagram?(str1, str2)
  str1.chars.each do |char|
    if str1.include?(char) && str2.include?(char)
      str1.delete! (char)
      str2.delete! (char)
    end
  end
  str1.empty? && str2.empty?
end


# O(nlog(n))
def third_anagram?(str1, str2)
  str1.chars.sort! == str2.chars.sort!

end

#O(n)
def fourth_anagram?(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  str1.each_char do |char|
    hash1[char] += 1
  end

  str2.each_char do |char|
    hash2[char] += 1
  end

  hash1 == hash2
end

#O(n) faster
def fourth_anagram_bonus(str1, str2)
  hash = Hash.new(0)
  str1.each_char do |char|
    hash[char] += 1
  end
  str2.each_char do |char|
    hash[char] -= 1
  end

  hash.values.all? { |value| value == 0 }
end


puts fourth_anagram_bonus?("gizmo", "sally")
puts fourth_anagram_bonus?("elvis", "lives")
