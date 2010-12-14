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
  
  def beginning_1to4_pandigital?
    self.to_s[0..3].split(//).sort.join == "1234"
  end
  
  def ending_1to4_pandigital?
    return false if self.to_s.length < 9
    self.to_s[-4..-1].split(//).sort.join == "1234"
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
  
  # if j.beginning_1to4_pandigital? 
  #   puts "\n\nThe #{count + 1}th Fibonacci number has first four digits as 1-4 pandigital.\n\n"
  # end
  # if j.ending_1to4_pandigital? 
  #   puts "\n\nThe #{count + 1}th Fibonacci number has last four digits as 1-4 pandigital.\n\n"
  # end
  # break if j.ending_1to4_pandigital? && j.beginning_1to4_pandigital?

  if j.beginning_1to9_pandigital? 
    puts "\n\nThe #{count + 1}th Fibonacci number has first nine digits as 1-9 pandigital.\n\n"
  end
  if j.ending_1to9_pandigital? 
    puts "\n\nThe #{count + 1}th Fibonacci number has last nine digits as 1-9 pandigital.\n\n"
  end
  break if j.ending_1to9_pandigital? && j.beginning_1to9_pandigital?
end

puts "The #{count + 1}th Fibonacci number is 1-9 pandigital on both ends."
# is_1to9_pandigital?
puts "\n\nTime spent is #{(Time.now - start_time) / 60 }  minutes"