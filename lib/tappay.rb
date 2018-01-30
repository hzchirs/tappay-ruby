require "tappay/version"

require 'tappay/request'
require 'tappay/api_resource'
require 'tappay/pay_by_prime'
require 'tappay/pay_by_token'
require 'tappay/refund'

module TapPay
  @@mode        = :sandbox
  @@app_id      = ''
  @@app_key     = ''
  @@partner_key = ''
  @@merchant_id = ''

  class << self
    def setup
      yield(self)
    end

    def mode=(mode)
      @@mode = mode
    end

    def partner_key=(partner_key)
      @@partner_key = partner_key.to_s
    end

    def merchant_id=(merchant_id)
      @@merchant_id = merchant_id.to_s
    end

    def app_id=(app_id)
      @@app_id = app_id
    end

    def app_key=(app_key)
      @@app_key = app_key
    end

    def mode
      @@mode
    end

    def partner_key
      @@partner_key
    end

    def merchant_id
      @@merchant_id
    end

    def app_id
      @@app_id
    end

    def app_key
      @@app_key
    end

    def pay_by_prime(payload, &block)
      TapPay::PayByPrime.call(payload, &block)
    end

    def pay_by_token(payload, &block)
      TapPay::PayByToken.call(payload, &block)
    end

    def refund(payload, &block)
      TapPay::Refund.call(payload, &block)
    end
  end
end
