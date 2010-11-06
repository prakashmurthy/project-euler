#!/usr/bin/env ruby
# Solution to problem number 307 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=307
# prob_307_defective_chips.rb

class Array
  def max_item_count
    count_hash = Hash.new(0)
    self.each { |item| count_hash[item] += 1 }
    max_value = 0
    count_hash.each do |key, value| 
      max_value = value if value > max_value
    end
    max_value
  end
end

defects = 4
chips   = 5
min_defects = 3

combinations = []
number = 0
(1..chips).each do |x|
  (1..chips).each do |y|
    (1..chips).each do |z|
      (1..chips).each do |a|
        number += 1
        combinations << [x, y, z, a]
        # puts "Combination number #{number} : #{x}-#{y}-#{z}-#{a}"
      end
    end
  end
end

number = 0
combinations.each do |combination|
  if  combination.max_item_count == 2 and combination.uniq.length != 2 #and combination[0] == combination[2] 
    number += 1
    puts "Combination #{number} : #{combination.join(', ')}"
  end
end
# # Total number of combinations
# total_combinations = defects * chips # chips_C_1 * chips_C_1 * chips_C_1 .... defect times. 
# puts "Total number of combinations : #{total_combinations}"
# 
# # Number of combinations that have exactly one defect per chip
# # chips_C_1 * (chips -1)_C_1 * (chips -2)_C_1 * ..... defect times
# one_defect_per_chip = 1
# (0..defects).each do |number|
#   one_defect_per_chip = 