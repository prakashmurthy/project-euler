#!/usr/bin/env ruby
# Solution to problem number 102 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=102
# prob_102_triangles.rb

#
#  Solved using the formula for area of triangle from vertices 
#  given in http://www.mathopenref.com/coordtrianglearea.html
# 

#
#  If the origin is within the triangle, then the area of three triangles
#  formed by the three sides with the origin will be equal to the 
#  area of the triangle in question. 
#

require 'open-uri'

class Triangle
  attr_reader :area
  
  def initialize(point_a, point_b, point_c)
    @area = ( (point_a[0] * (point_b[1] - point_c[1]) + point_b[0] * (point_c[1] - point_a[1]) +  point_c[0] * (point_a[1] - point_b[1]) ) * 1.0 / 2.0 ).abs
  end
end

class TriangleAndPoint
  attr_reader :contains_origin
  
  def initialize(point_a, point_b, point_c)
    origin = [0,0]
    
    main_triangle = Triangle.new(point_a, point_b, point_c)
    
    sub_triangle_1 = Triangle.new(point_a, point_b, origin)
    sub_triangle_2 = Triangle.new(point_a, origin, point_c)
    sub_triangle_3 = Triangle.new(origin, point_b, point_c)
    
    @contains_origin = ( main_triangle.area == sub_triangle_1.area + sub_triangle_2.area + sub_triangle_3.area )
  end
  
end

if __FILE__ == $0
  number_of_triangles_containing_origin = 0
    
  input_file = open("http://projecteuler.net/project/triangles.txt")
  input_file.each do |line|
    input = []
    input << line.split(',').map {|num_str| num_str.to_i}
    point_a = [input[0][0], input[0][1]]
    point_b = [input[0][2], input[0][3]]
    point_c = [input[0][4], input[0][5]]
    
    triangle = TriangleAndPoint.new(point_a, point_b, point_c)
    
    number_of_triangles_containing_origin += 1 if triangle.contains_origin 
  end
  
  puts "There are #{number_of_triangles_containing_origin} triangles containing the origin in the sample file."
end