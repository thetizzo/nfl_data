# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'nfl_data/version'

Gem::Specification.new do |spec|
  spec.name          = 'nfl_data'
  spec.version       = NflData::VERSION
  spec.authors       = ['thetizzo']
  spec.email         = ['j.m.taylor1@gmail.com']
  spec.homepage      = 'https://github.com/thetizzo/nfl_data'
  spec.license       = 'MIT'
  spec.summary       = %q{Parse NFL data like a boss}
  spec.description   = %q{Parse NFL data like a boss}

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest', '~> 5.4.1'
  spec.add_development_dependency 'vcr', '~> 2.9.3'
  spec.add_development_dependency 'webmock', '~> 1.19.0'

  spec.add_dependency 'nokogiri', '~> 1.6.3.1'
end
