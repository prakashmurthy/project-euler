#!/usr/bin/env ruby
# Solution to Problem # 97 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=97

class PowersOfTwo
  attr_reader :value
  def initialize(length)
    @length = length
    @value  = 1
  end
  
  def truncated_multiply
    @value *= 2
    new_value = @value.to_s.length > @length ? @value.to_s[-@length, @length].to_i : @value
    @value = new_value < 10**(@length - 1) ? @value : new_value
    # puts "The value is #{@value}."
    @value
  end
  
end    
      
if __FILE__ == $0
  start_time = Time.new
  puts "Starting the program....\n\n"
  powers_of_two = PowersOfTwo.new(10)
  7830457.times { powers_of_two.truncated_multiply }
  massive_prime = (powers_of_two.value * 28433) + 1
  puts "\n\nThe last 10 digits of the massive prime is #{massive_prime.to_s[-10,10]}"
  puts "\n\nTime spent is #{(Time.now - start_time) / 60 } minutes"
end

# $ time ruby projecteuler/prob_097_mersenne_prime.rb 
# Starting the program....
# 
# The last 10 digits of the massive prime is 8739992577
# 
# Time spent is 0.2850208833333333 minutes
# 
# real  0m17.130s
# user  0m17.026s
# sys 0m0.044s