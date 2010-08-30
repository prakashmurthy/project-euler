#!/usr/bin/env ruby
# Solution to problem number 28 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=28

## Most of the work required for solving this problem is in figuring out the sequence for each of the corner elements; 
## Once that was worked out, finding out the sum of diagonal elements was a piece of cake!
north_east_prev = 1
south_east_prev = 1
south_west_prev = 1
north_west_prev = 1

total = 1
spiral = 3
count = 1

while spiral <= 1001
  north_east_prev = north_east_prev + (2 * count)
  #puts "north_east_prev is #{north_east_prev}"
  total += north_east_prev
  count += 1
  
  south_east_prev = south_east_prev + (2 * count)
  #puts "south_east_prev is #{south_east_prev}"
  total += south_east_prev
  count += 1
  
  south_west_prev = south_west_prev + (2 * count)
  #puts "south_west_prev is #{south_west_prev}"
  total += south_west_prev
  count += 1
  
  north_west_prev = north_west_prev + (2 * count)
  #puts "north_west_prev is #{north_west_prev}"
  total += north_west_prev
  count += 1
  
  spiral += 2
  #puts "Spiral count is #{spiral}"
end

puts "Sum of the numbers on the diagonals in a 1001 by 1001 spiral is #{total}"