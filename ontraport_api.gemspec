# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ontraport_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'ontraport_api'
  spec.version       = OntraportApi::VERSION
  spec.authors       = ['Jimmy Ngu']
  spec.email         = ['jimmynguyc@gmail.com']
  spec.summary       = %q{Ruby Client for Ontraport's JSON API}
  spec.description   = %q{Ruby client for Ontraport's JSON API}
  spec.homepage      = 'https://github.com/jimmynguyc/ontraport_api'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 1.9.3'

  spec.add_development_dependency 'bundler', '~> 2.1'
  spec.add_development_dependency 'rake', '~> 12.3.3'
  spec.add_development_dependency "minitest", '~> 5.6'

  spec.add_runtime_dependency 'httparty', '~> 0.13'
end
