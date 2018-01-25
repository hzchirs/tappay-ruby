RSpec.describe TapPay::Request do
  PARTNER_KEY = "partner_6ID1DoDlaPrfHw6HBZsULfTYtDmWs0q0ZZGKMBpp4YICWBxgK97eK3RM"
  let(:fake_url) { 'https://www.fake.com' }

  before :each do
    stub_request(:any, fake_url)
      .to_return(body: { status: 0, rec_trade_id: '12345' }.to_json)
  end

  describe '.send' do
    before :each do
      TapPay.partner_key = PARTNER_KEY
    end

    it "requests with body has default partner_key and merchant_id" do
      res = TapPay::Request.send(fake_url, { test: 1 })

      expect(WebMock).to have_requested(:post, fake_url)
        .with(body: { test: 1, partner_key: PARTNER_KEY, merchant_id: "" })
    end

    it 'returns response body in json format' do
      res = TapPay::Request.send(fake_url, { test: 1 })

      expect(res['status']).to eq 0
      expect(res['rec_trade_id']).to eq('12345') 

      # Block style
      TapPay::Request.send(fake_url, { test: 1 }) do |res|
        expect(res['status']).to eq 0
        expect(res['rec_trade_id']).to eq('12345') 
      end
    end

    context 'if params do not have partner_key' do
      it "requests header x-api-key's value is default partner_key" do
        res = TapPay::Request.send(fake_url, { test: 1 })

        expect(WebMock).to have_requested(:post, fake_url)
          .with(headers: { 'x-api-key' => PARTNER_KEY })
      end
    end

    context 'if params have partner_key' do
      it "request's header x-api-key's value is params' partner_key" do
        res = TapPay::Request.send(fake_url, { partner_key: 'custom_key' })

        expect(WebMock).to have_requested(:post, fake_url)
          .with(headers: { 'x-api-key' => 'custom_key' })
      end
    end

  end
end
