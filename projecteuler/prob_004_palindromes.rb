#!/usr/bin/env ruby
# Solution to problem 4 in Project Euler
# http://projecteuler.net/index.php?section=problems&id=4

class Problem004
  
  def Problem004.palindrome?(number)
    number == number.to_s.reverse.to_i
  end
  
end