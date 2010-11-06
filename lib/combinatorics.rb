class Integer
  def factorial 
    if self <= 1
      1
    else 
      self * ( self -1 ).factorial
    end
  end
  
  def permutation(r)
    self.factorial / (self - r).factorial
  end
  
  def combination(r)
    self.permutation(r) / r.factorial
  end  
end

if __FILE__ == $0
  
  MAX_NUMBER = 4

  (1..MAX_NUMBER).each do |choose|
    puts "#{MAX_NUMBER}_P_#{choose} = #{MAX_NUMBER.permutation(choose)} : #{MAX_NUMBER}_C_#{choose} = #{MAX_NUMBER.combination(choose)}"
  end

  puts 1_000_000**20_000

end