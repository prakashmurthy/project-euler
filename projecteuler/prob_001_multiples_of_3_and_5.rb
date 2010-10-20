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
  
  def Problem001.answer(max_number=10)
    total = 0
    (1...max_number).each do |number|
      total += number if (number % 3).zero? or (number % 5).zero?
    end
    total
  end
  
end

if __FILE__ == $0
  puts Problem001.answer(1000)
end