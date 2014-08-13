# -*- encoding: utf-8 -*-
# stub: kpeg 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "kpeg"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Evan Phoenix"]
  s.date = "2014-01-04"
  s.description = "KPeg is a simple PEG library for Ruby. It provides an API as well as native\ngrammar to build the grammar.\n\nKPeg strives to provide a simple, powerful API without being too exotic.\n\nKPeg supports direct left recursion of rules via the\n{OMeta memoization}[http://www.vpri.org/pdf/tr2008003_experimenting.pdf] trick."
  s.email = ["evan@fallingsnow.net"]
  s.executables = ["kpeg"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.rdoc", "examples/phone_number/README.md", "examples/upper/README.md"]
  s.files = ["History.txt", "Manifest.txt", "README.rdoc", "bin/kpeg", "examples/phone_number/README.md", "examples/upper/README.md"]
  s.homepage = "https://github.com/evanphx/kpeg"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--main", "README.rdoc"]
  s.rubyforge_project = "kpeg"
  s.rubygems_version = "2.3.0"
  s.summary = "KPeg is a simple PEG library for Ruby"

  s.installed_by_version = "2.3.0" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<minitest>, ["~> 5.2"])
      s.add_development_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_development_dependency(%q<hoe>, ["~> 3.7"])
    else
      s.add_dependency(%q<minitest>, ["~> 5.2"])
      s.add_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_dependency(%q<hoe>, ["~> 3.7"])
    end
  else
    s.add_dependency(%q<minitest>, ["~> 5.2"])
    s.add_dependency(%q<rdoc>, ["~> 4.0"])
    s.add_dependency(%q<hoe>, ["~> 3.7"])
  end
end
