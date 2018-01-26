module TapPay
  class Refund
    def self.call(params = {}, &block)
      TapPay::Request.post(TapPay::APIResource.refund_url, params, &block)
    end
  end
end
