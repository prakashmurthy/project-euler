# Extends integer class to 
#  1. return the unit fraction, and 
#  2. the length of the recurring cycle 
#  3. the integer in words

class Integer
  
  def proper_divisors
    i = 1
    divisors_array = []
  
    while i < self
      #puts "Came here with i = #{i}"
      if self.modulo(i) == 0
        divisors_array.push(i)
      end
    
      if ((i >= (self/2)) and (i < self))
        i = self
      else
        i = i + 1
      end
  
    end
    divisors_array
  end

  def sum_of_proper_divisors
    divisors = self.proper_divisors
    total = 0
    divisors.each {|num| total = total + num}
    total
  end
  
  def reverse
    self.to_s.reverse.to_i
  end
   
  def has_only_odd_digits?
    self.to_s[/[02468]/].nil?
  end
  
  
  def bouncy?
      self_str = self.to_s
      length = self_str.length
      downward_flag = upward_flag = false
      for index in 1..(length-2)
        #puts self_str[(index - 1), 1]
        number_a = self_str[(index - 1),1].to_i 
        number_b = self_str[index,1].to_i
        number_c = self_str[(index + 1),1].to_i
        if ((number_a - number_b) > 0)
          first_direction = "decreasing"
          downward_flag = true
        elsif ((number_a - number_b) == 0)
          first_direction = "neutral"
        else 
          first_direction = "increasing"
          upward_flag = true
        end
        #puts "first_direction is #{first_direction}; downward_flag is #{downward_flag} & upward_flag is #{upward_flag}." # "decreasing", "neutral" or "increasing"
        #puts

        if ((number_b - number_c) > 0)
          next_direction = "decreasing"
          downward_flag = true
        elsif ((number_b - number_c) == 0)
          next_direction = "neutral"
        else 
          next_direction = "increasing"
          upward_flag = true
        end
        #puts "next_direction is #{next_direction}; downward_flag is #{downward_flag} & upward_flag is #{upward_flag}." # "decreasing", "neutral" or "increasing"
        #puts

        return true if (downward_flag and upward_flag)
      end
      false
    end
    
  # def is_1to9_pandigital?
  #   return false if (self.to_s =~ /1/).nil?
  #   return false if (self.to_s =~ /2/).nil?
  #   return false if (self.to_s =~ /3/).nil?
  #   return false if (self.to_s =~ /4/).nil?
  #   return false if (self.to_s =~ /5/).nil?
  #   return false if (self.to_s =~ /6/).nil?
  #   return false if (self.to_s =~ /7/).nil?
  #   return false if (self.to_s =~ /8/).nil?
  #   return false if (self.to_s =~ /9/).nil?
  #   return true
  # end
  
  def is_1to9_pandigital?
    return false if (self.to_s =~ /1/).nil?
    self.to_s.split(//).sort.join == "123456789"
  end
  
  def palindrome? 
    reverse_number = self.to_s.reverse.to_i
    reverse_number == self
  end
  
  def binary_representation
    number_of_digits_in_binary = 0
    while true
      break if self < 2**(number_of_digits_in_binary)
      number_of_digits_in_binary += 1
    end
    binary_string = ""
    new_number = self
    for position in (1..number_of_digits_in_binary)
      relevant_2_power = 2**(number_of_digits_in_binary - position)
      if new_number >= relevant_2_power
        binary_string += "1"
        new_number -= relevant_2_power
      else
        binary_string += "0"
      end
    end
    binary_string
  end
    
  def unit_fraction
    1.0/self
  end
  
  def recurring_cycle_length
    numerator = 1
    result = ""
    remainders_array = []
    count = 1
    length = 0
    remainder = 0
    append_zero = false
    
    while true
      #puts "numerator is #{numerator}; result is #{result}, remainder is #{remainder}, remainders_array: #{remainders_array.join(', ')}"
      if numerator > self
        # divide numerator by self, send divisor to result, and remainder to numerator
        factor, remainder = numerator.divmod(self)
        result += factor.to_s
        #puts "result is #{result}, remainder is #{remainder}, remainders_array: #{remainders_array.join(', ')}"
        #puts "value of remainders_array.include?(remainder) is #{remainders_array.include?(remainder)}"
        break if (remainder == 0) or (remainders_array.include?(remainder))
        numerator = remainder
        remainders_array << remainder
        append_zero = false
      else
        # multiply numerator by 10; modify reminder and result appropriately
        if result.empty?
          result = "0." 
        end
        numerator *= 10
        #puts "append_zero in else loop is #{append_zero}"
        if append_zero 
          result += '0'
          remainders_array << 'x'*count
          count += 1
        end
        append_zero = true
         
      end
    end
    #puts "result for #{self} is #{result}"
    if remainder > 0
      length = remainders_array.reverse.index(remainder) + 1
    end
    length
  end

  def to_words(separator=" ")
    number_to_words = {:"one" => 1,
                        :"two" => 2,
                        :"three" => 3,
                        :"four" => 4,
                        :"five" => 5,
                        :"six" => 6,
                        :"seven" => 7,
                        :"eight" => 8,
                        :"nine" => 9,
                        :"ten" => 10,
                        :"eleven" => 11,
                        :"twelve" => 12,
                        :"thirteen" => 13,
                        :"fourteen" => 14,
                        :"fifteen" => 15,
                        :"sixteen" => 16,
                        :"seventeen" => 17,
                        :"eighteen" => 18,
                        :"nineteen" => 19,
                        :"twenty" => 20,
                        :"thirty" => 30,
                        :"forty" => 40,
                        :"fifty" => 50,
                        :"sixty" => 60,
                        :"seventy" => 70,
                        :"eighty" => 80,
                        :"ninety" => 90,
                        :"hundred" => 100,
                        :"thousand" => 1000}
    
    if (self < 100 ) and number_to_words.has_value?(self)
      number_to_words.index(self)
    elsif (self > 20) and (self < 100)
      number_to_words.index((self/10)*10).to_s + separator + number_to_words.index(self.modulo(10)).to_s
    elsif (self >= 100) and (self < 1000) and (self.modulo(100) == 0)
      (self/100).to_words.to_s + separator + "hundred"
    elsif (self >= 100) and (self < 1000) and (self.modulo(100) > 0)
      number_to_words.index(self/100).to_s + separator + "hundred" + 
         separator + "and" + separator + (self.modulo(100)).to_words(separator).to_s
    elsif (self == 1000)
      "one" + separator + "thousand"
    else
      number_to_words.index(self/1000).to_s + separator + "thousand" + separator + (self.modulo(1000)).to_words(separator).to_s
    end
  end
  
end