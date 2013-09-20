# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'codedryer/version'

Gem::Specification.new do |spec|
  spec.name          = "codedryer"
  spec.version       = Codedryer::VERSION
  spec.authors       = ["ftomassetti"]
  spec.email         = ["FTomassetti@FTOMASSETTI-PC"]
  spec.description   = %q{TODO: Write a gem description}
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = ""
  spec.license       = "Apache license 2"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "commander"
  spec.add_dependency "lightmodels"
  spec.add_dependency "ruby-lightmodels"
  spec.add_dependency "js-lightmodels"
  spec.add_dependency "java-lightmodels"  

  spec.add_development_dependency "bundler", "1.4.0.pre.2"
  spec.add_development_dependency "rake"
end
