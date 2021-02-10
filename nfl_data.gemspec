lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "nfl_data/version"

Gem::Specification.new do |spec|
  spec.name = "nfl_data"
  spec.version = NflData::VERSION
  spec.authors = ["thetizzo"]
  spec.email = ["j.m.taylor1@gmail.com"]
  spec.homepage = "https://github.com/thetizzo/nfl_data"
  spec.license = "MIT"
  spec.summary = "Parse NFL data like a boss"
  spec.description = "Parse NFL data like a boss"

  spec.files = `git ls-files -z`.split("\x0")
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.9"
  spec.add_development_dependency "rspec-resembles_json_matchers", "~> 0.9"
  spec.add_development_dependency "vcr", "~> 4.0.0"
  spec.add_development_dependency "webmock", "~> 3.8"
  spec.add_development_dependency "standard", "~> 0.5"

  spec.add_dependency "nokogiri", "~> 1.11"
  spec.add_dependency "typhoeus", "~> 1.4"
  spec.add_dependency "zeitwerk", "~> 2.4"
end
