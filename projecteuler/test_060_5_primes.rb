#!/usr/bin/env ruby
# Tests for Solution to problem 60 in Project Euler
# http://projecteuler.net/index.php?section=problems&id=60

# test_prob_060_5_primes.rb

require File.join(File.dirname(__FILE__), "prob_060_5_primes.rb")
require "test/unit"

class TestConcatPrimes < Test::Unit::TestCase
  
  def test_for_concat_prime_pairs
    assert_equal ConcatPrimes.concat_prime?(3, 7), true
    assert_equal ConcatPrimes.concat_prime?(109, 673), true
    assert_equal ConcatPrimes.concat_prime?(19, 67), false
    assert_equal ConcatPrimes.concat_prime?(11, 7), false
  end
    
  def test_sum_4_concat_prime_pairs
    assert_equal (ConcatPrimes.special_primes(4).inject {|total, item| total + item}), 792
  end
  
end