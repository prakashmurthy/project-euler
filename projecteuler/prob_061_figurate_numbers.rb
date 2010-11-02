#!/usr/bin/env ruby
# Solution to problem number 61 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=61

start_time = Time.new
puts "Starting up 3... 2... 1... GOOOOOOOOOO!\n\n"

MIN_NUMBER = 1_000
MAX_NUMBER = 10_000
tri_numbers = []
sqr_numbers = []
penta_numbers = []
hexa_numbers = []
hepta_numbers = []
octa_numbers = []

n = 1
while true 
  tri_number = n * (n + 1) / 2
  sqr_number = n**2
  penta_number = n * (3 * n -1 ) / 2
  hexa_number = n * (2 * n -1 )
  hepta_number = n * (5 * n -3 ) / 2
  octa_number = n * (3 * n -2 )
  
  break if tri_number > MAX_NUMBER
  tri_numbers << tri_number if tri_number < MAX_NUMBER and tri_number >= MIN_NUMBER
  sqr_numbers << sqr_number if sqr_number < MAX_NUMBER and sqr_number >= MIN_NUMBER
  penta_numbers << penta_number if penta_number < MAX_NUMBER and penta_number >= MIN_NUMBER
  hexa_numbers << hexa_number if hexa_number < MAX_NUMBER and hexa_number >= MIN_NUMBER
  hepta_numbers << hepta_number if hepta_number < MAX_NUMBER and hepta_number >= MIN_NUMBER
  octa_numbers << octa_number if octa_number < MAX_NUMBER and octa_number >= MIN_NUMBER
  n += 1
end

puts "tri_numbers are #{tri_numbers.join(', ')}\n\n"
puts "sqr_numbers are #{sqr_numbers.join(', ')}\n\n"
puts "penta_numbers are #{penta_numbers.join(', ')}\n\n"
# puts "hexa_numbers are #{hexa_numbers.join(', ')}"
# puts "hepta_numbers are #{hepta_numbers.join(', ')}"
# puts "octa_numbers are #{octa_numbers.join(', ')}"

def next_element_array(number, number_array)
  number_array.select { |num2| num2.to_s =~ /^#{number.to_s[2,2].to_i}/ }
end

# puts "next elements for 2010 in penta_numbers is #{next_element_array(2010, penta_numbers).join(', ')}"

remaining_arrays = [sqr_numbers, tri_numbers]
result_array = []

penta_numbers.each do |number|
# number = penta_numbers[0]
  result_array << number
  count = 0
  while !remaining_arrays.empty?
    observing_array = remaining_arrays[count]
    next_array = next_element_array(result_array[-1], observing_array)
    
    if !next_array.empty?
      remaining_arrays.delete(observing_array)
      
      next_array.each_with_index do |next_number, index|
        result_array << next_number
        count = 0
        
        puts "next_number # #{index} is #{next_number}"
      end
    else
      count += 1
    end
    
  end
end

puts "\n\nTime spent is #{(Time.now - start_time) / 60 }  minutes"