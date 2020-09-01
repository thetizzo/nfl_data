# frozen_string_literal: true

module NflData
  module MySportsFeeds
    class PlayersFeed
      attr_reader :client

      def initialize(client: MySportsFeeds::Client.new)
        @client = client
      end

      def feed
        client.get(endpoint: "players")["players"]
      end
    end
  end
end
