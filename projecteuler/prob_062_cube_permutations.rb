#!/usr/bin/env ruby
# Solution to problem number 62 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=62
# projecteuler/prob_062_cube_permutations.rb

start_time = Time.new
def permutations?(first_number, second_number)
  first_number.to_s.split(//).sort == second_number.to_s.split(//).sort
end

def fill_cubes_array(number)
  cubes_array = []
  while true # to group cubes with same length
    cube = number**3
    cube_length = cube.to_s.length
    next_number_cube_length = ((number + 1)**3).to_s.length
    cubes_array << cube
    number += 1
    break if cube_length < next_number_cube_length
  end
  return cubes_array, number
end

number = 345
# puts "Cubes array has #{cubes_array.length} elements. They are #{cubes_array.join(', ')}\n\n"
# puts "Next number is #{next_number}"

set_of_cubes_found = false
REQUIRED_NUMBER_OF_CUBES = 5
while !set_of_cubes_found
  cubes_array, number = fill_cubes_array(number)
  while !set_of_cubes_found
    ref_cube = cubes_array.shift
  
    cubes_set = []
    cubes_set << ref_cube
  
    break if cubes_array.length == 1
    (1..cubes_array.length).each do |index|
      other_cube = cubes_array[index - 1]
      #puts "Ref cube is #{ref_cube}. Other cube is #{other_cube}."
      if permutations?(ref_cube, other_cube)
        cubes_array.delete(other_cube)
        cubes_set << other_cube
        if cubes_set.length == REQUIRED_NUMBER_OF_CUBES
          set_of_cubes_found = true
        end
      end
    end
  end
  if set_of_cubes_found
    puts "The smallest cube for which exactly #{REQUIRED_NUMBER_OF_CUBES} permutations of its digits are cubes is #{ref_cube}.\n\nThe combinations are #{cubes_set.join(', ')}"
  else
    puts "There are no cubes that match the criteria when cubes length is #{ref_cube.to_s.length}."
  end
end

puts "\nTime spent is #{(Time.now - start_time) / 60 } minutes."