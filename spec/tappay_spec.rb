RSpec.describe TapPay do
  it "has a version number" do
    expect(TapPay::VERSION).not_to be nil
  end

  describe '#pay_by_prime' do
    it 'requests pay by prime url' do
      res = TapPay.pay_by_prime({ a: 1 })

      expect(WebMock).to have_requested(:post, TapPay::APIResource.pay_by_prime_url)
    end
  end

  describe '#pay_by_token' do
    it 'requests pay by token url' do
      res = TapPay.pay_by_token({ a: 1 })

      expect(WebMock).to have_requested(:post, TapPay::APIResource.pay_by_token_url)
    end
  end

  describe '#refund' do
    it 'requests refund url' do
      res = TapPay.refund({ a: 1 })

      expect(WebMock).to have_requested(:post, TapPay::APIResource.refund_url)
    end
  end
end
