# frozen_string_literal: true

module NflData
  module MySportsFeeds
    class WeeklyPlayerGamelogs
      attr_reader :client

      def initialize(client: MySportsFeeds::Client.new)
        @client = client
      end

      def feed(season_start_year:, week:)
        client.get(endpoint: "#{season_slug(season_start_year)}/week/#{week}/player_gamelogs")["gamelogs"]
      end

      def season_slug(year)
        "#{year}-#{year + 1}-regular"
      end
    end
  end
end
