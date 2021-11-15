# frozen_string_literal: true

require_relative 'value'

# Fuby class
class Fuby
  attr_accessor :options

  DEFAULT_OPTIONS = { series: false, round_to: 9 }.freeze

  def initialize(options = {})
    @options = DEFAULT_OPTIONS.merge(options)
  end

  def future_value(present_value, rate, period)
    Value.future_value(present_value, rate, period, @options[:series], @options[:round_to])
  end

  def present_value(future_value, rate, period)
    Value.present_value(future_value, rate, period, @options[:series], @options[:round_to])
  end

  def discounted_cash_flow(cfs, rate)
    Value.discounted_cash_flow(cfs, rate, @options[:series], @options[:round_to])
  end
end

# puts future_value(100.0, 0.07, 5.0)
# puts present_value(114.49, 0.07, 3.0)

# 62709167234
