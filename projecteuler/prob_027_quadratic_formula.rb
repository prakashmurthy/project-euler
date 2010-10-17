#!/usr/bin/env ruby
# Solution to problem number 27 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=27

require 'prime'
# puts Prime.each.take_while {|p| p <= 20 }

start_time = Time.new
puts "Starting up 3... 2... 1... GOOOOOOOOOO!\n\n"

def quadratic_formula(n, a, b)
  n**2 + a * n + b
end

max_primes = 0
max_ab = []

(-999..+999).each do |a|
  (-999..+999).each do |b|
    # puts "Processing a = #{a} and b = #{b}"
    n = -1
    number_of_primes = 0
    while true
      n += 1
      if Prime.prime?(quadratic_formula(n, a, b))
        number_of_primes += 1
      else
        break
      end
    end
    if number_of_primes > max_primes
      max_primes = number_of_primes
      max_ab = a, b, (a * b)
      puts "\n\n#{max_ab.join(', ')} has #{max_primes} number of primes. Time spent is #{(Time.now - start_time) / 60 } minutes\n\n"
    end
  end
end

puts "\n\n#{max_ab.join(', ')} has #{max_primes} number of primes."
puts "FINISH!!! Time spent is #{(Time.now - start_time) / 60 } minutes\n"

#Output from execution
# -61, 971, -59231 has 71 number of primes.
# FINISH!!! Time spent is 0.9381342166666666 minutes