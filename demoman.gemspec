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

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
