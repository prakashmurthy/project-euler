#!/usr/bin/env ruby
# Solution to problem number 73 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=73

start_time = Time.new
puts "Start time is #{start_time}"

x = 1.0
y = 1.0
fractions_array = []
while x <=12_000.0
  while y < x
    fraction = y/x
    fractions_array << fraction if (fraction > 1.0/3.0) and (fraction < 1.0/2.0)
    break if fraction > 0.5
    y = y + 1
  end
  y = (x/3.0).to_i
  x = x + 1
  print "."  if x.modulo(100) == 0
  STDOUT.flush
end 
puts
puts "There are #{fractions_array.uniq.length} fractions between 1/3 and 1/2 in a sorted set of reduced proper fractions for d <= 12_000"
puts "Time spent is #{(Time.now - start_time) / 60 }  minutes"