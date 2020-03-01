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

  class << self
    extend Forwardable
    def_delegators TapPay::Payment, :pay_by_prime, :pay_by_token
    def_delegators TapPay::Transaction, :refund

    attr_accessor :mode, :partner_key

    def setup
      yield(self)
    end
  end
end
