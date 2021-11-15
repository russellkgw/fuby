# frozen_string_literal: true

require_relative 'utils'

# Value class
class Value
  class << self
    include Utils

    # FV = PV(1 + r)^t
    def future_value(present_value, interest_rate, period, series, round_to)
      return present_value if period.zero?

      result = (1..period).map do |prd|
        r(f(present_value) * (1.0 + f(interest_rate))**f(prd), round_to)
      end

      !series ? result.last : result
    end

    # PV = FV/(1 + r)^t
    def present_value(future_value, interest_rate, period, series, round_to)
      return future_value if period.zero?

      res = (1..period).map do |prd|
        r(f(future_value) / (1.0 + f(interest_rate))**f(prd), round_to)
      end

      !series ? res.last : res
    end

    # DCF = C/1 + r)^t
    def discounted_cash_flow(cashflows, interest_rate, series, round_to)
      return 0 if !cashflows || cashflows.empty?

      res = (1..cashflows.count).map do |prd|
        r(f(cashflows[prd - 1]) / (1.0 + f(interest_rate))**f(prd), round_to)
      end

      !series ? res.sum : res
    end
  end
end
