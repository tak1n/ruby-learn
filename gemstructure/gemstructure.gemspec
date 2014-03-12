# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gemstructure/version'

Gem::Specification.new do |spec|
  spec.name          = "gemstructure"
  spec.version       = Gemstructure::VERSION
  spec.authors       = ["Benny1992"]
  spec.email         = ["klotz.benjamin@yahoo.de"]
  spec.description   = %q{TODO: Write a gem description}
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = File.read(File.expand_path('../MANIFEST', __FILE__)).split("\n") # Use MANIFEST file generated from git ls-files
  # spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) } remove this if gem has no bin file
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
