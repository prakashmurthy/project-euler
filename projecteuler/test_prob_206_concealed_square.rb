#!/usr/bin/env ruby
# Tests for Solution to problem number 206 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=206

# test_prob_206_concealed_square.rb

require "prob_206_concealed_square"
require "test/unit"

class TestDecimalRecurringCycle < Test::Unit::TestCase
  def test_is_number_of_required_form_function
    start_number = 1020304050607080900
    end_number = 1929394959697989990
    
    assert_equal(start_number.is_number_of_required_form?, true, "Start number is of the required format")
    assert_equal(end_number.is_number_of_required_form?, true, "End number is of the required format")
    assert_equal((start_number + 70_000_000).is_number_of_required_form?, true, "Start number + 70M is of the required format")
    assert_equal((end_number - 1).is_number_of_required_form?, false, "End number -1 is not of the required format")
    assert_equal((end_number - 3_000).is_number_of_required_form?, true, "end number - 3000 is of the required format")
    assert_equal((start_number + start_number/10).is_number_of_required_form?, true, "start number * 1.1 is of the required format")
  end
  
  def test_ends_with_70_function
    assert_equal(240.ends_with_70?, false, "240 does not end with 70")
    assert_equal(9876570.ends_with_70?, true, "9876570 ends with 70")
  end
  
  def test_ends_with_30_function
    assert_equal(1340.ends_with_30?, false, "1340 does not end with 30")
    assert_equal(7876530.ends_with_30?, true, "7876530 ends with 30")
  end
end