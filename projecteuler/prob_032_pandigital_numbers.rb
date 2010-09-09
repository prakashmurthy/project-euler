#!/usr/bin/env ruby
# Solution to problem number 32 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=32

require "../lib/integer_functions"

start_time = Time.new

pandigital_array = []
products_array = []

multiplicand = 1
while multiplicand <= 100 # 100 * 100 = 10_000 the upper limit after which multiplier is always less than multiplicand
  multiplier = multiplicand
  while true 
    new_number = (multiplicand.to_s + multiplier.to_s + (multiplicand * multiplier).to_s).to_i
    length_of_full_number = (multiplicand.to_s + multiplier.to_s + (multiplicand * multiplier).to_s).length
    break if length_of_full_number > 9
    if (length_of_full_number == 9)
      if new_number.is_1to9_pandigital?
        pandigital_array << [multiplicand, multiplier, (multiplicand * multiplier)]
        products_array << (multiplicand * multiplier)
      end
    end
    multiplier += 1
  end
  multiplicand += 1
  puts "processing multiplicand = #{multiplicand}" if multiplicand.modulo(10) == 0
end
puts
puts "The pandigital combinations are #{pandigital_array.join(", ")}"
puts 

sum_of_products = 0

products_array.uniq.each do |product|
   sum_of_products += product
end

puts "The sum of products is #{sum_of_products}"
puts
puts "Time spent is #{(Time.now - start_time) / 60 }  minutes"

## Output from the execution
# The pandigital combinations are 4, 1738, 6952, 4, 1963, 7852, 12, 483, 5796, 18, 297, 5346, 27, 198, 5346, 28, 157, 4396, 39, 186, 7254, 42, 138, 5796, 48, 159, 7632
# 
# The sum of products is 45228
# 
# Time spent is 0.0103034166666667  minutes