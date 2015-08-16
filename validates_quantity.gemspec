# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'validates_quantity/version'

Gem::Specification.new do |spec|
  spec.name          = "validates_quantity"
  spec.version       = ValidatesQuantity::VERSION
  spec.authors       = ["Mathieu Mahé"]
  spec.email         = ["mathieu.mahe@gmail.com"]
  spec.summary       = %q{Add to Rails the possibility to validate the quantity of an associate model}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "activerecord", "~> 4.0.0"
  spec.add_development_dependency "sqlite3"
end
