Gem::Specification.new do |spec|
  spec.name = 'mygem'
  spec.version = '0.1'
  spec.summary = 'Summary'
  spec.description = 'Description'
  spec.email = 'myemail@provider.com'
  spec.homepage = 'http://myapp.com'
  spec.author = 'me'
  spec.bindir = 'bin'
  spec.executable = 'exec.rb'
  spec.files = Dir['lib/**/*.rb'] + Dir['bin/*'] + Dir['ext/**/*.c'] + Dir['ext/**/extconf.rb']
  spec.platform = Gem::Platform::RUBY # This is the default
  spec.require_paths = [ 'lib', 'ext' ]
  spec.extensions = Dir['ext/**/extconf.rb']

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 2.0.0"
  spec.add_development_dependency "rake-compiler"
end
