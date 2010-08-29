#!/usr/bin/env ruby
# Solution to the problem number 34 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=34

# Assuming an upper bound of 1000000 (don't know the logic of the upper bound)

class Integer
  def factorial 
    if self <= 1
      1
    else 
      self * ( self -1 ).factorial
    end
  end
end


(10..1000000).each do |num|
  total = 0
  num.to_s.split(//).each do |char|
    total = total + char.to_i.factorial
  end
  puts "sum of factorials of digits in #{num} is #{total}" if num == total
end