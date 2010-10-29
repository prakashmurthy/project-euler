#!/usr/bin/env ruby
# Tests for Solution to problem 4 in Project Euler
# http://projecteuler.net/index.php?section=problems&id=4

# test_prob_004_palindromes.rb

require File.join(File.dirname(__FILE__), "prob_004_palindromes.rb")
require "test/unit"

class TestProblem004 < Test::Unit::TestCase
  
  def test_number_is_palindrome
    assert_equal Problem004::palindrome?(123) , false
    assert_equal Problem004::palindrome?(12321) , true
  end
    
end