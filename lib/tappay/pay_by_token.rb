module TapPay
  class PayByToken
    def self.call(params = {}, &block)
      TapPay::Request.post(TapPay::APIResource.pay_by_token_url, params, &block)
    end
  end
end
