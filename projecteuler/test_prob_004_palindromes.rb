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
  
  def test_max_palindrome_with_two_digits
    assert_equal 9009, Problem004::max_palindrome(2) 
  end
  
  def test_max_palindrome_with_three_digits
    assert_equal 906609, Problem004::max_palindrome(3) 
  end
  
end