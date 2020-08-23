# TapPay

![Ruby Gem](https://github.com/hzchirs/tappay-ruby/workflows/Ruby%20Gem/badge.svg?branch=master)
[![Maintainability](https://api.codeclimate.com/v1/badges/1bc81b37e0025c3de443/maintainability)](https://codeclimate.com/github/hzchirs/tappay-ruby/maintainability)

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

**Settings**

You need to setup mode which affects the requests sent to sandbox or production server.
The partner_key is optional, they could also be specified in request params.

```ruby
TapPay.setup do |config|
  config.mode = Rails.env.production? ? :production : :sandbox # sandbox or production
  config.partner_key = 'your_partner_key' # optional
end
```

**Map API Resources to Module and Action**

It is easy to map api resources to the TapPay module's namespace and action. 
For example, the **pay by prime** api: 
https://sandbox.tappaysdk.com/tpc/payment/pay-by-prime , 
the last two parts of the url are `payment` and `pay-by-prime`. The first part `payment`
is mapped to namespace `Payment`, and the last part `pay-by-prime` is
mapped to action `pay_by_prime`, so it can be called by
`TapPay::Payment.pay_by_prime(params)`.

Another example is *bind card*, the bind card api: 
https://sandbox.tappaysdk.com/tpc/card/bind , the last two parts of the url are`card` and `bind`,
so the api can be called by `TapPay::Card.bind(params)` as you expect.

### Supported APIs
**Payment**

  * pay_by_prime
  * pay_by_token

**Card**

  * bind
  * remove

**Transaction**

  * cap
  * query
  * refund
  * trade_history

For more details about api request params and responses, please refer to the [TapPay Backend API Documentation](https://docs.tappaysdk.com/tutorial/zh/back.html#back).

## More Examples
### Pay By Prime
```ruby
params = {
  prime: 'test_3a2fb2b7e892b914a03c95dd4dd5dc7970c908df67a49527c0a648b2bc9',
  merchant_id: 'your_merchant_id',
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

res = TapPay::Payment.pay_by_prime(params)
res #=> {"status"=>0, "msg"=>"Success", "amount"=>100, ...}
res['status'] #=> 0
res['msg'] #=> Success

# Block Style
TapPay::Payment.pay_by_prime(params) do |res|
  res #=> {"status"=>0, "msg"=>"Success", "amount"=>100, ...}
end
```

### Pay By Token
```ruby
params = {
  merchant_id: 'your_merchant_id',
  card_key: 'your_card_key_after_pay_by_prime_with_remember_true',
  card_token: 'your_card_token_after_pay_by_prime_with_remember_true',
  amount: 1,
  currency: "TWD",
  details: "An apple and a pen."
}

res = TapPay::Payment.pay_by_token(params)

# Block Style
TapPay::Payment.pay_by_token(params) do |res|
  res #=> {"status"=>0, "msg"=>"Success", "amount"=>100, ...}
end
```

### Refund
```ruby
params = {
  rec_trade_id: 'your_rec_trade_id'
}

res = TapPay::Transaction.refund(params)

# Block Style
TapPay::Transaction.refund(params) do |res|
  res 
end
```

### Card
```ruby
# bind
params = {
  prime: 'test_3a2fb2b7e892b914a03c95dd4dd5dc7970c908df67a49527c0a648b2bc9',
  merchant_id: 'your_merchant_id',
  currency: 'TWD',
  cardholder: {
        phone_number: "+886923456789",
        name: "Jane Doe",
        email: "Jane@Doe.com",
        zip_code: "12345",
        address: "123 1st Avenue, City, Country",
        national_id: "A123456789"
  }
}

TapPay::Card.bind(params) do |res|
  res
end

# remove
params = {
  card_key: "your_card_key",
  card_token: "your_card_token"
}

TapPay::Card.remove(params) do |res|
  res
end
```


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
