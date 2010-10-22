#!/usr/bin/env ruby
# Tests for Solution to problem 5 in Project Euler
# http://projecteuler.net/index.php?section=problems&id=5

# test_prob_005_divisible.rb

require File.join(File.dirname(__FILE__), "prob_005_divisible.rb")
require "test/unit"

class TestProblem005 < Test::Unit::TestCase

  def test_divisible_number
    assert_equal Solution5.smallest_divisible_number(4), 12
    assert_equal Solution5.smallest_divisible_number(10), 2520
  end
  
  def test_final_answer
    assert_equal Solution5.smallest_divisible_number(20), 232792560
  end
  
end