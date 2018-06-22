require 'forwardable'
require "tappay/version"

require 'tappay/request'
require 'tappay/api_resources'
require 'tappay/card'
require 'tappay/payment'
require 'tappay/transaction'

module TapPay
  @mode        = :sandbox
  @app_id      = ''
  @app_key     = ''
  @partner_key = ''
  @merchant_id = ''

  class << self
    extend Forwardable
    def_delegators TapPay::Payment, :pay_by_prime, :pay_by_token
    def_delegators TapPay::Transaction, :refund

    def setup
      yield(self)
    end

    def mode=(mode)
      @mode = mode
    end

    def partner_key=(partner_key)
      @partner_key = partner_key.to_s
    end

    def merchant_id=(merchant_id)
      @merchant_id = merchant_id.to_s
    end

    def app_id=(app_id)
      @app_id = app_id
    end

    def app_key=(app_key)
      @app_key = app_key
    end

    def mode
      @mode
    end

    def partner_key
      @partner_key
    end

    def merchant_id
      @merchant_id
    end

    def app_id
      @app_id
    end

    def app_key
      @app_key
    end
  end
end
