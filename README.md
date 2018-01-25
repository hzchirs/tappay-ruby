# TapPay

A very simple [TapPay](https://www.tappaysdk.com/tch) API wrapper written in the Ruby language.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tappay'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tappay

## API Documentation
See [TapPay Backend API](https://docs.tappaysdk.com/tutorial/zh/back.html#back).

## Usage

You can setup env, partner_key and merchant_id. It requests sandbox server or production server by env.
The partner_key and merchant_id are optional, thay could also be specified in request params.

```ruby
# sandbox or production
TapPay.env = :sandbox

TapPay.setup do |config|
  config.partner_key = 'your_partner_key' # optional
  config.merchant_id = 'your_merchant_id' # optional
end
```

### Pay By Prime
```ruby
params = {
  prime: 'test_3a2fb2b7e892b914a03c95dd4dd5dc7970c908df67a49527c0a648b2bc9',
  details: "TapPay Test",
  amount: 100,
  cardholder: {
    phone_number: '0912345678',
    name: "王小明",
    email: "LittleMing@Wang.com",
    zip_code: "100",
    address: "台北市天龍區芝麻街1號1樓",
    national_id: "A123456789"
  },
  remember: true
}

res = TapPay.pay_by_prime(params)
res #=> {"status"=>0, "msg"=>"Success", "amount"=>100, ...}
res['status'] #=> 0
res['msg'] #=> Success

# Block Style
TapPay.pay_by_prime(params) do |res|
  res #=> {"status"=>0, "msg"=>"Success", "amount"=>100, ...}
end
```

### Pay By Token
```ruby
params = {
  card_key: 'your_card_key_after_pay_by_prime_with_remember_true',
  card_token: 'your_card_token_after_pay_by_prime_with_remember_true',
  amount: 1,
  currency: "TWD",
  details: "An apple and a pen."
}

res = TapPay.pay_by_token(params)

# Block Style
TapPay.pay_by_token(params) do |res|
  res #=> {"status"=>0, "msg"=>"Success", "amount"=>100, ...}
end
```

### Refund
```ruby
params = {
  rec_trade_id: 'your_rec_trade_id'
}

res = TapPay.refund(params)

# Block Style
TapPay.refund(params) do |res|
  res 
end
```
## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

