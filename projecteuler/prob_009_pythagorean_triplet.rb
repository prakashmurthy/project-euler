#!/usr/bin/env ruby
# Solution to Problem 9 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=9

# A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
# 
# a^2 + b^2 = c^2
# For example, 32 + 42 = 9 + 16 = 25 = 52.
# 
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

a = 1
b = 2
c = 3

quit = false

while c < 1000
  while (b < c)
    while (a < b)
      sum = a + b + c
      ab_squared = a*a + b*b
      c_squared = c*c
      if ( ab_squared == c_squared) 
        #puts "Pythagorean triplets - a = #{a}; b = #{b}; c = #{c}; ab_squared = #{ab_squared} & c_squared = #{c_squared} "
        quit = true if (sum == 1000)
        break
      end
      break if ((ab_squared > c_squared) or (sum > 1000))
      a = a + 1
    end
    break if quit
    b = b + 1
    a = 1
  end
  break if quit
  c = c + 1
  puts "Now processing 'c' = #{c}" if c.modulo(100) == 0
  a = 1
  b = 2
end

puts "a = #{a}; b = #{b}; c = #{c}; ab_squared = #{ab_squared} & c_squared = #{c_squared} "
puts "The product of these three is #{a*b*c}"