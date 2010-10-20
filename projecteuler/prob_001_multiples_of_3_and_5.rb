#!/usr/bin/env ruby
# prob_001_multiples_of_3_and_5.rb
# Solution to problem 1 in Project Euler
# http://projecteuler.net/index.php?section=problems&id=1

## My original solution following procedural coding :-)
# MAX_NUMBER = 1_000
# total = 0
# (1..(MAX_NUMBER-1)).each do |number|
#   total += number if (number % 3).zero? or (number % 5).zero?
# end
# 
# puts "#{total} is the sum of all natural numbers below #{MAX_NUMBER} that are multiples of 3 or 5."

class Problem001
  MAX_NUMBER = 10
  
  def Problem001.answer
    total = 0
    (1...MAX_NUMBER).each do |number|
      total += number if (number % 3).zero? or (number % 5).zero?
    end
    total
  end
  
end

puts Problem001.answer