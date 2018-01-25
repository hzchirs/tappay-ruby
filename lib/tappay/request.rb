require 'net/http'
require 'json'

module TapPay
  class Request
    def self.send(url, params = {}, &block)
      payload = default_params.merge(params).to_json
      uri     = URI(url)
      req     = Net::HTTP::Post.new(uri)

      req['Content-Type'] = 'application/json'
      req['x-api-key'] = params[:partner_key] || TapPay.partner_key
      req.body = payload

      res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http|
        http.request(req)
      }
      res_json = JSON.parse(res.body)

      block_given? ? yield(res_json) : res_json
    end

    def self.default_params
      {
        partner_key: TapPay.partner_key,
        merchant_id: TapPay.merchant_id
      }
    end

    private_class_method :default_params
  end
end
