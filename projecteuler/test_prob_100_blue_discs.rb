#!/usr/bin/env ruby
# Tests for Solution to problem 100 in Project Euler
# http://projecteuler.net/index.php?section=problems&id=100


require File.join(File.dirname(__FILE__), "prob_100_blue_discs.rb")
require "test/unit"

class TestBlueDiscs < Test::Unit::TestCase
  def test_for_total_of_21
    assert_equal BagOfDiscs.combination_with_half_probability( 21 ) , 15
  end
  
  def test_for_total_of_22
    assert_equal BagOfDiscs.combination_with_half_probability( 22 ) , false
  end 

  def test_for_total_of_120
    assert_equal BagOfDiscs.combination_with_half_probability( 120 ) , 85
  end
  
  def test_for_total_greater_than_22
    assert_equal BagOfDiscs.next_combination_with_half_probability( 22 ) , 85
  end
  
  def test_for_total_of_1000000030324
    assert_equal BagOfDiscs.combination_with_half_probability( 1000000030324 ) , false
  end
    
  # def test_for_total_greater_than_10_power_of_12
  #   assert_equal BagOfDiscs.next_combination_with_half_probability( 10**12 ) , 707106783028
  # end
end