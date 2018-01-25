module TapPay
  class PayByPrime
    def self.call(params = {}, &block)
      TapPay::Request.send(TapPay::APIResource.pay_by_prime_url, params, &block)
    end
  end
end
