# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'openstates/version'

Gem::Specification.new do |spec|
  spec.name          = 'openstates'
  spec.version       = OpenStates::VERSION
  spec.authors       = ['Chris']
  spec.email         = ['chris@wideeyelabs.com']
  spec.summary       = 'Ruby gem to interact with the OpenStates API.'
  spec.description   = 'Ruby gem to interact with the OpenStates API.'
  spec.homepage      = 'https://github.com/WideEyeLabs'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday_middleware'
  spec.add_dependency 'hashie'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-remote'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rubocop'
end
