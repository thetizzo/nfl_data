# frozen_string_literal: true

module NflData
  module MySportsFeeds
    class SeasonalGamesFeed
      attr_reader :client

      def initialize(client: MySportsFeeds::Client.new)
        @client = client
      end

      def feed(season_start_year:)
        response = client.get(endpoint: "#{season_slug(season_start_year)}/games")
        response["games"].map { |data| data["schedule"] }
      end

      def season_slug(year)
        "#{year}-#{year + 1}-regular"
      end
    end
  end
end
