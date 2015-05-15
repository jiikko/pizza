# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pizza_client/version'

Gem::Specification.new do |spec|
  spec.name          = "pizza_client"
  spec.version       = PizzaClient::VERSION
  spec.authors       = ["jiikko"]
  spec.email         = ["n905i.1214@gmail.com"]
  spec.summary       = %q{pizza client.}
  spec.description   = %q{automation tool client.}
  spec.homepage      = "https://github.com/jiikko/pizza"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 0"

  spec.add_dependency 'thor', "~> 0"
  spec.add_dependency 'selenium-webdriver', "~> 2.45"
  spec.add_dependency 'chromedriver-helper', "~> 0.0"
  spec.add_dependency 'capybara', "~> 2.4"
end
