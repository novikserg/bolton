# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bolton/version"

Gem::Specification.new do |spec|
  spec.name          = "bolton"
  spec.version       = Bolton::VERSION
  spec.authors       = ["Sergey Novik"]
  spec.email         = ["konnigun@gmail.com"]

  spec.summary       = "A gem for parsing JSON APIs into Ruby Objects"
  spec.homepage      = "https://github.com/novikserg/bolton"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 2.0.0"

  spec.add_dependency "httparty", "~> 0"

  spec.add_development_dependency "rake", "~> 11"
  spec.add_development_dependency "minitest", "~> 5"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "rubocop", "~> 0.43.0"
end
