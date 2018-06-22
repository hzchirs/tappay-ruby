RSpec.describe TapPay::Card do
  describe '#bind' do
    it 'requests bind url' do
      res = TapPay::Card.bind({ a: 1 })

      expect(WebMock).to have_requested(:post, @base_url + 'card/bind')
    end
  end

  describe '#remove' do
    it 'requests remove url' do
      res = TapPay::Card.remove({ a: 1 })

      expect(WebMock).to have_requested(:post, @base_url + 'card/remove')
    end
  end

  describe '#query' do
    it 'requests query url' do
      res = TapPay::Card.query({ a: 1 })

      expect(WebMock).to have_requested(:post, @base_url + 'card/query')
    end
  end
end
