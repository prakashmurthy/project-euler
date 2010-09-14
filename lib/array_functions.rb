class Array

 def sort_index
  d=[]
  self.each_with_index{|x,i| d[i]=[x,i]}
  if block_given?
   d.sort {|x,y| yield x[0],y[0]}.collect{|x| x[1]}
  else
   d.sort.collect{|x| x[1]}
  end
 end

 def sort_by(ord=[])
  return nil if self.length!=ord.length
  self.values_at(*ord)
 end

end


# a = [21, 33, 11, 34, 36, 24, 14]
# p a
# p b=a.sort_index
# p a.sort_by(b)
# p c=a.sort_index {|x,y| x%2 <=> y%2}
# p a.sort_by(c)