#!/usr/bin/env ruby
# Solution to problem number 206 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=206
# prob_206_concealed_square.rb

start_time = Time.now
puts "Started at #{start_time}."

start_number_string = end_number_string = ''
for n in (1..9)
  start_number_string += n.to_s + '0'
  end_number_string += n.to_s + '9'
end

start_number_string += '0'
end_number_string +=  '0'

 puts "Start number string is #{start_number_string.to_i} and end number string is #{end_number_string.to_i}"
# 
# puts "difference in numbers is #{end_number_string.to_i - start_number_string.to_i}"
# 
puts "The answer to your question lies between #{Math.sqrt(start_number_string.to_i).to_i} and #{Math.sqrt(end_number_string.to_i).to_i}"

class Integer
  def is_number_of_required_form?
    return false if self.to_s[0,1] != '1'
    return false if self.to_s[2,1] != '2'
    return false if self.to_s[4,1] != '3'
    return false if self.to_s[6,1] != '4'
    return false if self.to_s[8,1] != '5'
    return false if self.to_s[10,1] != '6'
    return false if self.to_s[12,1] != '7'
    return false if self.to_s[14,1] != '8'
    return false if self.to_s[16,1] != '9'
    return false if self.to_s[18,1] != '0'
    return true
  end
  
  def ends_with_30?
    self.to_s[(self.to_s.length - 2), 2] == '30'
  end
  
  def ends_with_70?
    self.to_s[(self.to_s.length - 2), 2] == '70'
  end
end

# puts "For start number: #{start_number_string.to_i.is_number_of_required_form?}"
# puts "For end number: #{end_number_string.to_i.is_number_of_required_form?}"
# puts "For end number - 4000 : #{(end_number_string.to_i - 4000).is_number_of_required_form?}"
# puts "For end number - 4001 : #{(end_number_string.to_i - 4001).is_number_of_required_form?}"

#for number in ((Math.sqrt(start_number_string.to_i).to_i)..(Math.sqrt(end_number_string.to_i).to_i)).step(10)
number = Math.sqrt(start_number_string.to_i).to_i + 20 # To make the number end in 30
puts "Number now is #{number}"

while true
  #break if start_number_string.to_i.is_number_of_required_form?
  break if (number**2).is_number_of_required_form?
  if number.ends_with_30?
    number += 40 
  else
    number += 60
  end
  puts "processing #{number}" if (number-70).modulo(100000) == 0
  #STDOUT.flush
end

puts "The number is #{number}, and it's square is #{number**2}"
finish_time = Time.now
puts "Finished at #{finish_time}."
puts "Time spent is #{(finish_time - start_time) / 60 }  minutes"

#OUTPUT FROM SECOND ATTEMPT AFTER INCLUDING LOGIC FOR LAST NUMBER BEING ZERO
# The number is 1389019170, and it's square is 1929374254627488900
# Finished at Wed Sep 08 18:28:18 -0600 2010.
# Time spent is 50.6771063666667  minutes

#OUTPUT FROM THIRD ATTEMPT AFTER INCLUDING LOGIC FOR LAST TWO NUMBERS BEING EITHER "30" or "70"
# The number is 1389019170, and it's square is 1929374254627488900
# Finished at Wed Sep 08 19:05:45 -0600 2010.
# Time spent is 6.66842705  minutes
