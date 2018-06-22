RSpec.describe TapPay::Transaction do
  describe '#refund' do
    it 'requests refund url' do
      res = TapPay::Transaction.refund({ a: 1 })

      expect(WebMock).to have_requested(:post, @base_url + 'transaction/refund')
    end
  end

  describe '#cap' do
    it 'requests cap url' do
      res = TapPay::Transaction.cap({ a: 1 })

      expect(WebMock).to have_requested(:post, @base_url + 'transaction/cap')
    end
  end

  describe '#query' do
    it 'requests query url' do
      res = TapPay::Transaction.query({ a: 1 })

      expect(WebMock).to have_requested(:post, @base_url + 'transaction/query')
    end
  end

  describe '#trade_history' do
    it 'requests trade_history url' do
      res = TapPay::Transaction.trade_history({ a: 1 })

      expect(WebMock).to have_requested(:post, @base_url + 'transaction/trade-history')
    end
  end
end
