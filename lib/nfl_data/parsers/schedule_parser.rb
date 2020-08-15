module NflData
  module Parsers
    class ScheduleParser
      def initialize(feed: MySportsFeeds::Schedule.new)
        @feed = feed
      end

      def schedule(year:)
        schedule_data = @feed.seasonal_games.map { |game_data| game_data["schedule"] }
        Schedule.new(games: schedule_data.map { |data| init_game(data) })
      end

      private

      def init_game(data)
        Schedule::Game.new(
          week: data["week"],
          home_team: data["homeTeam"]["abbreviation"],
          away_team: data["awayTeam"]["abbreviation"],
          start_time: data["startTime"]
        )
      end
    end
  end
end
