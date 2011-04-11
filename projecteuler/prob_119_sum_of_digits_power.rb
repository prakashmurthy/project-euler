#!/usr/bin/env ruby
# Solution to problem number 119 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=119

class Integer
  def sum_of_digits
    self.to_s.split(//).inject(0) { |sum, num_s| sum + num_s.to_i }
  end
end

if __FILE__ ==$0
  REQUIRED_TERM            = 30
  
  start_number             = 10
  end_number               = 1_000_000
  length_of_longest_number = 6
  result_set               = []
  
  while true
    
    (2..(length_of_longest_number * 9)).each do |number|
      power = 0
      number_raised = number**power
      while number_raised <= end_number
        if ( number_raised > start_number ) && ( number_raised.sum_of_digits == number )
          puts "#{number_raised} = #{number}^#{power}"
          result_set << number_raised
        end
        power += 1
        number_raised = number**power
      end
    end
    
    if result_set.length > REQUIRED_TERM
      break
    else
      start_number             =  end_number
      end_number               *= 10
      length_of_longest_number += 1
    end
  end
  puts "\n\nThe numbers are #{result_set.sort.join(', ')}\n\n"
  puts "The #{REQUIRED_TERM} term is #{result_set.sort[REQUIRED_TERM-1]}"
end

#
#  OUTPUT
#

# The numbers are 81, 512, 2401, 4913, 5832, 17576, 19683, 234256, 390625, 614656, 1679616, 17210368, 34012224, 52521875, 60466176, 205962976, 612220032, 8303765625, 10460353203, 24794911296, 27512614111, 52523350144, 68719476736, 271818611107, 1174711139837, 2207984167552, 6722988818432, 20047612231936, 72301961339136, 248155780267521, 3904305912313344
# 
# The 30 term is 248155780267521
# 
# real  0m0.058s
# user  0m0.038s
# sys   0m0.011s