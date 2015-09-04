# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tagistrano/version'

Gem::Specification.new do |spec|
  spec.name          = 'tagistrano'
  spec.version       = Tagistrano::VERSION
  spec.authors       = ['Kyle Edson']
  spec.email         = ['kae@foraker.com']
  spec.description   = 'Automatically create git tags on Capistrano tasks'
  spec.summary       = 'Add prompts to Capistrano tasks to automatically generate new git tags based on semantic versioning'
  spec.homepage      = 'https://github.com/foraker/tagistrano'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 0'
  spec.add_development_dependency 'rake', '~> 0'
  spec.add_development_dependency 'rspec', '~> 0'
end
