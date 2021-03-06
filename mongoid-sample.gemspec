# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mongoid/sample/version'

Gem::Specification.new do |spec|
  spec.name          = 'mongoid-sample'
  spec.version       = Mongoid::Sample::VERSION
  spec.authors       = ['Ben Crouse']
  spec.email         = ['bencrouse@gmail.com']

  spec.summary       = "Brings Ruby's Array#sample to Mongoid collections"
  spec.homepage      = 'https://github.com/bencrouse/mongoid-sample'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'mongoid', '>= 4.0'

  spec.add_development_dependency 'bundler', '>= 2.1.0'
  spec.add_development_dependency 'rake', '>= 12.3.3'
  spec.add_development_dependency 'minitest', '~> 5.0'
end
