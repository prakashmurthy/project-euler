#!/usr/bin/env ruby
# Solution to problem number 47 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=47

require 'prime'
# puts Prime.each.take_while {|p| p <= 20 }

start_time = Time.new
puts "Starting up 3... 2... 1... GOOOOOOOOOO!\n\n"

class Integer
  def distinct_prime_factors
    prime_factors = []
    number = self
    Prime.each do |prime_no|
      if (number % prime_no).zero?
        prime_factors << prime_no
        number = number / prime_no while (number % prime_no).zero?
      end
      break if number == 1
    end
    prime_factors
  end
end
   
# puts "Prime factors of 644 are #{644.distinct_prime_factors.join(', ')}"     
number = 2

sequence = 0

required_primes_count = 4
required_sequence = 4

while true
  number.distinct_prime_factors.length == required_primes_count ? sequence += 1 : sequence = 0
  break if sequence == required_primes_count
  number += 1 
  puts "Processing #{number}. Time spent is #{(Time.now - start_time) / 60 } minutes\n " if (number % 1_000).zero?
end

puts "\n\n#{number - required_primes_count + 1} is first in the sequence."
puts "FINISH!!! Time spent is #{(Time.now - start_time) / 60 } minutes\n"

#Output from execution
# 134043 is first in the sequence.
# FINISH!!! Time spent is 39.966287533333336 minutes