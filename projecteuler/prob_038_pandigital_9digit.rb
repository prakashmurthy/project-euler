#!/usr/bin/env ruby
# Solution to problem number 38 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=38

class Integer
  def is_1to9_pandigital?
    return false if (self.to_s =~ /1/).nil?
    return false if (self.to_s =~ /2/).nil?
    return false if (self.to_s =~ /3/).nil?
    return false if (self.to_s =~ /4/).nil?
    return false if (self.to_s =~ /5/).nil?
    return false if (self.to_s =~ /6/).nil?
    return false if (self.to_s =~ /7/).nil?
    return false if (self.to_s =~ /8/).nil?
    return false if (self.to_s =~ /9/).nil?
    return true
  end
end

# puts "123456789.is_1to9_pandigital? evaluates to #{123456789.is_1to9_pandigital?}"
# puts "123456780.is_1to9_pandigital? evaluates to #{123456780.is_1to9_pandigital?}"
# puts "192384576.is_1to9_pandigital? evaluates to #{192384576.is_1to9_pandigital?}"
# puts "918273645.is_1to9_pandigital? evaluates to #{918273645.is_1to9_pandigital?}"
# puts "18273645.is_1to9_pandigital? evaluates to #{18273645.is_1to9_pandigital?}"

max_1to9_pandigital = 0

# Checking for 2 - 3 - 4 breakdown of the 1to9 pandigital number
puts "Checking for 2 - 3 - 4 breakdown of the 1to9 pandigital number"
number = 91 # breaking up 918273645 (sequence generated starting with 9) into 3 numbers of 2, 3 and 4 digits each.

while true
  twice_number = number * 2
  thrice_number = number * 3
  break if ((thrice_number.to_s.length > 4) or (twice_number.to_s.length > 3) or (number.to_s.length > 2))
  new_number = ((number.to_s) + (twice_number.to_s) + (thrice_number.to_s)).to_i
  if new_number.is_1to9_pandigital?
    max_1to9_pandigital = new_number if new_number > max_1to9_pandigital
    puts "#{((number.to_s) + "_" + (twice_number.to_s) + "_" + (thrice_number.to_s))} is pandigital"
  end
  
  #puts "#{number} * 2 = #{twice_number}"
  number += 1
end

# Checking for 4 - 5 breakdown of the 1to9 pandigital number
puts "Checking for 4 - 5 breakdown of the 1to9 pandigital number"
number = 9182 # breaking up 918273645 (sequence generated starting with 9) into two numbers of 4 and 5 digits each.
while true
  twice_number = number * 2
  break if ((twice_number.to_s.length > 5) or (number.to_s.length > 4))
  new_number = ((number.to_s) + (twice_number.to_s)).to_i
  if new_number.is_1to9_pandigital?
    max_1to9_pandigital = new_number if new_number > max_1to9_pandigital
    puts "#{((number.to_s) + "_" + (twice_number.to_s))} is pandigital"
  end
  
  #puts "#{number} * 2 = #{twice_number}"
  number += 1
end


puts "Max 1 to 9 pandigital number is #{max_1to9_pandigital}."