require "bundler/setup"
require "tappay"
require 'webmock/rspec'

WebMock.disable_net_connect!

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:each) do
    TapPay.mode = :sandbox
    @base_url   = 'https://sandbox.tappaysdk.com/tpc/'

    stub_request(:any, /tappaysdk\.com/).to_return(body: "{}")
  end
end
