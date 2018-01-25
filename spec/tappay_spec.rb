RSpec.describe TapPay do
  PRIME  = "test_3a2fb2b7e892b914a03c95dd4dd5dc7970c908df67a49527c0a648b2bc9"
  MERCHANT_ID = "GlobalTesting_CTBC"
  PARTNER_KEY = "partner_6ID1DoDlaPrfHw6HBZsULfTYtDmWs0q0ZZGKMBpp4YICWBxgK97eK3RM"

  before :each do
    TapPay.setup do |config|
      config.partner_key = PARTNER_KEY
      config.merchant_id = MERCHANT_ID
    end
  end

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
