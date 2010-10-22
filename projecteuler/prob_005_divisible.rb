#!/usr/bin/env ruby
# Solution to problem number 5 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=5
# prob_005_divisible.rb

class Solution5
 def self.smallest_divisible_number(highest_number)
   (1..highest_number).inject(1) {|smallest_multiple, number| smallest_multiple.lcm(number)}
 end
end

if __FILE__ == $0
  puts Solution5::smallest_divisible_number(20)
end