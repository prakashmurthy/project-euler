#!/usr/bin/env ruby
# Solution to problem number 7 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=7
require 'prime'

class Problem007
  def Problem007.nth_prime(number)
    nth_prime = 1
    Prime.each_with_index do |prime, index|
      puts "prime : #{prime}; index : #{index}"
      nth_prime = prime
      break if index + 1 == number
    end
    nth_prime
  end
end

if __FILE__ == $0
  puts "The 6th prime number is #{Problem007.nth_prime(6)}"
end