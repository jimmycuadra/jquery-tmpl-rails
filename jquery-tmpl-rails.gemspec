# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "jquery-tmpl-rails/version"

Gem::Specification.new do |s|
  s.name        = "jquery-tmpl-rails"
  s.version     = Jquery::Tmpl::Rails::VERSION
  s.authors     = ["Jimmy Cuadra"]
  s.email       = ["jimmy@jimmycuadra.com"]
  s.homepage    = ""
  s.summary     = %q{jQuery Templates for the Rails asset pipeline.}
  s.description = %q{Adds the jQuery Templates plugin and a corresponding Sprockets engine to the asset pipeline in Rails applications.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency 'rails', '>= 3.2.0'
  s.add_development_dependency 'rspec'
end
