#!/usr/bin/env ruby
# Solution to problem number 33 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=33
# projecteuler/prob_033_cancel_fractions.rb

start_time = Time.new

def has_common_element?(x,y)
  x.to_s =~ /[#{y}]/
end

count = 0 

for number in (11..99)
  next if number.modulo(10) == 0
  for denominator in ((number+1)..99)
    next if denominator.modulo(10) == 0
    zero_or_one = has_common_element?(number, denominator)
    if zero_or_one
      zero_or_one == 1? other_digit_in_numerator = number/10 : other_digit_in_numerator = number.modulo(10)
      
      zero_or_one_denominator = has_common_element?(denominator, number)
      zero_or_one_denominator == 1? other_digit_in_denominator = denominator/10 : other_digit_in_denominator = denominator.modulo(10)
      if ((number.to_f/denominator) == (other_digit_in_numerator.to_f/other_digit_in_denominator))
        puts "#{number}/#{denominator}, #{other_digit_in_numerator}/#{other_digit_in_denominator}"  
      end
      count += 1
    end
  end
end
#puts "There are #{count} elements."
puts
puts "Time spent is #{(Time.now - start_time) / 60 }  minutes"

## Output from execution# 
# 16/64, 1/4
# 19/95, 1/5
# 26/65, 2/5
# 49/98, 4/8
# 
# Time spent is 0.00188603333333333  minutes