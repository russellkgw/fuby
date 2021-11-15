# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/value'

# Value test
class ValueTest < Minitest::Test
  def test_value_future_value
    assert_equal 100.0, Value.future_value(100.0, 0.07, 0, false, 6)
    assert_equal 107.0, Value.future_value(100.0, 0.07, 1, false, 6)
    assert_equal 114.49, Value.future_value(100.0, 0.07, 2, false, 6)
    assert_equal 140.255173, Value.future_value(100.0, 0.07, 5, false, 6)
    assert_equal 672.75, Value.future_value(100.0, 0.1, 20, false, 2)
    assert_equal 265.33, Value.future_value(100.0, 0.05, 20, false, 2)

    assert_equal 99.0, Value.future_value(100.0, -0.01, 1, false, 6)
    assert_equal 90.438208, Value.future_value(100.0, -0.01, 10, false, 6)
    assert_equal 85.7375, Value.future_value(100.0, -0.05, 3, false, 6)

    assert_equal [107.0, 114.49], Value.future_value(100.0, 0.07, 2, true, 6)
    assert_equal [107.0, 114.49, 122.5043, 131.079601, 140.255173], Value.future_value(100.0, 0.07, 5, true, 6)
  end

  def test_value_present_value
    assert_equal 100.0, Value.present_value(100, 0.07, 0, false, 6)
    assert_equal 100.0, Value.present_value(107.0, 0.07, 1, false, 6)
    assert_equal 100.0, Value.present_value(114.49, 0.07, 2, false, 6)

    assert_equal 37.69, Value.present_value(100.0, 0.05, 20, false, 2)
    assert_equal 14.86, Value.present_value(100.0, 0.1, 20, false, 2)

    assert_equal 115.620302925, Value.present_value(100.0, -0.07, 2, false, 9)

    assert_equal [100.0], Value.present_value(107.0, 0.07, 1, true, 3)
    assert_equal [107.0, 100.0], Value.present_value(114.49, 0.07, 2, true, 3)
  end

  def test_value_discounted_cash_flow
    assert_equal 720_344.387, Value.discounted_cash_flow([30_000, 870_000], 0.12, false, 3)
    assert_equal 773_663, Value.discounted_cash_flow([30_000, 870_000], 0.08, false, 0)
    assert_equal 0, Value.discounted_cash_flow([], 0.12, false, 3)
    assert_equal 0, Value.discounted_cash_flow(nil, 0.12, false, 3)
  end
end
