# encoding: UTF-8

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = "solidus_paste_addresses"
  s.version     = "1.0.0"
  s.summary     = "Paste full addresses and have them parsed into the individual lines"
  s.required_ruby_version = ">= 2.1"

  s.author    = "Personal Wine"
  s.email     = "engineering@personalwine.com"
  s.homepage  = "http://www.personalwine.com"
  s.license   = %q{BSD-3}

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = "lib"
  s.requirements << "none"

  solidus_version = [">= 1.1", "< 3"]

  s.add_dependency "solidus_core", solidus_version
  s.add_dependency "deface", "~> 1.0"
  s.add_dependency "StreetAddress"

  s.add_development_dependency "solidus_backend", solidus_version
  s.add_development_dependency "rspec-rails", "~> 3.2"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "sass-rails"
  s.add_development_dependency "coffee-rails"
  s.add_development_dependency "factory_girl"
  s.add_development_dependency "capybara"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "ffaker"
end
