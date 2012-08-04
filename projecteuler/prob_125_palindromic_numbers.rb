#!/usr/bin/env ruby
# Solution to problem number 125 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=125

require File.expand_path(File.join(File.dirname(__FILE__), "..", "lib", "integer_functions"))
 
start_time = Time.new
puts "Starting up 3... 2... 1... GOOOOOOOOOO!\n\n"

MAX_NUMBER = 10**8

squares = [1,4]
number = 3
while true
  squares << number**2
  break if (squares[-1] ||= 0) + (squares[-2] ||= 0) > MAX_NUMBER
  number += 1
end

start_index = 0
end_index   = 1
palindrome_sum = []
while start_index < (MAX_NUMBER - 1)
  sum = squares[start_index]  
  while end_index <   squares.length
    sum += squares[end_index]
    break if sum > MAX_NUMBER
    palindrome_sum << sum if sum.palindrome?
    end_index += 1
  end
  start_index += 1
  end_index = start_index + 1
  # puts "Processing start_index = #{start_index}. Time spent is #{(Time.now - start_time) / 60 }  minutes" if (start_index % 100_000).zero?
end
# puts "There are #{palindrome_sum.count} squares with max_number = #{MAX_NUMBER}.\n\n"
# puts "Squares : #{palindrome_sum.join(', ')}\n\n"
puts "Sum of all palindromic numbers less than #{MAX_NUMBER} that can be written as sum of consecutive squares is #{palindrome_sum.uniq.inject {|sum, number| sum + number}}."
puts "\n\nTime spent is #{(Time.now - start_time) / 60 }  minutes"

# Output from execution
# Sum of all palindromic numbers less than 100000000 that can be written as sum of consecutive squares is 2906969179.
# 
# Time spent is 0.3635408666666667  minutes