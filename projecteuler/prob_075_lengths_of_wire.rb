#!/usr/bin/env ruby
# Solution to problem number 75 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=75
# projecteuler/prob_074_lengths_of_wire.rb

start_time = Time.new
puts "Starting up 3... 2... 1... GOOOOOOOOOO!\n\n"

MAX_LENGTH = 1_500_000
right_angle_triangles = Hash.new(0)

(1...MAX_LENGTH).each do |x|
  puts "Processing #{x}; Time spent is #{(Time.now - start_time) / 60 }  minutes" if (x % 10_000).zero?
  (1...x).each do |y|
    next if x + y > MAX_LENGTH
    (1...y).each do |z|
      next if x + y + z > MAX_LENGTH
      if x**2 == y**2 + z**2
        # puts "x = #{x} ; y = #{y} ; z = #{z}"
        right_angle_triangles[x+y+z] += 1 
      end
    end
  end
end

count = 0
right_angle_triangles.each do |key, value|
  # puts "Key = #{key} : Value = #{value}"
  if value == 1
    # puts "#{key} has only one combination."
    count += 1
  end
end

puts "\n\nThere are #{count} numbers <= #{MAX_LENGTH} with only one combination.\n\n"

puts "Time spent is #{(Time.now - start_time) / 60 }  minutes"