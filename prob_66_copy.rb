#!/usr/bin/env ruby
# Solution to problem number 66 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=66
require 'mathn'
# require 'prime'
start_time = Time.new
puts "Starting up 3... 2... 1... GOOOOOOOOOO!\n\n"

class Integer
  def perfect_square?
    (Math.sqrt(self).to_i)**2 == self
  end
  
  def minimal_solution_for_x
    x = 1
    while true
      y_squared = (x**2 - 1.0) / self
      puts "x = #{x} y_squared = #{y_squared} self = #{self}"
      if y_squared.to_i == y_squared and !y_squared.zero?
        break if y_squared.to_i.perfect_square?
      end
      x += 1
      # if x > 10_000
      #   puts "\n\n#{self} out of bounds.\n\n"
      #   break
      # end
    end
    x
  end
end

# MAX_NUMBER = 1_000
# 
# max_x = 0
# d_with_max_x = 0
# 
# 
# (2..MAX_NUMBER).each do |number|
#   puts "number is #{number}. Time spent is #{(Time.now - start_time) / 60 }  minutes"
#   next if number.perfect_square?
#   minimal_solution = number.minimal_solution_for_x
#   if minimal_solution > max_x
#     max_x = minimal_solution
#     d_with_max_x = number
#   end
#   
# end

# puts "The max value of x when D <= #{MAX_NUMBER} is #{max_x} for D = #{d_with_max_x}"
puts "minimal solution for 61 is #{61.minimal_solution_for_x}"

puts "\n\nTime spent is #{(Time.now - start_time) / 60 }  minutes"