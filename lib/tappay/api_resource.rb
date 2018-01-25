module TapPay
  module APIResource
    def self.base_url
      if TapPay.mode == :production
        'https://prod.tappaysdk.com'
      else
        'https://sandbox.tappaysdk.com'
      end
    end

    def self.pay_by_prime_url
      "#{base_url}/tpc/payment/pay-by-prime"
    end

    def self.pay_by_token_url
      "#{base_url}/tpc/payment/pay-by-token"
    end

    def self.refund_url
      "#{base_url}/tpc/transaction/refund"
    end
  end
end
