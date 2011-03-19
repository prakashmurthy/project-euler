#!/usr/bin/env ruby
# Solution to Problem # 179 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=179

require File.expand_path(File.join(File.dirname(__FILE__), "..", "lib", "integer_functions"))

class NumberOfDivisors
  attr_accessor :count, :number, :current_number_of_divisors 
  
  def initialize
    @count                      = 0
    @number                     = 1
    @current_number_of_divisors = 0
    @next_number_of_divisors    = 0
  end
  
  def next
    @number += 1
    @current_number_of_divisors = @number.number_of_divisors
    @next_number_of_divisors = (@number + 1).number_of_divisors
    @count += 1 if @current_number_of_divisors  == @next_number_of_divisors
  end
    
end

MAX_NUMBER = 1e7
if __FILE__ == $0
  start_time = Time.new
  puts "Starting the program....\n\n"
  
  numbers = NumberOfDivisors.new
  while true
    numbers.next
    # puts "Number = #{numbers.number}; number of divisors = #{numbers.current_number_of_divisors}"
    puts "Processing #{numbers.number}; Time spent is #{(Time.now - start_time) / 60 } minutes." if (numbers.number % 10_000).zero?
    break if numbers.number == MAX_NUMBER
  end
  
  puts "\n\nThere are #{numbers.count} numbers meeting the criteria when max number is #{MAX_NUMBER}."
  puts "\n\nTime spent is #{(Time.now - start_time) / 60 } minutes"
end


# There are 986262 numbers meeting the criteria when max number is 10000000.0.
# Time spent is 466.48583455 minutes