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
end