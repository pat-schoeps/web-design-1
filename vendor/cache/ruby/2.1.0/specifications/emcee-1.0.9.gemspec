# -*- encoding: utf-8 -*-
# stub: emcee 1.0.9 ruby lib

Gem::Specification.new do |s|
  s.name = "emcee"
  s.version = "1.0.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Andrew Huth"]
  s.date = "2014-11-17"
  s.description = "Add web components to the Rails asset pipeline"
  s.email = ["andrew@huth.me"]
  s.homepage = "https://github.com/ahuth/emcee"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "Add web components to the Rails asset pipeline."

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, ["~> 1.0"])
      s.add_runtime_dependency(%q<nokogumbo>, ["~> 1.1"])
      s.add_runtime_dependency(%q<rails>, ["~> 4.0"])
      s.add_development_dependency(%q<coffee-rails>, ["~> 4.0"])
      s.add_development_dependency(%q<sass>, ["~> 3.0"])
      s.add_development_dependency(%q<sqlite3>, ["~> 1.3"])
    else
      s.add_dependency(%q<nokogiri>, ["~> 1.0"])
      s.add_dependency(%q<nokogumbo>, ["~> 1.1"])
      s.add_dependency(%q<rails>, ["~> 4.0"])
      s.add_dependency(%q<coffee-rails>, ["~> 4.0"])
      s.add_dependency(%q<sass>, ["~> 3.0"])
      s.add_dependency(%q<sqlite3>, ["~> 1.3"])
    end
  else
    s.add_dependency(%q<nokogiri>, ["~> 1.0"])
    s.add_dependency(%q<nokogumbo>, ["~> 1.1"])
    s.add_dependency(%q<rails>, ["~> 4.0"])
    s.add_dependency(%q<coffee-rails>, ["~> 4.0"])
    s.add_dependency(%q<sass>, ["~> 3.0"])
    s.add_dependency(%q<sqlite3>, ["~> 1.3"])
  end
end
