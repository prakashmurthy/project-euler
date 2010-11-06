#!/usr/bin/env ruby
# Tests for Solution to problem 111 in Project Euler
# http://projecteuler.net/index.php?section=problems&id=111

# test_prob_111_10_digit_primes.rb

require File.join(File.dirname(__FILE__), "prob_111_10_digit_primes.rb")
require "test/unit"

class TestProblem111 < Test::Unit::TestCase
  
  def test_elements_of_primes_array
    Problem111.fill_primes_array(1)
    assert_equal [2,3,5,7], $primes_array
  end
  
  def test_elements_of_primes_array_size
    Problem111.fill_primes_array(4)
    assert_equal 1061, $primes_array.size
  end
  
  # def test_m_4_d
  #   assert_equal 2, Problem111.m_function(4, 0)[0]
  #   assert_equal 3, Problem111.m_function(4, 1)[0]
  #   assert_equal 3, Problem111.m_function(4, 2)[0]
  #   assert_equal 3, Problem111.m_function(4, 3)[0]
  #   assert_equal 3, Problem111.m_function(4, 4)[0]
  #   assert_equal 3, Problem111.m_function(4, 5)[0]
  #   assert_equal 3, Problem111.m_function(4, 6)[0]
  #   assert_equal 3, Problem111.m_function(4, 7)[0]
  #   assert_equal 3, Problem111.m_function(4, 8)[0]
  #   assert_equal 3, Problem111.m_function(4, 9)[0]
  # end
  # 
  # def test_m_4_n
  #   assert_equal 13, Problem111.m_function(4, 0)[1].length
  #   assert_equal 9, Problem111.m_function(4, 1)[1].length
  #   assert_equal 1, Problem111.m_function(4, 2)[1].length
  #   assert_equal 12, Problem111.m_function(4, 3)[1].length
  #   assert_equal 2, Problem111.m_function(4, 4)[1].length
  #   assert_equal 1, Problem111.m_function(4, 5)[1].length
  #   assert_equal 1, Problem111.m_function(4, 6)[1].length
  #   assert_equal 9, Problem111.m_function(4, 7)[1].length
  #   assert_equal 1, Problem111.m_function(4, 8)[1].length
  #   assert_equal 7, Problem111.m_function(4, 9)[1].length
  # end
  # 
  # def test_m_4_S
  #   assert_equal 67061, Problem111.m_function(4, 0)[1].inject {|total, element| total + element}
  #   assert_equal 22275, Problem111.m_function(4, 1)[1].inject {|total, element| total + element}
  #   assert_equal 2221 , Problem111.m_function(4, 2)[1].inject {|total, element| total + element}
  #   assert_equal 46214, Problem111.m_function(4, 3)[1].inject {|total, element| total + element}
  #   assert_equal 8888 , Problem111.m_function(4, 4)[1].inject {|total, element| total + element}
  #   assert_equal 5557 , Problem111.m_function(4, 5)[1].inject {|total, element| total + element}
  #   assert_equal 6661 , Problem111.m_function(4, 6)[1].inject {|total, element| total + element}
  #   assert_equal 57863, Problem111.m_function(4, 7)[1].inject {|total, element| total + element}
  #   assert_equal 8887 , Problem111.m_function(4, 8)[1].inject {|total, element| total + element}
  #   assert_equal 48073, Problem111.m_function(4, 9)[1].inject {|total, element| total + element}
  # end
  
  def test_sum_of_all_S_4
    assert_equal 273700, Problem111.sum_of_s(4)
  end
  
  def test_count_of_elements
    assert_equal 3, 3334.count_of_elements(3)
    assert_equal 0, 12564.count_of_elements(9)
    assert_equal 2, 10101.count_of_elements(0)
    assert_equal 3, 10101.count_of_elements(1)
  end
end