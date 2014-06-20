# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gemcext/version'

Gem::Specification.new do |spec|
  spec.name          = "gemcext"
  spec.version       = Gemcext::VERSION
  spec.authors       = ["Your Name"]
  spec.email         = ["your@email.here"]
  spec.summary       = %q{Write a short summary. Required.}
  spec.description   = %q{Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files = File.read(File.expand_path('../MANIFEST', __FILE__)).split("\n")

  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib", "ext"]
  spec.extensions = Dir['ext/**/extconf.rb']

  spec.required_ruby_version = '>= 1.8.7' # Specify your required ruby version here

  spec.add_runtime_dependency 'sinatra', '~> 1.4' # Specify your runtime & development dependencies here

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'minitest'
end
