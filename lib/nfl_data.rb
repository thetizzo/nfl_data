require "nokogiri"
require "open-uri"
require "json"
require "typhoeus"
require "base64"
require "zeitwerk"

loader = Zeitwerk::Loader.for_gem
loader.setup

module NflData
end
