#!/usr/bin/env ruby
# Solution to problem number 10 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=10

require "prime"
MAX_NUMBER = 2_000_000
sum = 0
Prime.each do |p|
  sum += p if p < MAX_NUMBER
  break if p > MAX_NUMBER
end
puts "Sum of primes under #{MAX_NUMBER} is #{sum}"

# Output from the execution
# Sum of primes under 2000000 is 142913828922
# Program exited with code #0 after 10.89 seconds.