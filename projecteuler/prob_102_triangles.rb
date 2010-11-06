#!/usr/bin/env ruby
# Solution to problem number 102 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=102
# prob_102_triangles.rb

class RandomTriangles 
  
  # Given the co-ordinates of two points, find the length of the line.
  def RandomTriangles.length_of_line(point1, point2=[0,0])
    Math.sqrt((point1[0] - point2[0])**2 + (point1[1] - point2[1])**2)
  end
  
  # Distance to origin
  def RandomTriangles.distance_to_origin(point)
    RandomTriangles.length_of_line(point)
  end
  
  def RandomTriangles.line_include_point?( line_point_x, line_point_y, point )
    RandomTriangles.length_of_line(line_point_x, line_point_y) == RandomTriangles.length_of_line(line_point_x, point) + RandomTriangles.length_of_line(line_point_y, point)
  end
  
  def RandomTriangles.y_intercept(point1, point2)
    point1_point2 = RandomTriangles.length_of_line(point1, point2)
    
  end
  ## The following logic blown to pieces as the second example doesn't fit the bill.
  # For a triangle to include the origin, the sum of lenghts of the sides should be greater than the sum of lengths of the distances to origin
  # def RandomTriangles.include_origin?(point1, point2, point3)
  #   point1_point2 = RandomTriangles.length_of_line(point1, point2)
  #   point2_point3 = RandomTriangles.length_of_line(point2, point3)
  #   point3_point1 = RandomTriangles.length_of_line(point3, point1)
  #   
  #   point1_origin = RandomTriangles.distance_to_origin(point1)
  #   point2_origin = RandomTriangles.distance_to_origin(point2)
  #   point3_origin = RandomTriangles.distance_to_origin(point3)
  #   
  #   point1_point2 + point2_point3 + point3_point1 >= point1_origin + point2_origin + point3_origin
  # end
  
  def RandomTriangles.include_origin?(point1, point2, point3)
    
  end
end

if __FILE__ == $0
  origin = [0, 0]
  
  # First example : A(-340,495), B(-153,-910), C(835,-947)
  # point1 = [-340,495]
  # point2 = [-153,-910] 
  # point3 = [835,-947]
  
  # Second example : X(-175,41), Y(-421,-714), Z(574,-645)
  point1 = [-175,41]
  point2 = [-421,-714]
  point3 = [574,-645]

  point1_point2 = RandomTriangles.length_of_line(point1, point2)
  point2_point3 = RandomTriangles.length_of_line(point2, point3)
  point3_point1 = RandomTriangles.length_of_line(point3, point1)

  puts "point1_point2 = #{point1_point2} ; point2_point3 = #{point2_point3} ; point3_point1 = #{point3_point1}\n\n"

  point1_origin = RandomTriangles.length_of_line(point1, origin)
  point2_origin = RandomTriangles.length_of_line(point2, origin)
  point3_origin = RandomTriangles.length_of_line(point3, origin)
  puts "point1_origin = #{point1_origin} ; point2_origin = #{point2_origin} ; point3_origin = #{point3_origin}\n\n"
  puts "Difference is #{point1_point2 + point2_point3 + point3_point1 >= point1_origin + point2_origin + point3_point1}"
end