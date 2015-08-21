# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tagistrano/version'

Gem::Specification.new do |spec|
  spec.name          = 'tagistrano'
  spec.version       = Tagistrano::VERSION
  spec.authors       = ['Kyle Edson']
  spec.email         = ['kae@foraker.com']
  spec.description   = 'Automatically create git tags on Capistrano deploys'
  spec.summary       = 'Automatically create git tags on Capistrano deploys'
  spec.homepage      = 'https://github.com/foraker/tagistrano'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
