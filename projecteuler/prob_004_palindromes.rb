#!/usr/bin/env ruby
# Solution to problem 4 in Project Euler
# http://projecteuler.net/index.php?section=problems&id=4

class Problem004
  
  def Problem004.palindrome?(number)
    number == number.to_s.reverse.to_i
  end
  
  def Problem004.max_palindrome(number)  
    highest_palindrome = 0
    start_number = 10**(number - 1)
    end_number = 10**number - 1
    
    (start_number..end_number).each do |number_1|
      (start_number..end_number).each do |number_2|        
        highest_palindrome = number_1 * number_2 if (number_1 * number_2) > highest_palindrome and Problem004.palindrome?(number_1 * number_2)
      end
    end
    
    highest_palindrome
  end
end

if __FILE__ == $0
  puts "The largest palindrome made from the product of two 3-digit numbers is #{Problem004.max_palindrome(3)}"
end