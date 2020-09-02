# frozen_string_literal: true

module NflData
  module MySportsFeeds
    class PlayersFeed
      attr_reader :client

      def initialize(client: MySportsFeeds::Client.new)
        @client = client
      end

      def feed(position: nil)
        params = {position: position}
        client.get(endpoint: "players", params: params)["players"]
      end
    end
  end
end
