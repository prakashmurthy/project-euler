#!/usr/bin/env ruby
# Solution to problem number 43 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=43

# find and print all permutations of a list
start_time = Time.new

class Integer
  def has_unique_property?
    number_234 = self.to_s[1,3].to_i
    return false if number_234.modulo(2) != 0
    
    number_345 = self.to_s[2,3].to_i
    return false if number_345.modulo(3) != 0
    
    number_456 = self.to_s[3,3].to_i
    return false if number_456.modulo(5) != 0
    
    number_567 = self.to_s[4,3].to_i
    return false if number_567.modulo(7) != 0
    
    number_678 = self.to_s[5,3].to_i
    return false if number_678.modulo(11) != 0
    
    number_789 = self.to_s[6,3].to_i
    return false if number_789.modulo(13) != 0
    
    number_8910 = self.to_s[7,3].to_i
    return false if number_8910.modulo(17) != 0
    
    true
  end
end

puts "1406357289.has_unique_property? evaluates to #{1406357289.has_unique_property?}"
puts "1234567890.has_unique_property? evaluates to #{1234567890.has_unique_property?}"
# find permutations recursively based on the idea that
# for each item in the list, there is a set of permutations
# that start with that item followed by some permutation of
# the remaining items.
def permute(list)
 if (list.length <= 1)
   return [list]
 end
 permutations = []
 count = 1
 list.each do |item|
   sublist_permutations = permute(list - [item])
   sublist_permutations.each do |permutation|
     permutation.unshift(item)
     permutations << permutation
     #puts "Permutations : #{permutations.join(', ')}"
     #puts "permutation lists: #{permutations.each {permutation.join(', ')}}"
   end
 end
 return permutations
end

list = %w{ 0 1 2 3 4 5 6 7 8 9 }
permutations = permute(list)
puts "There are #{permutations.length} permutations of 0..9 "
# permutations.each do |permutation|
#   puts "#{permutation.join(", ")}"
# end

numbers_with_unique_property = []
permutations.each do |permutation|
  if permutation.to_s.to_i.has_unique_property?
    puts "#{permutation.to_s.to_i} has the unique property."
    numbers_with_unique_property << permutation.to_s.to_i
  end
end

puts "The total is #{numbers_with_unique_property.inject {|result, element| result + element}}"
puts "Time spent is #{(Time.now - start_time) / 60 }  minutes"

# ## Output from the execution
# There are 3628800 permutations of 0..9 
# 1406357289 has the unique property.
# 1430952867 has the unique property.
# 1460357289 has the unique property.
# 4106357289 has the unique property.
# 4130952867 has the unique property.
# 4160357289 has the unique property.
# The total is 16695334890
# Time spent is 6.32133486666667  minutes