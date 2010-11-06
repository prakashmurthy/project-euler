#!/usr/bin/env ruby
# Tests for Solution to problem 1 in Project Euler
# http://projecteuler.net/index.php?section=problems&id=1

# test_prob_001.rb

require File.join(File.dirname(__FILE__), "prob_001_multiples_of_3_and_5.rb")
require "test/unit"

class TestProblem001 < Test::Unit::TestCase
  
  def test_is_answer_23_when_max_number_is_10
    assert_equal Problem001.answer(10), 23
  end
    
  def test_is_answer_23_when_max_number_is_1000
    assert_equal Problem001.answer(233168), 12685652714
  end
  
end