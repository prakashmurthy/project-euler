#!/usr/bin/env ruby
# Solution to problem number 69 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=69

require File.expand_path(File.join(File.dirname(__FILE__), "..", "lib", "integer_functions"))

class Integer
  def eulers_totient
    # Logic based on explanation in http://mathworld.wolfram.com/TotientFunction.html
    return (self - 1) if Prime.prime?(self)

    eulers_totient_value   = self
    distinct_prime_factors = self.distinct_prime_factors    
    distinct_prime_factors.each do |prime_factor|
      eulers_totient_value = eulers_totient_value * (prime_factor - 1) / prime_factor
    end
    eulers_totient_value
  end
end

if __FILE__ == $0
  MAX_NUMBER       = 1_000_000
  max_n            = 0
  max_n_by_totient = 0
  (2..MAX_NUMBER/10).each do |number_by_10|
    number = number_by_10 * 10
    # next if Prime.prime?(number)
    n_by_totient = number * 1.0 / number.eulers_totient
    # puts "The euler's totient for #{number} is #{number.eulers_totient} & n_by is #{n_by_totient}."
    if n_by_totient > max_n_by_totient
      max_n_by_totient = n_by_totient
      max_n            = number
    end
  end
  puts "The maximum value of n / totient(n) is #{max_n_by_totient} for #{max_n} when MAX_NUMBER is #{MAX_NUMBER}."
end

#
# OUTPUT
#

# time ruby projecteuler/prob_069_eulers_totient.rb 
# The maximum value of n / totient(n) is 5.539388020833333 for 510510 when MAX_NUMBER is 1000000.
# 
# real  27m30.649s
# user  15m28.984s
# sys     0m9.882s