#!/usr/bin/env ruby
# Tests for Solution to problem 102 in Project Euler
# http://projecteuler.net/index.php?section=problems&id=102

require File.join(File.dirname(__FILE__), "prob_102_triangles.rb")
require "test/unit"

class TestTriangles < Test::Unit::TestCase
  def test_compute_area_with_points
    point_a = [0,0]
    point_b = [0,30]
    point_c = [25,15]
    triangle = Triangle.new(point_a, point_b, point_c)
    assert_equal 375, triangle.area, "The area of the triangle with [0,0], [0,30] & [25,15] as vertices is 375."
  end
  
  def test_compute_area_with_points_2
    point_a = [-340,495]
    point_b = [-153,-910]
    point_c = [835,-947]
    
    triangle = Triangle.new(point_a, point_b, point_c)
    assert_equal 690610.5, triangle.area, "The area of the triangle with [-340,495], [-153,-910] & [835,-947] as vertices is 690610.5."
  end
  
  def test_case_1_contains_origin
    point_a = [-340,495]
    point_b = [-153,-910]
    point_c = [835,-947]
    
    triangle = TriangleAndPoint.new(point_a, point_b, point_c)
    assert_equal true, triangle.contains_origin, "The triangle with [-340,495], [-153,-910] & [835,-947] as vertices contains the origin."
  end
  
  def test_case_2_does_not_contain_origin
    point_a = [-175,41]
    point_b = [-421,-714]
    point_c = [574,-645]
    
    triangle = TriangleAndPoint.new(point_a, point_b, point_c)
    assert_equal false, triangle.contains_origin, "The triangle with [-175,41], [-421,-714] & [574,-645] as vertices does not contain the origin."
  end
end
