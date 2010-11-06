#!/usr/bin/env ruby
# Tests for Solution to problem 7 in Project Euler
# http://projecteuler.net/index.php?section=problems&id=7

# test_prob_007_10001st_prime.rb

require File.join(File.dirname(__FILE__), "prob_007_10001st_prime.rb")
require "test/unit"

class TestProblem007 < Test::Unit::TestCase
  def test_6th_prime
    assert_equal 13, Problem007.nth_prime(6)
  end
  
  def test_10001th_prime
    assert_equal 104743, Problem007.nth_prime(10001)
  end
end