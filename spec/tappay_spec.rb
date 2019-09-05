RSpec.describe TapPay do
  it "has a version number" do
    expect(TapPay::VERSION).not_to be nil
  end

  describe '#pay_by_prime' do
    it 'requests pay by prime url' do
      TapPay.pay_by_prime({ a: 1 })

      expect(WebMock).to have_requested(:post, @base_url + 'payment/pay-by-prime')
    end
  end

  describe '#pay_by_token' do
    it 'requests pay by token url' do
      TapPay.pay_by_token({ a: 1 })

      expect(WebMock).to have_requested(:post, @base_url + 'payment/pay-by-token')
    end
  end

  describe '#refund' do
    it 'requests refund url' do
      TapPay.refund({ a: 1 })

      expect(WebMock).to have_requested(:post, @base_url + 'transaction/refund')
    end
  end
end
