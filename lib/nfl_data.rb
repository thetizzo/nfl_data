require "nokogiri"
require "open-uri"
require "json"
require "typhoeus"
require "base64"
require "zeitwerk"

loader = Zeitwerk::Loader.for_gem
loader.collapse("lib/nfl_data/models")
loader.setup

module NflData
end
