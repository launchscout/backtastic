# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "backtastic/version"

Gem::Specification.new do |s|
  s.name        = "backtastic"
  s.version     = Backtastic::VERSION
  s.authors     = ["Chris Nelson"]
  s.email       = ["superchrisnelson@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Formtastic meets backbone.. ish.}
  s.description = %q{Create backbone twitter bootstrap form views easily using helpers. Handle and display
    validation failures from rails.
  }


  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_runtime_dependency "haml_coffee_assets"
  s.add_runtime_dependency "rails-backbone"
  s.add_runtime_dependency "inflection-js-rails"
  s.add_runtime_dependency "twitter-bootstrap-rails"
end
