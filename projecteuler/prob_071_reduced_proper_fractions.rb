#!/usr/bin/env ruby
# Solution to problem number 71 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=71

start_time = Time.new

reduced_proper_fractions = {}

max_less_than_3by7 = 0
max_less_than_3by7_sting = ""

THREE_BY_SEVEN = 3.0/7.0

x = 1.0
y = 1.0
while x <=1_000_000.0
  while y < x
    fraction = y/x
    if (fraction > max_less_than_3by7) and (fraction < THREE_BY_SEVEN)
      max_less_than_3by7 = fraction
      max_less_than_3by7_sting = "_" + y.to_s + "by" + x.to_s
    end
    break if fraction >= THREE_BY_SEVEN
    #reduced_proper_fractions[(y/x)] = "_" + y.to_s + "by" + x.to_s
    y = y + 1
  end
  y = (x *  THREE_BY_SEVEN).to_i
  x = x + 1
  print "."  if x.modulo(100) == 0
  STDOUT.flush
end 
# 
# new_array = reduced_proper_fractions.sort.select{|k,v| k < 3.0/7.0}
# puts
# puts "the value is #{new_array.pop}"
puts
puts "The required value is #{max_less_than_3by7} for #{max_less_than_3by7_sting} "
#puts "The constant is #{THREE_BY_SEVEN}"
puts "Time spent is #{(Time.now - start_time) / 60 }  minutes"