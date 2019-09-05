RSpec.describe TapPay::Payment do
  describe '#pay_by_prime' do
    it 'requests pay by prime url' do
      TapPay::Payment.pay_by_prime({ a: 1 })

      expect(WebMock).to have_requested(:post, @base_url + 'payment/pay-by-prime')
    end
  end

  describe '#pay_by_token' do
    it 'requests pay by token url' do
      TapPay::Payment.pay_by_token({ a: 1 })

      expect(WebMock).to have_requested(:post, @base_url + 'payment/pay-by-token')
    end
  end
end
