#!/usr/bin/env ruby
# Solution to problem number 104 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=104

start_time = Time.new
puts "Starting up 3... 2... 1... GOOOOOOOOOO!\n\n"

class Integer
  def beginning_1to9_pandigital?
    self.to_s[0..8].split(//).sort.join == "123456789"
  end
  
  def ending_1to9_pandigital?
    return false if self.to_s.length < 9
    self.to_s[-9..-1].split(//).sort.join == "123456789"
  end
end

i = 0
j = 1
count = 0

while true
  count += 1
  puts "Processing #{count}th Fibonacci number. Time spent is #{(Time.now - start_time) / 60 }  minutes" if (count % 1_000).zero?
  k = j
  j = i + j
  i = k

  break if j.ending_1to9_pandigital? and j.beginning_1to9_pandigital?
end

puts "The #{count + 1}th Fibonacci number is 1-9 pandigital."
# is_1to9_pandigital?
puts "\n\nTime spent is #{(Time.now - start_time) / 60 }  minutes"