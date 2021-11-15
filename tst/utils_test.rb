# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/utils'

# Util test
class UtilsTest < Minitest::Test
  include Utils

  def test_utils_to_float
    assert_equal 123.0, f(123)
    assert_equal 0.0, f(0)
    assert_equal(-1.0, f(-1))
    assert_equal 3456.01234, f(3456.01234)
    assert_equal 567_890.0, f('567890')
  end

  def test_utils_round
    assert_equal 123.123457, r(123.123456789, 6)
    assert_equal 123, r(123.123456789, 0)
    assert_equal 0.0, r(0, 3)
    assert_equal(-1.98765, r(-1.98765432, 5))
    assert_equal(-1.987654, r(-1.98765432, 6))
    assert_equal 0.9876543, r(0.9876543, 9)
  end
end
