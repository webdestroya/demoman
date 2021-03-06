# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'demoman/version'

Gem::Specification.new do |gem|
  gem.name          = "demoman"
  gem.version       = Demoman::VERSION
  gem.authors       = ["Mitch Dempsey"]
  gem.email         = ["mrdempsey@gmail.com"]
  gem.description   = %q{Library for reading metadata from Half-Life demo files}
  gem.summary       = %q{Library for reading metadata from Half-Life demo files}
  gem.homepage      = "http://www.mitchdb.com/"
  gem.license       = 'GPL-3'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "bundler", "~> 1.3"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec", ">= 2.14"
  gem.add_development_dependency "simplecov"
  gem.add_development_dependency "coveralls"
end
