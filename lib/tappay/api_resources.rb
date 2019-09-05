module TapPay
  module APIResources
    CARD = [
      'bind',
      'remove'
    ].freeze

    PAYMENT = [
      'pay_by_prime',
      'pay_by_token'
    ].freeze

    TRANSACTION = [
      'cap',
      'query',
      'refund',
      'trade_history'
    ].freeze

    def base_url
      if TapPay.mode == :production
        'https://prod.tappaysdk.com'.freeze
      else
        'https://sandbox.tappaysdk.com'.freeze
      end
    end

    def class_name
      self.name.split("::")[-1]
    end

    def resource_url(resource_name)
      "#{base_url}/tpc/#{class_name.downcase}/#{resource_name.gsub('_', '-')}"
    end

    def generate_resources
      TapPay::APIResources.const_get(class_name.upcase).each do |resource|
        define_singleton_method(resource) do |params, &block|
          TapPay::Request.post(resource_url(resource), params, &block)
        end
      end
    end
  end
end
