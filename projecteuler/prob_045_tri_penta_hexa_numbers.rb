#!/usr/bin/env ruby
# Solution to problem number 45 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=45

start_number = 40755

triangle_number_count = 286
pentagonal_number_count = 166
hexagonal_number_count = 144

while true
  next_triangle_number = triangle_number_count * (triangle_number_count + 1) /2
  next_pentagonal_number = pentagonal_number_count * (3 * pentagonal_number_count - 1) /2
  next_hexagonal_number = hexagonal_number_count * (2 * hexagonal_number_count - 1)

  break if (next_triangle_number == next_pentagonal_number) && (next_pentagonal_number == next_hexagonal_number)
  
  triangle_number_count += 1 if  ((next_triangle_number < next_pentagonal_number) && 
                                  (next_pentagonal_number <= next_hexagonal_number)) ||
                                 ((next_triangle_number < next_hexagonal_number) && 
                                  (next_hexagonal_number <= next_pentagonal_number)) ||
                                 ((next_triangle_number == next_pentagonal_number) &&
                                  (next_pentagonal_number < next_hexagonal_number))
                                  
  pentagonal_number_count += 1 if ((next_pentagonal_number < next_triangle_number) && 
                                   (next_triangle_number <= next_hexagonal_number)) ||
                                  ((next_pentagonal_number < next_hexagonal_number) && 
                                   (next_hexagonal_number <= next_triangle_number)) ||
                                  ((next_pentagonal_number == next_hexagonal_number) &&
                                   (next_hexagonal_number < next_triangle_number))
                                  
  hexagonal_number_count += 1 if ((next_hexagonal_number < next_triangle_number) && 
                                  (next_triangle_number <= next_pentagonal_number)) ||
                                 ((next_hexagonal_number < next_pentagonal_number) && 
                                  (next_pentagonal_number <= next_triangle_number)) ||
                                 ((next_hexagonal_number == next_triangle_number) &&
                                  (next_triangle_number < next_pentagonal_number))
  puts "Number : #{next_triangle_number}, #{next_pentagonal_number} & #{next_hexagonal_number} / Triangle count   : #{triangle_number_count},  Pentagonal count : #{pentagonal_number_count},  Hexagonal count  : #{hexagonal_number_count}"
end

puts "Number           : #{next_triangle_number}, 
      Triangle count   : #{triangle_number_count}, 
      Pentagonal count : #{pentagonal_number_count}, 
      Hexagonal count  : #{hexagonal_number_count}"