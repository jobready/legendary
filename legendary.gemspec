# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'legendary/version'

Gem::Specification.new do |spec|
  spec.name          = "legendary"
  spec.version       = Legendary::VERSION
  spec.authors       = ["John D'Agostino"]
  spec.email         = ["johnd@jobready.com.au"]

  spec.summary       = %q{A Legendary Gem to Detect Security Vulnerabilities}
  spec.description   = %q{A simple gem that helps detect security vulnerabilities and outdated gems}
  spec.homepage      = "https://github.com/jobready/legendary"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1"

  spec.add_dependency "bundler", "~> 1.9"
  spec.add_dependency "activesupport", "~> 4.2"
  spec.add_dependency "git", "~> 1.2"
  spec.add_dependency "gems", "~> 0.8"

end
