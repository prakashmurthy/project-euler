#!/usr/bin/env ruby
# Solution to problem number 35 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=35
# prob_035_circular_primes.rb

def primeArray(number)
  @sieve = Array.new(number)
  
  for count in 2..Math.sqrt(number)
    next if @sieve[count]
    
    for inner_count in 2..number/count
      @sieve[count * inner_count] = true
    end
  end
  @sieve
end

max_number = 1_000_000
primeArray(max_number)

class String
  def rotate()
    rotations_array = []
    
    for count in 1..self.length
      new_string = ""
      for inner_count in 1..self.length
        new_string += self[inner_count - count, 1]
      end
      rotations_array << new_string
    end
    rotations_array
  end
end

for number in 2..max_number
  next if !@sieve[number].nil?
  
  rotations = number.to_s.rotate
  is_circular = true
  
  rotations.each do |number_string|
    #puts "#{number_string} now "
    is_circular = false if !@sieve[number_string.to_i].nil?
    break if !is_circular
  end

  if !is_circular
    rotations.each do |number_string|
      next if number_string[0,1] == "0"
      @sieve[number_string.to_i] = true
    end
  end
end


number_of_circular_primes = 0
for number in 2..max_number
  print "#{number} | " if @sieve[number].nil?
  number_of_circular_primes += 1 if @sieve[number].nil?
end

puts 
puts "There are #{number_of_circular_primes} circular primes under #{number}"

#puts "#{11.to_s.rotate.join(', ')}"