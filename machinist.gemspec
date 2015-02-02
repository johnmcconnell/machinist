# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'machinist/version'

Gem::Specification.new do |spec|
  spec.name          = "machinist"
  spec.version       = Machinist::VERSION
  spec.authors       = ["johnmcconnell"]
  spec.email         = ["johnnyillinois@gmail.com"]
  spec.summary       = %q{A Machine Learning library offering a variety of algoritms.}
  spec.description   = %q{A Machine Learning library offering a variety of algoritms.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'require_all'
  spec.add_dependency 'attr_init'

  spec.add_development_dependency "simplecov", "~> 0.8.0"
  spec.add_development_dependency "coveralls", "~> 0.7.0"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
