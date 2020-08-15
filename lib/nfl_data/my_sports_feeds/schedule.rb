# frozen_string_literal: true

module NflData
  module MySportsFeeds
    class Schedule
      attr_reader :client

      def initialize(client: MySportsFeeds::Client.new)
        @client = client
      end

      def seasonal_games
        response = client.get(endpoint: "2020-2021-regular/games")
        response["games"]
      end
    end
  end
end
