#!/usr/bin/env ruby
# prob_006_squares.rb
# Solution to problem 6 in Project Euler
# http://projecteuler.net/index.php?section=problems&id=6

class Problem006
  
  def Problem006.sum_of_squares(max_number=10)
    (1..max_number).inject { |total, number| total + number**2 }
  end
  
  def Problem006.square_of_sums(max_number=10)
    ((1..max_number).inject { |total, number| total + number })**2
  end
  
  def Problem006.difference(max_number=10)
    Problem006.square_of_sums(max_number) - Problem006.sum_of_squares(max_number)
  end
  
end

if __FILE__ == $0
  puts Problem006.sum_of_squares(10)
  puts Problem006.square_of_sums(10)
  puts Problem006.difference(10)
  
  puts Problem006.difference(100) # Final answer
end