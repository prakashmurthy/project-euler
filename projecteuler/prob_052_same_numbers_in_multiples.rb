#!/usr/bin/env ruby
# Solution to problem number 52 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=52

def fits_criteria?(number)
  number_letters = number.to_s.split(//).uniq.sort
  number_x_2_letters = (number * 2).to_s.split(//).uniq.sort
  number_x_3_letters = (number * 3).to_s.split(//).uniq.sort
  number_x_4_letters = (number * 4).to_s.split(//).uniq.sort
  number_x_5_letters = (number * 5).to_s.split(//).uniq.sort
  number_x_6_letters = (number * 6).to_s.split(//).uniq.sort
  
  if (number_x_2_letters == number_x_3_letters) &&
     (number_x_3_letters == number_x_4_letters) &&
     (number_x_4_letters == number_x_5_letters) &&
     (number_x_5_letters == number_x_6_letters)
     true
  else
     false
  end
end

number = 10_000 # Starting at 10_000 since it has to have same digits when multiplied by 2,3,4,5 & 6, the number should have at least five digits
while true
  break if fits_criteria?(number)
  number += 1
  puts "Now processing #{number}" if number.modulo(1000) == 0
end
puts "Number is #{number}"  