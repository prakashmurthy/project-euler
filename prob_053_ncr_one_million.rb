#!/usr/bin/env ruby
# Solution to problem number 53 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=53

class Integer
  def factorial 
    if self <= 1
      1
    else 
      self * ( self -1 ).factorial
    end
  end
end


ncr_one_million_count = []

n = 1
r = 0
while n <= 100
  while r <= n
    ncr_value = n.factorial / (r.factorial * (n-r).factorial)
    if ncr_value > 1000000
      puts "N is #{n}; r is #{r}. Gives #{ncr_value}"
      ncr_one_million_count << 1
    end
    r = r + 1
  end
  r = 0
  n = n + 1
end
puts "There are #{ncr_one_million_count.count} ncr values greater than one million when 1 <= N <= 100"