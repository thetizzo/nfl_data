# frozen_string_literal: true

module NflData
  module MySportsFeeds
    class Client
      attr_reader :base_url, :api_key, :api_host, :api_version, :format

      def initialize(
        api_host: ENV.fetch("MYSPORTSFEEDS_API_HOST"),
        api_key: ENV.fetch("MYSPORTSFEEDS_API_KEY"),
        api_version: ENV.fetch("MYSPORTSFEEDS_API_VERSION")
      )
        @api_host = api_host
        @api_key = api_key
        @api_version = api_version
        @format = "json"
        @base_url = "#{@api_host}/#{@api_version}/pull/nfl/"
      end

      def get(endpoint:, params: {})
        request(method: :get, endpoint: endpoint, params: params)
      end

      private

      def request(method:, endpoint:, params:)
        request = Typhoeus::Request.new(
          "#{base_url}#{endpoint}.#{format}",
          method: method,
          params: params,
          accept_encoding: "gzip",
          userpwd: "#{api_key}:MYSPORTSFEEDS"
        )

        # request.on_complete do |response|
        #   if response.success?
        #   end
        # end

        response = request.run
        JSON.parse(response.body)
      end
    end
  end
end
