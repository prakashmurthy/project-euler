# Extends Integer class to return the factorial for an integer
# used in solutions for multiple problems at Project Euler

class Integer
  def factorial 
    if self <= 1
      1
    else 
      self * ( self -1 ).factorial
    end
  end
  
  def factorials_sum
    self_str = self.to_s
    length = self_str.length
    factorials_sum = 0
    for count in 1..length
      #puts "#{self_str[(count-1), 1]}"
      digit = self_str[(count-1), 1].to_i
      factorials_sum += digit.factorial
    end
    factorials_sum
  end
end