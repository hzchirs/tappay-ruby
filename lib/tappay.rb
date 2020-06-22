# frozen_string_literal: true

require 'forwardable'
require 'tappay/version'

require 'tappay/request'
require 'tappay/api_resources'
require 'tappay/card'
require 'tappay/payment'
require 'tappay/transaction'

module TapPay
  VALID_MODES = [:sandbox, :production].freeze

  @mode        = :sandbox
  @app_id      = ''
  @app_key     = ''
  @partner_key = ''

  class << self
    extend Forwardable
    def_delegators TapPay::Payment, :pay_by_prime, :pay_by_token
    def_delegators TapPay::Transaction, :refund

    def setup
      yield(self)
    end

    def mode=(mode)
      unless VALID_MODES.include?(mode)
        raise ArgumentError, "Invalid mode! mode must be one of `#{VALID_MODES}`"
      end

      @mode = mode
    end

    def partner_key=(partner_key)
      @partner_key = partner_key.to_s
    end

    def mode
      @mode
    end

    def partner_key
      @partner_key
    end
  end
end
