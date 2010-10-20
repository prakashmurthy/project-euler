#!/usr/bin/env ruby
# Tests for Solution to problem 6 in Project Euler
# http://projecteuler.net/index.php?section=problems&id=6

# test_prob_006_squares.rb

require File.join(File.dirname(__FILE__), "prob_006_squares.rb")
require "test/unit"

class TestProblem006 < Test::Unit::TestCase
  
  def test_sum_of_squares_when_max_number_is_10
    assert_equal Problem006.sum_of_squares(10), 385, "Sum of Squares for numbers less than or equal to 10 should be 385"
  end
  
  def test_square_of_sums_when_max_number_is_10
    assert_equal Problem006.square_of_sums(10), 3025, "Square of sums for numbers less than or equal to 10 should be 3025"
  end
  
end