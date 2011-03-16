#!/usr/bin/env ruby
# Solution to problem number 61 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=61

start_time = Time.new
puts "Starting up 3... 2... 1... GOOOOOOOOOO!\n\n"

MIN_NUMBER = 1_000
MAX_NUMBER = 10_000
@tri_numbers = []
@sqr_numbers = []
@penta_numbers = []
@hexa_numbers = []
@hepta_numbers = []
@octa_numbers = []

class Integer
  def third_number_non_zero?
    self.to_s[2] != '0'
  end
end

def next_elements(number, list_of_numbers)
  last_two_digits = number.to_s[2,2]
  next_elements_list = list_of_numbers.select {|second_number| second_number.to_s =~ /^#{last_two_digits.to_i}/}
  return next_elements_list
end

n = 1
while true 
  tri_number = n * (n + 1) / 2
  sqr_number = n**2
  penta_number = n * (3 * n -1 ) / 2
  hexa_number = n * (2 * n -1 )
  hepta_number = n * (5 * n -3 ) / 2
  octa_number = n * (3 * n -2 )
  
  break if tri_number > MAX_NUMBER
  @tri_numbers << tri_number if ( (tri_number < MAX_NUMBER) and (tri_number >= MIN_NUMBER) and (tri_number.third_number_non_zero?) )
  @sqr_numbers << sqr_number if ( (sqr_number < MAX_NUMBER) and (sqr_number >= MIN_NUMBER) and (sqr_number.third_number_non_zero?) )
  @penta_numbers << penta_number if ( (penta_number < MAX_NUMBER) and (penta_number >= MIN_NUMBER) and (penta_number.third_number_non_zero?) )
  @hexa_numbers << hexa_number if ( (hexa_number < MAX_NUMBER) and (hexa_number >= MIN_NUMBER) and (hexa_number.third_number_non_zero?) )
  @hepta_numbers << hepta_number if ( (hepta_number < MAX_NUMBER) and (hepta_number >= MIN_NUMBER) and (hepta_number.third_number_non_zero?) )
  @octa_numbers << octa_number if ( (octa_number < MAX_NUMBER) and (octa_number >= MIN_NUMBER) and (octa_number.third_number_non_zero?) )
  n += 1
end

puts "There are #{@tri_numbers.length} tri_numbers are #{@tri_numbers.join(', ')}\n\n"
puts "There are #{@sqr_numbers.length} sqr_numbers are #{@sqr_numbers.join(', ')}\n\n"
puts "There are #{@penta_numbers.length} penta_numbers are #{@penta_numbers.join(', ')}\n\n"
puts "There are #{@hexa_numbers.length} hexa_numbers are #{@hexa_numbers.join(', ')}\n\n"
puts "There are #{@hepta_numbers.length} hepta_numbers are #{@hepta_numbers.join(', ')}\n\n"
puts "There are #{@octa_numbers.length} octa_numbers are #{@octa_numbers.join(', ')}\n\n"

@octa_numbers.each do |octal|
  remaining_numbers = @tri_numbers + @sqr_numbers + @penta_numbers + @hexa_numbers + @hepta_numbers
  list = next_elements(octal, remaining_numbers)
  # unless list.empty?
  #   puts "Octal number #{octal} has the following linked elements: #{list.join(', ')}\n\n"
  # end
  list.each do |second_number|
    if @hepta_numbers.include?(second_number)
      remaining_numbers = remaining_numbers - @hepta_numbers
    elsif @hexa_numbers.include?(second_number)
      remaining_numbers = remaining_numbers - @hexa_numbers
    elsif @penta_numbers.include?(second_number)
      remaining_numbers = remaining_numbers - @penta_numbers
    elsif @sqr_numbers.include?(second_number)
      remaining_numbers = remaining_numbers - @sqr_numbers
    elsif @tri_numbers.include?(second_number)
      remaining_numbers = remaining_numbers - @tri_numbers
    end
    
    second_level_numbers = remaining_numbers
    second_list = next_elements(second_number, remaining_numbers)
    
    # unless second_list.empty?
    #   puts "Octal number #{octal} => Second number #{second_number} has the following linked list: #{second_list.join(', ')}\n\n"
    # end
    
    second_list.each do |third_number|
      remaining_numbers = second_level_numbers
      if @hepta_numbers.include?(third_number)
        remaining_numbers = remaining_numbers - @hepta_numbers
      elsif @hexa_numbers.include?(third_number)
        remaining_numbers = remaining_numbers - @hexa_numbers
      elsif @penta_numbers.include?(third_number)
        remaining_numbers = remaining_numbers - @penta_numbers
      elsif @sqr_numbers.include?(third_number)
        remaining_numbers = remaining_numbers - @sqr_numbers
      elsif @tri_numbers.include?(third_number)
        remaining_numbers = remaining_numbers - @tri_numbers
      end
      
      third_level_numbers = remaining_numbers
      third_list = next_elements(third_number, remaining_numbers)
      
      # unless third_list.empty?
      #   puts "#{octal} => #{second_number} => #{third_number} => #{third_list.join(', ')}\n\n"
      # end
      
      third_list.each do |fourth_number|
        remaining_numbers = third_level_numbers
        if @hepta_numbers.include?(fourth_number)
          remaining_numbers = remaining_numbers - @hepta_numbers
        elsif @hexa_numbers.include?(fourth_number)
          remaining_numbers = remaining_numbers - @hexa_numbers
        elsif @penta_numbers.include?(fourth_number)
          remaining_numbers = remaining_numbers - @penta_numbers
        elsif @sqr_numbers.include?(fourth_number)
          remaining_numbers = remaining_numbers - @sqr_numbers
        elsif @tri_numbers.include?(fourth_number)
          remaining_numbers = remaining_numbers - @tri_numbers
        end

        fourth_level_numbers = remaining_numbers
        fourth_list = next_elements(fourth_number, remaining_numbers)

        # unless fourth_list.empty?
        #   puts "#{octal} => #{second_number} => #{third_number} => #{fourth_number} => #{fourth_list.join(', ')}\n\n"
        # end
        
        fourth_list.each do |fifth_number|
          remaining_numbers = fourth_level_numbers
          if @hepta_numbers.include?(fifth_number)
            remaining_numbers = remaining_numbers - @hepta_numbers
          elsif @hexa_numbers.include?(fifth_number)
            remaining_numbers = remaining_numbers - @hexa_numbers
          elsif @penta_numbers.include?(fifth_number)
            remaining_numbers = remaining_numbers - @penta_numbers
          elsif @sqr_numbers.include?(fifth_number)
            remaining_numbers = remaining_numbers - @sqr_numbers
          elsif @tri_numbers.include?(fifth_number)
            remaining_numbers = remaining_numbers - @tri_numbers
          end

          fifth_level_numbers = remaining_numbers
          fifth_list = next_elements(fifth_number, remaining_numbers)

          # unless fifth_list.empty?
          #   puts "#{octal} => #{second_number} => #{third_number} => #{fourth_number} => #{fifth_number} => #{fifth_list.join(', ')}\n\n"
          # end
          
          fifth_list.each do |sixth_number|
            last_list = next_elements(sixth_number, @octa_numbers)
            last_list.each do |last_number|
              if last_number == octal
                puts "#{octal} => #{second_number} => #{third_number} => #{fourth_number} => #{fifth_number} => #{sixth_number} are cyclical!!"
                puts "The sum is #{octal + second_number + third_number + fourth_number + fifth_number + sixth_number}\n\n"
              end
            end
          end
        end
      end
    end
  end
end

puts "\n\nTime spent is #{(Time.now - start_time) / 60 } minutes"