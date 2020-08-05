require "nokogiri"
require "open-uri"
require "json"
require "typhoeus"
require "base64"
require "dry/configurable"
require "zeitwerk"

Zeitwerk::Loader.for_gem.setup

module NflData
  extend Dry::Configurable

  setting :my_sports_feeds_api do
    setting :key, ENV.fetch("MYSPORTSFEEDS_API_KEY")
    setting :host, ENV.fetch("MYSPORTSFEEDS_API_HOST")
    setting :version, ENV.fetch("MYSPORTSFEEDS_API_VERSION")
  end
end
