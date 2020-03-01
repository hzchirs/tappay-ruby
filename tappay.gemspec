
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tappay/version"

Gem::Specification.new do |spec|
  spec.name          = "tappay"
  spec.version       = TapPay::VERSION
  spec.authors       = ["HzChris"]
  spec.email         = ["hzchirs@gmail.com"]

  spec.summary       = %q{A very simple TapPay API wrapper for ruby.}
  spec.description   = %q{A very simple TapPay API wrapper for ruby. Currently support pay_by_prime, pay_by_token and refund.}
  spec.homepage      = "https://github.com/hzchirs/tappay-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.1"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.9"
  spec.add_development_dependency "webmock", "~> 3.8"

  spec.required_ruby_version = '>= 2.2.0'
end
