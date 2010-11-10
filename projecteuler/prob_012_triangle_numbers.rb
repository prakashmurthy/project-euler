#!/usr/bin/env ruby
# Solution to Problem # 12 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=12

require File.expand_path(File.join(File.dirname(__FILE__), "..", "lib", "integer_functions"))

class TriangleNumbers
  def initialize 
    @index = 0
    @triangle_number = 0
  end
  
  def next
    @index += 1
    @triangle_number += @index
  end
  
end
       
if __FILE__ == $0
  start_time = Time.new
  puts "Starting the program....\n\n"
  max_divisors = 500
  triangle_numbers = TriangleNumbers.new
  count = 0
  while true
    count += 1 
    next_triangle_number = triangle_numbers.next
    divisor_count        = next_triangle_number.number_of_divisors
    break if divisor_count > max_divisors
    puts "Processing #{count}th Triangle number : #{next_triangle_number}." if (count % 1000).zero?
  end
  puts "\n\nThe #{count}th Triangle number is #{next_triangle_number}, and it has #{divisor_count} divisors."
  puts "\n\nTime spent is #{(Time.now - start_time) / 60 } minutes"
end

# Output from the execution! Finishes in less than half a minute!
# time ruby projecteuler/prob_012_triangle_numbers.rb
# Starting the program....
# 
# Processing 1000th Triangle number : 500500.
# Processing 2000th Triangle number : 2001000.
# Processing 3000th Triangle number : 4501500.
# Processing 4000th Triangle number : 8002000.
# Processing 5000th Triangle number : 12502500.
# Processing 6000th Triangle number : 18003000.
# Processing 7000th Triangle number : 24503500.
# Processing 8000th Triangle number : 32004000.
# Processing 9000th Triangle number : 40504500.
# Processing 10000th Triangle number : 50005000.
# Processing 11000th Triangle number : 60505500.
# Processing 12000th Triangle number : 72006000.
#
# The 12375th Triangle number is 76576500, and it has 576 divisors.
# 
# 
# Time spent is 0.4524478833333333 minutes
# 
# real  0m27.177s
# user  0m26.847s
# sys 0m0.091s