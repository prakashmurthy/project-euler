#!/usr/bin/env ruby
# Tests for Solution to problem 102 in Project Euler
# http://projecteuler.net/index.php?section=problems&id=102

require File.join(File.dirname(__FILE__), "prob_102_triangles.rb")
require "test/unit"

class TestRandomTriangles < Test::Unit::TestCase
  
  def test_length_of_line
    assert_equal RandomTriangles.length_of_line([0,4], [3,0])   , 5
    assert_equal RandomTriangles.length_of_line([12,0], [0,-5]) , 13
    assert_equal RandomTriangles.length_of_line([0,0], [3,4])   , 5
  end
  
  def test_distance_to_origin
    assert_equal RandomTriangles.distance_to_origin([4,3])      , 5
    assert_equal RandomTriangles.distance_to_origin([100,0])    , 100
    assert_equal RandomTriangles.distance_to_origin([-5,-12])   , 13
  end
  
  def test_line_include_point
    assert RandomTriangles.line_include_point?([0,150], [0, -234], [0, 23]   ) , "The line ([0,150], [0, -234] ) includes the point ([0, 23] )."
    assert RandomTriangles.line_include_point?([12, 5], [-12, -5], [0, 0]    ) , "The line ([12, 5], [-12, -5] ) includes the point ([0,  0] )."
  end
  
  def test_include_origin_first_example
    # First example : A(-340,495), B(-153,-910), C(835,-947) 
    assert_equal RandomTriangles.include_origin?([-340,495], [-153,-910], [835,-947])   , true
  end
  
  def test_include_origin_second_example
    # Second example : X(-175,41), Y(-421,-714), Z(574,-645)
    assert_equal RandomTriangles.include_origin?([-175,41], [-421,-714], [574,-645])    , false
  end
  
  def test_y_intercept
    assert_equal RandomTriangles.y_intercept([6,8], [-6,0]) , 4
  end
  
end