# frozen_string_literal: true

module NflData
  module MySportsFeeds
    class Client
      attr_reader :base_url

      def initialize()
        @base_url = "#{ENV["MYSPORTSFEEDS_API_HOST"]}/#{ENV["MYSPORTSFEEDS_API_VERSION"]}/pull/nfl"
      end

      def request(method, endpoint)
        request = Typhoeus::Request.new(
          "#{base_url}#{endpoint}",
          method: :get,
          accept_encoding: "gzip",
          userpwd: "#{ENV["MYSPORTSFEEDS_API_KEY"]}:MYSPORTSFEEDS"
        )
      end
    end
  end
end
