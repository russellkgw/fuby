# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/fuby'

# Fuby test
class FubyTest < Minitest::Test
  def setup
    @fuby = Fuby.new
  end

  def test_fuby_new_default_options
    assert_equal @fuby.options, { series: false, round_to: 9 }
  end

  def test_fuby_new_custom_options
    fuby = Fuby.new({ series: true, round_to: 6 })
    assert_equal fuby.options, { series: true, round_to: 6 }
  end

  def test_fuby_future_value
    assert_equal 114.49, @fuby.future_value(100.0, 0.07, 2)
  end

  def test_fuby_discounted_cash_flow
    assert_equal 720_344.387755102, @fuby.discounted_cash_flow([30_000, 870_000], 0.12)
  end
end
